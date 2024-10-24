import 'package:flutter/material.dart';
import "package:p1_donut_app_daniel_rodriguez/car_model.dart";  // Importa el modelo del carrito
import 'package:provider/provider.dart';
import '../utils/pizza_tile.dart'; // Asegúrate de importar el widget correcto

class PizzaTab extends StatelessWidget {
  // list of donuts 
 final List pizzaOnSale = [
    //[ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/Pizza/pizza1.png"],
    ["Strawberry", "45", Colors.red, "lib/Pizza/pizza2.png"],
    ["Grape Ape", "84", Colors.purple, "lib/Pizza/pizza3.png"],
    ["Choco", "95", Colors.brown, "lib/Pizza/pizza4.png"],
    ["Cream ice", "36", Colors.blue, "lib/Pizza/pizza5.png"],
    ["cherry", "45", Colors.red, "lib/Pizza/pizza6.png"],
    ["Ape Grape", "84", Colors.purple, "lib/Pizza/pizza7.png"],
    ["Cocho", "95", Colors.brown, "lib/Pizza/pizza8.png"],
  ];

  PizzaTab({super.key});
  
  get pizzasOnSale => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pizzaOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return PizzaTile(
                  pizzaFlavor: pizzaOnSale[index][0],
                  pizzaPrice: pizzaOnSale[index][1],
                  pizzaColor: pizzaOnSale[index][2],
                  imageName: pizzaOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pizzaOnSale[index][0],
                      'price': pizzaOnSale[index][1],
                      'color': pizzaOnSale[index][2],
                      'image': pizzaOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    ('Favorite for ${pizzaOnSale[index][0]} toggled');
                  },
                );
              },
            ),
          ),
          // Barrita inferior para mostrar el total del carrito
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cart.totalItems} Items | \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink, // Color del botón "View Cart"
                      ),
                      onPressed: () {
                        // Acción para ver el carrito
                        ('View Cart pressed');
                      },
                      child: const Text('View Cart'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
