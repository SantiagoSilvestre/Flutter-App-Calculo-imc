import 'package:calcular_imc/data/model/pessoa.dart';
import 'package:calcular_imc/data/repositories/pessoa_repository.dart';
import 'package:calcular_imc/domain/usecases/calcular_imc.dart';
import 'package:calcular_imc/domain/usecases/classificacao_imc.dart';
import 'package:flutter/material.dart';

class ListaPessoasPage extends StatefulWidget {
  const ListaPessoasPage({super.key});

  @override
  State<ListaPessoasPage> createState() => _ListaPessoasPageState();
}

class _ListaPessoasPageState extends State<ListaPessoasPage> {
  var pessoaRepository = PessoaRepository();
  var _pessoas = const <Pessoa>[];
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obterPessoas();
  }

  void obterPessoas() async {
    _pessoas = await pessoaRepository.listar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            nomeController.text = "";
            pesoController.text = "";
            alturaController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar Registro"),
                    content: Column(
                      children: [
                        Row(
                          children: [
                            const Text("nome:"),
                            SizedBox(
                              width: 150,
                              height: 60,
                              child: TextField(controller: nomeController),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Peso:"),
                            SizedBox(
                              width: 150,
                              height: 60,
                              child: TextField(
                                controller: pesoController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Altura:"),
                            SizedBox(
                              width: 150,
                              height: 60,
                              child: TextField(
                                controller: alturaController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () async {
                          var peso = double.tryParse(pesoController.text);
                          var altura = double.tryParse(alturaController.text);
                          var pessoa =
                              Pessoa(nomeController.text, peso, altura);
                          var imc =
                              CalcularImc.calcularImc(peso ?? 0, altura ?? 0);

                          pessoa.imc = imc;
                          pessoa.classficiacao =
                              ClassificacaoImc.getClassificacaoImc(imc);

                          await pessoaRepository.adicionar(pessoa);
                          Navigator.pop(context);
                          obterPessoas();
                        },
                        child: const Text("Salvar"),
                      ),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text("Calculadora IMC")),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _pessoas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var pessoa = _pessoas[index];
                    return ListTile(
                      title: Text(pessoa.nome),
                      subtitle: Text(pessoa.imprimirFicha()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
