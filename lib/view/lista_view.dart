// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


int lstindex = 0;

class ListaView extends StatefulWidget {
  const ListaView({super.key});

  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  List<String> shoppingLists = ['Lista 1'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            switch (index) {
              case 0:
                setState(() {
                  shoppingLists.add('Nova Lista');
                  Navigator.pushNamed(
                    context,
                    'shopping',
                    arguments: shoppingLists.last,
                  );
                });
                break;
              case 1:
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Sobre'),
                      content: Text('Your pop-up card content goes here.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
                break;
              default:
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Criar Lista',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Sobre',
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: shoppingLists.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(shoppingLists[index]),
                    onTap: () {
                      lstindex = index;
                      Navigator.pushNamed(context, 'shopping',
                          arguments: shoppingLists[index]);
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          TextEditingController listNameController =
                              TextEditingController(text: shoppingLists[index]);
                          return AlertDialog(
                            content: TextField(
                              controller: listNameController,
                              decoration:
                                  InputDecoration(hintText: 'Novo nome'),
                            ),
                            actions: [
                              TextButton(
                                child: Text('Salvar'),
                                onPressed: () {
                                  setState(() {
                                    shoppingLists[index] =
                                        listNameController.text;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Deletar lista'),
                                onPressed: () {
                                  setState(() {
                                    shoppingLists.removeAt(index);
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              }),
        ));
  }
}
