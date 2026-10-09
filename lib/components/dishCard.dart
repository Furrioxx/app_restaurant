import 'package:app_restaurant/models/dish.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  const DishCard({super.key, required this._dish});

  final Dish _dish;

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
                height: 170,
                width: double.infinity,
                child: Image.asset(_dish.imagePath, fit: BoxFit.cover),
              ),
              SizedBox(height: 20),
              Text(_dish.name, style:
              TextStyle(
                  fontWeight: FontWeight.bold
              )
              ),
              SizedBox(height: 5),
              // permet de mettre du overflow si le texte est supérieur à 2 lignes
              // pour garder la même taille de card pour tous les plats
              Expanded(
                child: Text(
                  _dish.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 5),
              Text(_dish.displayPrice)
            ],
          )
      ),
    );
  }
}