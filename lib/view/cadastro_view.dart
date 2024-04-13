// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final formKey = GlobalKey<FormState>();
  final txtnome = TextEditingController();
  final txtemail = TextEditingController();
  final txtsenha = TextEditingController();
  final txtsenha1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(children: [
            SizedBox(height: 30),
            TextFormField(
              controller: txtnome,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe seu nome';
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: txtemail,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
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
            SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, 'lista');
                }
              },
              child: Text('Confirmar'),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Já possui login?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
