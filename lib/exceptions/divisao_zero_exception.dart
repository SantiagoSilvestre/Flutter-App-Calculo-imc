class DivisaoZeroException implements Exception {
  String error() => "Não é possível realizar uma divisão por zero!";

  @override
  String toString() {
    return "DivisaoZeroException ${error()}";
  }
}
