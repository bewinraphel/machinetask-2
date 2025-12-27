 class CartItemModel {
  final int id;
  final String name;
  final String image;
  final double price;
  int quantity;
  bool savedForLater;

  CartItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
    this.savedForLater = false,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'quantity': quantity,
        'savedForLater': savedForLater ? 1 : 0,
      };

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      quantity: map['quantity'],
      savedForLater: map['savedForLater'] == 1,
    );
  }
}
