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
      appBar: AppBar(
        title: Text(
          'Compras',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
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
                hoverColor: Colors.red.shade100,
                onLongPress: () {
                  setState(() {});
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
