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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  TextEditingController continent = TextEditingController();
  TextEditingController famille = TextEditingController();
  List<Animal> repos = [];

  void RechercherAnimaux() async {
    try{
      final response = await Dio().get('http://10.0.2.2:8080/exam/animaux/${continent.text}?famille=${famille.text}');
      repos = (response.data as List).map((json) => Animal.fromJson(json)).toList();
      setState(() {});
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Utilisateur introuvable' + e.toString())));
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
            controller: continent,
            decoration:  const InputDecoration(labelText: 'continent'),
          ),
          TextField(
            controller: famille,
            decoration:  const InputDecoration(labelText: 'Famille'),
          ),

          SizedBox(height: 10),
          ElevatedButton(onPressed: RechercherAnimaux, child: const Text('Rechercher')),
          const SizedBox(height: 10),

          Expanded(
              child: ListView.builder(
                  itemCount: repos.length,
                  itemBuilder: (context, index){
                    final repo = repos[index];
                    return ListTile(
                      title: Text(repo.nom),
                      subtitle: Text((repo.continent)),
                    );
                  }
              ))
        ],),

      ),
    );

  }
}
