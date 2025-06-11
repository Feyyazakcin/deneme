import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  // Uygulamayı başlatırken varsayılan bir şehirle başlatmak için
  runApp(
    MaterialApp(
      home: IlDetaySayfasi(il: 'Adana'),
      debugShowCheckedModeBanner: false, // Debug bandını kaldırır
    ),
  );
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

// Veri yapınızı daha tutarlı hale getirmek için bir Map yerine List<Map<String, String>> kullanılıyor
// ve her bir alan için potansiyel eksiklikler göz önünde bulunduruluyor.
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
      // Eksik telefon/web örneği
      {
        'ad': 'Adana Etnografya Müzesi',
        'kuruluşYılı': '1983',
        'önem': 'Bölgesel kültürel objeler.',
        'koleksiyon': 'Halılar, kilimler, giysiler.',
        'adres': 'Kuruköprü Mah. Seyhan',
        'bilgi': 'Adana’nın kültürel mirasını yansıtır.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': '10 TL',
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
      {
        'ad': 'Sabancı Merkez Camii',
        'tip': 'Camii',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Seyhan Nehri kıyısı',
        'bilgi': 'Türkiye’nin en büyük camilerinden.',
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
      {
        'ad': 'Kazancılar Çarşısı',
        'tip': 'Geleneksel Çarşı',
        'yemekler': 'Ciğer, şırdan, bici bici',
        'fiyat': 'Uygun',
        'bilgi': 'Yöresel lezzetlerin tadılabileceği tarihi çarşı.',
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
  'Adıyaman': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Adıyaman Müzesi',
        'kuruluşYılı': '1978',
        'önem': 'Paleolitik dönemden Roma’ya uzanan eserler.',
        'koleksiyon': 'Heykeller, mozaikler, yazıtlar.',
        'adres': 'Altınşehir Mah. Müze Cad. No:1',
        'telefon': '+90 416 216 1234',
        'web': 'http://adiyamanmuzesi.gov.tr',
        'bilgi': 'Bölgedeki tarihi zenginliği yansıtan önemli bir müze.',
        'ziyaretSaatleri': '08:30 - 17:30',
        'girişÜcreti': '10 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Nemrut Dağı',
        'tip': 'Antik Tümülüs ve Heykel Kompleksi',
        'girişÜcreti': '60 TL',
        'konum': 'Kahta İlçesi',
        'ziyaretSaatleri': '06:00 - 20:00',
        'bilgi': 'Kommagene Krallığı’na ait dev heykelleriyle ünlü.',
      },
      {
        'ad': 'Cendere Köprüsü',
        'tip': 'Tarihi Roma Köprüsü',
        'konum': 'Kahta yakınları, Cendere Çayı üzerinde',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Roma döneminden kalma iyi korunmuş bir taş köprü.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Kahta Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Adıyaman çiğ köftesi, et yemekleri',
        'fiyat': 'Uygun',
        'bilgi': 'Yerel lezzetleri deneyebileceğiniz otantik bir mekan.',
        'adres': 'Kahta Merkez, Atatürk Bulvarı No:45',
        'telefon': '+90 416 725 4567',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Göksu Mağaraları',
        'tip': 'Doğal Mağara',
        'konum': 'Gerger ilçesi',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Doğa yürüyüşü ve keşif için uygun doğal oluşumlar.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'bilgi': 'Güneydoğu Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'bilgi': '600 bin civarı.'},
      {'ad': 'İklim', 'bilgi': 'Kara iklimi etkili, yazlar sıcak ve kurak.'},
    ],
  },
  'Afyonkarahisar': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Afyonkarahisar Arkeoloji Müzesi',
        'kuruluşYılı': '1933',
        'önem': 'Frig, Lidya, Roma ve Bizans dönemine ait eserler.',
        'koleksiyon': 'Heykeller, lahitler, seramikler, yazıtlar.',
        'adres': 'Karaman Mah. Milli Birlik Cad. No:96',
        'telefon': '+90 272 213 7766',
        'web': 'http://afyonmuzesi.gov.tr',
        'bilgi':
            'Zengin arkeolojik koleksiyonuyla Türkiye’nin önemli müzelerindendir.',
        'ziyaretSaatleri': '08:30 - 17:30',
        'girişÜcreti': '15 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Afyonkarahisar Kalesi',
        'tip': 'Tarihi Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Şehir merkezi',
        'ziyaretSaatleri': '09:00 - 18:00',
        'bilgi':
            'M.Ö. 1350’lerde Hititler tarafından yapıldığı tahmin edilir. Şehre hâkim manzarasıyla dikkat çeker.',
      },
      {
        'ad': 'Frig Vadisi',
        'tip': 'Doğal ve Arkeolojik Alan',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'İhsaniye ilçesi',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Kaya yerleşimleri, tapınaklar ve Frig mimarisine ait izler barındırır.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Aşçı Bacaksız',
        'tip': 'Restoran',
        'yemekler': 'Afyon sucuğu, kaymaklı ekmek kadayıfı',
        'fiyat': 'Orta',
        'bilgi': 'Yöresel Afyon mutfağını sunan köklü bir lokanta.',
        'adres': 'Yeşilyol Cad. No:20',
        'telefon': '+90 272 212 3456',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Akdağ Tabiat Parkı',
        'tip': 'Milli Park',
        'konum': 'Sandıklı ilçesi',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Doğa yürüyüşü, kampçılık ve kuş gözlemi için ideal bir alan.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'bilgi': 'Ege Bölgesi’nin İç Batı Anadolu bölümünde yer alır.',
      },
      {'ad': 'Nüfus', 'bilgi': '750 bin civarı.'},
      {
        'ad': 'İklim',
        'bilgi': 'Karasal iklim; kışlar soğuk, yazlar sıcak ve kurak.',
      },
    ],
  },
  'Ağrı': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Ağrı İshak Paşa Sarayı Müzesi',
        'kuruluşYılı': '1984',
        'önem': 'Osmanlı dönemine ait nadide bir saray kompleksi.',
        'koleksiyon': 'Saray eşyaları, silahlar, dönemsel kostümler.',
        'adres': 'Doğubayazıt, Ağrı',
        'telefon': '+90 472 312 1234',
        'web': 'http://ishakpasasarayi.gov.tr',
        'bilgi':
            '18. yüzyılda inşa edilen, Osmanlı mimarisinin önemli örneklerinden biridir.',
        'ziyaretSaatleri': '08:00 - 17:00',
        'girişÜcreti': '20 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'İshak Paşa Sarayı',
        'tip': 'Tarihi Saray',
        'girişÜcreti': '20 TL',
        'konum': 'Doğubayazıt',
        'ziyaretSaatleri': '08:00 - 17:00',
        'bilgi':
            'Osmanlı, Selçuklu ve Barok mimarisini bir araya getiren tarihi yapı.',
      },
      {
        'ad': 'Ağrı Dağı',
        'tip': 'Doğal Dağ ve Tırmanış Alanı',
        'girişÜcreti': 'Rehberli turlar ücretlidir',
        'konum':
            'Iğdır ve Ağrı sınırı', // Iğdır'ın şu anki konumunuz olduğunu hatırlıyorum :)
        'ziyaretSaatleri': 'Doğa şartlarına göre değişken',
        'bilgi':
            'Türkiye’nin en yüksek dağı (5137 m), dağcılık ve doğa tutkunları için popüler.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Doğubayazıt Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Abdigör köftesi, et yemekleri, ayran aşı çorbası',
        'fiyat': 'Uygun',
        'bilgi':
            'Yöresel Ağrı yemeklerini deneyimleyebileceğiniz nezih bir mekan.',
        'adres': 'Doğubayazıt Merkez',
        'telefon': '+90 472 312 5678',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Balık Gölü',
        'tip': 'Volkanik Göl',
        'konum': 'Taşlıçay ilçesi',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Sakin doğası ve kuş gözlemciliği ile bilinen yüksek rakımlı göl.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'bilgi': 'Doğu Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'bilgi': '535 bin civarı.'},
      {
        'ad': 'İklim',
        'bilgi':
            'Karasal iklim; kışlar uzun ve çok soğuk, yazlar kısa ve serin.',
      },
    ],
  },
};

class _IlDetaySayfasiState extends State<IlDetaySayfasi>
    with SingleTickerProviderStateMixin {
  String secilenKategori = 'Arkeolojik Müzeler';
  String aramaKelimesi = '';

  // Yorumlar: Mekan adına göre liste tutuyoruz.
  // Uygulama yeniden başlatıldığında yorumlar sıfırlanır,
  // kalıcı depolama (Hive, SharedPreferences, SQLite) için ayrı bir çalışma gerekir.
  Map<String, List<String>> yorumlar = {};

  // Animasyon için kayan yazı
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    // Animasyon değerlerini ekranın sağından başlayıp sola doğru kayacak şekilde ayarla
    _animation = Tween<double>(
      begin: 1.0, // Ekranın sağ kenarından başlangıç
      end: -1.0, // Ekranın sol kenarına doğru bitiş
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.repeat(); // Animasyonu sürekli tekrarla
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Telefon arama fonksiyonu
  void _callPhone(String number) async {
    final uri = Uri(scheme: 'tel', path: number);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        _showErrorDialog('Telefon', 'Arama yapılamıyor. $number');
      }
    } catch (e) {
      _showErrorDialog('Hata', 'Telefon araması başlatılamadı: $e');
    }
  }

  // URL açma fonksiyonu
  void _openURL(String url) async {
    final uri = Uri.parse(url.startsWith('http') ? url : 'http://$url');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        ); // Harici uygulama ile aç
      } else {
        _showErrorDialog('Web Sayfası', 'Web sayfası açılamıyor. $url');
      }
    } catch (e) {
      _showErrorDialog('Hata', 'Web sayfası açılamadı: $e');
    }
  }

  // Haritada konum gösterme fonksiyonu
  void _showLocation(String address) async {
    final query = Uri.encodeComponent(address);
    // Google Haritalar'ı doğrudan açmak için URI
    // "maps.app.goo.gl" veya "maps.google.com" ile daha güvenilir açılım
    final googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$query',
    );

    try {
      if (await canLaunchUrl(googleMapsUrl)) {
        await launchUrl(googleMapsUrl);
      } else {
        _showErrorDialog('Konum', 'Harita açılamıyor. Adres: $address');
      }
    } catch (e) {
      _showErrorDialog('Hata', 'Harita başlatılamadı: $e');
    }
  }

  // Hata/Bilgi Diyalogu
  void _showErrorDialog(String title, String content) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kapat'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final detaylar = sehirBilgileri[widget.il] ?? {};
    // Mevcut kategorideki mekanlar (hala kategoriye göre listeleme için kullanılıyor)
    final mekanlar = detaylar[secilenKategori] ?? [];

    // Arama kelimesi dolu ise tüm şehirdeki tüm mekanlarda arama yap
    List<Map<String, String>> tumMekanlar = [];
    if (detaylar.isNotEmpty) {
      detaylar.forEach((kategori, mekanListesi) {
        tumMekanlar.addAll(mekanListesi);
      });
    }

    final List<Map<String, String>> filtrelenmisMekanlar =
        aramaKelimesi.trim().isEmpty
            ? mekanlar // Arama yoksa sadece seçili kategorinin mekanlarını göster
            : tumMekanlar.where((mekan) {
              // Arama varsa tüm mekanlarda ara
              // Her bir mekanın tüm değerlerinde arama yap
              return mekan.entries.any((entry) {
                final val = entry.value.toLowerCase();
                return val.contains(aramaKelimesi.toLowerCase());
              });
            }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: RepaintBoundary(
          // Animasyonun geri kalan UI'dan ayrılması için
          child: SizedBox(
            height: 30,
            width:
                MediaQuery.of(context).size.width *
                0.7, // %70'lik alan kaplasın
            child: OverflowBox(
              // Metnin sınırlar dışında kaymasına izin verir
              minWidth: 0.0,
              maxWidth: double.infinity,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  // Metnin genişliğini dinamik olarak hesapla
                  final textPainter = TextPainter(
                    text: TextSpan(
                      text: widget.il,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                  );
                  textPainter.layout();

                  final textWidth = textPainter.width;
                  // Animasyon değerini kullanarak metnin başlangıç konumunu ayarla
                  // Ekranın sağından başlayıp soluna doğru tamamen kaymasını sağlar
                  final offsetX =
                      _animation.value *
                      (textWidth + MediaQuery.of(context).size.width);

                  return Transform.translate(
                    offset: Offset(offsetX, 0),
                    child: Text(
                      widget.il,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children:
                  detaylar.keys.map((kategori) {
                    final isSelected = secilenKategori == kategori;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            secilenKategori = kategori;
                            aramaKelimesi =
                                ''; // Kategori değişince aramayı sıfırla
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),

          // Arama çubuğu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                labelText:
                    'Mekan, bilgi veya özellik ara...', // Yeni, daha genel arama metni
                prefixIcon: const Icon(Icons.search),
                suffixIcon:
                    aramaKelimesi.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.clear),
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
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ), // İç boşluk
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
            child:
                filtrelenmisMekanlar.isEmpty
                    ? Center(
                      child: Text(
                        aramaKelimesi.isNotEmpty
                            ? 'Aradığınız kritere uygun sonuç bulunamadı.'
                            : 'Bu kategori için veri bulunamadı.',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filtrelenmisMekanlar.length,
                      itemBuilder: (context, index) {
                        final mekan = filtrelenmisMekanlar[index];

                        // Mekan adı (zorunlu)
                        final mekanAdi = mekan['ad'] ?? 'İsimsiz Mekan';

                        // Her mekan için yorumlar (varsayılan boş liste)
                        // putIfAbsent, key yoksa ekler, varsa mevcut değeri döndürür.
                        yorumlar.putIfAbsent(mekanAdi, () => []);

                        // "Konumu ve Genel Özellikleri" kategorisi sade liste gösterir
                        if (secilenKategori == 'Konumu ve Genel Özellikleri' &&
                            aramaKelimesi.isEmpty) {
                          // Arama yapılmıyorsa ve "Konumu ve Genel Özellikleri" seçiliyse sade liste göster
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              leading: const Icon(
                                Icons.info_outline,
                                color: Colors.blueGrey,
                              ),
                              title: Text(
                                mekanAdi,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(mekan['bilgi'] ?? 'Bilgi yok.'),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                          );
                        } else if (secilenKategori !=
                                'Konumu ve Genel Özellikleri' ||
                            aramaKelimesi.isNotEmpty) {
                          // Diğer kategoriler veya arama yapılıyorsa detaylı kartı göster
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ExpansionTile(
                              title: Text(
                                mekanAdi,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              leading: Icon(
                                kategoriIkonlari[secilenKategori] ?? Icons.info,
                              ), // Eğer arama yapılıyorsa ikonun hangi kategoriye ait olduğunu bulmak zorlaşır, varsayılan bir ikon iyi olabilir
                              childrenPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              children: [
                                // Mekan detay bilgileri
                                ...mekan.entries
                                    .where((e) => e.key != 'ad')
                                    .map((entry) {
                                      // Telefon Bilgisi
                                      if (entry.key == 'telefon' &&
                                          entry.value.isNotEmpty) {
                                        return ListTile(
                                          visualDensity: VisualDensity.compact,
                                          leading: const Icon(
                                            Icons.phone,
                                            color: Colors.green,
                                            size: 20,
                                          ),
                                          title: Text(entry.value),
                                          trailing: IconButton(
                                            icon: const Icon(
                                              Icons.call,
                                              size: 20,
                                            ),
                                            onPressed:
                                                () => _callPhone(entry.value),
                                          ),
                                        );
                                      }
                                      // Web Bilgisi
                                      if (entry.key == 'web' &&
                                          entry.value.isNotEmpty) {
                                        return ListTile(
                                          visualDensity: VisualDensity.compact,
                                          leading: const Icon(
                                            Icons.language,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          title: Text(entry.value),
                                          trailing: IconButton(
                                            icon: const Icon(
                                              Icons.open_in_new,
                                              size: 20,
                                            ),
                                            onPressed:
                                                () => _openURL(entry.value),
                                          ),
                                        );
                                      }
                                      // Adres Bilgisi
                                      if (entry.key == 'adres' &&
                                          entry.value.isNotEmpty) {
                                        return ListTile(
                                          visualDensity: VisualDensity.compact,
                                          leading: const Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                          title: Text(entry.value),
                                          trailing: IconButton(
                                            icon: const Icon(
                                              Icons.map,
                                              size: 20,
                                            ),
                                            onPressed:
                                                () =>
                                                    _showLocation(entry.value),
                                          ),
                                        );
                                      }
                                      // Diğer bilgiler
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${_keyToLabel(entry.key)}: ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(child: Text(entry.value)),
                                          ],
                                        ),
                                      );
                                    })
                                    .toList(),

                                const Divider(height: 20, thickness: 1),

                                // Yorumlar Bölümü Başlığı
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Ziyaretçi Yorumları',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                ),

                                // Yorum listesi (en son yorum altta)
                                // Yorumları ters çevirerek en yeniyi en üste getir.
                                if (yorumlar[mekanAdi]!.isEmpty)
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Henüz yorum yapılmadı.',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ...yorumlar[mekanAdi]!.reversed.map((yorum) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Card(
                                      color: Colors.blueGrey[50],
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.chat_bubble_outline,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(child: Text(yorum)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),

                                const SizedBox(height: 10),

                                // Yeni yorum ekleme alanı
                                _YorumEkleWidget(
                                  onYorumEklendi: (yeniYorum) {
                                    setState(() {
                                      // Yorumu listenin sonuna ekle
                                      yorumlar[mekanAdi]!.add(yeniYorum);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink(); // Hiçbir koşul sağlanmazsa boş döndür
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
      case 'bilgi': // 'bilgi' key'ini doğrudan göstermek yerine daha özel bir label kullanın
        return 'Ek Bilgi';
      default:
        return key[0].toUpperCase() +
            key.substring(1); // Diğer key'leri baş harfi büyük olarak döndür
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
      FocusScope.of(context).unfocus(); // Klavyeyi kapat
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Controller'ı dispose etmeyi unutma
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), // Daha dar padding
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Yorumunuzu buraya yazın...',
                hintText:
                    'En fazla 200 karakter', // Karakter sınırı eklenebilir
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ), // İç boşluk
              ),
              maxLines: 2, // 1 veya 2 satır görünür
              maxLength: 200, // Karakter sınırı
              textInputAction: TextInputAction.done, // Klavyedeki "bitti" tuşu
              onSubmitted: (_) => _gonder(),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _gonder,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Gönder'),
          ),
        ],
      ),
    );
  }
}
