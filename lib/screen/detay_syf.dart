import 'package:flutter/material.dart';
import '../models/kahve.dart';

class DetaySayfasi extends StatelessWidget {
  final Kahve secilenKahve;

  const DetaySayfasi({super.key, required this.secilenKahve});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 250),
      appBar: AppBar(
        title: Text(secilenKahve.isim),
        backgroundColor: const Color.fromARGB(255, 255, 252, 250),
        foregroundColor: const Color.fromARGB(255, 40, 15, 6),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    secilenKahve.resimYolu,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          secilenKahve.isim,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 15, 6),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${secilenKahve.fiyat} TL",
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
