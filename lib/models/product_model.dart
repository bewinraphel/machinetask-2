class ProductModel {
  final int id;
  final String name;
  final String image1;
  final String image2;
  final String image3;
  final int price;
  final int quantity;
  final bool favourite;
  final bool saveForlater;
  final bool bestseller;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.price,
    required this.quantity,
    required this.favourite,
    required this.saveForlater,
    required this.bestseller,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'price': price,
      'quantity': quantity,
      'favourite': favourite == true ? 1 : 0,
      'saveForlater': saveForlater == true ? 1 : 0,
      'bestseller': bestseller == true ? 1 : 0,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      price: json['price'],
      quantity: json['qunatity'] ?? 0,
      bestseller: json['bestseller'] == 1 ? true : false,
      favourite: json['favourite'] == 1 ? true : false,
      saveForlater: json['saveForlater'] == 1 ? true : false,
      description: json['description'] ?? "",
    );
  }
}
