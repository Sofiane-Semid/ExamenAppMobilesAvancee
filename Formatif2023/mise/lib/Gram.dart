import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Am(title: 'Am'),
    );
  }
}


class Gram extends StatefulWidget {
  const Gram({super.key, required this.title});

  final String title;

  @override
  State<Gram> createState() => _Gram();
}

class _Gram extends State<Gram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gram"),
                  SizedBox(height: 20),
                  TextButton(child: const Text('Retour ver Am'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const Am(title: "Am"),
                        ),
                      );
                    },
                  )

                ],
              ),

            ),
          )

          ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}