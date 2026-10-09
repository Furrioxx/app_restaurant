import 'package:app_restaurant/models/dish.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  const DishCard({super.key, required this.dish});

  final Dish dish;

  @override
  Widget build(BuildContext context) {
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
  }
}