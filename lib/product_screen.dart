import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:uts_asli/model/product_model.dart';


import 'package:provider/provider.dart';

import 'package:uts_asli/home_screen.dart';
import 'package:uts_asli/provider/theme.dart';

import 'model/product_model.dart';

import 'card_screen.dart';

class ProductPage extends StatelessWidget {
  ProductPage(this.itemOfShoes);

  final Shoesproduct itemOfShoes;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 226, 48, 48),
        title: const Text('FOODIE'),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );

            provider.gantiwarna = 'awal';

          },
        ),

        actions: [
          SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              left: 0,
              child: 
              IconButton(
            icon: const Icon( Icons.shopping_cart,
                  color: Colors.black,),
            color: Colors.white,
            onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
          ),
              
                
                
                


            ),
            Positioned(
              top: 0,
              right: 43,
              child: Container(
                width: 25,
                height: 25,
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

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          
          child: Column(
            children: [
              Image.asset(
                provider.gantiwarna == "awal"
                    ? itemOfShoes.pathOfImage[0]
                    : provider.gantiwarna == "green"
                        ? itemOfShoes.pathOfImage[1]
                        : itemOfShoes.pathOfImage[2],
                height: 300,
                width: 400,
              ),
              Row(children: [
                Transform.scale(
                  scale: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color.fromARGB(255, 28, 28, 28)),
                              value: 'awal',
                              groupValue: provider.gantiwarna,
                              onChanged: (val) {
                                provider.red = val;
                              }),
                          Text('basic')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromARGB(255, 160, 162, 19)),
                              value: 'green',
                              groupValue: provider.gantiwarna,
                              onChanged: (val) {
                                provider.red = val;
                              }),
                          const Text('color 1')
                        ],
                      ),
                      itemOfShoes.pathOfImage[2].isNotEmpty
                          ? Row(
                              children: [
                                Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) =>
                                            const Color.fromARGB(255, 134, 134, 134)),
                                    value: 'abu-abu',
                                    groupValue: provider.gantiwarna,
                                    onChanged: (val) {
                                      provider.red = val;
                                    }),
                                const Text('color 2')
                              ],
                            )
                          : const Text('')
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  child: DropdownButton<String>(
                    hint: const Text("level"),
                    value: provider.selected,
                    onChanged: (final newValue) {
                      provider.selected = newValue.toString();
                    },
                    items: itemOfShoes.sizesepa.map<DropdownMenuItem<String>>(
                      (final String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            itemOfShoes.nameOfShoes,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                              text: '\RP.',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 100, 10),
                              ),
                            ),
                            TextSpan(
                              text: itemOfShoes.price,
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: [
                        Text(
                          itemOfShoes.stars,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          itemOfShoes.describeshoes,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      itemOfShoes.details,
                      style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Consumer<MyProvider>(builder: (context, numbersOfOrders, child) {
        return FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 154, 153, 153),
          onPressed: () {
            numbersOfOrders.tambahkeranjang(itemOfShoes);

            numbersOfOrders.calculateTotalPrice(numbersOfOrders.amountOfShoes,
                double.parse(itemOfShoes.price));
          },
          elevation: 7,
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.black,
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
