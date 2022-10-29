import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';

class RestaurantDetailItem extends StatelessWidget {
  final DetailRestaurant detailRestaurant;

  const RestaurantDetailItem({super.key, required this.detailRestaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            detailRestaurant.name,
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Hero(
                tag: detailRestaurant.pictureId,
                child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/small/${detailRestaurant.pictureId}'),
              ),

              // Nama restoran
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                child: Text(
                  detailRestaurant.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // Lokasi restoran
              Container(
                margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text(
                      detailRestaurant.city,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),

              // Rating restoran
              Container(
                margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Row(
                  children: [
                    const Icon(Icons.star),
                    Text(
                      detailRestaurant.rating.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),

              const Divider(
                height: 50,
                thickness: 2.0,
              ),

              // Deskripsi restoran
              Container(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  detailRestaurant.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),

              // Menu Minuman
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Menu Minuman',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: detailRestaurant.menus.drinks.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.orangeAccent)),
                              onPressed: () {},
                              child: Text(
                                detailRestaurant.menus.drinks[index].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Menu makanan
              const Padding(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0, top: 30.0),
                child: Text(
                  'Menu Makanan',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: detailRestaurant.menus.foods.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.orangeAccent)),
                              onPressed: () {},
                              child: Text(
                                detailRestaurant.menus.foods[index].name,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
