import 'package:calcular_imc/exceptions/divisao_zero_exception.dart';

class CalcularImc {
  static double calcularImc(double peso, double altura) {
    if (altura == 0) {
      throw DivisaoZeroException();
    }

    return peso / (altura * altura);
  }
}
