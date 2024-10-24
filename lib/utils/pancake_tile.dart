import 'package:flutter/material.dart';

class PancakeTile extends StatelessWidget {
 final String pancakesFlavor;
final String pancakesPrice;
final dynamic pancakesColor;
final String imageName;
final VoidCallback onAddToCart; // Callback para agregar al carrito
  final VoidCallback onFavoriteToggle;

  const PancakeTile({super.key, required this.pancakesFlavor, required this.pancakesPrice, this.pancakesColor, required this.imageName, required this.onAddToCart, required this.onFavoriteToggle,});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container
      (decoration: BoxDecoration(color: pancakesColor[100], borderRadius: BorderRadius.circular(24)),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment. end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: pancakesColor [200], 
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          padding: 
          const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: Text("\$$pancakesPrice",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: pancakesColor[800])
        )
        )
        ]),
        //Donut Picture
        Padding(
          padding: 
          const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
          child: Image.asset(imageName),
        ),
        //Donut flavor text
        Text(pancakesFlavor,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        const Text(
          "Dunkin's", style: TextStyle(color: Colors.grey),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.favorite, color: Colors.pink[400]),
              IconButton(icon: const Icon(Icons.add), onPressed: onAddToCart, color: Colors.grey[800],)
              
          ],
          )
        ],),
      ),
      );
  }
}