import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

class RestaurantListItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                      'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RestaurantDetailPage.routeName,
                      arguments: const RestaurantDetailPage().toString());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(restaurant.name),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.location_on),
                          Text(restaurant.city),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.star),
                          Text(restaurant.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
