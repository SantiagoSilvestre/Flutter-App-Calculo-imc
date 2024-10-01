import 'package:calcular_imc/data/model/pessoa.dart';

class PessoaRepository {
  final List<Pessoa> _pessoas = [];

  adicionar(Pessoa pessoa) async {
    await Future.delayed(const Duration(milliseconds: 5));
    _pessoas.add(pessoa);
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 5));
    _pessoas.remove(_pessoas.where((pessoa) => pessoa.id == id).first);
  }

  Future<List<Pessoa>> listar() async {
    await Future.delayed(const Duration(milliseconds: 5));
    return _pessoas;
  }
}
