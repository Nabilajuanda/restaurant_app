class DetailResult {
  DetailResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  DetailRestaurant restaurant;

  factory DetailResult.fromJson(Map<String, dynamic> json) => DetailResult(
      error: json["error"],
      message: json["message"],
      restaurant: DetailRestaurant.fromJson(json["restaurant"]));
}

class DetailRestaurant {
  DetailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  int rating;
  List<Category> categories;
  Menus menus;
  List<CustomerReview> customerReviews;

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) =>
      DetailRestaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        rating: json["rating"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        menus: Menus.fromJson(json["menus"]),
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );
}

class Category {
  Category({
    required this.name,
  });

  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );
}

class CustomerReview {
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Category> foods;
  List<Category> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods:
            List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
        drinks: List<Category>.from(
            json["drinks"].map((x) => Category.fromJson(x))),
      );
}
