import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shushi_app/components/food_tile.dart';
import 'package:shushi_app/components/mybutton.dart';
import 'package:shushi_app/pages/food_details.dart';
import 'package:shushi_app/themes/colors.dart';

import '../models/shop_models.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigation to food details page
  void navigateToFoodDetails(int index) {
    // get the shop and item details page
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: foodMenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and item details page
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade800,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
        title: const Text(
          "Tokyo Sushi",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // promo banner
            Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16.00)),
              padding: const EdgeInsets.all(25.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get 32% promo",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 25.00,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20.00,
                      ),
                      MyButton(
                        text: "Redeem",
                        onTap: () {},
                      ),
                    ],
                  ),
                  Image.asset(
                    "lib/images/many_sushi.png",
                    height: 100,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25.00),

            // search input
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(16.00),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(16.00),
                ),
                hintText: "Search food by keyword",
              ),
            ),

            const SizedBox(height: 25.00),

            // menu list
            Text(
              "Food Menu",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18.00),
            ),

            const SizedBox(height: 10.00),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
              ),
            ),

            const SizedBox(height: 25.00),

            // popular dish
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16.00),
              ),
              margin: const EdgeInsets.only(bottom: 25.00),
              padding: const EdgeInsets.all(20.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // image
                      Image.asset(
                        "lib/images/salmon_eggs.png",
                        height: 60.00,
                      ),

                      const SizedBox(width: 20.00),

                      // name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name
                          Text(
                            "Salmon Eggs",
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18.00),
                          ),

                          const SizedBox(height: 10.00),

                          Text(
                            "\$22.99",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: 24.00,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
