// import 'package:finalorb/cal/task_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// class TaskProvider extends ChangeNotifier {
//   final double _currentValue = 10;
//   List<Task> _tasks = []; // Use a regular List, not final
//   double _inputValue = 0;
//
//   double get currentValue => _currentValue;
//   List<Task> get tasks => _tasks;
//
//   final String _boxName = 'tasks';
//
//   Future<void> saveTasksToHive() async {
//     final box = await Hive.openBox<Task>(_boxName);
//     await box.clear();
//
//     for (final task in _tasks) {
//       await box.add(task);
//     }
//   }
//
//   Future<void> loadTasksFromHive() async {
//     // Hive.registerAdapter<Task>(TaskAdapter());
//     final box = await Hive.openBox<Task>(_boxName);
//     _tasks = box.values.toList();
//
//     // if (_tasks.isEmpty) {
//     //   _currentValue = 10;
//     // } else {
//     //   _currentValue = _tasks.last.result;
//     // }
//     notifyListeners();
//   }
//
//   void setInputValue(double? value) {
//     _inputValue = value ?? 0;
//   }
//
//   void addTask(String operation, double value) {
//
//     if (_inputValue != 0) {
//       double valueBeforeOperation;
//       double result;
//       if( _tasks.isEmpty){
//         valueBeforeOperation = _currentValue;
//       }
//       else{
//         valueBeforeOperation = _tasks[_tasks.length-1].result;
//       }
//
//       if (operation == "add") {
//         result = valueBeforeOperation + _inputValue;
//       } else if (operation == "subtract") {
//         result = valueBeforeOperation - _inputValue;
//       } else {
//       // } else if (operation == "multiply") {
//         result = valueBeforeOperation * _inputValue;
//       }
//
//       _tasks.add(Task(operation:operation, value:_inputValue,valueBeforeOperation:valueBeforeOperation,result: result));
//       _inputValue = 0;
//       saveTasksToHive();
//       notifyListeners();
//     }
//   }
//
//
//   void editTask(int index, String newOperation, double newValue) {
//
//     if (index >= 0 && index < _tasks.length) {
//       final task = _tasks[index];
//       // final oldValue = task.value;
//       // final oldOperation = task.operation;
//
//       // if (oldOperation == "add") {
//       //   _currentValue -= oldValue;
//       // } else if (oldOperation == "subtract") {
//       //   _currentValue += oldValue;
//       // } else if (oldOperation == "multiply") {
//       //   _currentValue /= oldValue;
//       // }
//
//       // Update the task with the edited values
//       task.operation = newOperation;
//       task.value = newValue;
//       task.result = _calculateResultForTask(index);
//
//       // Adjust _currentValue based on the edited task
//       // if (newOperation == "add") {
//       //   _currentValue += newValue;
//       // } else if (newOperation == "subtract") {
//       //   _currentValue -= newValue;
//       // } else if (newOperation == "multiply") {
//       //   _currentValue *= newValue;
//       // }
//
//       // Update the task in Hive and recalculate subsequent task results
//       editTaskInHive(index);
//
//       for (int i = index + 1; i < _tasks.length; i++) {
//         _tasks[i].valueBeforeOperation = _tasks[i-1].result;
//         _tasks[i].result = _calculateResultForTask(i);
//       }
//
//       // Save changes and notify listeners
//       saveTasksToHive();
//       notifyListeners();
//     }
//   }
//
//   Future<void> editTaskInHive(int index) async {
//     final box = await Hive.openBox<Task>(_boxName);
//
//     if (index >= 0 && index < _tasks.length) {
//       final editedTask = _tasks[index];
//
//       await box.putAt(index, editedTask); // Use putAt instead of insertAt
//     }
//   }
//
//   double _calculateResultForTask(int index) {
//     double result = _tasks[index].valueBeforeOperation;
//
//     final task = _tasks[index];
//     if (task.operation == "add") {
//       result += task.value;
//     } else if (task.operation == "subtract") {
//       result -= task.value;
//     } else if (task.operation == "multiply") {
//       result *= task.value;
//     }
//
//     return result;
//   }
//
// }
