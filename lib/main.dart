
import 'package:finalorb/Update/tank_provider.dart';
import 'package:finalorb/View/screen/add_tank.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(TaskAdapter());
  // await Hive.openBox<Task>('tasks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TankProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Math Task App',
        home: AddTank(),
      ),
    );
  }
}
















































// import 'package:finalorb/Update/tank_provider.dart';
// import 'package:finalorb/View/screen/add_tank.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:provider/provider.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//
//   runApp(ChangeNotifierProvider(
//     create: (_) => TankProvider(),
//     child: const MyApp(),
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'ORB',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const AddTank(),
//     );
//   }
// }
//