import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/food_models.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25.00),
      padding: const EdgeInsets.all(25.00),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // image
          Image.asset(
            food.imagePath,
            height: 140.00,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text
              Text(
                food.name,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20.00,
                ),
              ),

              const SizedBox(
                height: 8.00,
              ),

              // price and rating
              SizedBox(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      '\$' + food.price,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        // rating
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        Text(
                          food.rating,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
