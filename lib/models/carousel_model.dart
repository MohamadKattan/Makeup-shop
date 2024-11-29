class CarouselModel {
  String imgUrl;
  String title;
  String subTitle;
  CarouselModel(
      {required this.imgUrl, required this.title, required this.subTitle});
  factory CarouselModel.fromJson(Map<String, dynamic> map) {
    return CarouselModel(
        imgUrl: map['url'], title: map['title'], subTitle: map['subTitle']);
  }
}
