import 'package:flutter/material.dart';

import '../utils/my_tab.dart';
import '../Tab/donut_tab.dart';
import '../Tab/pancake_tab.dart';
import '../Tab/pizza_tab.dart';
import '../Tab/smoothie_tab.dart';
import '../Tab/burger_tab.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

 @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> myTabs =[
  //donut tab
   const MyTab(iconPath: 'lib/icons/donut.png',),
  //burger tab
   const MyTab(iconPath: 'lib/icons/burger.png',),
  //smothie tab
  const MyTab(iconPath: 'lib/icons/smoothie.png'),
  //pizza tab
  const MyTab(iconPath: 'lib/icons/pizza.png',),
   //pancakes
  const MyTab(iconPath: 'lib/icons/pancakes.png',) 
];
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController( 
      length: myTabs.length, 
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey[800]
                   ),
          ),
         actions: const[Padding(
           padding: EdgeInsets.only(right: 25.0),
           child: Icon(Icons.person),
         )
         ],
       ),
       body: Column(children: [
        //texto "i want to eat"
        const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Row(
            children: [
              Text("I want to ", style: TextStyle(fontSize: 24), ),
              Text("Eat", style :TextStyle(fontSize: 24, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
          ],
          ),
        ),
        //tab bar
        TabBar(tabs:myTabs),
        //tab bar view
        const Expanded(child: TabBarView (children: [
          DonutTab(),
          BurgerTab(),
          SmoothieTab(),
          PancakeTab(),
          PizzaTab()
        ]))
       ],),
       ),
    ); //Icon       
  }
}
