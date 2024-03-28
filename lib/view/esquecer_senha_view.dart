// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EsquecerSenhaView extends StatefulWidget {
  const EsquecerSenhaView({super.key});

  @override
  State<EsquecerSenhaView> createState() => _EsquecerSenhaViewState();
}

class _EsquecerSenhaViewState extends State<EsquecerSenhaView> {
  @override
  Widget build(BuildContext context) {

    final nome = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2 ${nome ?? ''}'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('voltar'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 't3');
              },
              child: Text('abrir'),
            ),
          ],
        ),
      ),
    );
  }
}