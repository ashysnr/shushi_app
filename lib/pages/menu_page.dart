import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shushi_app/components/food_tile.dart';
import 'package:shushi_app/components/mybutton.dart';
import 'package:shushi_app/models/food_models.dart';
import 'package:shushi_app/themes/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: "25.00",
      imagePath: "lib/images/salmon_sushi.png",
      rating: "4.9",
    ),
    Food(
      name: "Tuna Sushi",
      price: "20.00",
      imagePath: "lib/images/tuna.png",
      rating: "4.5",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[800],
        ),
        title: Text(
          "Tokyo Sushi",
          style: TextStyle(
            color: Colors.grey[800],
          ),
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
