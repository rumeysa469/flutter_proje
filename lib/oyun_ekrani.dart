import 'package:calisma_yapisi/kisiler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calisma_yapisi/sonuc_ekrani.dart';


class OyunEkrani extends StatefulWidget {
  Kisiler kisi;

  OyunEkrani({required this.kisi}); // kisiler classından kisi nesnesi olusşturduk

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oyun Ekranı"),
        leading: IconButton(onPressed: (){
          print("Appbar geri tuşu seçildi");
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.kisi.ad} - ${widget.kisi.yas} - ${widget.kisi.boy} - ${widget.kisi.bekar}"),
// ${widget.kisi.ad}: bu yapı widget in içine gidiypr yani üstteki kodlara orada oluşturudğumuz kisi nesnesine ve oradanda onunn kapsadığı parametrelere
            ElevatedButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const SonucEkrani()));
             // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const SonucEkrani()));
              //bu kod da geçiş esnasında aradaki pencereyi siler
            }, child: const Text("Bitti")),
          ],
        ),
      ),
    );
  }
}
