import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sistem_toko/model/response_barang_model.dart';
import 'package:sistem_toko/model/response_post_model.dart';

class ApiService {
  static final String _url = "http://47.254.194.71/server_inventory/index.php/Api";

  static Future<List<Barang>> getListBarang() async {
    List<Barang> listBarang = [];
    final response = await http.get("$_url/getbarang");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      ResponseBarang respBarang = ResponseBarang.fromJson(json);

      respBarang.barang.forEach((item) {
        listBarang.add(item);
      });
      return listBarang;
    } else {
      return [];
    }
  }

  Future<ResponsePost> postBarang(
      String nama, String jumlah, String gambar) async {
    final response = await http.post("$_url/insertbarang",
        body: {'nama': nama, 'jumlah': jumlah, 'gambar': gambar});

    if (response.statusCode == 200) {
      ResponsePost responsePost =
          ResponsePost.fromJson(jsonDecode(response.body));
      return responsePost;
    } else {
      return null;
    }
  }

  Future<ResponsePost> updateBarang(id, nama, jumlah, gambar) async {
    final response = await http.post("$_url/updatebarang",
        body: {'id': id, 'nama': nama, 'jumlah': jumlah, 'gambar': gambar});

    if (response.statusCode == 200) {
      ResponsePost responsePost =
          ResponsePost.fromJson(jsonDecode(response.body));
      return responsePost;
    } else {
      return null;
    }
  }

  Future<ResponsePost> deleteBarang(String id) async {
    final response = await http.post("$_url/deletebarang", body: {'id': id});

    if (response.statusCode == 200) {
      ResponsePost responsePost =
          ResponsePost.fromJson(jsonDecode(response.body));
      return responsePost;
    } else {
      return null;
    }
  }
}
