class Animal{
  final String nom;
  final String espece;
  final String famille;
  final String continent;

  Animal({
    required this.nom,
    required this.espece,
    required this.famille,
    required this.continent
  });

  factory Animal.fromJson(
      Map<String, dynamic> json,
      ){
    return Animal(nom : json['nom'], espece: json['espece'],famille: json['famille'],continent: json['continent'] );
  }
}