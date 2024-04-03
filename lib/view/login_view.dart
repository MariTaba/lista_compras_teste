// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
            child: Form(
                key: formKey,
                child: Column(children: [
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
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Informe sua senha';
                      } else if (value.isEmpty) {
                        return 'Informe sua senha';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          'lista',
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'cadastro',
                      );
                    },
                    child: Text('Cadastro'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'esquecer_senha',
                      );
                    },
                    child: Text('Esqueceu a senha?'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'sobre',
                      );
                    },
                    child: Text('Sobre aplicativo'),
                  )
                ]))));
  }
}
