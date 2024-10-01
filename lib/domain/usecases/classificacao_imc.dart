class ClassificacaoImc {
  static String getClassificacaoImc(double imc) {
    if (imc < 0) {
      return "Valor inválido";
    }
    switch (imc) {
      case (< 16):
        return "Magreza grave";
      case (>= 16 && < 17):
        return "Magreza moderada";
      case (>= 17 && < 18.5):
        return "Magreza leve";
      case (>= 18.5 && < 25):
        return "Saudável";
      case (>= 25 && < 30):
        return "Sobrepeso";
      case (>= 30 && < 35):
        return "Obesidade Grau I";
      case (>= 35 && < 40):
        return "Obesidade Grau II (severa)";
      case (>= 40):
        return "Obesidade Grau III (mórbida)";
      default:
        return "Valor inválido";
    }
  }
}
