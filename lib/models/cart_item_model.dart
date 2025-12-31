class CartModel {
  final int? id;
  final int productId;
  final String name;
  final int price;
  final String image;
  final int quantity;

  CartModel({
    this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
  });

  Map<String, dynamic> toMap() => {
        'productId': productId,
        'name': name,
        'price': price,
        'image': image,
        'quantity': quantity,
      };

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      productId: map['productId'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      quantity: map['quantity'],
    );
  }
}
