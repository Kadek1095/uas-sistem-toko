import 'package:flutter/material.dart';
import 'package:sistem_toko/screen/beranda.dart';
import 'package:sistem_toko/screen/edit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: HalamanBeranda.id,
      routes: {
        HalamanBeranda.id: (context) => HalamanBeranda(),
        HalamanTambahEdit.id: (context) => HalamanTambahEdit()
      },
    );
  }
}
