import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IlDetaySayfasi extends StatelessWidget {
  final String il;

  IlDetaySayfasi({required this.il});

  // Kategoriler ve içerikler (kırpılmış hali)
  final Map<String, Map<String, List<String>>> sehirBilgileri = {
    'Adana': {
      'Müzeler': ['Adana Arkeoloji Müzesi', 'Adana Sinema Müzesi'],
      'Tiyatro Salonları': ['Adana Devlet Tiyatrosu'],
      'Restoranlar': ['Kebapçı Mesut', 'Onbaşılar'],
      'Tarihi Yerler': ['Taşköprü', 'Büyük Saat'],
    },
    'Adıyaman': {
      'Müzeler': ['Adıyaman Müzesi'],
      'Tiyatro Salonları': ['Kültür Merkezi'],
      'Restoranlar': ['Nemrut Sofrası'],
      'Tarihi Yerler': ['Nemrut Dağı', 'Cendere Köprüsü'],
    },
    'Afyonkarahisar': {
      'Müzeler': ['Afyon Müzesi'],
      'Tiyatro Salonları': ['AKÜ Sahnesi'],
      'Restoranlar': ['Aşçı Bacaksız'],
      'Tarihi Yerler': ['Afyon Kalesi'],
    },
    'Ağrı': {
      'Müzeler': ['İshak Paşa Sarayı'],
      'Tiyatro Salonları': ['Ağrı Kültür Merkezi'],
      'Restoranlar': ['Doğubayazıt Sofrası'],
      'Tarihi Yerler': ['Ağrı Dağı'],
    },
    'Aksaray': {
      'Müzeler': ['Aksaray Müzesi'],
      'Tiyatro Salonları': ['Aksaray Kültür Merkezi'],
      'Restoranlar': ['Taşpınar Sofrası'],
      'Tarihi Yerler': ['Ihlara Vadisi'],
    },
    'Amasya': {
      'Müzeler': ['Amasya Müzesi'],
      'Tiyatro Salonları': ['Belediye Tiyatrosu'],
      'Restoranlar': ['Yalıboyu Lokantası'],
      'Tarihi Yerler': ['Kral Mezarları'],
    },
    'Ankara': {
      'Müzeler': ['Anıtkabir', 'Anadolu Medeniyetleri Müzesi'],
      'Tiyatro Salonları': ['Devlet Tiyatroları'],
      'Restoranlar': ['Aspava', 'Trilye'],
      'Tarihi Yerler': ['Anıtkabir', 'Augustus Tapınağı'],
    },
    'Antalya': {
      'Müzeler': ['Antalya Müzesi'],
      'Tiyatro Salonları': ['Devlet Tiyatrosu'],
      'Restoranlar': ['7 Mehmet'],
      'Tarihi Yerler': ['Kaleiçi', 'Aspendos'],
    },
    'Ardahan': {
      'Müzeler': ['Ardahan Müzesi'],
      'Tiyatro Salonları': ['Kültür Merkezi'],
      'Restoranlar': ['Kafkas Lokantası'],
      'Tarihi Yerler': ['Şeytan Kalesi'],
    },
    'Artvin': {
      'Müzeler': ['Artvin Ekomüzesi'],
      'Tiyatro Salonları': ['Belediye Sahnesi'],
      'Restoranlar': ['Dağ Yolu Sofrası'],
      'Tarihi Yerler': ['Arhavi Köprüsü'],
    },
    'Aydın': {
      'Müzeler': ['Aydın Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Şehir Tiyatrosu'],
      'Restoranlar': ['Aydın Kebapçısı'],
      'Tarihi Yerler': ['Tralleis Antik Kenti'],
    },
    'Balıkesir': {
      'Müzeler': ['Kuvayi Milliye Müzesi'],
      'Tiyatro Salonları': ['Şehir Sahnesi'],
      'Restoranlar': ['Balıkesir Lokantası'],
      'Tarihi Yerler': ['Zağnos Paşa Camii'],
    },
    'Bartın': {
      'Müzeler': ['Bartın Müzesi'],
      'Tiyatro Salonları': ['Bartın Kültür Merkezi'],
      'Restoranlar': ['Bartın Sofrası'],
      'Tarihi Yerler': ['Amasra Kalesi'],
    },
    'Batman': {
      'Müzeler': ['Batman Müzesi'],
      'Tiyatro Salonları': ['Şehir Tiyatrosu'],
      'Restoranlar': ['Batman Lokantası'],
      'Tarihi Yerler': ['Hasankeyf'],
    },
    'Bayburt': {
      'Müzeler': ['Bayburt Baksı Müzesi'],
      'Tiyatro Salonları': ['Bayburt Kültür Merkezi'],
      'Restoranlar': ['Bayburt Sofrası'],
      'Tarihi Yerler': ['Bayburt Kalesi'],
    },
    'Bilecik': {
      'Müzeler': ['Bilecik Müzesi'],
      'Tiyatro Salonları': ['Kültür Merkezi'],
      'Restoranlar': ['Söğüt Lokantası'],
      'Tarihi Yerler': ['Şeyh Edebali Türbesi'],
    },
    'Bingöl': {
      'Müzeler': ['Bingöl Müzesi'],
      'Tiyatro Salonları': ['Belediye Sahnesi'],
      'Restoranlar': ['Yayla Sofrası'],
      'Tarihi Yerler': ['Yüzen Ada'],
    },
    'Bitlis': {
      'Müzeler': ['Bitlis Etnografya Müzesi'],
      'Tiyatro Salonları': ['Bitlis Kültür Merkezi'],
      'Restoranlar': ['Tatvan Sofrası'],
      'Tarihi Yerler': ['Bitlis Kalesi'],
    },
    'Bolu': {
      'Müzeler': ['Bolu Müzesi'],
      'Tiyatro Salonları': ['Abant İzzet Baysal Sahnesi'],
      'Restoranlar': ['Bolu Mangal Evi'],
      'Tarihi Yerler': ['Gölcük Tabiat Parkı'],
    },
    'Burdur': {
      'Müzeler': ['Burdur Müzesi'],
      'Tiyatro Salonları': ['Burdur Belediyesi Kültür Salonu'],
      'Restoranlar': ['Burdur Şiş Lokantası'],
      'Tarihi Yerler': ['Sagalassos Antik Kenti'],
    },
    'Çorum': {
      'Müzeler': ['Çorum Müzesi'],
      'Tiyatro Salonları': ['Çorum Belediyesi Sahnesi'],
      'Restoranlar': ['Çorum Lezzet Sofrası'],
      'Tarihi Yerler': ['Hattuşaş'],
    },
    'Denizli': {
      'Müzeler': ['Denizli Müzesi'],
      'Tiyatro Salonları': ['Denizli Devlet Tiyatrosu'],
      'Restoranlar': ['Denizli Kebabı'],
      'Tarihi Yerler': ['Pamukkale Travertenleri'],
    },
    'Diyarbakır': {
      'Müzeler': ['Diyarbakır Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Diyarbakır Devlet Tiyatrosu'],
      'Restoranlar': ['Diyarbakır Kebabı'],
      'Tarihi Yerler': ['Diyarbakır Surları'],
    },
    'Düzce': {
      'Müzeler': ['Düzce Müzesi'],
      'Tiyatro Salonları': ['Düzce Kültür Merkezi'],
      'Restoranlar': ['Düzce Kebabı'],
      'Tarihi Yerler': ['Göller Yöresi'],
    },
    'Edirne': {
      'Müzeler': ['Edirne Müzesi'],
      'Tiyatro Salonları': ['Edirne Devlet Tiyatrosu'],
      'Restoranlar': ['Ciğerci Niyazi'],
      'Tarihi Yerler': ['Selimiye Camii'],
    },
    'Elazığ': {
      'Müzeler': ['Elazığ Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Elazığ Tiyatrosu'],
      'Restoranlar': ['Elazığ Köftecisi'],
      'Tarihi Yerler': ['Harput Kalesi'],
    },
    'Erzincan': {
      'Müzeler': ['Erzincan Müzesi'],
      'Tiyatro Salonları': ['Erzincan Kültür Merkezi'],
      'Restoranlar': ['Erzincan Tandır Evi'],
      'Tarihi Yerler': ['Erzincan Evleri'],
    },
    'Erzurum': {
      'Müzeler': ['Erzurum Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Erzurum Devlet Tiyatrosu'],
      'Restoranlar': ['Erzurum Cağ Kebabı'],
      'Tarihi Yerler': ['Erzurum Kalesi'],
    },
    'Eskişehir': {
      'Müzeler': ['Eskişehir Modern Sanatlar Müzesi'],
      'Tiyatro Salonları': ['Eskişehir Şehir Tiyatrosu'],
      'Restoranlar': ['Eskişehir Odunpazarı Lokantası'],
      'Tarihi Yerler': ['Odunpazarı Evleri'],
    },
    'Gaziantep': {
      'Müzeler': ['Gaziantep Zeugma Mozaik Müzesi'],
      'Tiyatro Salonları': ['Gaziantep Devlet Tiyatrosu'],
      'Restoranlar': ['Kebapçı Halil Usta'],
      'Tarihi Yerler': ['Gaziantep Kalesi'],
    },
    'Giresun': {
      'Müzeler': ['Giresun Müzesi'],
      'Tiyatro Salonları': ['Giresun Kültür Merkezi'],
      'Restoranlar': ['Giresun Sofrası'],
      'Tarihi Yerler': ['Giresun Kalesi'],
    },
    'Gümüşhane': {
      'Müzeler': ['Gümüşhane Müzesi'],
      'Tiyatro Salonları': ['Gümüşhane Kültür Merkezi'],
      'Restoranlar': ['Gümüşhane Sofrası'],
      'Tarihi Yerler': ['Santa Harabeleri'],
    },
    'Hakkari': {
      'Müzeler': ['Hakkari Müzesi'],
      'Tiyatro Salonları': ['Hakkari Kültür Merkezi'],
      'Restoranlar': ['Hakkari Sofrası'],
      'Tarihi Yerler': ['Yüksekova Vadisi'],
    },
    'Hatay': {
      'Müzeler': ['Hatay Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Antakya Devlet Tiyatrosu'],
      'Restoranlar': ['Hatay Sofrası'],
      'Tarihi Yerler': ['Antakya Evleri'],
    },
    'Iğdır': {
      'Müzeler': ['Iğdır Müzesi'],
      'Tiyatro Salonları': ['Iğdır Kültür Merkezi'],
      'Restoranlar': ['Iğdır Sofrası'],
      'Tarihi Yerler': ['Ağrı Dağı'],
    },
    'Isparta': {
      'Müzeler': ['Isparta Müzesi'],
      'Tiyatro Salonları': ['Isparta Devlet Tiyatrosu'],
      'Restoranlar': ['Isparta Kebabı'],
      'Tarihi Yerler': ['Göller Yöresi'],
    },
    'İzmir': {
      'Müzeler': ['İzmir Arkeoloji Müzesi', 'Atatürk Müzesi'],
      'Tiyatro Salonları': ['İzmir Devlet Tiyatrosu'],
      'Restoranlar': ['Kordon Lokantası'],
      'Tarihi Yerler': ['Efes Antik Kenti'],
    },
    'Kahramanmaraş': {
      'Müzeler': ['Kahramanmaraş Müzesi'],
      'Tiyatro Salonları': ['Kahramanmaraş Devlet Tiyatrosu'],
      'Restoranlar': ['Maraş Dondurması'],
      'Tarihi Yerler': ['Kahramanmaraş Kalesi'],
    },
    'Karabük': {
      'Müzeler': ['Karabük Müzesi'],
      'Tiyatro Salonları': ['Karabük Kültür Merkezi'],
      'Restoranlar': ['Karabük Sofrası'],
      'Tarihi Yerler': ['Safranbolu Evleri'],
    },
    'Karaman': {
      'Müzeler': ['Karaman Müzesi'],
      'Tiyatro Salonları': ['Karaman Kültür Merkezi'],
      'Restoranlar': ['Karaman Kebabı'],
      'Tarihi Yerler': ['Karaman Kalesi'],
    },
    'Kastamonu': {
      'Müzeler': ['Kastamonu Müzesi'],
      'Tiyatro Salonları': ['Kastamonu Kültür Merkezi'],
      'Restoranlar': ['Kastamonu Çekme Helvası'],
      'Tarihi Yerler': ['Kastamonu Kalesi'],
    },
    'Kayseri': {
      'Müzeler': ['Kayseri Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Kayseri Devlet Tiyatrosu'],
      'Restoranlar': ['Kayseri Mantıcısı'],
      'Tarihi Yerler': ['Kayseri Kalesi'],
    },
    'Kırıkkale': {
      'Müzeler': ['Kırıkkale Müzesi'],
      'Tiyatro Salonları': ['Kırıkkale Kültür Merkezi'],
      'Restoranlar': ['Kırıkkale Sofrası'],
      'Tarihi Yerler': ['Kırıkkale Evleri'],
    },
    'Kırklareli': {
      'Müzeler': ['Kırklareli Müzesi'],
      'Tiyatro Salonları': ['Kırklareli Kültür Merkezi'],
      'Restoranlar': ['Kırklareli Sofrası'],
      'Tarihi Yerler': ['Kırklareli Kalesi'],
    },
    'Kırşehir': {
      'Müzeler': ['Kırşehir Müzesi'],
      'Tiyatro Salonları': ['Kırşehir Kültür Merkezi'],
      'Restoranlar': ['Kırşehir Mantı Salonu'],
      'Tarihi Yerler': ['Kırşehir Kalesi'],
    },
    'Konya': {
      'Müzeler': ['Mevlana Müzesi'],
      'Tiyatro Salonları': ['Konya Devlet Tiyatrosu'],
      'Restoranlar': ['Konya Etli Ekmekçisi'],
      'Tarihi Yerler': ['Konya Alaeddin Tepesi'],
    },
    'Kütahya': {
      'Müzeler': ['Kütahya Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Kütahya Belediyesi Kültür Merkezi'],
      'Restoranlar': ['Kütahya Kebabı'],
      'Tarihi Yerler': ['Kütahya Çini Atölyeleri'],
    },
    'Malatya': {
      'Müzeler': ['Malatya Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Malatya Devlet Tiyatrosu'],
      'Restoranlar': ['Malatya Kebabı'],
      'Tarihi Yerler': ['Malatya Kalesi'],
    },
    'Manisa': {
      'Müzeler': ['Manisa Müzesi'],
      'Tiyatro Salonları': ['Manisa Kültür Merkezi'],
      'Restoranlar': ['Manisa Kebabı'],
      'Tarihi Yerler': ['Manisa Kalesi'],
    },
    'Mardin': {
      'Müzeler': ['Mardin Müzesi'],
      'Tiyatro Salonları': ['Mardin Kültür Merkezi'],
      'Restoranlar': ['Mardin Sofrası'],
      'Tarihi Yerler': ['Mardin Evleri'],
    },
    'Mersin': {
      'Müzeler': ['Mersin Müzesi'],
      'Tiyatro Salonları': ['Mersin Devlet Tiyatrosu'],
      'Restoranlar': ['Mersin Kebabı'],
      'Tarihi Yerler': ['Mersin Kalesi'],
    },
    'Muğla': {
      'Müzeler': ['Muğla Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Muğla Kültür Merkezi'],
      'Restoranlar': ['Muğla Mantı Evi'],
      'Tarihi Yerler': ['Muğla Kalesi'],
    },
    'Muş': {
      'Müzeler': ['Muş Müzesi'],
      'Tiyatro Salonları': ['Muş Kültür Merkezi'],
      'Restoranlar': ['Muş Kebabı'],
      'Tarihi Yerler': ['Muş Kalesi'],
    },
    'Nevşehir': {
      'Müzeler': ['Nevşehir Müzesi'],
      'Tiyatro Salonları': ['Nevşehir Kültür Merkezi'],
      'Restoranlar': ['Nevşehir Sofrası'],
      'Tarihi Yerler': ['Göreme Açık Hava Müzesi'],
    },
    'Niğde': {
      'Müzeler': ['Niğde Müzesi'],
      'Tiyatro Salonları': ['Niğde Kültür Merkezi'],
      'Restoranlar': ['Niğde Köftesi'],
      'Tarihi Yerler': ['Niğde Kalesi'],
    },
    'Ordu': {
      'Müzeler': ['Ordu Müzesi'],
      'Tiyatro Salonları': ['Ordu Kültür Merkezi'],
      'Restoranlar': ['Ordu Pidesi'],
      'Tarihi Yerler': ['Ordu Kalesi'],
    },
    'Osmaniye': {
      'Müzeler': ['Osmaniye Müzesi'],
      'Tiyatro Salonları': ['Osmaniye Kültür Merkezi'],
      'Restoranlar': ['Osmaniye Sofrası'],
      'Tarihi Yerler': ['Osmaniye Kalesi'],
    },
    'Rize': {
      'Müzeler': ['Rize Müzesi'],
      'Tiyatro Salonları': ['Rize Kültür Merkezi'],
      'Restoranlar': ['Rize Pidesi'],
      'Tarihi Yerler': ['Rize Kalesi'],
    },
    'Sakarya': {
      'Müzeler': ['Sakarya Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Sakarya Kültür Merkezi'],
      'Restoranlar': ['Sakarya Pidesi'],
      'Tarihi Yerler': ['Sakarya Kalesi'],
    },
    'Samsun': {
      'Müzeler': ['Samsun Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Samsun Devlet Tiyatrosu'],
      'Restoranlar': ['Samsun Kumpirçisi'],
      'Tarihi Yerler': ['Samsun Kalesi'],
    },
    'Siirt': {
      'Müzeler': ['Siirt Müzesi'],
      'Tiyatro Salonları': ['Siirt Kültür Merkezi'],
      'Restoranlar': ['Siirt Kebabı'],
      'Tarihi Yerler': ['Siirt Kalesi'],
    },
    'Sinop': {
      'Müzeler': ['Sinop Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Sinop Kültür Merkezi'],
      'Restoranlar': ['Sinop Balıkçısı'],
      'Tarihi Yerler': ['Sinop Kalesi'],
    },
    'Sivas': {
      'Müzeler': ['Sivas Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Sivas Devlet Tiyatrosu'],
      'Restoranlar': ['Sivas Kebabı'],
      'Tarihi Yerler': ['Sivas Kalesi'],
    },
    'Şanlıurfa': {
      'Müzeler': ['Şanlıurfa Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Şanlıurfa Devlet Tiyatrosu'],
      'Restoranlar': ['Şanlıurfa Kebabı'],
      'Tarihi Yerler': ['Göbeklitepe'],
    },
    'Tekirdağ': {
      'Müzeler': ['Tekirdağ Müzesi'],
      'Tiyatro Salonları': ['Tekirdağ Kültür Merkezi'],
      'Restoranlar': ['Tekirdağ Köftesi'],
      'Tarihi Yerler': ['Tekirdağ Kalesi'],
    },
    'Tokat': {
      'Müzeler': ['Tokat Müzesi'],
      'Tiyatro Salonları': ['Tokat Kültür Merkezi'],
      'Restoranlar': ['Tokat Mantı Evi'],
      'Tarihi Yerler': ['Tokat Kalesi'],
    },
    'Trabzon': {
      'Müzeler': ['Trabzon Arkeoloji Müzesi'],
      'Tiyatro Salonları': ['Trabzon Devlet Tiyatrosu'],
      'Restoranlar': ['Trabzon Pidesi'],
      'Tarihi Yerler': ['Trabzon Kalesi'],
    },
    'Tunceli': {
      'Müzeler': ['Tunceli Müzesi'],
      'Tiyatro Salonları': ['Tunceli Kültür Merkezi'],
      'Restoranlar': ['Tunceli Kebabı'],
      'Tarihi Yerler': ['Munzur Vadisi'],
    },
    'Uşak': {
      'Müzeler': ['Uşak Müzesi'],
      'Tiyatro Salonları': ['Uşak Kültür Merkezi'],
      'Restoranlar': ['Uşak Kebabı'],
      'Tarihi Yerler': ['Uşak Kalesi'],
    },
    'Van': {
      'Müzeler': ['Van Müzesi'],
      'Tiyatro Salonları': ['Van Kültür Merkezi'],
      'Restoranlar': ['Van Kahvaltıcıları'],
      'Tarihi Yerler': ['Van Kalesi'],
    },
    'Yalova': {
      'Müzeler': ['Yalova Müzesi'],
      'Tiyatro Salonları': ['Yalova Kültür Merkezi'],
      'Restoranlar': ['Yalova Balıkçıları'],
      'Tarihi Yerler': ['Yalova Kalesi'],
    },
    'Zonguldak': {
      'Müzeler': ['Zonguldak Müzesi'],
      'Tiyatro Salonları': ['Zonguldak Kültür Merkezi'],
      'Restoranlar': ['Zonguldak Lokantası'],
      'Tarihi Yerler': ['Zonguldak Kalesi'],
    },
  };

  // Google arama fonksiyonu
  void _aramaYap(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Bu il hakkında ne öğrenmek istersiniz?"),
            content: TextField(controller: controller),
            actions: [
              TextButton(
                child: Text("Ara"),
                onPressed: () async {
                  final query = controller.text;
                  final url = Uri.parse(
                    "https://www.google.com/search?q=$il $query",
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("İptal"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final detay = sehirBilgileri[il];

    return Scaffold(
      appBar: AppBar(
        title: Text('$il Detayları'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _aramaYap(context),
          ),
        ],
      ),
      body:
          detay != null
              ? ListView(
                padding: EdgeInsets.all(12),
                children:
                    detay.entries.map<Widget>((entry) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            entry.key,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                            ),
                          ),
                          children:
                              entry.value.isNotEmpty
                                  ? entry.value.map<Widget>((item) {
                                    return ListTile(
                                      title: Text(
                                        '• $item',
                                        style: TextStyle(
                                          color: Colors.green[700],
                                        ),
                                      ),
                                    );
                                  }).toList()
                                  : [
                                    ListTile(
                                      title: Text(
                                        '• İçerik yok',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                        ),
                      );
                    }).toList(),
              )
              : Center(
                child: Text(
                  'Bu il hakkında detaylı bilgi mevcut değil.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
    );
  }
}
