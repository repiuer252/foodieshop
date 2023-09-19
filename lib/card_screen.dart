import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uts_asli/home_screen.dart';
import 'package:uts_asli/metode_pembayaran.dart';

import 'package:uts_asli/product_screen.dart';
import 'package:uts_asli/provider/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            color: Colors.white,
            onPressed: () {
              Provider.of<MyProvider>(context, listen: false).swapTheme();
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 226, 48, 48),
        title: const Text('penny store'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: BackButton(
            color: Colors.grey[600],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 64),
        child: Container(
            child: Column(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: provider.screecard
                    .map((e) => Column(
                          children: [
                            Container(
                              color: Color.fromARGB(255, 155, 155, 155),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Image.asset(
                                        e.warna == "awal"
                                            ? e.pathOfImage[0]
                                            : e.warna == "green"
                                                ? e.pathOfImage[1]
                                                : e.pathOfImage[2],
                                        width: 100,
                                        height: 100),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(e.nameOfShoes),
                                            Text(' size :${e.size}'),
                                          ],
                                        ),
                                        Column(
                                          children: [Text('RP.${e.price}',style: const TextStyle(fontSize: 16),)],
                                        )
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      color: Color.fromARGB(255, 245, 7, 7),
                                      onPressed: () {
                                        context
                                            .read<MyProvider>()
                                            .hapuskeranjang(e);
                                      },
                                    ),
                                  ],
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ))
                    .toList()),
            Consumer<MyProvider>(builder: (context, numbersOfOrders, child) {
              return Text(
                'total harga \RP. ${numbersOfOrders.totalNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              );
            })
          ],
        )),
      ),
      floatingActionButton: Container(
        width: 100,
        height: 50,
        child: Consumer<MyProvider>(builder: (context, numbersOfOrders, child) {
          return TextButton(
            child: Text("bayar"),
            style: TextButton.styleFrom(
              // ignore: deprecated_member_use
              primary: Colors.white,
              backgroundColor: const Color.fromARGB(255, 245, 55, 55),
            ),
            onPressed: () {
              if (provider.screecard.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Metodepay()),
                );
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        title: Text("belom ada barang"),
                      );
                    });
              }
            },
          );
        }),
      ),
    );
  }
}
