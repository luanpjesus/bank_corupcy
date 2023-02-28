import 'package:bank_corrupcy/repository/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'models/moeda.dart';

class MoedasBase extends StatefulWidget {
  const MoedasBase({super.key});

  @override
  State<MoedasBase> createState() => _MoedasBaseState();
}

class _MoedasBaseState extends State<MoedasBase> {
  final tabela = MoedaRepository.tabela;

  @override
  Widget build(BuildContext context) {
    NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: 'R\$');
    List<Moeda> selecionadas = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cripto Moedinha"),
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              leading: (selecionadas.contains(tabela[moeda]))
                  ? CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(
                      width: 40,
                      child: Image.asset(tabela[moeda].icone),
                    ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              title: Text(
                tabela[moeda].nome,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(tabela[moeda].sigla),
              trailing: Text(real.format(tabela[moeda].preco)),
              selected: selecionadas.contains(tabela[moeda]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: () {
                setState(() {
                  (selecionadas.contains(tabela[moeda]))
                      ? selecionadas.remove(tabela[moeda])
                      : selecionadas.add(tabela[moeda]);
                });
              },
            );
          },
          padding: const EdgeInsets.all(16.0),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
