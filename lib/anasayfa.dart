import 'package:calisma_yapisi/kisiler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  int sayac = 0;
  bool kontrol = false;

  Future<int> toplama(int sayi1, int sayi2) async{
    int toplam = sayi1+sayi2;
    return toplam;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç : $sayac"),
            ElevatedButton(onPressed: (){
              setState(() { // buradaki bu setState butona tıklayında bir arttırması için kullan
                sayac = sayac+1;
              });

            }, child: const Text("Tıkla")),
            ElevatedButton(onPressed: (){
              var kisi = Kisiler(ad: "Ahmet", yas: 20, boy: 1.80, bekar: true);
              Navigator.push(context,MaterialPageRoute(builder: (context) =>OyunEkrani(kisi: kisi)));
              // bu yukarıdaki kod geçiş yapmak istediğimiz sayfa için yazılıyor

            }, child: const Text("Başla")),
            Visibility(visible :kontrol, child:const Text("merhaba")), // kontrol false ise görünür yapma true ise görünür olsun
            Text(kontrol ? "merhaba": "güle güle", style: TextStyle(color: kontrol ? Colors.blue : Colors.red),),
            ((){
              if (kontrol){
                return const Text("merhaba", style: TextStyle(color: Colors.blue),);
              }else{
                return const Text("güle güle", style: TextStyle(color: Colors.red),);

              }
            }()),
            ElevatedButton(onPressed: (){
              setState(() {kontrol = true;});
            }, child: const Text("Durum 1 (true)")),

            ElevatedButton(onPressed: (){
              setState(() {kontrol = false;});
            }, child: const Text("Durum 1 (FALSE)")),
            FutureBuilder<int> (
              future: toplama(10, 20),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return const Text("HATA OLUŞTU");
                }
                if(snapshot.hasData){
                  return Text("sonuç : ${snapshot.data}");
                }
                else{
                  return const Text("sonuç yok");
                }
              }
            )

          ],
        ),
      ),
    );
  }
}
// Text(kontrol ? "merhaba": "güle güle", style: TextStyle(color: kontrol ? Colors.blue : Colors.red),),
// bu yapı tek satırda bir if else oluşturdu kontrol tru ise merhaba yazdır vbe rengi mavi olsun
// eğer false ise güle güle yazdır rengi de kırmızı olsun dedik
