import 'package:finalorb/Model/tank_model.dart';
import 'package:finalorb/Update/tank_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTankDialog extends StatefulWidget {
  final Tank? editThisTank;
  const AddTankDialog({this.editThisTank,super.key});

  @override
  State<AddTankDialog> createState() => _AddTankDialogState();
}

class _AddTankDialogState extends State<AddTankDialog> {
  final TextEditingController tankNameController = TextEditingController();
  final TextEditingController tankCapacityController = TextEditingController();
  final TextEditingController tankRobController = TextEditingController();
  String? tankType;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    if (widget.editThisTank != null) {
      tankNameController.text = widget.editThisTank!.tankName;
      tankCapacityController.text = widget.editThisTank!.totalCapacity.toString();
      tankRobController.text = widget.editThisTank!.currentROB.toString();
      tankType = widget.editThisTank!.tankType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust the value as needed
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: tankNameController,
              decoration: InputDecoration(
                  labelText: 'Tank Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter tank name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: tankCapacityController,
              keyboardType: TextInputType.number, // for number input
              decoration: InputDecoration(
                suffix: const Text("m³"),
                  labelText: 'Max Capacity',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter tank Capacity';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: tankRobController,
              keyboardType: TextInputType.number, // for number input
              decoration: InputDecoration(
                suffix: const Text("m³"),
                  labelText: 'Initial ROB',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(), // Defines default border color
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Initial Tank ROB';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: widget.editThisTank != null ?widget.editThisTank!.tankType : null,
              onChanged: (newValue) {
                setState(() {
                  tankType = newValue!;
                });
              },
              items: <String>['Sludge/Oil tank', 'Bilge/Water tank']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Select Tank Type",

              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select tank type';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final tank = Tank(
                    tankName: tankNameController.text,
                    currentROB: double.tryParse(tankRobController.text) ?? 0,
                    totalCapacity:
                        double.tryParse(tankCapacityController.text) ?? 0,
                    tankType: tankType!,
                  );
                  if (widget.editThisTank != null) {
                    Provider.of<TankProvider>(context, listen: false)
                        .editTank(widget.editThisTank!.tankName, tank);
                  }
                  else{
                    Provider.of<TankProvider>(context, listen: false)
                        .addTank(tank);
                  }

                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all(Size(MediaQuery.of(context).size.width *0.65, 50))),
              child: const Text('Save Tank'),
            )
          ],
        ),
      ),
    );
  }
}
