import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/list';

  Future<RestaurantResult> topRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat top restaurant');
    }
  }
}

class ApiDetail {
  Future<DetailResult> topDetail(String id) async {
    String _baseUrl = 'https://restaurant-api.dicoding.dev/detail/$id';
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return DetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat detail restaurant');
    }
  }
}
