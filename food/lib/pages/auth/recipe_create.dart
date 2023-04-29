import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late String ad, malzemeler, tarif;
  getRecipeAd(ad) {
    this.ad = ad;
  }

  getRecipeMalzemeler(malzemeler) {
    this.malzemeler = malzemeler;
  }

  getRecipeTarif(tarif) {
    this.tarif = tarif;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Tarifi Ekleme"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Yemek Adı",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.purpleAccent, width: 2.0))),
                  onChanged: (String ad) {
                    getRecipeAd(ad);
                  }),
            ),
            customSizedBox(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Malzemeler",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.purpleAccent, width: 2.0))),
                  onChanged: (String malzemeler) {
                    getRecipeMalzemeler(malzemeler);
                  }),
            ),
            customSizedBox(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tarif",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.purpleAccent, width: 2.0))),
                  onChanged: (String tarif) {
                    getRecipeTarif(tarif);
                  }),
            ),
            customSizedBox(),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, "/signup"),
                child:
                    Text("Ekle", style: TextStyle(color: Colors.purpleAccent))),
          ],
        ),
      ),
    );
  }
}

Widget customSizedBox() => SizedBox(
      height: 20,
    );
