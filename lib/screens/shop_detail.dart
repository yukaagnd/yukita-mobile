import 'package:flutter/material.dart';
import 'package:yukita/models/shop_entry.dart'; 
import 'package:yukita/screens/list_shopentry.dart';

class ShopDetailPage extends StatelessWidget {
  final ShopEntry shop;

  const ShopDetailPage(this.shop, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ShopEntryPage()),
          ),
        ),
        title: const Text("Shop Detail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                shop.fields.productName,  // Updated to match the form's variable
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Price: ${shop.fields.price}",  // Updated to show price
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                "Quantity: ${shop.fields.quantity}",  // Updated to show quantity
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                "Location: ${shop.fields.location}",  // Updated to show location
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Description: ${shop.fields.description}",  // Updated to show description
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
