import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mise/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  Details(title: 'Details'),
    );
  }
}

class Details extends StatefulWidget {
  const Details({super.key, required this.title});

  final String title;

  @override
  State<Details> createState() => _Details();
}
class _Details extends State<Details> {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(50,0,50,0),
          child: Container(
            color: Colors.orange,
            height: 200,
            child: Center(child: Text("C'est réussi!")),
          ),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const MyHomePage(title: "Acceuil"),
              ),
            );
          },
          child: const Text("Revenir à l'acceuil"),
        ),
      ],

    ),
  );

}
}