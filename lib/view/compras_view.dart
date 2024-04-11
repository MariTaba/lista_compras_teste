// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/compras.dart';

class ComprasView extends StatefulWidget {
  const ComprasView({super.key});

  @override
  State<ComprasView> createState() => _ComprasViewState();
}

class _ComprasViewState extends State<ComprasView> {

  List<Compras> dados = [];
  

  @override
  void initState() {
    dados = Compras.preencher();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}