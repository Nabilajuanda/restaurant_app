import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/ui/item_restaurant_list.dart';

class RestaurantList extends StatelessWidget {
  static const routeName = '/restaurant_list';

  RestaurantList({Key? key}) : super(key: key);

  RestaurantResult? restaurantResult;

  Widget _buildList() {
    return ChangeNotifierProvider(
      create: (_) => RestaurantListProvider(apiService: ApiService()),
      child: Consumer<RestaurantListProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return SizedBox(
              width: 400,
              height: 600,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.result.restaurants.length,
                  itemBuilder: (context, index) {
                    var restaurant = state.result.restaurants[index];
                    return RestaurantListItem(restaurant: restaurant);
                  }),
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
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

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Localie Restaurant',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Autocomplete<Restaurant>(
                optionsBuilder: (TextEditingValue value) {
                  return restaurantResult!.restaurants
                      .where((element) => element.name
                          .toLowerCase()
                          .contains(value.text.toLowerCase()))
                      .toList();
                },
                onSelected: (value) => debugPrint(value.name),
                displayStringForOption: (Restaurant restaurant) =>
                    '${restaurant.name} ${restaurant.city}',
              ),
            ),
            _buildList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAndroid(context);
  }
}
