import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shushi_app/components/mybutton.dart';
import 'package:shushi_app/models/shop_models.dart';
import 'package:shushi_app/themes/colors.dart';
import '../models/food_models.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItem(Food food, BuildContext context) {
    // geting shop
    final shop = context.read<Shop>();

    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("My Cart"),
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Container(
          padding: const EdgeInsets.all(25.00),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // getting food from cart
                    final Food food = value.cart[index];

                    // getting food name, price and image
                    final String foodName = food.name;
                    final String foodPrice = food.price;
                    final String foodImage = food.imagePath;

                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12)),
                      margin: const EdgeInsets.only(bottom: 12.00),
                      padding: const EdgeInsets.all(14.00),
                      child: ListTile(
                        leading: Image.asset(
                          foodImage,
                          height: 100,
                        ),
                        title: Text(
                          foodName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foodPrice),
                            const Text("Qty"),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () => removeItem(food, context),
                            icon: const Icon(Icons.delete)),
                      ),
                    );
                  },
                ),
              ),

              // Pay Button
              MyButton(
                text: "Add to Cart",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
