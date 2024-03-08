class DataModel {
  final String name;
  final String Logoimg;
  final String img;
  final String title;
  final String subtitle;
  final int price;
  final List<String> description;
  final List<String> HowItsWork;
  final String location;

  DataModel({
    required this.title,
    required this.subtitle,
    required this.HowItsWork,
    required this.name,
    required this.img,
    required this.Logoimg,
    required this.price,
    required this.description,
    required this.location,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json["name"],
        img: json["img"],
        price: json["price"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        location: json["location"],
        Logoimg: json["location"],
        HowItsWork: json["HowItsWork"]);
  }
}
