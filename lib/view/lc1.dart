// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Lc1View extends StatefulWidget {
  const Lc1View({super.key});

  @override
  State<Lc1View> createState() => _Lc1ViewState();
}

class _Lc1ViewState extends State<Lc1View> {
  var formKey = GlobalKey<FormState>();
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  var txtValor3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recuperar senha"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(),
        ));
  }
}
