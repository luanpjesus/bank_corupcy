import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropPage extends StatelessWidget {
  final dropValues = ValueNotifier("");
  final dropOpcoes = ['Audi', 'BMW', 'Lada'];
  DropPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("carros"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 280,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          label: Text("Marca"),
                          iconColor: Colors.red,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                      isExpanded: true,
                      elevation: 4,
                      icon: const Icon(Icons.arrow_downward),
                      hint: const Text("Escolha a marca"),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) =>
                          dropValues.value = escolha.toString(),
                      items: dropOpcoes
                          .map((opcao) => DropdownMenuItem(
                                value: opcao,
                                child: Text(opcao),
                              ))
                          .toList(),
                    ),
                  );
                },
                valueListenable: dropValues,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
