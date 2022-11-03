import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/ui/login_page.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        fontFamily: 'Open_Sans',
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        RestaurantList.routeName: (context) => const RestaurantList(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
            detailResto: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}
