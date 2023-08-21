import 'package:finalorb/Model/tank_model.dart';
import 'package:finalorb/Update/tank_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationSelectionDialog extends StatefulWidget {
  final Tank tank;

  const OperationSelectionDialog({super.key, required this.tank});

  @override
  State<OperationSelectionDialog>createState() => _OperationSelectionDialogState();
}

class _OperationSelectionDialogState extends State<OperationSelectionDialog> {
  List<String> allOperations = ["Manual Addition","Daily Collection/Generation","Evaporation", "Shore Disposal", "Incinerated", "Ows Overboard","From Engine Room Bilge Well",];
  Map<String, bool> operationsMap = {};

  @override
  void initState() {
    super.initState();
    final allTankNames = Provider.of<TankProvider>(context, listen: false)
        .tanks
        .where((tank) => tank.tankName != widget.tank.tankName)
        .map((tank) => "To ${tank.tankName}")
        .toList();
    allOperations = [...allOperations, ...allTankNames];
    for (var operation in allOperations) {
      operationsMap[operation] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select ${widget.tank.tankName} Operations'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: allOperations.length,
          itemBuilder: (BuildContext context, int index) {
            final operation = allOperations[index];
            return CheckboxListTile(
              title: Text(operation),
              value: operationsMap[operation],
              onChanged: (bool? value) {
                setState(() {
                  operationsMap[operation] = value!;
                });
              },
            );
          },
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            List<String> selectedOperations = [];
            operationsMap.forEach((key, value) {
              if (value) {
                selectedOperations.add(key);
              }
            });
            Provider.of<TankProvider>(context, listen: false).updateTankOperations(widget.tank.tankName, selectedOperations);
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
          minimumSize:
          MaterialStateProperty.all(const Size(double.infinity , 40))),
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
