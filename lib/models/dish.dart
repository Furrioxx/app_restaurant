import 'dart:ffi';

import 'package:app_restaurant/main.dart';

class Dish {
  const Dish(
      {
        required this.name,
        required this.description,
        required this.imagePath,
        required this.category,
        required this.price
      }
    );

  final String name;
  final String description;
  final String imagePath;
  final String category;
  final double price;

  static List<Dish> initDishes() {
    return [
      // ---------- FORMULES ----------
      Dish(
        name: "Formule midi",
        description: "La formule gourmande et économique, seulement pour le midi",
        imagePath: "assets/images/formules/formule_midi.jpg",
        category: MenuPage.FORMULES,
        price: 14.90,
      ),
      Dish(
        name: "Formule complète",
        description: "Entrée, plat et dessert au choix, servie midi et soir",
        imagePath: "assets/images/formules/formule_complete.jpg",
        category: MenuPage.FORMULES,
        price: 24.50,
      ),
      Dish(
        name: "Formule express",
        description: "Plat du jour et boisson, idéale pour une pause rapide",
        imagePath: "assets/images/formules/formule_express.jpg",
        category: MenuPage.FORMULES,
        price: 11.90,
      ),

      // ---------- ENTRÉES ----------
      Dish(
        name: "Salade de chèvre chaud",
        description: "Mesclun, toasts de chèvre, miel et noix",
        imagePath: "assets/images/entrees/salade_chevre.jpg",
        category: MenuPage.ENTREES,
        price: 8.50,
      ),
      Dish(
        name: "Velouté de potimarron",
        description: "Crème fraîche et éclats de châtaignes",
        imagePath: "assets/images/entrees/veloute_potimarron.jpg",
        category: MenuPage.ENTREES,
        price: 7.00,
      ),
      Dish(
        name: "Terrine de campagne",
        description: "Servie avec cornichons et pain grillé",
        imagePath: "assets/images/entrees/terrine_campagne.jpg",
        category: MenuPage.ENTREES,
        price: 7.50,
      ),

      // ---------- PLATS ----------
      Dish(
        name: "Burger maison",
        description: "Bœuf, cheddar, oignons confits et frites maison",
        imagePath: "assets/images/plats/burger_maison.jpg",
        category: MenuPage.PLATS,
        price: 15.90,
      ),
      Dish(
        name: "Risotto aux champignons",
        description: "Riz crémeux, champignons de saison et parmesan",
        imagePath: "assets/images/plats/risotto_champignons.jpg",
        category: MenuPage.PLATS,
        price: 14.50,
      ),
      Dish(
        name: "Filet de saumon",
        description: "Saumon rôti, purée de patate douce et légumes verts",
        imagePath: "assets/images/plats/filet_saumon.jpg",
        category: MenuPage.PLATS,
        price: 17.50,
      ),

      // ---------- DESSERTS ----------
      Dish(
        name: "Tarte au citron meringuée",
        description: "Pâte sablée, crème de citron et meringue dorée",
        imagePath: "assets/images/desserts/tarte_citron.jpg",
        category: MenuPage.DESSERTS,
        price: 6.50,
      ),
      Dish(
        name: "Fondant au chocolat",
        description: "Cœur coulant, servi avec une boule de vanille",
        imagePath: "assets/images/desserts/fondant_chocolat.jpg",
        category: MenuPage.DESSERTS,
        price: 7.00,
      ),
      Dish(
        name: "Panna cotta",
        description: "Coulis de fruits rouges",
        imagePath: "assets/images/desserts/panna_cotta.jpg",
        category: MenuPage.DESSERTS,
        price: 6.00,
      ),

      // ---------- BOISSONS ----------
      Dish(
        name: "Eau minérale",
        description: "Plate ou gazeuse, 50 cl",
        imagePath: "assets/images/boissons/eau_minerale.jpg",
        category: MenuPage.BOISSONS,
        price: 2.50,
      ),
      Dish(
        name: "Limonade artisanale",
        description: "Citron pressé et menthe fraîche",
        imagePath: "assets/images/boissons/limonade.jpg",
        category: MenuPage.BOISSONS,
        price: 4.00,
      ),
      Dish(
        name: "Café",
        description: "Expresso ou allongé",
        imagePath: "assets/images/boissons/cafe.jpg",
        category: MenuPage.BOISSONS,
        price: 2.00,
      ),
    ];
  }
}