// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  @override
  Widget build(BuildContext context) {
    final String listName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(listName)),
      body: Center(child: Text('Itens da lista de compras aqui')),
    );
  }
}

void main() {}