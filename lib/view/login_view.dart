// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();

  //Controladores dos Campos de Texto
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
                    //
                    // VALIDAÇÃO
                    //
                    validator: (value) {
                      if (value == null) {
                        return 'Informe o email';
                      } else if (value.isEmpty) {
                        return 'Informe o email';
                      } else if (double.tryParse(value) == null) {
                        return 'Informe um valor NUMÉRICO';
                      }
                      //Retornar null significa sucesso na validação
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
                      } else if (double.tryParse(value) == null) {
                        return 'Informe um valor NUMÉRICO';
                      }
                      //Retornar null significa sucesso na validação
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  //
                  // BOTÃO
                  //
                  //ElevatedButton, OutlinedButton, TextButton
                  OutlinedButton(
                    child: {

                    },
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'cadastro',
                        );
                      })
                ]))));
  }
}
