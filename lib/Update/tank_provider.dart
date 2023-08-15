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

  void updateTankOperations(String tankName, List<String> newOperations) {
    Tank targetTank = _tanks.firstWhere((tank) => tank.tankName == tankName);
    targetTank.updateTankOperations(newOperations);
    notifyListeners();
  }

  void addToROB(String tankName, double amount) {
    Tank targetTank = _tanks.firstWhere((tank) => tank.tankName == tankName);
      targetTank.addROB(amount);
      notifyListeners();

  }

  void subtractFromROB(String tankName, double amount) {
    Tank targetTank = _tanks.firstWhere((tank) => tank.tankName == tankName);
    if (targetTank != null) {
      targetTank.subtractROB(amount);
      notifyListeners();
    }
  }

  void transferROB(String sourceTankName, String targetTankName,
      double amount) {
    Tank sourceTank = _tanks.firstWhere((tank) =>
    tank.tankName == sourceTankName);
    Tank destTank = _tanks.firstWhere((tank) =>
    tank.tankName == targetTankName);
    if (sourceTank != null && destTank != null) {
      sourceTank.transferROBTo(destTank, amount);
      notifyListeners();
    }
  }

  void saveOperations(String fromTankName, String operationName, double value) {
    Tank fromTank = _tanks.firstWhere((tank) => tank.tankName == fromTankName);
    // Tank? toTank = _tanks.firstWhere((tank) => tank.tankName == toTankName, orElse: () => null);
      fromTank.addPerformedOperation("$operationName: $value");
      notifyListeners();
  }
}

  // void performTransfer(String fromTankName, String toTankName) {
  //   Tank? fromTank = _tanks.firstWhere((tank) => tank.tankName == fromTankName, orElse: () => null);
  //   Tank? toTank = _tanks.firstWhere((tank) => tank.tankName == toTankName, orElse: () => null);
  //
  //   if (fromTank != null && toTank != null) {
  //     fromTank.addOperation('transfer to $toTankName');
  //     toTank.addOperation('received from $fromTankName');
  //     notifyListeners();
  //   }
  // }
// More utility functions for managing the tanks can be added as required.

