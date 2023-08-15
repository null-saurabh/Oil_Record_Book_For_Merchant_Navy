import 'package:finalorb/Update/tank_provider.dart';
import 'package:finalorb/View/screen/allocate_operations_to_tanks.dart';
import 'package:finalorb/View/utils/add_tank_alert_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTank extends StatelessWidget {
  const AddTank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Provider.of<TankProvider>(context).tanks.isNotEmpty
      ?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0,bottom: 10),
            child: Text("* Please add all required tanks before proceeding further",style: TextStyle(fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 50,width: double.infinity,
            child: ElevatedButton(style:ButtonStyle(shape:
                MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.zero))),child: const Text("Save & Next"), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AllocateOperations()));
            }),
          ),
        ],
      ):null,
      appBar: AppBar(
        elevation: 10,
        title: const Text("Add All Tanks"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {showDialog(
          context: context,
          builder: (BuildContext context) => const AddTankDialog(),
        );},
        child: const Icon(Icons.add),
      ),

      body: Consumer<TankProvider>(builder: (context, tank, _) {
        return tank.tanks.isEmpty
        ?const NoTankDesign()
         : ListView.builder(
          itemCount: tank.tanks.length,
            itemBuilder: (context,index){
            return Card(
              child: ListTile(title: Text(tank.tanks[index].tankName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Max Capacity: ${tank.tanks[index].totalCapacity} m³"),
                  Text("Tank Type: ${tank.tanks[index].tankType}"),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(child: const Icon(Icons.edit,size: 25,),onTap:(){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AddTankDialog(editThisTank: tank.tanks[index],),
                    );
                  },),
                  const SizedBox(width: 7,),
                Container(
                  height:30,  // Adjust height to your need
                  width: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
                  const SizedBox(width: 7,),
                  GestureDetector(child: const Icon(Icons.delete_forever,size: 25,),onTap: (){
                    tank.deleteTank(tank.tanks[index].tankName);

                  },),
                ],
              ),),
            );
            });
      }),
    );
  }
}


class NoTankDesign extends StatelessWidget {
  const NoTankDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      SizedBox(height: (MediaQuery.of(context).size.height)/2 - 200),
      SizedBox(
        height: 105,
        width: double.infinity,
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => const AddTankDialog(),
            );
          },
          icon: const Icon(
            Icons.add_circle_outline_rounded,
            color: Colors.black26,
            size: 100,
          ),
        ),
      ),
      const Padding(
        padding:
        EdgeInsets.only(top: 10, bottom: 25),
        child: Text("Add All Onboarded Tanks Here",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 19,
                fontWeight: FontWeight.w500)),
      )
    ],
      );
  }
}
