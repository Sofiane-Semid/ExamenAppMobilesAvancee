class Chanson{
  final int id;
  final String titre;

  Chanson({
    required this.id,
    required this.titre,
  });

  factory Chanson.fromJson(
      Map<String, dynamic> json,
      ){
    return Chanson(id : json['id'], titre: json['titre'] );
  }
}