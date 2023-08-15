import 'package:finalorb/Model/tank_model.dart';
import 'package:finalorb/Update/tank_provider.dart';
import 'package:finalorb/View/utils/indicator_capacity.dart';
import 'package:finalorb/View/utils/perform_operation_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text("ORB"),
      ),
      body: Consumer<TankProvider>(builder: (context,tank,_){
        return GridView.builder(
            padding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: tank.tanks.length,itemBuilder: (context,index){
          return HomePageTankUi(tank: tank.tanks[index]);
        });
      }),
    );
  }
}






class HomePageTankUi extends StatefulWidget {
  final Tank tank;
  const HomePageTankUi({
    required this.tank,
    super.key,
  });

  @override
  State<HomePageTankUi> createState() => _HomePageTankUiState();
}

class _HomePageTankUiState extends State<HomePageTankUi> {
  String? performOperation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 12,right: 5,left: 5),
        child: Column(
          children: [
            Text(widget.tank.tankName,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      const Text("Daily Collection: 05"),
                      const Text("Today's Operation's:",style:TextStyle(fontWeight: FontWeight.w500),),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                            child: ListView.builder(itemCount:widget.tank.allOperationsPerformed.length,itemBuilder: (context,index){
                              return Text((index+1).toString() +". "+widget.tank.allOperationsPerformed[index]);
                            }),
                          ),
                        ),
                      ),
                      // const Spacer(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 55),
                        child: DropdownButtonFormField<String>(
                          onChanged: (newValue) {
                            setState(() {
                              performOperation = newValue!;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => PerformOperations(tank: widget.tank,operationName: newValue,),
                              );
                              Future.delayed(const Duration(seconds: 1), () {
                                setState(() {
                                  performOperation = null;
                                });
                              });
                            });
                          },
                          value: performOperation,
                          items: widget.tank.tankOperations.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                              // borderRadius: BorderRadius.only(),
                            ),
                            hintText: "Select Operations",
                            hintStyle: TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis,),


                          ),

                          selectedItemBuilder: (BuildContext context) {
                            return widget.tank.tankOperations.map((String value) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 70,
                                  child: Text(value, overflow: TextOverflow.ellipsis,maxLines: 1,softWrap: false,style: const TextStyle(fontSize: 12),),
                                ),
                              );
                            }).toList();
                          },

                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Column(

                  children: [
                    Text("Cap: ${widget.tank.totalCapacity}"),
                    Expanded(child: CapacityIndicator(totalCapacity: widget.tank.totalCapacity, currentCapacity: widget.tank.currentROB)),
                    Text("ROB: ${widget.tank.currentROB}"),

                  ],
                )
              ],),
            ),
          ],
        ),
      ),
    );
  }
}


// widget.tank.tankOperations

