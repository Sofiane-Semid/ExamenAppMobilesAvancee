import 'package:flutter/material.dart';

import 'Gram.dart';
import 'Stram.dart';

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
      home: const Am(title: 'Am'),
    );
  }
}


class Am extends StatefulWidget {
  const Am({super.key, required this.title});

  final String title;

  @override
  State<Am> createState() => _Am();
}

class _Am extends State<Am> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(

              child: Text('Sofiane 6240792'),
            ),
            ListTile(
              title: const Text('Am'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Am(title: 'Am'),
                    )
                );
              },
            ),
            ListTile(
              title: const Text('Stram'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Stram(title: 'Stram'),
                    )
                );
              },
            ),
            ListTile(
              title: const Text('Gram'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Gram(title: 'Gram'),
                    )
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Expanded(
                flex: 6,
                child: Container(
                  color: Colors.blue,
                )
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Container(
              color: Colors.yellow,
              height: 222,
              width: 222,
            ),

            Expanded(
              flex: 3,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.orange,
              ),
            )

          ],
        ),
      ),
    );
  }
}
