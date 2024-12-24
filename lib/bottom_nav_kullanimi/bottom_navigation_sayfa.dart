import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_bir.dart';
import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_iki.dart';
import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_uc.dart';
import 'package:flutter/material.dart';

class BottomNavigationSayfa extends StatefulWidget {
  const BottomNavigationSayfa({super.key});

  @override
  State<BottomNavigationSayfa> createState() => _BottomNavigationSayfaState();
}

class _BottomNavigationSayfaState extends State<BottomNavigationSayfa> {
  int secilen_indeks = 0;
  var sayfalar= [const SayfaBir(), const SayfaIki(), const SayfaUc()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("Bottom Navigation"),backgroundColor: Colors.pinkAccent,),
      body: sayfalar[secilen_indeks],
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.looks_one_outlined), label: "bir"),
            BottomNavigationBarItem(icon: Icon(Icons.looks_two_outlined), label: "iki"),
            BottomNavigationBarItem(icon: Icon(Icons.looks_3_outlined), label: "üç"),
          ],
        currentIndex: secilen_indeks,
        backgroundColor: Colors.pinkAccent,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (indeks){
            setState(() {
              secilen_indeks = indeks;
            });
        },
      ),
    );
  }
}
