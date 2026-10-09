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
      home: MenuPage(title: 'Menu du Restaurant Pizza'),
    );
  }
}

class MenuPage extends StatelessWidget {
  MenuPage({super.key, required this.title});
  final String title;
  final List<String> _categories = ["Formules", "Entrées", "Plats", "Desserts", "Boissons"];

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
                height: 76,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (final category in _categories)
                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(category, style:
                            TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      )
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