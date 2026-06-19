class Animal{
  final String nom;
  final String espece;
  final String famille;
  final String continent;

  Animal({
    required this.nom,
    required this.continent,
    required this.famille,
    required this.espece,
  });

  factory Animal.fromJson(
      Map<String, dynamic> json,
      ){
    return Animal(nom : json['nom'], continent: json['continent'],famille: json['famille'],espece: json['espece'] );
  }
}