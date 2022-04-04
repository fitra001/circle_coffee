import 'dart:convert';
import 'dart:io';

import 'package:circle_coffee/models/kategori_model.dart';
import 'package:circle_coffee/models/keranjang_model.dart';
import 'package:circle_coffee/models/menu_model.dart';
import 'package:circle_coffee/models/user_model.dart';
import 'package:http/http.dart';

class ApiService {
  static const String baseUrl = "http://192.168.100.26:3000";
  static const String imageKategoriUrl = baseUrl + '/images/kategori/';
  static const String imageMenuUrl = baseUrl + '/images/menu/';

  Client client = Client();

  Future<List<Kategori>?> getAllKategori() async {
    final response = await client.get(Uri.parse(baseUrl + '/kategori'));
    if (response.statusCode == 200) {
      return kategoriFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Menu>?> getAllMenu() async {
    final response = await client.get(Uri.parse(baseUrl + '/menu'));
    if (response.statusCode == 200) {
      return menuFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Menu>?> getMenuByIdKategori(String idKategori) async {
    final response =
        await client.get(Uri.parse(baseUrl + '/kategori/' + idKategori));
    if (response.statusCode == 200) {
      return menuFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Menu?> getDetailMenuByIdMenu(String idMenu) async {
    final response = await client.get(Uri.parse(baseUrl + '/menu/' + idMenu));
    if (response.statusCode == 200) {
      return singleMenuFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Keranjang>?> getKeranjang(String idUser) async {
    final response = await client.post(Uri.parse(baseUrl + '/keranjang'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'id_user': idUser}));
    if (response.statusCode == 200) {
      return keranjangFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<dynamic> addKeranjang({int? idUser, int? idMenu, int? qty}) async {
    var data = {'id_user': idUser, 'id_menu': idMenu, 'qty': qty};
    final response = await client.post(Uri.parse(baseUrl + '/keranjang/add'),
        headers: {'Content-Type': 'application/json'}, 
        body: json.encode(data)
    );

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> updateQtyKeranjang({int? idUser, int? idMenu, int? qty}) async {
    var data = {'id_user': idUser, 'id_menu': idMenu, 'qty': qty};
    final response = await client.post(Uri.parse(baseUrl + '/keranjang/update_qty'),
        headers: {'Content-Type': 'application/json'}, 
        body: json.encode(data)
    );

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> deleteKeranjang({int? idUser, int? idMenu}) async {
    var data = {'id_user': idUser, 'id_menu': idMenu};
    final response = await client.post(Uri.parse(baseUrl + '/keranjang/delete'),
        headers: {'Content-Type': 'application/json'}, 
        body: json.encode(data)
    );

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> login({String? email, String? pass}) async {
    var data = {'email': email, 'password':pass};
    final response = await client.post(Uri.parse(baseUrl + '/auth'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data)
    );

    Map<String, dynamic> res = json.decode(response.body);
    return res;
    
  }

  Future<dynamic> register({String? nama, String? no_telp, String? email, String? password}) async {
    var data = {
      'nama': nama,
      'no_telp': no_telp,
      'email': email,
      'password': password,
      'role_id' : 2,
      'is_active' : 1

    };
    
    final response = await client.post(Uri.parse(baseUrl + '/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data)
    );

    Map<String, dynamic> res = json.decode(response.body);
    return res;
    
  }
}
