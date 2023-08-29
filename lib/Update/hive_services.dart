// import 'package:finalorb/Model/models.dart';
// import 'package:hive/hive.dart';
//
// class HiveService {
//   static const _boxName = 'tank_operations';
//
//   Future<void> init() async {
//     await Hive.openBox<TankOperation>(_boxName);
//   }
//
//   Box<TankOperation> get _box => Hive.box<TankOperation>(_boxName);
//
//   Future<void> addOperation(TankOperation operation) async {
//     await _box.add(operation);
//   }
//
//   List<TankOperation> get allOperations => _box.values.toList();
//
//   void editOperation(int index, TankOperation newOperation) {
//     _box.putAt(index, newOperation);
//   }
// }
