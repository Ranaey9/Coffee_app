import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int secilenSayfa = 0;
  int sepetSayisi = 0;
  List<Kahve> sepetim = [];
  List<Kahve> kahveler = [
    Kahve(
      isim: "Espresso",
      fiyat: 120,
      resimYolu: "https://images.unsplash.com/photo-1510707577719-ae7c14805e3a",
    ),
    Kahve(
      isim: "Americano",
      fiyat: 140,
      resimYolu: "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
    ),
    Kahve(
      isim: "Latte",
      fiyat: 180,
      resimYolu: "https://images.unsplash.com/photo-1524758631624-e2822e304c36",
    ),
    Kahve(
      isim: "Cappuccino",
      fiyat: 190,
      resimYolu: "https://images.unsplash.com/photo-1511920170033-f8396924c348",
    ),
    Kahve(
      isim: "Mocha",
      fiyat: 220,
      resimYolu: "https://images.unsplash.com/photo-1541167760496-1628856ab772",
    ),
    Kahve(
      isim: "Türk Kahvesi",
      fiyat: 150,
      resimYolu: "https://images.unsplash.com/photo-1605478522258-7f90f8b5f5a3",
    ),
    Kahve(
      isim: "Flat White",
      fiyat: 170,
      resimYolu: "https://images.unsplash.com/photo-1521302080334-4bebac2763a6",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kahve Diyarı'),
        backgroundColor: Color.fromARGB(255, 255, 252, 250),
        actions: [
          Stack(
            alignment: AlignmentGeometry.center,
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
                icon: Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    sepetim.length.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 252, 250),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'kahve ara..',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 40, 15, 6),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 15, 6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Sıcak Kahveler",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 15, 6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Soğuk Kahveler",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 15, 6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Atıştırmalıklar",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: kahveler.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromARGB(255, 252, 251, 250),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetaySayfasi(secilenKahve: kahveler[index]),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            kahveler[index].resimYolu,
                          ),
                        ),
                        title: Text(
                          kahveler[index].isim,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 40, 15, 6),
                          ),
                        ),
                        subtitle: Text(
                          kahveler[index].fiyat.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: const Color.fromARGB(255, 40, 15, 6),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              sepetim.add(kahveler[index]);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${kahveler[index].isim} Sepete Eklendi.",
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: const Color.fromARGB(255, 61, 29, 18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
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
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class Kahve {
  String isim;
  double fiyat;
  String resimYolu;

  Kahve({required this.isim, required this.fiyat, required this.resimYolu});
}

class DetaySayfasi extends StatelessWidget {
  final Kahve secilenKahve;
  const DetaySayfasi({super.key, required this.secilenKahve});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(secilenKahve.isim),
        backgroundColor: Colors.brown.shade50,
      ),
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
        backgroundColor: Color.fromARGB(255, 255, 252, 250),
      ),
      backgroundColor: Color.fromARGB(255, 255, 252, 250),

      body: widget.sepetListesi.isEmpty
          ? const Center(child: Text("Sepetiniz henüz boş!",style: TextStyle(fontSize: 20),))
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
                  padding: const EdgeInsets.all(20),
                  color: Colors.brown.shade50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Toplam Tutar:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${toplamhesapla()} TL",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
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
