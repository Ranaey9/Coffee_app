import 'package:flutter/material.dart';
import 'package:kahve_app/Sepet/sepet.dart';
import 'package:kahve_app/screen/detay_syf.dart';
import 'package:kahve_app/screen/favorites_syf.dart';
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
      resimYolu:
          "https://cdn.shopify.com/s/files/1/0510/5893/3917/files/espresso_480x480.png?v=1730890991",
      kategori: "Sıcak",
      isFavorite: false,
    ),
    Kahve(
      isim: "Americano",
      fiyat: 140,
      resimYolu: "https://www.tchibo.com.tr/img/gAQ0DWpO/1919/image.avif",
      kategori: "Sıcak",
      isFavorite: false,
    ),
    Kahve(
      isim: "Latte",
      fiyat: 180,
      resimYolu:
          "https://assets.tmecosys.com/image/upload/t_web_rdp_recipe_584x480_1_5x/img/recipe/ras/Assets/314D11A6-4457-4C70-A1BE-A6C25F597C18/Derivates/B362DC69-6AAA-43E1-AF51-184463E8551B.jpg",
      kategori: "Sıcak",
      isFavorite: false,
    ),
    Kahve(
      isim: "Türk Kahvesi",
      fiyat: 150,
      resimYolu:
          "https://servet.com/cdn/shop/files/servet-turk-kahvesi-01.jpg?v=1725369120&width=1080",
      kategori: "Sıcak",
      isFavorite: false,
    ),
    Kahve(
      isim: "Iced Latte",
      fiyat: 190,
      resimYolu:
          "https://coffeelab.com.tr/wp-content/uploads/2024/08/ice_latte.png",
      kategori: "Soğuk",
      isFavorite: false,
    ),
    Kahve(
      isim: "Frappe",
      fiyat: 210,
      resimYolu:
          "https://www.thehungrybites.com/wp-content/uploads/2023/06/coffee-ice-cream-frappe-frappuccino-3.jpg",
      kategori: "Soğuk",
      isFavorite: false,
    ),
    Kahve(
      isim: "Cold Brew",
      fiyat: 185,
      resimYolu:
          "https://www.kahverengiroastery.com/wp-content/uploads/2024/12/cold-brew.jpg",
      kategori: "Soğuk",
      isFavorite: false,
    ),
    Kahve(
      isim: "Çikolatalı Cookie",
      fiyat: 85,
      resimYolu:
          "https://cdn.yemek.com/mnresize/1250/833/uploads/2021/03/bol-cikolatali-cookie-tarifi.jpg",
      kategori: "Atıştırmalık",
      isFavorite: false,
    ),
    Kahve(
      isim: "Meyveli Cheesecake",
      fiyat: 160,
      resimYolu:
          "https://www.egricayir.com/resimler/resimler/yaz_mevsimine_uygun_bir_tatli_balli_orman_meyveli_cheesecake_tarifi_1654068502.jpg",
      kategori: "Atıştırmalık",
      isFavorite: false,
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
      body: secilenSayfa == 0
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (deger) {
                      setState(() {
                        filtrelenmisKahveler = kahveler
                            .where(
                              (k) => k.isim.toLowerCase().contains(
                                deger.toLowerCase(),
                              ),
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: seciliKategori == "Hepsi"
                                  ? const Color.fromARGB(255, 40, 15, 6)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Hepsi",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: seciliKategori == "Hepsi"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => kategoriFiltrele("Sıcak"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: seciliKategori == "Sıcak"
                                  ? const Color.fromARGB(255, 40, 15, 6)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Sıcak Kahveler",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: seciliKategori == "Sıcak"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => kategoriFiltrele("Soğuk"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: seciliKategori == "Soğuk"
                                  ? const Color.fromARGB(255, 40, 15, 6)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Soğuk Kahveler",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: seciliKategori == "Soğuk"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => kategoriFiltrele("Atıştırmalık"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: seciliKategori == "Atıştırmalık"
                                  ? const Color.fromARGB(255, 40, 15, 6)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Atıştırmalıklar",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: seciliKategori == "Atıştırmalık"
                                    ? Colors.white
                                    : Colors.black,
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
                                builder: (context) =>
                                    DetaySayfasi(secilenKahve: kahve),
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
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      kahve.isFavorite = !kahve.isFavorite;
                                    });
                                  },
                                  icon: Icon(
                                    kahve.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: kahve.isFavorite
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sepetim.add(kahve);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "${kahve.isim} Sepete Eklendi.",
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 61, 29, 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : FavorilerSayfasi(
              favoriListesi: kahveler.where((k) => k.isFavorite).toList(),
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
