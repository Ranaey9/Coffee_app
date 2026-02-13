import 'package:flutter/material.dart';
import 'package:kahve_app/Sepet/sepet.dart';
import 'package:kahve_app/screen/detay_syf.dart';
import '../models/kahve.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Kahve> filtrelenmisKahveler = [];
  List<Map<String, dynamic>> sparisGecmisi = [];
  List<Kahve> sepetim = [];
  int secilenSayfa = 0;
  String seciliKategori = "Hepsi";

  List<Kahve> kahveler = [
    Kahve(
      isim: "Espresso",
      fiyat: 120,
      resimYolu: "https://images.unsplash.com/photo-1510707577719-ae7c14805e3a",
      kategori: "Sıcak",
    ),
    Kahve(
      isim: "Americano",
      fiyat: 140,
      resimYolu: "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
      kategori: "Sıcak",
    ),
    Kahve(
      isim: "Latte",
      fiyat: 180,
      resimYolu: "https://images.unsplash.com/photo-1524758631624-e2822e304c36",
      kategori: "Sıcak",
    ),
    Kahve(
      isim: "Türk Kahvesi",
      fiyat: 150,
      resimYolu: "https://images.unsplash.com/photo-1605478522258-7f90f8b5f5a3",
      kategori: "Sıcak",
    ),
    Kahve(
      isim: "Iced Latte",
      fiyat: 190,
      resimYolu: "https://images.unsplash.com/photo-1517701550737-a65bc042c04f",
      kategori: "Soğuk",
    ),
    Kahve(
      isim: "Frappe",
      fiyat: 210,
      resimYolu: "https://images.unsplash.com/photo-1572286258217-40142c1c6a70",
      kategori: "Soğuk",
    ),
    Kahve(
      isim: "Cold Brew",
      fiyat: 185,
      resimYolu: "https://images.unsplash.com/photo-1461023058943-07fcbe16d735",
      kategori: "Soğuk",
    ),
    Kahve(
      isim: "Çikolatalı Cookie",
      fiyat: 85,
      resimYolu: "https://images.unsplash.com/photo-1499636136210-6f4ee915583e",
      kategori: "Atıştırmalık",
    ),
    Kahve(
      isim: "Meyveli Cheesecake",
      fiyat: 160,
      resimYolu: "https://images.unsplash.com/photo-1533134242443-d4fd215305ad",
      kategori: "Atıştırmalık",
    ),
  ];

  @override
  void initState() {
    super.initState();
    filtrelenmisKahveler = kahveler;
  }

  void kategoriFiltrele(String kategori) {
    setState(() {
      seciliKategori = kategori;
      if (kategori == "Hepsi") {
        filtrelenmisKahveler = kahveler;
      } else {
        filtrelenmisKahveler = kahveler
            .where((k) => k.kategori == kategori)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kahve Diyarı'),
        backgroundColor: const Color.fromARGB(255, 255, 252, 250),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SepetimSayfasi(
                        sepetListesi: sepetim,
                        onRemove: (index) {
                          setState(() {
                            sepetim.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    sepetim.length.toString(),
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 252, 251, 250),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (deger) {
                setState(() {
                  filtrelenmisKahveler = kahveler
                      .where(
                        (k) =>
                            k.isim.toLowerCase().contains(deger.toLowerCase()),
                      )
                      .toList();
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'kahve ara..',
                hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 40, 15, 6),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => kategoriFiltrele("Hepsi"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: seciliKategori == "Hepsi" ? const Color.fromARGB(255, 40, 15, 6) : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Hepsi",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: seciliKategori == "Hepsi" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => kategoriFiltrele("Sıcak"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: seciliKategori == "Sıcak" ? const Color.fromARGB(255, 40, 15, 6) : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Sıcak Kahveler",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: seciliKategori == "Sıcak" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => kategoriFiltrele("Soğuk"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: seciliKategori == "Soğuk" ? const Color.fromARGB(255, 40, 15, 6) : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Soğuk Kahveler",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: seciliKategori == "Soğuk" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => kategoriFiltrele("Atıştırmalık"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: seciliKategori == "Atıştırmalık" ? const Color.fromARGB(255, 40, 15, 6) : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Atıştırmalıklar",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: seciliKategori == "Atıştırmalık" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filtrelenmisKahveler.length,
              itemBuilder: (context, index) {
                final kahve = filtrelenmisKahveler[index];
                return Card(
                  color: const Color.fromARGB(255, 252, 251, 250),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetaySayfasi(secilenKahve: kahve),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(kahve.resimYolu),
                    ),
                    title: Text(
                      kahve.isim,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 40, 15, 6),
                      ),
                    ),
                    subtitle: Text(
                      "${kahve.fiyat} TL",
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 40, 15, 6),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          sepetim.add(kahve);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${kahve.isim} Sepete Eklendi."),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 61, 29, 18),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: secilenSayfa,
        onTap: (index) {
          setState(() {
            secilenSayfa = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}