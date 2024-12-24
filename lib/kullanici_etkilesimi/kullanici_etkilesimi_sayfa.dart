import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget {
  const KullaniciEtkilesimiSayfa({super.key});

  @override
  State<KullaniciEtkilesimiSayfa> createState() => _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {
  var tfcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("KULLANICI ETKİLEŞİMİ"),),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Silmek ister misiniz? "),
                  action: SnackBarAction(label: "Evet", onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Silindi"),
                      ),);
                  },),

                )

              );

            }, child: const Text("Snackbar")),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Silmek ister misiniz? ", style: TextStyle(color: Colors.blue),),
                    backgroundColor: Colors.grey, // gelen mesajımızın arka plan rengi
                    action: SnackBarAction(label: "Evet",textColor: Colors.red, onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Silindi", style: TextStyle(color: Colors.pink),),
                          backgroundColor: Colors.grey,
                        ),);
                    },),

                  )

              );

            }, child: const Text("Snackbar (özel)")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("Başlık"),
                      content: const Text("İçereik"),
                      actions: [
                        TextButton(onPressed: (){
                          print("iptal seçildi");
                          Navigator.pop(context);
                        }, child: const Text("İptal")),
                        TextButton(onPressed: (){
                          print("tamam seçildi"); // terminalde yazıyor
                          Navigator.pop(context); // tamam 'a tıklayınca gerie dönüyor
                        }, child: const Text("tamam"))
                      ],
                    );
                  });

            }, child: const Text("Alert")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("Kayıt İşlemi"),
                      content: TextField(controller: tfcontrol, decoration: InputDecoration(hintText: "Veri"),),
                      backgroundColor: Colors.grey,
                      actions: [
                        TextButton(onPressed: (){
                          print("iptal seçildi");
                          Navigator.pop(context);
                        }, child: const Text("İptal", style: TextStyle(color: Colors.red),)),
                        TextButton(onPressed: (){
                          print("Alınan veri : ${tfcontrol.text} "); // terminalde yazıyor
                          Navigator.pop(context);
                          tfcontrol.text = ""; // bu girilen değerden sonra temzilensin diye
                        }, child: const Text("Kaydet", style: TextStyle(color: Colors.red),))
                      ],
                    );
                  });

            }, child: const Text("Alert (özel)")),
          ],
        ),
      ),
    );
  }
}
