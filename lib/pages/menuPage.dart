import 'package:app_restaurant/components/categoryCard.dart';
import 'package:app_restaurant/components/dishCard.dart';
import 'package:app_restaurant/models/dish.dart';
import 'package:flutter/material.dart';


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
                            child: CategoryCard(category: category, selectedCategory: _selectedCategory)
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
                      maxCrossAxisExtent: 500,
                      mainAxisExtent: 320,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _visibleDishes.length,
                    itemBuilder: (context, index) {
                      final dish = _visibleDishes[index];
                      return DishCard(dish: dish);
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