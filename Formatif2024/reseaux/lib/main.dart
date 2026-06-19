import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'class.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Les animaux de mon zoo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // On recupere les données de l'api github et on les affiche dans une liste
  TextEditingController contient = TextEditingController();
  TextEditingController famille = TextEditingController();
  List<Animal> animal = [];

  void RechercherRepos() async {
    try{
      final response = await Dio().get('http://10.0.2.2:8080/exam/animaux/${contient.text}?famille=${famille.text}');
      animal = (response.data as List).map((json) => Animal.fromJson(json)).toList();
      setState(() {});
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Utilisateur introuvable' + e.toString())));
    }
    if(contient == "Ocean"){
      contient = Icon(Icons.water) as TextEditingController;
    }
    else{
      contient = Icon(Icons.landscape) as TextEditingController;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding : const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: contient,
            decoration:  const InputDecoration(labelText: 'Continent'),
          ),
          TextField(
            controller: famille,
            decoration:  const InputDecoration(labelText: 'Famille'),
          ),

          const SizedBox(height: 10),
          ElevatedButton(onPressed: RechercherRepos, child: const Text('Rechercher')),
          const SizedBox(height: 10),

          Expanded(
              child: ListView.builder(
                  itemCount: animal.length,
                  itemBuilder: (context, index){
                    final animals = animal[index];
                    return ListTile(
                      leading: animals.continent == "Océans"
                          ? const Icon(Icons.water)
                          : const Icon(Icons.landscape),
                      title: Text(animals.nom),
                      subtitle: Text((animals.espece)),
                    );
                  }


              ))
        ],),

      ),
    );

  }
}
