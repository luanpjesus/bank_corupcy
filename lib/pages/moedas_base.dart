import 'package:bank_corrupcy/pages/moedas_detalhes.dart';
import 'package:bank_corrupcy/repository/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../models/moeda.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: 'R\$');
  List<Moeda> selecionadas = [];
  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: const Text("Cripto Moedinha"),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
        ),
        title: Text("${selecionadas.length} selecionadas"),
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
        titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20),
      );
    }
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => MoedasDetalhesPage(moeda: moeda)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDinamica(),
        body: Center(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int moeda) {
              return ListTile(
                leading: (selecionadas.contains(tabela[moeda]))
                    ? const CircleAvatar(
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
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
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
                onTap: () => mostrarDetalhes(tabela[moeda]),
              );
            },
            padding: const EdgeInsets.all(16.0),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tabela.length,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: selecionadas.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () {},
                icon: const Icon(Icons.star),
                label: const Text(
                  "FAVORITAR",
                  style:
                      TextStyle(letterSpacing: 0, fontWeight: FontWeight.bold),
                ),
              )
            : null);
  }
}
