// import 'package:finalorb/cal/edit_task_ui.dart';
// import 'package:finalorb/cal/task_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
//
// class HomePages extends StatelessWidget {
//   const HomePages({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Math Task App')),
//       body: const SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CurrentValueDisplay(),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 OperationButton("add"),
//                 OperationButton("subtract"),
//                 OperationButton("multiply"),
//               ],
//             ),
//             SizedBox(height: 20),
//             ValueInput(),
//             SizedBox(height: 20),
//             // PerformButton(),
//             SizedBox(height: 20),
//             TaskHistoryList(),
//             // if (Provider.of<TaskProvider>(context).tasks.isNotEmpty) EditTaskUI(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CurrentValueDisplay extends StatelessWidget {
//   const CurrentValueDisplay({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Provider.of<TaskProvider>(context).tasks.isNotEmpty
//       ?Text('Current Value: ${Provider.of<TaskProvider>(context).tasks.last.result}')
//         :Text('Current Value: ${Provider.of<TaskProvider>(context).currentValue}');
//   }
// }
//
// class OperationButton extends StatelessWidget {
//   final String operation;
//
//   const OperationButton(this.operation, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => Provider.of<TaskProvider>(context, listen: false).addTask(operation, 0),
//       child: Text(operation),
//     );
//   }
// }
//
// class ValueInput extends StatelessWidget {
//   const ValueInput({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         onChanged: (value) => Provider.of<TaskProvider>(context, listen: false).setInputValue(double.tryParse(value)),
//         decoration: const InputDecoration(labelText: 'Enter Value'),
//       ),
//     );
//   }
// }
//
//
//
// class TaskHistoryList extends StatelessWidget {
//   const TaskHistoryList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final tasks = Provider.of<TaskProvider>(context).tasks;
//
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: tasks.length,
//       itemBuilder: (context, index) {
//         final task = tasks[index];
//         return ListTile(
//           title: Text('${task.operation} ${task.value} = ${task.result}'),
//           trailing: IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 // barrierDismissible: false,
//                 builder: (BuildContext context) => EditTaskUI(index: index,),
//               );
//               // Provider.of<TaskProvider>(context, listen: false).editTask(index, "add", 10); // Placeholder values
//             },
//           ),
//         );
//       },
//     );
//   }
// }
