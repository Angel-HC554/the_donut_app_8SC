import 'package:donut_app_8sc/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //Donut Tab
    const MyTab(
      iconPath: 'lib/icons/donut.png',
    ),
    //Burguer Tab
    const MyTab(
      iconPath: 'lib/icons/burger.png',
    ),
    //Smootie Tab
    const MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),
    //Pancake Tab
    const MyTab(
      iconPath: 'lib/icons/pancakes.png',
    ),
    //Pizza Tab
    const MyTab(
      iconPath: 'lib/icons/pizza.png',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            color: Colors.grey[800],
          ),
          actions: [
            Padding(
              //Le da padding a la derecha
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            )
          ],
        ),
        body: Column(
          children: [
            //TEXTO I WANT TO EAT
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    "I want to ",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    "EAT",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            //Tab Bar
            TabBar(tabs: myTabs)
            //Tab Bar View
          ],
        ),
      ),
    );
  }
}
