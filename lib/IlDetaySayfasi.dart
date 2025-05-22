import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: IlDetaySayfasi(il: 'İstanbul')));
}

class IlDetaySayfasi extends StatefulWidget {
  final String il;
  IlDetaySayfasi({required this.il});

  @override
  State<IlDetaySayfasi> createState() => _IlDetaySayfasiState();
}

class _IlDetaySayfasiState extends State<IlDetaySayfasi> {
  String secilenKategori = 'Arkeolojik Müzeler';

  final Map<String, Map<String, List<Map<String, String>>>> sehirBilgileri = {
    'İstanbul': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'İstanbul Arkeoloji Müzesi',
          'bilgi':
              'Türkiye\'nin en büyük müzelerinden biridir. Antik eserlerle doludur.',
        },
        {
          'ad': 'Pera Müzesi',
          'bilgi': 'Sanat ve arkeolojik koleksiyonlar barındırır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Galata Kulesi',
          'bilgi':
              'İstanbul\'un simgelerinden biri. Muhteşem manzaraya sahiptir.',
        },
        {
          'ad': 'Topkapı Sarayı',
          'bilgi': 'Osmanlı sultanlarının yaşadığı saraydır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Ayasofya',
          'bilgi': 'Bizans ve Osmanlı tarihinin izlerini taşır.',
        },
        {
          'ad': 'Sultanahmet Camii',
          'bilgi': 'Mavi Camii olarak da bilinir. Önemli bir Osmanlı eseridir.',
        },
      ],
    },
    'Ankara': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Ankara Arkeoloji Müzesi',
          'bilgi': 'Çeşitli medeniyetlere ait tarihi eserler.',
        },
        {
          'ad': 'CerModern',
          'bilgi': 'Türk sanatını tanıtan bir modern sanat galerisi.',
        },
      ],
      'Gezilecek Yerler': [
        {'ad': 'Anıtkabir', 'bilgi': 'Mustafa Kemal Atatürk’ün mezarı.'},
        {
          'ad': 'Kocatepe Camii',
          'bilgi': 'Türkiye’nin en büyük camilerinden biri.',
        },
      ],
      'Tarihi Yerler': [
        {'ad': 'Roma Hamamı', 'bilgi': 'Roma İmparatorluğu’na ait kalıntılar.'},
        {'ad': 'Atakule', 'bilgi': 'Ankara’nın en yüksek yapılarından biri.'},
      ],
    },
    'İzmir': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'İzmir Arkeoloji Müzesi',
          'bilgi': 'Ege bölgesinin antik kalıntılarını barındırır.',
        },
        {
          'ad': 'Agora Açıkhava Müzesi',
          'bilgi': 'Roma dönemine ait bir antik pazar yeri.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kordon Boyu',
          'bilgi': 'Deniz kenarında yürüyüş için harika bir yer.',
        },
        {
          'ad': 'Asansör',
          'bilgi': 'Tarihi bir asansör yapısı ve manzara noktası.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Kadifekale',
          'bilgi': 'Antik döneme ait bir tepe ve kale kalıntısı.',
        },
      ],
      'Edebiyatla İlgili': [
        {
          'ad': 'Halikarnas Balıkçısı Anı Köşesi',
          'bilgi': 'Ege edebiyatının önemli ismine ithaf.',
        },
      ],
    },
    'Konya': {
      'Tarihi Yerler': [
        {
          'ad': 'Mevlana Türbesi',
          'bilgi': 'Mevlânâ Celâleddîn-i Rûmî’nin mezarı.',
        },
        {
          'ad': 'İnce Minareli Medrese',
          'bilgi': 'Selçuklu dönemine ait önemli bir yapı.',
        },
      ],
      'Felsefi Yerler': [
        {
          'ad': 'Mevlana Kültür Merkezi',
          'bilgi': 'Sema gösterileri ve düşünce mirası.',
        },
      ],
      'Arkeolojik Müzeler': [
        {
          'ad': 'Çatalhöyük',
          'bilgi': 'Dünyanın en eski yerleşim yerlerinden biridir.',
        },
      ],
    },
    'Eskişehir': {
      'Gezilecek Yerler': [
        {
          'ad': 'Odunpazarı Evleri',
          'bilgi': 'Tarihi Osmanlı evlerinin bulunduğu mahalle.',
        },
        {
          'ad': 'Sazova Bilim, Sanat ve Kültür Parkı',
          'bilgi': 'Aileler için harika bir keşif alanı.',
        },
      ],
      'Bilim & Teknoloji': [
        {
          'ad': 'Bilim Deney Merkezi',
          'bilgi': 'Çocuklar ve gençler için interaktif bilim merkezi.',
        },
      ],
      'Fantastik / Kurgusal Yerler': [
        {
          'ad': 'Masal Şatosu',
          'bilgi': 'Çocuklar için fantastik öğelerle dolu bir yapı.',
        },
      ],
    },
    'Mardin': {
      'Tarihi Yerler': [
        {
          'ad': 'Deyrulzafaran Manastırı',
          'bilgi': 'Süryani Ortodoks Patrikliğinin eski merkezi.',
        },
        {
          'ad': 'Zinciriye Medresesi',
          'bilgi': 'Artuklu mimarisinin güzel bir örneği.',
        },
      ],
      'Etnografik & Kültürel': [
        {
          'ad': 'Mardin Müzesi',
          'bilgi': 'Birçok kültürü bir araya getiren koleksiyonlar.',
        },
      ],
    },

    // Diğer illeri buraya ekleyebilirsiniz...
  };

  @override
  Widget build(BuildContext context) {
    final detaylar = sehirBilgileri[widget.il];

    return Scaffold(
      appBar: AppBar(title: Text('${widget.il} Detayları')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Başlıklar yukarıda yatay menü gibi
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 12),
            color: Colors.green[100],
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  detaylar!.keys.map((kategori) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              secilenKategori == kategori
                                  ? Colors.green
                                  : Colors.green[300],
                        ),
                        onPressed: () {
                          setState(() {
                            secilenKategori = kategori;
                          });
                        },
                        child: Text(kategori),
                      ),
                    );
                  }).toList(),
            ),
          ),

          // İçerikler aşağıda açılıyor
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: detaylar[secilenKategori]?.length ?? 0,
              itemBuilder: (context, index) {
                final mekan = detaylar[secilenKategori]![index];
                return Card(
                  child: ExpansionTile(
                    title: Text(mekan['ad'] ?? ''),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(mekan['bilgi'] ?? ''),
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
}
