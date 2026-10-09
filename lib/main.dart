import 'package:app_restaurant/models/dish.dart';
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

class MenuPage extends StatefulWidget {
  MenuPage({super.key, required this.title});
  final String title;
  final List<String> _categories = [FORMULES, ENTREES, PLATS, DESSERTS, BOISSONS];
  static const String FORMULES = "Formules";
  static const String ENTREES = "Entrées";
  static const String PLATS = "Plats";
  static const String DESSERTS = "Desserts";
  static const String BOISSONS = "Boissons";

  @override
  State<MenuPage> createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage>{

  String _selectedCategory = MenuPage.FORMULES;
  List<Dish> _visibleDishes = [];
  List<Dish> _dishes = [];

  MenuPageState() {
    _dishes = Dish.initDishes();
    _visibleDishes = getDishesForCategory(MenuPage.FORMULES);
  }

  void switchCategory(String category){
    setState(() {
      _selectedCategory = category;
      _visibleDishes = getDishesForCategory(_selectedCategory);
    });
  }

  List<Dish> getDishesForCategory(String category) {
    return _dishes.where((dish) => dish.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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
                      for (final category in widget._categories)
                        GestureDetector(
                          onTap: () => switchCategory(category),
                          child: Card(
                              margin: EdgeInsets.all(10),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              color: _selectedCategory == category ? Theme.of(context).colorScheme.inversePrimary : Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(category, style:
                                  TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                          ),
                        )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      mainAxisExtent: 320,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _visibleDishes.length,
                    itemBuilder: (context, index) {
                      final dish = _visibleDishes[index];
                      return Card(
                        margin: EdgeInsets.zero,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: .start,
                              crossAxisAlignment: .start,
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child: Image.asset(dish.imagePath, fit: BoxFit.cover),
                                ),
                                SizedBox(height: 20),
                                Text(dish.name, style:
                                  TextStyle(
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                SizedBox(height: 5),
                                Expanded(
                                  child: Text(
                                    dish.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(dish.displayPrice)
                              ],
                            )
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}