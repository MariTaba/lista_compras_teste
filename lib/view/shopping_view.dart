// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => ShoppingViewState();
}

class ShoppingViewState extends State<ShoppingView> {
  Map<String, List<Map<String, dynamic>>> shoppingLists = {};

  @override
  Widget build(BuildContext context) {
    String listName = ModalRoute.of(context)!.settings.arguments as String? ??
        'Default List Name';

    return Scaffold(
      appBar: AppBar(
        title: Text(listName),
      ),
      body: ListView.builder(
        itemCount: shoppingLists[listName]?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${shoppingLists[listName]![index]['nome']}'),
            subtitle: Text(
              '${shoppingLists[listName]![index]['descricao']}\nQuantidade: ${shoppingLists[listName]![index]['quantidade']}',
            ),
            leading: Checkbox(
              value: shoppingLists[listName]![index]['comprado'] ?? false,
              onChanged: (bool? value) {
                setState(() {
                  shoppingLists[listName]![index]['comprado'] = value;
                });
              },
            ),
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController nomeController = TextEditingController(
                      text: shoppingLists[listName]![index]['nome']);
                  TextEditingController descricaoController =
                      TextEditingController(
                          text: shoppingLists[listName]![index]['descricao']);
                  TextEditingController quantidadeController =
                      TextEditingController(
                          text: shoppingLists[listName]![index]['quantidade']
                              .toString());
                  return AlertDialog(
                    title: Text('Edit Item'),
                    content: Column(
                      children: [
                        TextField(
                          controller: nomeController,
                          decoration: InputDecoration(hintText: 'Nome'),
                        ),
                        TextField(
                          controller: descricaoController,
                          decoration: InputDecoration(hintText: 'Descrição'),
                        ),
                        TextField(
                          controller: quantidadeController,
                          decoration: InputDecoration(hintText: 'Quantidade'),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Salvar'),
                        onPressed: () {
                          setState(() {
                            shoppingLists[listName]![index]['nome'] =
                                nomeController.text;
                            shoppingLists[listName]![index]['descricao'] =
                                descricaoController.text;
                            shoppingLists[listName]![index]['quantidade'] =
                                int.parse(quantidadeController.text);
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                      TextButton(
                        child: Text('Remover'),
                        onPressed: () {
                          setState(() {
                            shoppingLists[listName]!.removeAt(index);
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController nomeController = TextEditingController();
              TextEditingController descricaoController =
                  TextEditingController();
              TextEditingController quantidadeController =
                  TextEditingController();
              return AlertDialog(
                title: Text('Adicionar item'),
                content: Column(
                  children: [
                    TextField(
                      controller: nomeController,
                      decoration: InputDecoration(hintText: 'Nome'),
                    ),
                    TextField(
                      controller: descricaoController,
                      decoration: InputDecoration(hintText: 'Descrição'),
                    ),
                    TextField(
                      controller: quantidadeController,
                      decoration: InputDecoration(hintText: 'Quantidade'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Adicionar'),
                    onPressed: () {
                      setState(() {
                        if (shoppingLists[listName] == null) {
                          shoppingLists[listName] = [];
                        }
                        shoppingLists[listName]!.add({
                          'nome': nomeController.text,
                          'descricao': descricaoController.text,
                          'quantidade': int.parse(quantidadeController.text),
                          'comprado': false,
                        });
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
