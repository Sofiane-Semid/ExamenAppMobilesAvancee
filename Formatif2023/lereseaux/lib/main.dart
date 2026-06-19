import 'dart:ffi';

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
  TextEditingController terme = TextEditingController();
  List<Chanson> chanson = [];

  void RechercherRepos() async {
    try{
      final response = await Dio().get('https://examen-intra-a23.azurewebsites.net/exam/artiste/recherche/${terme.text}');
      chanson = (response.data as List).map((json) => Chanson.fromJson(json)).toList();
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
            controller: terme,
            decoration:  const InputDecoration(labelText: 'Titre'),
          ),

          const SizedBox(height: 10),
          ElevatedButton(onPressed: RechercherRepos, child: const Text('Rechercher')),
          const SizedBox(height: 10),

          Expanded(
              child: ListView.builder(
                  itemCount: chanson.length,
                  itemBuilder: (context, index){
                    final repo = chanson[index];
                    return ListTile(
                      title: Text(repo.titre),
                    );

                  }


              ))
        ],),

      ),
    );

  }
}

