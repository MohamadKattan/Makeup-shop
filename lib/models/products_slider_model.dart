class ProductsSliderModel {
  String name;
  String url;
  ProductsSliderModel({required this.name, required this.url});
  factory ProductsSliderModel.fromJson(Map<String, dynamic> map) {
    return ProductsSliderModel(name: map['name'], url: map['url']);
  }
}
