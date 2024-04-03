// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lista_compras/view/cadastro_view.dart';
import 'package:lista_compras/view/sobre_view.dart';

class ListaView extends StatefulWidget {
  const ListaView({super.key});

  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                child: Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return Container(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.music_note),
                                title: Text('Criar lista'),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CadastroView()));
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.videocam),
                                title: Text('Vídeo'),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SobreView()));
                                },
                              ),
                            ],
                          ),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
