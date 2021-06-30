import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:sistem_toko/model/response_barang_model.dart';
import 'package:sistem_toko/qr.dart';
import 'package:sistem_toko/service/api_service.dart';
import 'package:sistem_toko/widgets/list.dart';

import 'edit.dart';

class HalamanBeranda extends StatelessWidget {
  static const String id = "HALAMANBERANDA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Management Baju'),
        ),
        body: GridBarang(),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.qr_code),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QRViewExample()));
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalamanTambahEdit(
                                barang: null,
                              )));
                },
              ),
            ],
          ),
        )
        );
  }
}
class GridBarang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<Barang>>(
              future: ApiService.getListBarang(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  List<Barang> listBarang = snapshot.data;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: listBarang?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.indigo,
                        borderRadius: BorderRadius.circular(10.0),
                        child: itemBarang(listBarang[index]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HalamanTambahEdit(
                                      barang: listBarang[index])));
                        },
                      );
                    },
                  );
                }
              },
            )));
  }
}
