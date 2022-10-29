import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';

enum ResultState { loading, hasData, noData, error }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiDetail apiDetail;
  String detailResto;

  RestaurantDetailProvider(
      {required this.apiDetail, required this.detailResto}) {
    _fetchAllDetailResto();
  }

  late ResultState _state;
  late Detail _detail;
  String _message = '';

  String get message => _message;
  Detail get detail => _detail;
  ResultState get state => _state;

  Future<dynamic> _fetchAllDetailResto() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final detailRestaurant = await apiDetail.topDetail(detailResto);

      if (detailRestaurant.restaurant.id.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Tidak ada data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detail = detailRestaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error => $e';
    }
  }
}
