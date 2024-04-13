// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ClView extends StatefulWidget {
  const ClView({super.key});

  @override
  State<ClView> createState() => _ClViewState();
}

class _ClViewState extends State<ClView> {
  var formKey = GlobalKey<FormState>();
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionar lista'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(children: []),
            )));
  }
}
