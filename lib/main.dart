import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Pizza',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MenuPage(title: 'Menu du Restaurant Pizza'),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // todo
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: .center,
                children: [
                  // todo
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}