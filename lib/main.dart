import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Makanan> makanan = [
    Makanan("Pecel", "Mantap", "images/pecel.jpg", "Rp.7000"),
    Makanan("Extra Joss Susu", "Segar", "images/extrajoss.jpg", "Rp.5000"),
    Makanan("Keripik Singkong", "Renyah", "images/keripik.jpg", "Rp.2000")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MENU MAKANAN"),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DetailPage(
                          makanan[index].deskripsi,
                          makanan[index].harga,
                          makanan[index].gambar,
                          makanan[index].nama);
                    }));
                  },
                  title: Text(makanan[index].nama),
                ),
            itemCount: makanan.length),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  String nama, harga, deskripsi, image;
  DetailPage(this.deskripsi, this.harga, this.image, this.nama);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 200, height: 200, child: Image.asset(image)),
          Text(deskripsi),
          Text(harga)
        ],
      ),
    );
  }
}

class Makanan {
  String nama, deskripsi, harga, gambar;
  Makanan(this.nama, this.deskripsi, this.gambar, this.harga);
}
