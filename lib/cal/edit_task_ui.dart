// import 'package:finalorb/cal/task_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class EditTaskUI extends StatefulWidget {
//   final int index;
//   const EditTaskUI({required this.index,super.key});
//
//   @override
//   State<EditTaskUI> createState() => _EditTaskUIState();
// }
//
// class _EditTaskUIState extends State<EditTaskUI> {
//   String _newOperation = "add";
//   double _newValue = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       contentPadding: const EdgeInsets.all(20.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0), // Adjust the value as needed
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('Edit Task', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: 10),
//           Row(
//             children: [
//               DropdownButton<String>(
//                 value: _newOperation,
//                 onChanged: (newValue) => setState(() => _newOperation = newValue!),
//                 items: ["add", "subtract", "multiply"].map<DropdownMenuItem<String>>(
//                       (operation) => DropdownMenuItem<String>(
//                     value: operation,
//                     child: Text(operation),
//                   ),
//                 ).toList(),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   onChanged: (value) => setState(() => _newValue = double.tryParse(value) ?? 0),
//                   decoration: const InputDecoration(labelText: 'Value'),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Provider.of<TaskProvider>(context, listen: false).editTask(widget.index, _newOperation, _newValue);
//
//                   // Provider.of<TaskProvider>(context, listen: false).editTask(
//                   //   Provider.of<TaskProvider>(context, listen: false).tasks.length - 1,
//                   //   _newOperation,
//                   //   _newValue,
//                   // );
//                   //
//                   setState(() {
//                     _newOperation = "add";
//                     _newValue = 0.0;
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Edit'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//
//   }
// }
