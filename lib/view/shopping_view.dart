// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => ShoppingViewState();
}

class ShoppingViewState extends State<ShoppingView> {
  Map<String, List<Map<String, dynamic>>> shoppingLists = {};
  late TextEditingController controller;
  late String searchText = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    String listName = ModalRoute.of(context)!.settings.arguments as String? ??
        'Default List Name';

    return Scaffold(
      appBar: AppBar(
        title: Text(listName),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                    shoppingLists: shoppingLists[listName] ?? []),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoppingLists[listName]?.length ?? 0,
        itemBuilder: (context, index) {
          bool isChecked = shoppingLists[listName]![index]['comprado'] ?? false;
          return Container(
              color: isChecked ? Colors.grey.withOpacity(0.5) : null,
              child: ListTile(
                title: Text(
                  '${shoppingLists[listName]![index]['nome']}',
                  style: TextStyle(
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  '${shoppingLists[listName]![index]['descricao']}\nQuantidade: ${shoppingLists[listName]![index]['quantidade']}',
                ),
                leading: Checkbox(
                  checkColor: Color.fromARGB(255, 21, 21, 21),
                  activeColor: Color.fromARGB(0, 255, 255, 255),
                  value: isChecked,
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
                      TextEditingController nomeController =
                          TextEditingController(
                              text: shoppingLists[listName]![index]['nome']);
                      TextEditingController descricaoController =
                          TextEditingController(
                              text: shoppingLists[listName]![index]
                                  ['descricao']);
                      TextEditingController quantidadeController =
                          TextEditingController(
                              text: shoppingLists[listName]![index]
                                      ['quantidade']
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
                              decoration:
                                  InputDecoration(hintText: 'Descrição'),
                            ),
                            TextField(
                              controller: quantidadeController,
                              decoration:
                                  InputDecoration(hintText: 'Quantidade'),
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
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Color.fromARGB(255, 151, 143, 143),
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
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 22, 20, 20),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> shoppingLists;

  CustomSearchDelegate({required this.shoppingLists});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Map<String, dynamic>> results = shoppingLists
        .where(
            (item) => item['nome'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]['nome']),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Map<String, dynamic>> suggestionList = query.isEmpty
        ? shoppingLists
        : shoppingLists
            .where((item) =>
                item['nome'].toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]['nome']),
          onTap: () {
            query = suggestionList[index]['nome'];
          },
        );
      },
    );
  }
}
