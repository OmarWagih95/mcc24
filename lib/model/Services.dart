
class Services {
  final String id;
  final String name;
  final String Logoimg;
  final String img;
  final String title;
  final String subtitle;
  final int? price;
  final List<String> description;
  final List<String> HowItsWork;
  final String? location;
  Services({
    required this.id,
    required this.name,
    required this.Logoimg,
    required this.img,
    required this.title,
    required this.subtitle,
    this.price,
    required this.description,
    required this.HowItsWork,
    this.location,
  });

}
