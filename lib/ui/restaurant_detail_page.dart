import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/ui/item_restaurant_detail.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/resto_detail';

  final DetailRestaurant? detailResto;

  const RestaurantDetailPage({super.key, this.detailResto});

  Widget buildDetail() {
    return ChangeNotifierProvider(
      create: (_) => RestaurantDetailProvider(
          detailResto: detailResto!.id, apiDetail: ApiDetail()),
      child: Consumer<RestaurantDetailProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.hasData) {
            return SizedBox(
              height: 400,
              width: 400,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.detail.restaurant.id.length,
                itemBuilder: (context, index) {
                  var detailRestaurant = state.detail.restaurant;
                  return RestaurantDetailItem(
                      detailRestaurant: detailRestaurant);
                },
              ),
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildDetail();
  }
}
