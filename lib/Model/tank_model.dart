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
  String tankType;

  @HiveField(4)
  List<String> tankOperations;

  @HiveField(5)
  List<Operations>? performedOperations;


  Tank({
    required this.tankName,
    required this.currentROB,
    required this.totalCapacity,
    required this.tankType,
    this.tankOperations = const [],
    this.performedOperations,
  });
}



@HiveType(typeId: 1)
class Operations extends HiveObject {
  @HiveField(0)
  String tankName;

  @HiveField(1)
  double currentROB;

  @HiveField(2)
  double totalCapacity;

  @HiveField(3)
  String? targetTank;

  @HiveField(4)
  String operationName;

  @HiveField(5)
  double amount;

  @HiveField(6)
  double lastROB;


  Operations({
    required this.tankName,
    required this.currentROB,
    required this.totalCapacity,
    required this.operationName,
    this.targetTank,
    required this.amount,
    required this.lastROB,
  });
}