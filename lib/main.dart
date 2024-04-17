import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(benimUyg());
}

class benimUyg extends StatelessWidget {
  const benimUyg({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bugün ne yesem?',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;

  List<String> corbaAdlari = [
    "Mercimek",
    "Tarhaha",
    "Tavuksuyu",
    "Düğün",
    "Yoğurt"
  ];

  List<String> yemekAdlari = [
    "Karnıyarık",
    "Mantı",
    "Kuru",
    "İçli Köfte",
    "Izgara Balık"
  ];

  List<String> tatliAdlari = [
    "Kadayıf",
    "Baklava",
    "Sütlaç",
    "Kazandibi",
    "Dondurma"
  ];

  void yemekleriYenile() {
    setState(() {
      corbaNo = Random().nextInt(5) + 1;
      yemekNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      corbaNo = corbaNo + 1;
                      if (corbaNo == 6) {
                        corbaNo = 1;
                      }
                      print('corba no : $corbaNo');
                    });
                  },
                  child: Image.asset('assets/images/corba_$corbaNo.jpg')),
            ),
          ),
          Text(corbaAdlari[corbaNo - 1] + ' Çorbası'),
          Divider(
            height: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/images/yemek_$yemekNo.jpg')),
            ),
          ),
          Text(yemekAdlari[yemekNo - 1] + ' Yemeği'),
          Divider(
            height: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/images/tatli_$tatliNo.jpg')),
            ),
          ),
          Text(tatliAdlari[tatliNo - 1] + ' Tatlısı'),
        ],
      ),
    );
  }
}
