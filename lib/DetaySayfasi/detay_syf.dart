import 'package:flutter/material.dart';
import '../models/kahve.dart';

class DetaySayfasi extends StatelessWidget {
  final Kahve secilenKahve;
  const DetaySayfasi({super.key, required this.secilenKahve});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(secilenKahve.isim),
        backgroundColor: const Color.fromARGB(255, 255, 252, 250),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 252, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                secilenKahve.resimYolu,
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              secilenKahve.isim,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "${secilenKahve.fiyat} TL",
              style: const TextStyle(fontSize: 24, color: Colors.brown),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Taze çekilmiş çekirdeklerle hazırlanan eşsiz lezzet.",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
