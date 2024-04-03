// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EsquecerSenhaView extends StatefulWidget {
  const EsquecerSenhaView({super.key});

  @override
  State<EsquecerSenhaView> createState() => _EsquecerSenhaViewState();
}

class _EsquecerSenhaViewState extends State<EsquecerSenhaView> {
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
          padding: EdgeInsets.fromLTRB(50, 50, 50, 100),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: txtValor1,
                  style: TextStyle(fontSize: 32),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Informe o email';
                    } else if (value.isEmpty) {
                      return 'Informe o email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: txtValor2,
                  style: TextStyle(fontSize: 32),
                  decoration: InputDecoration(
                    labelText: 'Nova senha',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Informe a senha';
                    } else if (value.isEmpty) {
                      return 'Informe a senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: txtValor3,
                  style: TextStyle(fontSize: 32),
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Informe a senha';
                    } else if (value.isEmpty) {
                      return 'Informe a senha';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Confirmar'),
                ),
              ],
            ),
          ),
        ));
  }
}
