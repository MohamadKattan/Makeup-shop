class ProductsModel {
  String image;
  String? name;
  String? des;
  String? price;
  String? oldPrice;
  ProductsModel(
      {required this.image, this.name, this.des, this.price, this.oldPrice});

  factory ProductsModel.fromJson(Map<String, dynamic> map) {
    return ProductsModel(
        image: map['url'],
        name: map['name'] ?? 'name null',
        des: map['des'] ?? 'desc null',
        price: map['price'] ?? 'price null',
        oldPrice: map['oldPrice']);
  }
}
