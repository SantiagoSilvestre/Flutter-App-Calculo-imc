import 'package:flutter/material.dart';

class Pessoa {
  final String _id = UniqueKey().toString();
  final String _nome;
  final double? _peso;
  final double? _altura;
  double _imc = 0;
  String _classificacao = "N/A";

  Pessoa(this._nome, this._peso, this._altura);

  get id {
    return _id;
  }

  get nome {
    return _nome;
  }

  get peso {
    return _peso;
  }

  get altura {
    return _altura;
  }

  double getImc() {
    return _imc;
  }

  set imc(double imc) {
    _imc = imc;
  }

  get classificacao {
    return _classificacao;
  }

  set classficiacao(String classificacao) {
    _classificacao = classificacao;
  }

  String imprimirFicha() =>
      "\n----------begin Ficha \n Nome: $_nome, peso: $_peso, altura: $_altura \n"
      "IMC: ${_imc.toStringAsFixed(2)}, Classificado: $_classificacao \n"
      "------ fim -----";
}
