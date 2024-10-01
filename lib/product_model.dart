class Product {
  final int id;
  final String title;
  final double price;
  final String imageUrl;
  final String description;

  Product({required this.id, required this.title, required this.price, required this.imageUrl, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price']),
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzk92qOx7c5k5fybjVbUkwg6BGW_ptjgID9A&s',
      description: json['description'],
    );
  }
}
