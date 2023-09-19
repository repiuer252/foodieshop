import 'package:flutter/material.dart';
import 'package:uts_asli/card_screen.dart';

import 'package:uts_asli/product_screen.dart';



import 'package:provider/provider.dart';
import 'package:uts_asli/loginpake/authentication.dart';
import 'package:uts_asli/loginpake/login.dart';
import 'package:uts_asli/provider/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(

          onTap: () {

          },
        ),
        
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 226, 48, 48),
        title: const Text(
          'FOODIE',
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            color: Colors.white,
            onPressed: () {
              Provider.of<MyProvider>(context, listen: false).swapTheme();
            },
          ),
          IconButton(
           tooltip: 'Logout',
           icon: const Icon(Icons.logout),
             onPressed: () {
          AuthenticationHelper()
              .signOut()
              .then((_) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  ));
        },
        
          )
          // SizedBox(
          //   height: 4,
          //   width: 150,
          //   child: Stack(
          //     children: const [
          //       TextField(
          //         decoration: InputDecoration(
          //           hintText: 'Search shoes..',
          //           hintStyle: TextStyle(
          //               fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
          //           border: InputBorder.none,
          //           focusedBorder: InputBorder.none,
          //           enabledBorder: InputBorder.none,
          //           errorBorder: InputBorder.none,
          //           disabledBorder: InputBorder.none,
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
        
      ),
      
      
      body: 
       SingleChildScrollView(
        
        child: Container(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 32.0, top: 32),
                child: Text(
                  'ORIGINAL\n(FAKE 200% uang kembali)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 32, right: 32),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: provider.listOfShoes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(provider.listOfShoes[i]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 160, 160, 160),
                                
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    provider.listOfShoes[i].pathOfImage[0],
                                    height: 200,
                                    width: 200,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    provider.listOfShoes[i].nameOfShoes,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    provider.listOfShoes[i].describeshoes,
                                    style: const TextStyle(
                                        fontSize: 20, color: Color.fromARGB(255, 82, 137, 255)),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    const TextSpan(
                                      text: 'RP: ',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color:
                                              Color.fromARGB(255, 255, 91, 91),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: provider.listOfShoes[i].price,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ]))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 60,
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              left: 2,
              child: 
              
              FloatingActionButton(
                backgroundColor: const Color(0xFFFFCC2E),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
                tooltip: 'increment',
                elevation: 5,
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    color: const Color(0xFFFFCC2E),
                    shape: BoxShape.circle),
                child: Consumer<MyProvider>(
                    builder: (context, numbersOfOrders, child) {
                  return Center(
                    child: Text(numbersOfOrders.ordersNumber.toString()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
