import 'package:flutter/material.dart';
import "package:p1_donut_app_daniel_rodriguez/car_model.dart";  // Importa el modelo del carrito
import 'package:provider/provider.dart';
import '../utils/pancake_tile.dart'; // Asegúrate de importar el widget correcto

class PancakeTab extends StatelessWidget {
  // list of donuts 
 final List pancakes = [
    //[ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/pancakes/pancakes1.png"],
    ["Strawberry", "45", Colors.red, "lib/pancakes/pancakes2.png"],
    ["Grape Ape", "84", Colors.purple, "lib/pancakes/pancakes3.png"],
    ["Choco", "95", Colors.brown, "lib/pancakes/pancakes4.png"],
    ["Cream ice", "36", Colors.blue, "lib/pancakes/pancakes5.png"],
    ["cherry", "45", Colors.red, "lib/pancakes/pancakes6.png"],
    ["Ape Grape", "84", Colors.purple, "lib/pancakes/pancakes7.png"],
    ["Cocho", "95", Colors.brown, "lib/pancakes/pancakes8.png"],
  ];

  PancakeTab({super.key});
  
  get pancakesOnSale => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pancakes.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return PancakeTile(
                  pancakesFlavor: pancakes[index][0],
                  pancakesPrice: pancakes[index][1],
                  pancakesColor: pancakes[index][2],
                  imageName: pancakes[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pancakes[index][0],
                      'price': pancakes[index][1],
                      'color': pancakes[index][2],
                      'image': pancakes[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    ('Favorite for ${pancakesOnSale[index][0]} toggled');
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
