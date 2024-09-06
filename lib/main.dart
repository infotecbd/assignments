import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CartScreen(),
  ));
}

class CartItem {
  final String name;
  final String imageUrl;
  final int price;
  int quantity;

  CartItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {

  List<CartItem> cartItems = [
    CartItem(
      name: "Nike Air Max Tailwind IV SP",
      imageUrl: "https://storage.apex4u.com/5680632b-2141-4cae-9060-09e0f52d5eb5.jpg",
      price: 12000,
    ),
    CartItem(
      name: "Adidas UltraBoost",
      imageUrl: "https://storage.apex4u.com/5680632b-2141-4cae-9060-09e0f52d5eb5.jpg",
      price: 15000,
    ),
    CartItem(
      name: "Puma RS-X",
      imageUrl: "https://storage.apex4u.com/5680632b-2141-4cae-9060-09e0f52d5eb5.jpg",
      price: 8000,
    ),
  ];


  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }


  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }


  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text('My Bag'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            // Cart items list
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        // Image container
                        Container(
                          width: 80.0,
                          height: 80.0,
                          child: Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: NetworkImage(item.imageUrl),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        // Item details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 7.0),
                              Row(
                                children: <Widget>[
                                  // Decrement button
                                  GestureDetector(
                                    onTap: () => _decrementQuantity(index),
                                    child: Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                  // Quantity display
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      "${item.quantity}",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // Increment button
                                  GestureDetector(
                                    onTap: () => _incrementQuantity(index),
                                    child: Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  // Item price
                                  Text(
                                    "Tk.${item.price * item.quantity}",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Total Price
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Tk.${getTotalPrice()}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Checkout button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  // Implement checkout functionality here
                  print("Checkout button pressed");
                },
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


