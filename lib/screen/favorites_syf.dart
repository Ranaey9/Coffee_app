import 'package:flutter/material.dart';
import '../models/kahve.dart';

class FavorilerSayfasi extends StatelessWidget {
  final List<Kahve> favoriListesi;

  const FavorilerSayfasi({super.key, required this.favoriListesi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 251, 250),
      body: favoriListesi.isEmpty
          ? const Center(
              child: Text(
                "Henüz favori kahven yok.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriListesi.length,
              itemBuilder: (context, index) {
                final kahve = favoriListesi[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(kahve.resimYolu),
                    ),
                    title: Text(
                      kahve.isim,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("${kahve.fiyat} TL"),
                    trailing: const Icon(Icons.favorite, color: Colors.red),
                  ),
                );
              },
            ),
    );
  }
}
