import 'package:finalorb/Model/tank_model.dart';
import 'package:finalorb/Update/tank_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerformOperations extends StatefulWidget {
  final Tank tank;
  final String operationName;
  const PerformOperations({required this.tank,required this.operationName,super.key});

  @override
  State<PerformOperations> createState() => _PerformOperationsState();
}

class _PerformOperationsState extends State<PerformOperations> {
  final TextEditingController valueController = TextEditingController();
  // final TextEditingController tankCapacityController = TextEditingController();
  // final TextEditingController tankRobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


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
              controller: valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Value',
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
                  return 'Please enter value';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {

                  // if (widget.editThisTank != null) {
                  //   Provider.of<TankProvider>(context, listen: false)
                  //       .editTank(widget.editThisTank!.tankName, tank);
                  // }
                  // else{}
                    Provider.of<TankProvider>(context, listen: false)
                        .addToROB(widget.tank.tankName, double.tryParse(valueController.text) ?? 0);
                    Provider.of<TankProvider>(context, listen: false)
                        .saveOperations(widget.tank.tankName,widget.operationName,double.tryParse(valueController.text) ?? 0);

                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                  minimumSize:
                  MaterialStateProperty.all(Size(MediaQuery.of(context).size.width *0.65, 50))),
              child: const Text('Confirm'),
            )
          ],
        ),
      ),
    );
  }
}
