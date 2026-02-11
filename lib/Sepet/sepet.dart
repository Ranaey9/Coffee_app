import 'package:flutter/material.dart';
import '../models/kahve.dart';

class SepetimSayfasi extends StatefulWidget {
  final List<Kahve> sepetListesi;
  final Function(int) onRemove;

  const SepetimSayfasi({
    super.key,
    required this.sepetListesi,
    required this.onRemove,
  });

  @override
  State<SepetimSayfasi> createState() => _SepetimSayfasiState();
}

class _SepetimSayfasiState extends State<SepetimSayfasi> {
  double toplamhesapla() {
    double toplam = 0;
    for (var kahve in widget.sepetListesi) {
      toplam += kahve.fiyat;
    }
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
        backgroundColor: const Color.fromARGB(255, 255, 252, 250),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 252, 250),
      body: widget.sepetListesi.isEmpty
          ? const Center(
              child: Text(
                "Sepetiniz henüz boş!",
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.sepetListesi.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            widget.sepetListesi[index].resimYolu,
                          ),
                        ),
                        title: Text(widget.sepetListesi[index].isim),
                        subtitle: Text(
                          "${widget.sepetListesi[index].fiyat} TL",
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.onRemove(index);
                            });
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 254, 252, 252),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(0.18),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Toplam Tutar",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 23, 8, 3),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Ödenecek",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${toplamhesapla()} TL",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 26, 7, 1),
                        ),
                      ),
                    ],
                    
                  ),
                  
                ),
               
              ],
            ),
    );
  }
}
