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
        'ziyaretSaatleri': '09:00 - 18:00',
        'girişÜcreti': '20 TL',
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
        'adres': 'Çınarlı Mah. İstiklal Cad. No:5',
        'telefon': '+90 322 555 1234',
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
      {'ad': 'Nüfus', 'bilgi': '1.7 milyon civarı.'},
      {'ad': 'İklim', 'bilgi': 'Sıcak Akdeniz iklimi.'},
    ],
  },
};

class _IlDetaySayfasiState extends State<IlDetaySayfasi>
    with SingleTickerProviderStateMixin {
  String secilenKategori = 'Arkeolojik Müzeler';
  String aramaKelimesi = '';

  // Yorumlar: Mekan adına göre liste tutuyoruz.
  Map<String, List<String>> yorumlar = {};

  // Animasyon için kayan yazı
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    )..repeat();

    _animation = Tween<double>(
      begin: 1.0,
      end: -1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  void _showLocation(String address) async {
    // Google Maps için URI oluşturalım
    final query = Uri.encodeComponent(address);
    final googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$query',
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      // Eğer açılamazsa dialog göster
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Konum'),
          content: Text('Adres: $address\n(Harita açılamıyor)'),
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

  @override
  Widget build(BuildContext context) {
    final detaylar = sehirBilgileri[widget.il] ?? {};
    final mekanlar = detaylar[secilenKategori] ?? [];

    // Tüm mekanları kategori fark etmeksizin arama için birleştiriyoruz
    List<Map<String, String>> tumMekanlar = [];
    detaylar.forEach((kategori, mekanListesi) {
      tumMekanlar.addAll(mekanListesi);
    });

    final filtrelenmisMekanlar = aramaKelimesi.trim().isEmpty
        ? mekanlar
        : tumMekanlar.where((mekan) {
            return mekan.entries.any((entry) {
              final val = entry.value.toLowerCase();
              return val.contains(aramaKelimesi.toLowerCase());
            });
          }).toList();

    final ekranGenisligi = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: SizedBox(
          height: 30,
          child: ClipRect(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final textPainter = TextPainter(
                  text: TextSpan(
                    text: widget.il,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  maxLines: 1,
                  textDirection: TextDirection.ltr,
                );
                textPainter.layout();

                final textWidth = textPainter.width;

                final offsetX = _animation.value * (ekranGenisligi + textWidth);

                return Transform.translate(
                  offset: Offset(offsetX, 0),
                  child: child,
                );
              },
              child: Text(
                widget.il,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Kategori butonları
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: detaylar.keys.map((kategori) {
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
                        aramaKelimesi = '';
                      });
                    },
                    icon: Icon(kategoriIkonlari[kategori] ?? Icons.category),
                    label: Text(kategori),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                          ? Colors.blue
                          : Colors.grey[400],
                      foregroundColor: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Arama çubuğu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Mekan ara...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: aramaKelimesi.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            aramaKelimesi = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  aramaKelimesi = value;
                });
              },
            ),
          ),

          // Mekan listesi
          Expanded(
            child: filtrelenmisMekanlar.isEmpty
                ? Center(child: Text('Sonuç bulunamadı.'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtrelenmisMekanlar.length,
                    itemBuilder: (context, index) {
                      final mekan = filtrelenmisMekanlar[index];

                      // Mekan adı (zorunlu)
                      final mekanAdi = mekan['ad'] ?? 'İsimsiz Mekan';

                      // Her mekan için yorumlar (varsayılan boş liste)
                      yorumlar.putIfAbsent(mekanAdi, () => []);

                      // "Konumu ve Genel Özellikleri" kategorisi sade liste gösterir
                      if (secilenKategori == 'Konumu ve Genel Özellikleri') {
                        return Card(
                          child: ListTile(
                            title: Text(
                              mekanAdi,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(mekan['bilgi'] ?? ''),
                          ),
                        );
                      }

                      return Card(
                        child: ExpansionTile(
                          title: Text(
                            mekanAdi,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                            // Mekan detay bilgileri
                            ...mekan.entries.where((e) => e.key != 'ad').map((
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
                                    onPressed: () => _callPhone(entry.value),
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
                                    onPressed: () => _showLocation(entry.value),
                                  ),
                                );
                              }

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${_keyToLabel(entry.key)}: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(child: Text(entry.value)),
                                  ],
                                ),
                              );
                            }).toList(),

                            Divider(),

                            // Yorumlar Bölümü
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Text(
                                'Ziyaretçi Yorumları',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),

                            // Yorum listesi (en son yorum altta)
                            ...yorumlar[mekanAdi]!.map((yorum) {
                              return ListTile(
                                leading: Icon(Icons.comment),
                                title: Text(yorum),
                              );
                            }).toList(),

                            // Yeni yorum ekleme alanı
                            _YorumEkleWidget(
                              onYorumEklendi: (yeniYorum) {
                                setState(() {
                                  yorumlar[mekanAdi]!.add(yeniYorum);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Helper: key'den okunabilir label oluştur
  String _keyToLabel(String key) {
    switch (key) {
      case 'kuruluşYılı':
        return 'Kuruluş Yılı';
      case 'önem':
        return 'Önem';
      case 'koleksiyon':
        return 'Koleksiyon';
      case 'tip':
        return 'Tip';
      case 'yemekler':
        return 'Yemekler';
      case 'fiyat':
        return 'Fiyat';
      case 'konum':
        return 'Konum';
      case 'ziyaretSaatleri':
        return 'Ziyaret Saatleri';
      case 'girişÜcreti':
        return 'Giriş Ücreti';
      default:
        return key[0].toUpperCase() + key.substring(1);
    }
  }
}

class _YorumEkleWidget extends StatefulWidget {
  final void Function(String) onYorumEklendi;
  const _YorumEkleWidget({required this.onYorumEklendi});

  @override
  State<_YorumEkleWidget> createState() => _YorumEkleWidgetState();
}

class _YorumEkleWidgetState extends State<_YorumEkleWidget> {
  final TextEditingController _controller = TextEditingController();

  void _gonder() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onYorumEklendi(text);
      _controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Yorum ekle...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (_) => _gonder(),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(onPressed: _gonder, child: Text('Gönder')),
        ],
      ),
    );
  }
}
