class Product {
  static const String tableName = 'products';

  final int? id;
  final String name;
  final double price;
  final String description;
  final bool isSold; // 판매 여부
  final DateTime createdAt;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isSold,
    required this.createdAt,
  });

  Product copyWith(
      {int? id,
      String? name,
      double? price,
      String? description,
      bool? isSold,
      DateTime? createdAt}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      isSold: isSold ?? this.isSold,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'isSold': isSold ? 1 : 0,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      isSold: json['isSold'] == 1,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
