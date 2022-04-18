import 'dart:convert';

import 'package:circle_coffee/models/kategori_model.dart';
import 'package:circle_coffee/models/keranjang_model.dart';
import 'package:circle_coffee/models/menu_model.dart';
import 'package:http/http.dart';

class ApiService {
  static const String baseUrl = "http://localhost:3000";
  // static const String baseUrl = "https://circle-coffee-001.herokuapp.com";
  static const String imageKategoriUrl = baseUrl + '/images/kategori/';
  static const String imageMenuUrl = baseUrl + '/images/menu/';

  Client client = Client();

  Future<dynamic> login({String? email, String? pass}) async {
    var data = {'email': email, 'password': pass};
    final response = await client.post(Uri.parse(baseUrl + '/auth'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> register(
      {String? nama, String? noTelp, String? email, String? password}) async {
    var data = {
      'nama': nama,
      'no_telp': noTelp,
      'email': email,
      'password': password,
      'role_id': 2,
      'is_active': 1
    };

    final response = await client.post(Uri.parse(baseUrl + '/auth/register'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

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

  Future<List<Menu>?> getMenuTerlaris() async {
    final response = await client.get(Uri.parse(baseUrl + '/menu_terlaris'));
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

  Future<List<Menu>?> getMenuByNama(String text) async {
    final response =
      await client.get(Uri.parse(baseUrl + '/menu/search/' + text));
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

  Future<dynamic> getJumlahKeranjang(String idUser) async {
    final response = await client.post(Uri.parse(baseUrl + '/keranjang/jumlah'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'id_user': idUser}));
    
    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> addKeranjang({int? idUser, int? idMenu, int? qty}) async {
    var data = {'id_user': idUser, 'id_menu': idMenu, 'qty': qty};
    final response = await client.post(Uri.parse(baseUrl + '/keranjang/add'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> updateQtyKeranjang(
      {int? idUser, int? idMenu, int? qty}) async {
    var data = {'id_user': idUser, 'id_menu': idMenu, 'qty': qty};
    final response = await client.post(
        Uri.parse(baseUrl + '/keranjang/update_qty'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> deleteKeranjang({int? idUser, int? idMenu}) async {
    var data = {'id_user': idUser, 'id_menu': idMenu};
    final response = await client.post(Uri.parse(baseUrl + '/keranjang/delete'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> deleteKeranjangByUser({required int? idUser}) async {
    var data = {'id_user': idUser};
    final response = await client.post(Uri.parse(baseUrl + '/keranjang/delete/user'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> addOrder({required int? idUser, required int total}) async {
    var data = {'id_user': idUser, 'total': total};
    final response = await client.post(Uri.parse(baseUrl + '/order/add'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> addDetailOrder({required int? lastId, required int? idMenu, required int? harga, required int? qty}) async {
    var data = {'id_transaksi': lastId, 'id_menu': idMenu, 'harga': harga, 'qty': qty};
    final response = await client.post(Uri.parse(baseUrl + '/order/add/detail'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> getDetailOrder({required int? idTransaksi}) async {
    var data = {'id_transaksi': idTransaksi};
    final response = await client.post(Uri.parse(baseUrl + '/order/detail'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> getRiwayatOrder(String idUser) async {
    final response = await client.post(Uri.parse(baseUrl + '/order/riwayat'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'id_user': idUser}));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> getPesananOrder(String idUser) async {
    final response = await client.post(Uri.parse(baseUrl + '/order/pesanan'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'id_user': idUser}));

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> getAllPesanan() async {
    final response = await client.get(Uri.parse(baseUrl + '/order/pesanan'),
        headers: {'Content-Type': 'application/json'});

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> getAllPesananSelesai() async {
    final response = await client.get(Uri.parse(baseUrl + '/order/selesai'),
        headers: {'Content-Type': 'application/json'});

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> getAllPesananSiap() async {
    final response = await client.get(Uri.parse(baseUrl + '/order/siap'),
        headers: {'Content-Type': 'application/json'});

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> getAllPesananProses() async {
    final response = await client.get(Uri.parse(baseUrl + '/order/proses'),
        headers: {'Content-Type': 'application/json'});

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }

  Future<dynamic> updateStatusPesanan({status, idTransaksi}) async {
    var data = {'status': status, 'id_transaksi': idTransaksi};
    final response = await client.post(Uri.parse(baseUrl + '/order/update_status'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data)
      );

    Map<String, dynamic> res = json.decode(response.body);
    return res;
  }
}
