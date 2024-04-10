// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/compras.dart';

class ListaView extends StatefulWidget {
  const ListaView({super.key});

  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {

  List<Compras> dados = [];

  @override
  void initState() {
    dados = Compras.preencher();
    super.initState();
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compras', style: TextStyle(color: Colors.yellow,),),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: dados.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(dados[index].titulo),

                onTap: (){
                  Navigator.pushNamed(context, 'lc1');
                },
                hoverColor: Colors.red.shade100,

                onLongPress: (){
                  setState(() {
                    dados.removeAt(index);
                  });
                },

              ),
            );
          },
        ),

      ),
    );
  }
}