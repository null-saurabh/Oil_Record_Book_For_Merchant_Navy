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
  String? operation;

  @HiveField(5)
  double? amount;

  @HiveField(6)
  double? lastROB;


  Tank({
    required this.tankName,
    required this.currentROB,
    required this.totalCapacity,
    required this.tankType,
    this.operation,
    this.amount,
    this.lastROB,
  });
}