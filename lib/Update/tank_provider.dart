import 'package:finalorb/Model/tank_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class TankProvider extends ChangeNotifier {

  List<Tank> _tanks = [];
  List<Tank> get tanks => _tanks;

  List<Operations> _operations = [];
  List<Operations> get operations => _operations;

  TankProvider() {
    _loadTanks();
  }

  Future<void> _loadTanks() async {
    if (!Hive.isBoxOpen('tanks')) {
      final box = await Hive.openBox<Tank>('tanks');
      _tanks = box.values.toList();
    } else {
      final box = Hive.box<Tank>('tanks');
      _tanks = box.values.toList();
    }
  }

  Future<void> saveTanksToHive() async {
    if (!Hive.isBoxOpen('tanks')) {
      final box = await Hive.openBox<Tank>('tanks');
      await box.clear();
      for (final tank in _tanks) {
        await box.add(tank);
      }
    } else {
      final box = Hive.box<Tank>('tanks');
      await box.clear();
      for (final tank in _tanks) {
        await box.add(tank);
      }
    }
  }

  void addTank(Tank tank) {
    _tanks.add(tank);
    saveTanksToHive();
    notifyListeners();
  }

  void deleteTank(String tankName) {
    _tanks.removeWhere((tank) => tank.tankName == tankName);
    saveTanksToHive();
    notifyListeners();
  }

  void editTank(String oldTankName, Tank newTankData) {
    int index = _tanks.indexWhere((tank) => tank.tankName == oldTankName);
    if (index != -1) {
      _tanks[index] = newTankData;
      saveTanksToHive();
      notifyListeners();
    }
  }

  void addToROB(String tankName, double amount) {
    Tank targetTank = _tanks.firstWhere((tank) => tank.tankName == tankName,
        orElse: () => throw Exception('Tank not found')
    );
    if(targetTank.currentROB + amount <= targetTank.totalCapacity){
    targetTank.currentROB += amount;
    }
      notifyListeners();
  }

  void subtractFromROB(String tankName, double amount) {
    Tank targetTank = _tanks.firstWhere((tank) => tank.tankName == tankName,orElse: () => throw Exception('Tank not found'));
    if (targetTank.currentROB - amount >= 0) {
      targetTank.currentROB -= amount;
      notifyListeners();
    }
  }

  void transferROB(String sourceTankName, String targetTankName, double amount) {
    Tank sourceTank = _tanks.firstWhere((tank) =>
    tank.tankName == sourceTankName,orElse: () => throw Exception('Tank not found'));
    Tank destinationTank = _tanks.firstWhere((tank) =>
    tank.tankName == targetTankName,orElse: () => throw Exception('Tank not found'));

    if(sourceTank.currentROB - amount >= 0 && destinationTank.currentROB + amount <= destinationTank.totalCapacity){
      addToROB(destinationTank.tankName, amount);
      subtractFromROB(sourceTank.tankName, amount);
    }
    notifyListeners();
  }
}
