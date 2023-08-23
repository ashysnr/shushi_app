import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shushi_app/components/mybutton.dart';
import 'package:shushi_app/models/shop_models.dart';
import 'package:shushi_app/themes/colors.dart';
import '../models/food_models.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity count
  int quantityCount = 0;

  //increament
  void increaseQty() {
    setState(() {
      if (quantityCount < 10) {
        quantityCount++;
      }
    });
  }

  //descrease
  void decreaseQty() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void addToCart() {
    // if item is in the cart
    if (quantityCount > 0) {
      // get access to the shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantityCount);

      // show alert dialog when item is added to cart
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            widget.food.name + " was added to cart",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          //list of items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.00),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(height: 25.00),

                  //rating
                  Row(
                    children: [
                      // star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(width: 10.00),

                      // rating
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10.00),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28.00),
                  ),

                  const SizedBox(height: 25.00),

                  // description
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.00,
                    ),
                  ),

                  const SizedBox(height: 10.00),

                  Text(
                    "Sashimi can also be cooked, like in the case of unagi (grilled eel). It’s common to serve slices of sashimi on a bed of daikon radish with a side of soy sauce. No other toppings or fillings are added because sashimi is meant to highlight the fresh flavors of the fish.",
                    style: TextStyle(
                        height: 2, fontSize: 14.00, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ),

          //price + quantity
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25.00),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "\$" + widget.food.price,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.00),
                    ),

                    Row(
                      children: [
                        // decrease quantity
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decreaseQty,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // quatity count
                        SizedBox(
                          width: 40.00,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.00,
                              ),
                            ),
                          ),
                        ),

                        // increase quality
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: increaseQty,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25.00),

                // add to cart button
                MyButton(text: "Add to Cart", onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
