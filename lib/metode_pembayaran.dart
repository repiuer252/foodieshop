
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_asli/home_screen.dart';
import 'package:uts_asli/provider/theme.dart';



class Metodepay extends StatelessWidget {
  const Metodepay({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'metode pemabayaran',
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );

            provider.screecard.clear();

            provider.metoNumber;
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFFAF9FA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Image.asset(
                      'images/qr.png',
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              ),
              Consumer<MyProvider>(builder: (context, numbersOfOrders, child) {
                return const Text(
                  'scan di sini,(ovo, dana, shoppe, gopay)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                );
              }),
              Consumer<MyProvider>(builder: (context, numbersOfOrders, child) {
              return Text(
                'total harga \RP. ${numbersOfOrders.totalNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              );
            }),
              Container(
                margin: const EdgeInsets.all(10),
                child: 
                ElevatedButton.icon(
                    onPressed: () {
                    const snackBar = SnackBar(
                      content: Text('gambar sudah di dowload'),
                      backgroundColor: Colors.black,
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(milliseconds: 5000),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
  icon: const Icon( // <-- Icon
    Icons.download,
    size: 24.0,
  ),
  label: const Text('Download'), // <-- Text
),
                // FlatButton(
                //   child: Text('dowlaod gambar'),
                //   color: Colors.blueAccent,
                //   textColor: Colors.white,

                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  
}



