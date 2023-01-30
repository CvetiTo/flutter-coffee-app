import 'package:coffee_app/util/coffee_tile.dart';
import 'package:coffee_app/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    //coffee type is Selected
    [
      'Cappucino',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black-coffee',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  CoffeeTile coffeeLatte = const CoffeeTile(
    coffeeImagePath: 'lib/images/latte.jpg',
    coffeeName: 'Latte',
    coffeePrice: '4.10',
  );
  CoffeeTile cappucino = const CoffeeTile(
    coffeeImagePath: 'lib/images/cappucino.jpg',
    coffeeName: 'Cappucino',
    coffeePrice: '4.30',
  );
  CoffeeTile coffeeBlack = const CoffeeTile(
    coffeeImagePath: 'lib/images/coffee.jpg',
    coffeeName: 'Black-coffee',
    coffeePrice: '3.40',
  );
  //user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      //makes selection to false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(children: [
        //find the best coffe
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Find the best coffee for you',
            style: GoogleFonts.bebasNeue(
              fontSize: 60,
            ),
          ),
        ),
        const SizedBox(height: 25),
        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Find your coffee...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade600,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 25),
        //list of coffee tipes - horizontal
        SizedBox(
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              }),
        ),

        //list of coffee tiles - horizontal
        Expanded(
          child: ListView(scrollDirection: Axis.horizontal, children: [
            coffeeLatte,
            cappucino,
            coffeeBlack,
          ]),
        ),
      ]),
    );
  }
}
