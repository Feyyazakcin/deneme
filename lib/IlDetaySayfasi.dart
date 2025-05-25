import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: IlDetaySayfasi(il: 'Adana')));
}

class IlDetaySayfasi extends StatefulWidget {
  final String il;
  IlDetaySayfasi({required this.il});

  @override
  State<IlDetaySayfasi> createState() => _IlDetaySayfasiState();
}

final Map<String, IconData> kategoriIkonlari = {
  'Arkeolojik Müzeler': Icons.account_balance,
  'Gezilecek Yerler': Icons.place,
  'Tarihi Yerler': Icons.fort,
  'Doğa ve Parklar': Icons.nature_people,
  'Sanat ve Kültür Merkezleri': Icons.theater_comedy,
  'Alışveriş ve Çarşılar': Icons.shopping_bag,
  'Yeme İçme Mekanları': Icons.restaurant,
  'Eğlence ve Etkinlik Alanları': Icons.celebration,
  'Festivaller ve Etkinlikler': Icons.event,
  'Ulaşım ve Erişim Bilgileri': Icons.directions_bus,
  'Eğitim Kurumları': Icons.school,
  'Konumu ve Genel Özellikleri': Icons.location_on,
};

final Map<String, Map<String, List<Map<String, String>>>> sehirBilgileri = {
  'Adana': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Adana Arkeoloji Müzesi',
        'kuruluşYılı': '1919',
        'önem': 'Roma, Hitit ve Osmanlı dönemine ait koleksiyon.',
        'koleksiyon': 'Tabletler, sikkeler, heykeller.',
        'adres': 'Atatürk Cad. No:12, Seyhan',
        'telefon': '+90 322 456 7890',
        'web': 'http://adanamuzesi.gov.tr',
        'bilgi': 'Türkiye’nin en eski müzelerinden biri.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Taşköprü',
        'tip': 'Antik Roma Köprüsü',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Seyhan Nehri',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi': 'Roma döneminden kalma tarihi köprü.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Kebapçı Mesut',
        'tip': 'Restoran',
        'yemekler': 'Adana kebabı, şalgam suyu',
        'fiyat': 'Orta',
        'bilgi': 'Ünlü kebapçılardan biri.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Merkez Park',
        'tip': 'Şehir Parkı',
        'konum': 'Seyhan Nehri kıyısı',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Türkiye’nin en büyük şehir parklarından.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'bilgi': 'Akdeniz Bölgesi’nde yer alır.'},
    ],
  },
};

class _IlDetaySayfasiState extends State<IlDetaySayfasi> {
  String secilenKategori = 'Arkeolojik Müzeler';
  String aramaKelimesi = '';

  @override
  Widget build(BuildContext context) {
    final detaylar = sehirBilgileri[widget.il] ?? {};
    final mekanlar = detaylar[secilenKategori] ?? [];

    // *** TÜM KATEGORİLERDEN MEKANLARI TOPLA ***
    List<Map<String, String>> tumMekanlar = [];
    detaylar.forEach((kategori, mekanListesi) {
      tumMekanlar.addAll(mekanListesi);
    });

    // *** ARAMA YAP: Eğer arama kelimesi boşsa sadece seçilen kategori, değilse tüm kategorilerde ara ***
    final filtrelenmisMekanlar =
        aramaKelimesi.trim().isEmpty
            ? mekanlar
            : tumMekanlar.where((mekan) {
              return mekan.entries.any((entry) {
                final val = entry.value.toLowerCase();
                return val.contains(aramaKelimesi.toLowerCase());
              });
            }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('${widget.il} Rehberi')),
      body: Column(
        children: [
          // Kategori Butonları
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  detaylar.keys.map((kategori) {
                    final isSelected = secilenKategori == kategori;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            secilenKategori = kategori;
                            aramaKelimesi =
                                ''; // kategori değişince arama sıfırlanıyor
                          });
                        },
                        icon: Icon(
                          kategoriIkonlari[kategori] ?? Icons.category,
                        ),
                        label: Text(kategori),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isSelected ? Colors.blue : Colors.grey[400],
                          foregroundColor: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),

          // Arama Çubuğu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Mekan ara...',
                prefixIcon: Icon(Icons.search),
                suffixIcon:
                    aramaKelimesi.isNotEmpty
                        ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() => aramaKelimesi = '');
                          },
                        )
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                setState(() => aramaKelimesi = value);
              },
            ),
          ),

          // Mekan Listesi
          Expanded(
            child:
                filtrelenmisMekanlar.isEmpty
                    ? Center(child: Text('Sonuç bulunamadı.'))
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filtrelenmisMekanlar.length,
                      itemBuilder: (context, index) {
                        final mekan = filtrelenmisMekanlar[index];

                        // Eğer seçili kategori "Konumu ve Genel Özellikleri" ise sade liste göster
                        if (secilenKategori == 'Konumu ve Genel Özellikleri') {
                          return Card(
                            child: ListTile(
                              title: Text(
                                mekan['ad'] ?? '',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(mekan['bilgi'] ?? ''),
                            ),
                          );
                        }

                        // Diğer kategoriler için detaylı görünüm
                        return Card(
                          child: ExpansionTile(
                            title: Text(
                              mekan['ad'] ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            children:
                                mekan.entries.where((e) => e.key != 'ad').map((
                                  entry,
                                ) {
                                  if (entry.key == 'telefon') {
                                    return ListTile(
                                      leading: Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                      ),
                                      title: Text(entry.value),
                                      trailing: IconButton(
                                        icon: Icon(Icons.call),
                                        onPressed:
                                            () => _callPhone(entry.value),
                                      ),
                                    );
                                  }
                                  if (entry.key == 'web') {
                                    return ListTile(
                                      leading: Icon(
                                        Icons.language,
                                        color: Colors.blue,
                                      ),
                                      title: Text(entry.value),
                                      trailing: IconButton(
                                        icon: Icon(Icons.open_in_new),
                                        onPressed: () => _openURL(entry.value),
                                      ),
                                    );
                                  }
                                  if (entry.key == 'adres') {
                                    return ListTile(
                                      leading: Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                      ),
                                      title: Text(entry.value),
                                      trailing: IconButton(
                                        icon: Icon(Icons.map),
                                        onPressed:
                                            () => _showLocation(entry.value),
                                      ),
                                    );
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 4,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${entry.key}: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(child: Text(entry.value)),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  void _callPhone(String number) async {
    final uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _openURL(String url) async {
    final uri = Uri.parse(url.startsWith('http') ? url : 'http://$url');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _showLocation(String address) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Konum'),
            content: Text('Adres: $address\n(Harita entegrasyonu eklenebilir)'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Kapat'),
              ),
            ],
          ),
    );
  }
}
