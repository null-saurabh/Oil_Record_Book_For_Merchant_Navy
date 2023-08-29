import 'package:hive/hive.dart';

part 'tank_model.g.dart';

@HiveType(typeId: 0)
class Tank extends HiveObject {
  @HiveField(0)
  String tankName;

  @HiveField(1)
  double currentROB;

  @HiveField(2)
  double totalCapacity;

  @HiveField(3)
  List<String> tankOperations;

  @HiveField(4)
  String tankType;

  @HiveField(5)
  List<String> allOperationsPerformed;

  Tank({
    required this.tankName,
    required this.currentROB,
    required this.totalCapacity,
    this.tankOperations = const [],
    required this.tankType,
    List<String>? allOperationsPerformed,
  }) : allOperationsPerformed = allOperationsPerformed ?? <String>[];

  void updateTankOperations(List<String> newOperations) {
    tankOperations = newOperations;
    save();
  }

  void addPerformedOperation(String operation) {
    allOperationsPerformed.add(operation);
    save();
  }

  void addROB(double amount) {
    currentROB += amount;
    if (currentROB > totalCapacity) {
      currentROB = totalCapacity;
    }
    save();
  }

  void subtractROB(double amount) {
    currentROB -= amount;
    if (currentROB < 0) {
      currentROB = 0;
    }
    save();
  }

  void transferROBTo(Tank targetTank, double amount) {
    if (amount <= currentROB) {
      subtractROB(amount);
      targetTank.addROB(amount);
    } else {
      // print('Not enough ROB in the source tank to perform this transfer.');
    }
  }
}




































// class Tank {
//   String tankName;
//   double currentROB;
//   double totalCapacity;
//   List<String> tankOperations;
//   String tankType;
//   List<String> allOperationsPerformed;
//
//   Tank({
//     required this.tankName,
//     required this.currentROB,
//     required this.totalCapacity,
//     this.tankOperations = const [],
//     required this.tankType,
//     List<String>? allOperationsPerformed,
//   }) :allOperationsPerformed = allOperationsPerformed ?? <String>[];
//
//   void updateTankOperations(List<String> newOperations) {
//     tankOperations = newOperations;
//   }
//   void addPerformedOperation(String operation) {
//     allOperationsPerformed.add(operation);
//   }
//
//   void addROB(double amount) {
//     currentROB += amount;
//     if (currentROB > totalCapacity) {
//       currentROB = totalCapacity;
//     }
//   }
//
//   void subtractROB(double amount) {
//     currentROB -= amount;
//     if (currentROB < 0) {
//       currentROB = 0;
//     }
//   }
//
//   void transferROBTo(Tank targetTank, double amount) {
//     if (amount <= currentROB) {
//       subtractROB(amount);
//       targetTank.addROB(amount);
//     } else {
//       // print('Not enough ROB in the source tank to perform this transfer.');
//     }
//   }
// }
