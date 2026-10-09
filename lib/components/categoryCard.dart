import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this._category, required this._selectedCategory});

  final String _category;
  final String _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        // si la catégorie est celle sélectionnée, on l'affiche avec une couleur différente
        color: _selectedCategory == _category ? Theme.of(context).colorScheme.inversePrimary : Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(_category, style:
          TextStyle(
              fontWeight: FontWeight.bold
          ),
          ),
        )
    );
  }
}