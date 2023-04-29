import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Profil" ), backgroundColor: Colors.purpleAccent, ),
        body: Container(
      child: Center(
        child: TextButton(
            onPressed: () => Navigator.pushNamed(context, "/recipecreate"),
            child: Text("Yemek Tarifi Ekle",
                style: TextStyle(color: Colors.purpleAccent))),
      ),
    ));
  }
}
