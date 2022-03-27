import 'package:circle_coffee/models/kategori_model.dart';
import 'package:circle_coffee/models/menu_model.dart';
import 'package:http/http.dart';

class ApiService {
  // static const String baseUrl = "http://2c8d-125-167-49-53.ngrok.io";
  static const String baseUrl = "http://192.168.100.26:3000";
  static const String imageKategoriUrl = baseUrl + '/images/kategori/';
  static const String imageMenuUrl = baseUrl + '/images/menu/';
  
  Client client = Client();

  Future<List<Kategori>?> getAllKategori() async {
    final response = await client.get(Uri.parse(baseUrl+'/kategori'));
    if (response.statusCode == 200) {
      return kategoriFromJson(response.body);
    }else{
      return null;
    }
  }

  Future<List<Menu>?> getAllMenu() async {
    final response = await client.get(Uri.parse(baseUrl+'/menu'));
    if (response.statusCode == 200) {
      return menuFromJson(response.body);
    }else{
      return null;
    }
  }

}