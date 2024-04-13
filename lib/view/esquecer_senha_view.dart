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
  var txtsenha = TextEditingController();
  var txtsenha1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recuperar senha"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: txtValor1,
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
                controller: txtsenha,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite a senha';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: txtsenha1,
                decoration: InputDecoration(
                  labelText: 'Confirmar senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirme a senha';
                  }
                  if (value != txtsenha.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
                obscureText: true,
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
