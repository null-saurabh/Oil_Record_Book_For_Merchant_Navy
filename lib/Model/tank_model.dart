class Tank {
  String tankName;
  double currentROB;
  double totalCapacity;
  List<String> tankOperations;
  String tankType;
  List<String> allOperationsPerformed;

  Tank({
    required this.tankName,
    required this.currentROB,
    required this.totalCapacity,
    this.tankOperations = const [],
    required this.tankType,
    List<String>? allOperationsPerformed,
  }) :allOperationsPerformed = allOperationsPerformed ?? <String>[];

  void updateTankOperations(List<String> newOperations) {
    tankOperations = newOperations;
  }
  void addPerformedOperation(String operation) {
    allOperationsPerformed.add(operation);
  }

  void addROB(double amount) {
    currentROB += amount;
    if (currentROB > totalCapacity) {
      currentROB = totalCapacity;
    }
  }

  void subtractROB(double amount) {
    currentROB -= amount;
    if (currentROB < 0) {
      currentROB = 0;
    }
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
