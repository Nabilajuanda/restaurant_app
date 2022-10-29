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
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/detail/';

  Future<Detail> topDetail(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl$id'));
    if (response.statusCode == 200) {
      return Detail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat detail restaurant');
    }
  }
}
