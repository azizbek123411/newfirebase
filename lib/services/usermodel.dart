class Futbol {
  String name;
  String position;
  int number;
  double height;
  double rating;
  String country;
  List<String> thropies;
  bool isMusilman;
  String? id;

  Futbol({
    required this.name,
    required this.position,
    required this.number,
    required this.rating,
    required this.country,
    required this.thropies,
    required this.isMusilman,
    required this.height,
    this.id,
  });

  factory Futbol.fromJson(Map<String, dynamic> json){
    List <String> lst=[];
    for(final item in json['thropies']){
      lst.add(item.toString());
    }

    return Futbol(name: json['name'],
        position: json['position'],
        number: json["number"],
        rating: json["rating"],
        country: json["country"],
        thropies: lst,
        isMusilman: json["isMusilman"],
        height: json['height']);
  }


  Map<String, dynamic> toJson() =>
      {
        "name": name,
        'position': position,
        'number': number,
        'rating': rating,
        'country': country,
        "thropies": thropies,
        "isMusilman": isMusilman,
        'height':height,
      };
}