import 'package:finalorb/Model/tank_model.dart';
import 'package:flutter/foundation.dart';

class TankProvider extends ChangeNotifier {
  final List<Tank> _tanks = [];
  List<Tank> get tanks => _tanks;

  void addTank(Tank tank) {
    _tanks.add(tank);
    notifyListeners();
  }

  void deleteTank(String tankName) {
    _tanks.removeWhere((tank) => tank.tankName == tankName);
    notifyListeners();
  }

  void editTank(String oldTankName, Tank newTankData) {
    int index = _tanks.indexWhere((tank) => tank.tankName == oldTankName);
    if (index != -1) {
      _tanks[index] = newTankData;
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
