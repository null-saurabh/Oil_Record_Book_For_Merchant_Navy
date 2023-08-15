import 'package:finalorb/Update/tank_provider.dart';
import 'package:finalorb/View/screen/home_page.dart';
import 'package:finalorb/View/utils/opertaions_selection_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllocateOperations extends StatelessWidget {
  const AllocateOperations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0,bottom: 10),
            child: Text("*Please allocate operations to each tank before proceeding further",style: TextStyle(fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 50,width: double.infinity,
            child: ElevatedButton(style:ButtonStyle(shape:
            MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.zero))),child: const Text("Save & Next"), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
          ),
        ],
      ),
      appBar: AppBar(elevation:5,title: const Text("Allocate Operations for each Tank"),),
      body: Consumer<TankProvider>(builder: (context,tank,_){
        return ListView.builder(
            itemCount: tank.tanks.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(title: Text(tank.tanks[index].tankName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tank Type: ${tank.tanks[index].tankType}"),
                      Text("Selected  Operations:",style: TextStyle(fontWeight: FontWeight.w500),),
                      ...tank.tanks[index].tankOperations.asMap().entries.map((entry) => Text("${entry.key + 1}. ${entry.value}")).toList(),
                    ],
                  ),
                  trailing: GestureDetector(child: Icon(Icons.add_circle_outline,size: 40,color: Colors.black.withOpacity(0.6),),onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => OperationSelectionDialog(tank: tank.tanks[index]),
                    );

                  },),),
              );
            });
      }),
    );
  }
}
