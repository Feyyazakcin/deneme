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
    'Afyonkarahisar': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Afyonkarahisar Arkeoloji Müzesi',
          'bilgi':
              'Afyonkarahisar il sınırlarında yer alan bu müze, bölgenin tarih öncesi dönemlerinden Osmanlı dönemine kadar birçok eseri sergileyen önemli bir kültürel mekandır.',
          'image': 'Afyonkarahisar Arkeoloji Müzesi',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Afyon Kalesi',
          'bilgi':
              'Şehir merkezine hakim bir tepe üzerinde yer alan bu kale, Bizans döneminden kalma kalıntılarıyla dikkat çekmektedir. Ziyaretçilere şehri yüksekten izleme imkanı sunmaktadır.',
          'image': 'Afyonkarahisar Kalesi',
        },
        {
          'ad': 'Afyonkarahisar Ulu Camii',
          'bilgi':
              '13. yüzyılda inşa edilen bu cami, Selçuklu döneminin önemli yapılarından biridir. Ahşap direkleri ve taş işçiliğiyle dikkat çekmektedir.',
          'image': 'Afyonkarahisar Ulu Camii',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Ayazini Köyü',
          'bilgi':
              'Afyonkarahisar il sınırlarında yer alan bu köy, Frigya dönemine ait kaya mezarları ve kiliseleriyle ünlüdür. Ayrıca, Avdalaz Kalesi de burada yer almaktadır.',
          'image': 'Ayazini Köyü',
        },
        {
          'ad': 'Afyonkarahisar Mevlevihanesi',
          'bilgi':
              'Osmanlı dönemine ait bu yapı, Mevlevi tarikatının önemli merkezlerinden biridir. Günümüzde müze olarak kullanılmaktadır.',
          'image': 'Afyonkarahisar Mevlevihanesi',
        },
      ],
    },
    'Adana': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Adana Arkeoloji Müzesi',
          'bilgi':
              'Adana il sınırlarında yer alan bu müze, bölgenin tarih öncesi ve antik dönemlerine ait önemli eserleri sergileyen önemli bir mekandır.',
        },
        {
          'ad': 'Tarsus Müzesi',
          'bilgi':
              'Tarsus’taki antik eserlerin sergilendiği bir müze olup, Roma, Bizans ve Osmanlı dönemlerine ait eserler sunar.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Sabancı Merkez Camii',
          'bilgi':
              'Türkiye\'nin en büyük camilerinden biridir ve Adana\'nın simgelerindendir. Mimarisiyle dikkat çeker.',
        },
        {
          'ad': 'Adana Taşköprü',
          'bilgi':
              'Roma döneminden kalma ve hala kullanılan bu taş köprü, Seyhan Nehri üzerinde yer alır ve şehri ikiye böler.',
        },
        {
          'ad': 'Varda Köprüsü',
          'bilgi':
              'Adana il sınırlarında, Toros Dağları\'nda yer alan ve tren yolu için inşa edilmiş tarihi bir köprüdür.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Tarsus Antik Kenti',
          'bilgi':
              'Tarsus, Roma ve Bizans dönemine ait önemli kalıntılarıyla ünlüdür. Ayrıca, Saint Paul\'ün doğduğu yer olarak da bilinir.',
        },
        {
          'ad': 'Aynalıgöl Mağarası',
          'bilgi':
              'Adana il sınırlarında yer alan bu mağara, içindeki sarkıtlar ve dikitlerle dikkat çeker.',
        },
        {
          'ad': 'Misis Mozaik Müzesi',
          'bilgi':
              'Adana\'nın Misis beldesinde yer alan bu müze, Roma dönemine ait mozaikler ve eserler sergilemektedir.',
        },
      ],
    },
    'Adıyaman': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Adıyaman Arkeoloji Müzesi',
          'bilgi':
              'Adıyaman il sınırlarında yer alan bu müze, bölgenin tarih öncesi ve antik dönemlerine ait önemli eserleri sergileyen bir mekandır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Nemrut Dağı',
          'bilgi':
              'UNESCO Dünya Mirası Listesi\'nde yer alan Nemrut Dağı, antik Kommagene Krallığı\'na ait dev heykelleri ve mezar tapınağıyla ünlüdür.',
        },
        {
          'ad': 'Cendere Köprüsü',
          'bilgi':
              'Roma dönemine ait olan bu taş köprü, Adıyaman’ın tarihî simgelerinden biridir ve hala aktif olarak kullanılmaktadır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Perre Antik Kenti',
          'bilgi':
              'Adıyaman merkeze yakın olan bu antik kent, Roma ve Bizans dönemlerinden kalma yapılarıyla dikkat çeker.',
        },
        {
          'ad': 'Arsemia Antik Kenti',
          'bilgi':
              'Nemrut Dağı yakınlarında yer alan bu antik kent, Kommagene Krallığı’na ait önemli bir yerleşim yeri olup tarihi kalıntılara sahiptir.',
        },
      ],
    },
    'Afyonkarahisar': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Afyonkarahisar Arkeoloji Müzesi',
          'bilgi':
              'Afyonkarahisar il sınırlarında yer alan bu müze, bölgenin tarih öncesi dönemlerinden Osmanlı dönemine kadar birçok eseri sergileyen önemli bir kültürel mekandır.',
        },
        {
          'ad': 'Frig Vadisi Açık Hava Müzesi',
          'bilgi':
              'Frigya dönemine ait kaya mezarları ve yerleşim alanlarının bulunduğu bu alan, bölgenin arkeolojik mirasını sergileyen önemli bir müzedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Afyon Kalesi',
          'bilgi':
              'Şehir merkezine hakim bir tepe üzerinde yer alan bu kale, Bizans döneminden kalma kalıntılarıyla dikkat çekmektedir. Ziyaretçilere şehri yüksekten izleme imkanı sunmaktadır.',
        },
        {
          'ad': 'Afyonkarahisar Ulu Camii',
          'bilgi':
              '13. yüzyılda inşa edilen bu cami, Selçuklu döneminin önemli yapılarından biridir. Ahşap direkleri ve taş işçiliğiyle dikkat çekmektedir.',
        },
        {
          'ad': 'Gazlıgöl Kaplıcaları',
          'bilgi':
              'Afyonkarahisar’ın Gazlıgöl beldesinde yer alan bu termal sular, şifa arayanlar için oldukça ünlüdür. Tarihi bir geçmişe sahiptir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Ayazini Köyü',
          'bilgi':
              'Afyonkarahisar il sınırlarında yer alan bu köy, Frigya dönemine ait kaya mezarları ve kiliseleriyle ünlüdür. Ayrıca, Avdalaz Kalesi de burada yer almaktadır.',
        },
        {
          'ad': 'Afyonkarahisar Mevlevihanesi',
          'bilgi':
              'Osmanlı dönemine ait bu yapı, Mevlevi tarikatının önemli merkezlerinden biridir. Günümüzde müze olarak ziyaretçilere açıktır.',
        },
        {
          'ad': 'Phrygia Antik Kenti',
          'bilgi':
              'Frigya döneminden kalma antik kent kalıntıları, bölgenin tarihî geçmişi hakkında önemli ipuçları sunmaktadır.',
        },
      ],
    },
    'Ağrı': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Ağrı Müzesi',
          'bilgi':
              'Ağrı il sınırlarında yer alan bu müze, bölgenin tarih öncesi ve antik dönemlerine ait önemli eserleri sergileyen bir mekandır.',
        },
        {
          'ad': 'Doğubayazıt İshak Paşa Sarayı Müzesi',
          'bilgi':
              'İshak Paşa Sarayı, Osmanlı döneminin en önemli yapılarından biri olup, burada bulunan müze, sarayın tarihine ışık tutar.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Ağrı Dağı (veya Büyük Ağrı)',
          'bilgi':
              'Dünyaca ünlü Ağrı Dağı, 5.137 metre yüksekliğiyle Türkiye\'nin en yüksek dağıdır ve dağcılık için önemli bir yerdir. Ayrıca, Nuh\'un Gemisi’nin bu dağın zirvesine oturduğu inancı da vardır.',
        },
        {
          'ad': 'İshak Paşa Sarayı',
          'bilgi':
              'Osmanlı ve İran etkisiyle inşa edilmiş olan bu saray, Doğubayazıt ilçesinde yer alır ve tarihi mimarisiyle dikkat çeker.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Doğubayazıt Kalesi',
          'bilgi':
              'Doğubayazıt ilçesinde yer alan bu kale, Roma, Bizans ve Selçuklu dönemlerinden kalma kalıntılar içerir.',
        },
        {
          'ad': 'Nuh’un Gemisi Kalıntıları',
          'bilgi':
              'Ağrı Dağı’nda, Nuh’un Gemisi’nin kalıntılarının bulunduğuna inanılır. Bu tarihi yer, mitolojik bir anlam taşır.',
        },
      ],
    },
    'Aksaray': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Aksaray Müzesi',
          'bilgi':
              'Aksaray il sınırlarında yer alan bu müze, bölgenin tarih öncesi ve antik dönemlerine ait eserleri sergileyen önemli bir kültürel mekandır.',
        },
        {
          'ad': 'Kızılkaya Arkeolojik Alanı',
          'bilgi':
              'Frigya ve Roma dönemlerine ait kalıntıların bulunduğu bu açık hava müzesi, bölgedeki tarihi dokuyu ziyaretçilere sunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Ihlara Vadisi',
          'bilgi':
              'Ihlara Vadisi, 14 kilometre uzunluğunda, büyüleyici manzaralara sahip, yemyeşil bir kanyon olup, içinde tarihi kiliseler ve kaya oyma yapıları bulunmaktadır.',
        },
        {
          'ad': 'Aksaray Ulu Camii',
          'bilgi':
              'Selçuklu döneminden kalma bu cami, Aksaray’ın en önemli dini yapılarından biridir ve taş işçiliğiyle dikkat çeker.',
        },
        {
          'ad': 'Sultanhanı Kervansarayı',
          'bilgi':
              'Selçuklu dönemine ait olan bu kervansaray, Aksaray’ın en önemli tarihi yapılarındandır. Büyük bir avluya sahip olan bu yapı, bir zamanlar tüccarların konakladığı bir yerdi.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Güzelyurt Yeraltı Şehri',
          'bilgi':
              'Aksaray’a bağlı Güzelyurt ilçesinde yer alan bu yeraltı şehri, bölgedeki erken Hristiyanlık dönemi kalıntılarını barındırır ve birçok odadan oluşur.',
        },
        {
          'ad': 'Ziga Kaplıcaları',
          'bilgi':
              'Aksaray il sınırlarında yer alan bu kaplıcalar, sağlık turizmi için önemli bir bölgedir ve sıcak suları ile ünlüdür.',
        },
      ],
    },
    'Amasya': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Amasya Müzesi',
          'bilgi':
              'Amasya il sınırlarında yer alan bu müze, bölgenin antik dönemlerinden Osmanlı dönemine kadar birçok eseri sergileyen önemli bir kültürel mekandır.',
        },
        {
          'ad': 'Amasya Arkeoloji Müzesi',
          'bilgi':
              'Amasya il sınırlarında yer alan bu müze, Hellenistik ve Roma dönemlerine ait eserler ile ünlüdür.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Amasya Kalesi',
          'bilgi':
              'Amasya şehir merkezine hakim bir tepede yer alan kale, Bizans dönemine ait kalıntılarla birlikte Osmanlı dönemine ait yapıları da içerir. Şehri yüksekten görmek için mükemmel bir noktadır.',
        },
        {
          'ad': 'Yalıboyu Evleri',
          'bilgi':
              'Amasya’nın tarihi dokusunu en iyi yansıtan yerlerden biri olan Yalıboyu Evleri, Osmanlı dönemine ait geleneksel taş yapılarıyla dikkat çeker.',
        },
        {
          'ad': 'Saraydüzü Kışla Binası',
          'bilgi':
              'Amasya’da Osmanlı döneminden kalan bir diğer önemli yapıdır. Bugün müze olarak kullanılmaktadır ve tarihi bir öneme sahiptir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Amasya Evleri',
          'bilgi':
              'Osmanlı dönemi sivil mimarisinin örneklerini gösteren Yalıboyu Evleri, geçmişten günümüze gelen önemli bir tarihî mirastır.',
        },
        {
          'ad': 'Ferhat Su Kanalı',
          'bilgi':
              'Ferhat’ın Amasya’ya su getirdiği efsanevi hikayeye dayanan bu su kanalı, bölgenin tarihî miraslarından biridir.',
        },
        {
          'ad': 'Kral Mezarları',
          'bilgi':
              'Amasya il sınırlarında, kaya içine oyulmuş 7 adet kral mezarı yer alır. MÖ 1. yüzyıldan kalma olan bu mezarlar, Amasya’nın tarihî ve kültürel önemini gösterir.',
        },
      ],
    },
    'Antalya': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Antalya Müzesi',
          'bilgi':
              'Antalya il sınırlarında yer alan bu müze, bölgenin antik dönemlerinden Roma, Bizans ve Osmanlı dönemlerine kadar birçok önemli eseri sergileyen bir kültürel hazinedir.',
        },
        {
          'ad': 'Termessos Antik Kenti Müzesi',
          'bilgi':
              'Termessos Antik Kenti’nin arkeolojik buluntularını sergileyen bu müze, tarih severler için önemli bir ziyaret noktasıdır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kaleiçi',
          'bilgi':
              'Antalya’nın tarihi merkezi olan Kaleiçi, Osmanlı döneminden kalma dar sokakları, taş binaları ve tarihi limanı ile ziyaretçilere nostaljik bir atmosfer sunar.',
        },
        {
          'ad': 'Düden Şelalesi',
          'bilgi':
              'Antalya şehir merkezinin doğusunda yer alan Düden Şelalesi, doğal güzellikleri ve serin ortamıyla ziyaretçilerin ilgisini çeker.',
        },
        {
          'ad': 'Konyaaltı Plajı',
          'bilgi':
              'Antalya’nın en popüler plajlarından biri olan Konyaaltı, güzel kumsalı ve berrak deniziyle ünlüdür. Burada deniz keyfi yapılabilir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Aspendos Antik Tiyatrosu',
          'bilgi':
              'Roma döneminden kalma bu antik tiyatro, dünyanın en iyi korunmuş tiyatrolarından biridir ve günümüzde halen konserler ve tiyatro oyunları düzenlenmektedir.',
        },
        {
          'ad': 'Perge Antik Kenti',
          'bilgi':
              'MÖ 5. yüzyılda kurulan bu antik kent, Roma döneminden kalma kalıntılarla ünlüdür ve bölgedeki en önemli arkeolojik alanlardan biridir.',
        },
        {
          'ad': 'Termessos Antik Kenti',
          'bilgi':
              'Dağların zirvesine kurulu bu antik kent, görkemli yapıları ve etkileyici manzarasıyla tarih ve doğa severlerin ilgisini çeker.',
        },
      ],
    },
    'Ardahan': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Ardahan Müzesi',
          'bilgi':
              'Ardahan il sınırlarında yer alan bu müze, bölgenin tarihî geçmişine dair pek çok eseri sergileyen bir kültürel mekandır. Müzede, bölgedeki farklı medeniyetlere ait eserler bulunur.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Çıldır Gölü',
          'bilgi':
              'Çıldır Gölü, Ardahan’a bağlı Çıldır ilçesinde yer alır ve yaz aylarında su sporları, kış aylarında ise donmuş göl üzerinde atlı kızak gibi etkinlikler yapılabilir.',
        },
        {
          'ad': 'Ardahan Kalesi',
          'bilgi':
              'Ardahan il merkezine yakın bir tepede yer alan bu kale, hem stratejik bir noktada yer alması hem de tarihi dokusu ile dikkat çeker. Kaleden şehir manzarası oldukça etkileyicidir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Kura Nehri',
          'bilgi':
              'Ardahan il sınırlarından geçen bu nehir, bölgenin tarihsel önemi açısından oldukça etkilidir. Kura Nehri’nin kıyısında pek çok tarihi yerleşim ve kalıntılar bulunmaktadır.',
        },
        {
          'ad': 'Ağzıaçık Kilisesi',
          'bilgi':
              'Orta Çağ’dan kalma bir yapıdır. Gürpınar beldesi yakınlarında yer alır ve yapının kalıntıları ziyaretçilerini tarihsel bir yolculuğa çıkarır.',
        },
      ],
    },
    'Artvin': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Artvin Müzesi',
          'bilgi':
              'Artvin il sınırlarında yer alan bu müze, bölgenin tarihi ve kültürel geçmişini yansıtan önemli eserleri sergiler. Müzede Artvin’in çeşitli uygarlıklara ait arkeolojik buluntuları bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Çoruh Nehri',
          'bilgi':
              'Artvin’in en önemli doğal zenginliklerinden biri olan Çoruh Nehri, rafting gibi su sporlarıyla ünlüdür. Aynı zamanda nehir kenarında yürüyüş yaparak doğa ile iç içe bir gün geçirebilirsiniz.',
        },
        {
          'ad': 'Karagöl',
          'bilgi':
              'Karagöl, Artvin’in en bilinen ve en güzel doğa alanlarından biridir. Ormanlarla çevrili bu göl, trekking, kampçılık ve doğa yürüyüşleri için ideal bir alandır.',
        },
        {
          'ad': 'Artvin Kalesi',
          'bilgi':
              'Artvin şehir merkezine hakim bir tepede bulunan Artvin Kalesi, tarihsel önemi ve stratejik konumu ile dikkat çeker. Kaleden şehir manzarası oldukça etkileyicidir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Erzurum Evleri',
          'bilgi':
              'Artvin’in bazı köylerinde yer alan bu geleneksel Erzurum evleri, Osmanlı dönemi mimarisini yansıtan örneklerdir ve ziyaretçilere geçmişin izlerini sunar.',
        },
        {
          'ad': 'Güleç Köyü',
          'bilgi':
              'Güleç Köyü, Artvin’in en eski yerleşimlerinden biridir ve burada yer alan taş evler, geleneksel Karadeniz mimarisine güzel örnekler sunar.',
        },
      ],
    },
    'Aydın': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Aydın Arkeoloji Müzesi',
          'bilgi':
              'Aydın il sınırlarında yer alan bu müze, bölgenin tarihî geçmişine dair önemli arkeolojik buluntulara ev sahipliği yapmaktadır. Müzede, MÖ 3000 yılına kadar uzanan eserler bulunur.',
        },
        {
          'ad': 'Milet Antik Kenti Müzesi',
          'bilgi':
              'Milet Antik Kenti’nin kazılarından elde edilen eserlerin sergilendiği bu müze, Antik Yunan döneminin önemli eserlerini sunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Efes Antik Kenti',
          'bilgi':
              'Dünyanın en iyi korunmuş antik kentlerinden biri olan Efes, hem Roma hem de Helenistik döneme ait kalıntılarıyla ünlüdür. Artemis Tapınağı, Celsus Kütüphanesi gibi önemli yapıları barındırır.',
        },
        {
          'ad': 'Pamukkale Travertenleri',
          'bilgi':
              'Pamukkale’nin beyaz travertenleri, sıcak su kaynaklarının oluşturduğu doğal oluşumlardır. Aynı zamanda hierapolis antik kenti de burada yer alır.',
        },
        {
          'ad': 'Didim Altınkum Plajı',
          'bilgi':
              'Didim ilçesinde bulunan bu plaj, altın sarısı kumları ve berrak deniziyle tatilcilerin gözde mekanlarından biridir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Priene Antik Kenti',
          'bilgi':
              'Priene, Antik Yunan’dan kalan önemli bir şehir kalıntısıdır. Bugün, harabe halindeki tapınaklar ve tiyatro gibi yapıları ile dikkat çeker.',
        },
        {
          'ad': 'Milet Antik Kenti',
          'bilgi':
              'Milet, antik çağda büyük bir ticaret ve kültür merkeziydi. Milet Antik Kenti, özellikle tiyatrosu ve bazilikasıyla ünlüdür.',
        },
        {
          'ad': 'Bafa Gölü',
          'bilgi':
              'Bafa Gölü, tarihi harabeler ve zengin doğasıyla ziyaretçilerine hem huzur hem de keşif sunar. Aynı zamanda bir kuş cennetidir.',
        },
      ],
    },

    'Balıkesir': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Balıkesir Arkeoloji Müzesi',
          'bilgi':
              'Balıkesir’in tarihî geçmişini yansıtan bu müze, bölgenin farklı uygarlıklara ait eserlerini sergileyen önemli bir mekandır. Özellikle antik Yunan ve Roma dönemlerine ait eserler bulunur.',
        },
        {
          'ad': 'Altınoluk Müzesi',
          'bilgi':
              'Altınoluk beldesinde yer alan bu müze, bölgedeki arkeolojik kazılardan elde edilen eserleri sergiler. Aynı zamanda Balıkesir’in yerel kültürünü tanıtan objelere de yer verilmiştir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kaz Dağları',
          'bilgi':
              'Kaz Dağları, özellikle doğa yürüyüşleri, trekking ve dağcılık gibi açık hava etkinlikleri için idealdir. Ayrıca, bu dağlar, mitolojik öykülerle de ilişkilendirilen önemli bir bölgedir.',
        },
        {
          'ad': 'Erdek',
          'bilgi':
              'Erdek, Balıkesir’in en gözde tatil beldelerinden biridir. Sahil boyunca uzanan plajları, denizle iç içe geçmiş restoranları ve doğal güzellikleri ile ünlüdür.',
        },
        {
          'ad': 'Ayvalık Adaları',
          'bilgi':
              'Ayvalık Adaları, büyüleyici deniz manzaraları ve sakin atmosferi ile huzurlu bir tatil için ideal bir yerdir. Aynı zamanda zeytin ağaçlarıyla ünlüdür.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Antandros Antik Kenti',
          'bilgi':
              'Antandros, Antik Yunan’dan kalan bir yerleşimdir. Balıkesir’in Edremit ilçesinde yer alan bu antik kent, geçmişin izlerini taşıyan çok sayıda kalıntı barındırmaktadır.',
        },
        {
          'ad': 'Kyzikos Antik Kenti',
          'bilgi':
              'Kyzikos, Roma İmparatorluğu döneminde önemli bir şehir olmuş ve bugüne kadar pek çok kalıntı ulaşmıştır. Özellikle antik tiyatro ve bazilika dikkat çekmektedir.',
        },
        {
          'ad': 'Taksiyarhis Kilisesi',
          'bilgi':
              'Ayvalık’ta bulunan bu tarihi kilise, 19. yüzyıldan kalma bir yapıdır ve şehri gezmek isteyenlerin ilgiyle ziyaret ettiği önemli bir tarihi eserdir.',
        },
      ],
    },
    'Bartın': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bartın Arkeoloji Müzesi',
          'bilgi':
              'Bartın il sınırlarında yer alan bu müze, bölgenin tarihî geçmişini yansıtan eserleri sergileyen önemli bir mekandır. Müze, özellikle antik çağlardan kalma taş eserler ve seramiklerle zenginleştirilmiştir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Amasra Kalesi',
          'bilgi':
              'Amasra Kalesi, Bizans ve Osmanlı dönemlerinden kalma kalıntılarıyla ünlüdür. Ziyaretçilere muazzam bir deniz manzarası sunar.',
        },
        {
          'ad': 'Amasra Plajı',
          'bilgi':
              'Amasra ilçesinde bulunan bu plaj, temiz denizi ve sakin atmosferiyle ünlüdür. Yaz aylarında tatilciler için popüler bir dinlenme noktasıdır.',
        },
        {
          'ad': 'İnkumu Plajı',
          'bilgi':
              'İnkumu Plajı, Bartın’a bağlı Karadeniz kıyısında yer alan doğal bir plajdır. Beyaz kumları ve berrak denizi ile huzurlu bir tatil imkanı sunar.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Amasra Antik Tiyatrosu',
          'bilgi':
              'Amasra Antik Tiyatrosu, Roma döneminden kalma önemli bir yapıdır. Şehir merkezine oldukça yakın olan bu antik alan, tarihe tanıklık etmek isteyenler için güzel bir yerdir.',
        },
        {
          'ad': 'Kemere Köprüsü',
          'bilgi':
              'Kemere Köprüsü, Osmanlı dönemine ait taş köprülerden biridir ve Bartın’ın tarihî dokusunu yansıtan önemli yapılardandır.',
        },
        {
          'ad': 'Çakraz Kilisesi',
          'bilgi':
              'Çakraz köyünde yer alan bu eski kilise, Bizans dönemine ait yapılar arasında yer alır ve köyün tarihî mirasını gözler önüne serer.',
        },
      ],
    },

    'Bartın': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bartın Arkeoloji Müzesi',
          'bilgi':
              'Bartın il sınırlarında yer alan bu müze, bölgenin tarihî geçmişine ait eserleri sergileyen önemli bir kültürel mekandır. Burada, Prehistorik çağlardan Osmanlı dönemine kadar birçok eserin sergilendiği alanlar bulunur.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Amasra Kalesi',
          'bilgi':
              'Amasra Kalesi, Bizans ve Osmanlı dönemlerine ait kalıntılarla tarihi bir atmosfer sunar. Ziyaretçilere hem şehrin hem de denizin muazzam manzaralarını izleme fırsatı verir.',
        },
        {
          'ad': 'Amasra Plajı',
          'bilgi':
              'Amasra Plajı, Bartın’a bağlı Amasra ilçesinde yer alan temiz ve sakin bir plajdır. Doğal güzellikleriyle ünlüdür ve yaz aylarında tatilciler tarafından sıkça tercih edilir.',
        },
        {
          'ad': 'İnkumu Plajı',
          'bilgi':
              'İnkumu Plajı, Karadeniz kıyısında yer alan sakin ve güzel bir tatil beldesidir. Temiz denizi ve uzun kumsalıyla yazın en popüler plajlarından biridir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Amasra Antik Tiyatrosu',
          'bilgi':
              'Amasra Antik Tiyatrosu, Roma döneminden kalma önemli bir yapıdır. Bu antik tiyatro, deniz manzaralı oturma sıralarıyla ünlüdür ve tarihi dokusuyla etkileyicidir.',
        },
        {
          'ad': 'Kemere Köprüsü',
          'bilgi':
              'Kemere Köprüsü, Osmanlı dönemine ait taş bir köprüdür. Bartın’ın tarihi dokusunu yansıtan önemli yapılardandır.',
        },
        {
          'ad': 'Çakraz Kilisesi',
          'bilgi':
              'Çakraz köyünde bulunan bu kilise, Bizans dönemine ait bir yapı olup, bölgedeki tarihi izleri yansıtır.',
        },
      ],
    },
    'Batman': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Batman Müzesi',
          'bilgi':
              'Batman Müzesi, bölgenin tarihî mirasını sergileyen önemli bir kültürel mekandır. Müze, özellikle Hitit, Urartu ve Roma dönemlerine ait eserlerle zengindir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Hasankeyf',
          'bilgi':
              'Hasankeyf, tarihi ve kültürel açıdan büyük öneme sahip bir yerleşim alanıdır. Batman il sınırlarında yer alan bu antik şehir, tarihi yapıları ve mağara evleriyle ünlüdür. Fırat Nehri üzerindeki köprü ve kalıntılar oldukça etkileyicidir.',
        },
        {
          'ad': 'Batman Çayı',
          'bilgi':
              'Batman Çayı, Batman il sınırları içinde yer alan, çevresindeki doğal güzellikleriyle ünlü bir akarsudur. Çayın çevresindeki doğal alanlar, yürüyüş yapmak ve piknik yapmak için ideal alanlardır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Hasankeyf Kalesi',
          'bilgi':
              'Hasankeyf Kalesi, Mardin ve Batman illerinin birleşim noktasında yer alan tarihi bir kaledir. Roma ve Bizans dönemlerinden kalma kalıntılarıyla dikkat çeker.',
        },
        {
          'ad': 'Zeynel Bey Türbesi',
          'bilgi':
              'Zeynel Bey Türbesi, Hasankeyf ilçesinde yer alır ve Selçuklu dönemine ait önemli bir yapıdır. Osmanlı ve Selçuklu mimarisinin etkilerini taşır.',
        },
      ],
    },
    'Bayburt': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bayburt Arkeoloji Müzesi',
          'bilgi':
              'Bayburt Arkeoloji Müzesi, Bayburt il sınırlarında yer alan ve bölgenin tarihini yansıtan önemli bir kültürel mekandır. Müze, eski çağlardan Osmanlı dönemine kadar bir dizi arkeolojik eseri sergilemektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Bayburt Kalesi',
          'bilgi':
              'Bayburt Kalesi, şehri yüksek bir noktadan görebileceğiniz tarihi bir kaledir. Bizans dönemine ait kalıntılara sahip olan kale, bölgenin tarihi hakkında fikir verir.',
        },
        {
          'ad': 'Dörtler Dağı',
          'bilgi':
              'Dörtler Dağı, Bayburt il sınırlarında bulunan ve doğa yürüyüşleri yapmaya uygun bir dağdır. Doğal güzellikleri ve yürüyüş parkurlarıyla dikkat çeker.',
        },
        {
          'ad': 'Aydıntepe Yeraltı Şehri',
          'bilgi':
              'Aydıntepe Yeraltı Şehri, Bayburt’a bağlı Aydıntepe beldesinde bulunan ve yer altına inşa edilmiş bir yerleşim alanıdır. Bu şehri gezmek, tarihe farklı bir bakış açısı kazandırır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Bayburt Ulu Camii',
          'bilgi':
              'Bayburt Ulu Camii, 16. yüzyılda inşa edilmiş olan Osmanlı dönemi camilerindendir. Mimarisi ve süslemeleriyle dikkat çeker.',
        },
        {
          'ad': 'Rüstem Paşa Kervansarayı',
          'bilgi':
              'Rüstem Paşa Kervansarayı, Osmanlı dönemi yapılarından biridir ve tarihi ipek yolunun bir parçasıdır. Caminin ve kervansarayın mimarisi, döneminin zengin kültürünü yansıtır.',
        },
        {
          'ad': 'Büyükşehir İskelesi',
          'bilgi':
              'Büyükşehir İskelesi, Bayburt’taki tarihi yapılar arasında yer alır. Şehirdeki eski liman yapısı, eski ticaret yolları ve ticaretle ilgili geçmişi anlatan önemli bir yapıdır.',
        },
      ],
    },

    'Bilecik': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bilecik Arkeoloji Müzesi',
          'bilgi':
              'Bilecik Arkeoloji Müzesi, Bilecik il sınırlarında yer alan ve bölgenin tarihî geçmişine ait eserlerin sergilendiği önemli bir kültürel mekandır. Özellikle Frigya ve Roma dönemlerine ait eserler sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Söğüt',
          'bilgi':
              'Söğüt, Osmanlı İmparatorluğu’nun kurulduğu yer olarak bilinir. Bu tarihi kasaba, Osmanlı’nın ilk başkentlerinden biri olarak büyük öneme sahiptir. Osman Gazi’nin türbesi de burada yer almaktadır.',
        },
        {
          'ad': 'Bilecik Kalesi',
          'bilgi':
              'Bilecik Kalesi, şehir merkezine hakim bir tepe üzerinde yer alır ve Bilecik’in tarihi simgelerinden biridir. Kaleden şehri izleyebilir ve tarihî atmosferin tadını çıkarabilirsiniz.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Osman Gazi Türbesi',
          'bilgi':
              'Osman Gazi Türbesi, Osmanlı İmparatorluğu’nun kurucusu Osman Gazi’nin mezarının bulunduğu kutsal bir yerdir. Söğüt kasabasında yer alır ve Osmanlı tarihinin en önemli simgelerindendir.',
        },
        {
          'ad': 'Frig Vadisi',
          'bilgi':
              'Frig Vadisi, Bilecik il sınırlarında yer alan ve Frig uygarlığına ait kalıntıları barındıran önemli bir arkeolojik bölgedir. Kaya mezarları ve tapınaklar bu vadide bulunmaktadır.',
        },
      ],
    },
    'Bingöl': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bingöl Müzesi',
          'bilgi':
              'Bingöl Müzesi, bölgenin tarihî geçmişini yansıtan önemli arkeolojik eserleri sergileyen bir müzedir. Müzede, Hitit, Urartu ve Osmanlı dönemlerine ait eserler bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Bingöl Ovası',
          'bilgi':
              'Bingöl Ovası, doğa severler için ideal bir gezilecek yerdir. Ova, çevresindeki dağlarla çevrili olup, muazzam bir doğa manzarası sunar. Özellikle dağcılık ve yürüyüş yapmak isteyenler için harika bir bölgedir.',
        },
        {
          'ad': 'Yedisu Şelalesi',
          'bilgi':
              'Yedisu Şelalesi, Bingöl’ün en güzel doğal alanlarından biridir. Şelale çevresindeki yeşil alanlar, huzurlu bir atmosfer sunar ve yaz aylarında serinlemek için popüler bir yerdir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Kovancılar Kalesi',
          'bilgi':
              'Kovancılar Kalesi, Bingöl il sınırlarında yer alan tarihi bir yapıdır. Bizans dönemine ait kalıntılar taşıyan bu kale, bölgenin tarihî zenginliklerini gözler önüne serer.',
        },
        {
          'ad': 'Ulu Camii',
          'bilgi':
              'Bingöl şehir merkezinde yer alan Ulu Camii, Osmanlı dönemi mimarisinin güzel bir örneğidir. Caminin zarif taş işçiliği ve tarihi yapısı, ziyaretçilere büyüleyici bir atmosfer sunar.',
        },
      ],
    },

    'Bilecik': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bilecik Arkeoloji Müzesi',
          'bilgi':
              'Bilecik Arkeoloji Müzesi, bölgenin tarihî geçmişine ışık tutan eserleri sergileyen bir kültürel mekandır. Frig, Roma, Bizans ve Osmanlı dönemlerine ait birçok eser bu müzede sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Söğüt',
          'bilgi':
              'Söğüt, Osmanlı İmparatorluğu’nun kurulduğu yer olarak bilinir. Burada Osman Gazi’nin türbesi bulunur ve bölge, Osmanlı tarihinin başlangıç noktasını simgeler. Tarihi atmosferi ve doğal güzellikleriyle dikkat çeker.',
        },
        {
          'ad': 'Bilecik Kalesi',
          'bilgi':
              'Bilecik Kalesi, şehir merkezine hakim bir tepe üzerinde yer alır ve Bilecik’in simgelerindendir. Kaleden şehri ve çevresindeki güzellikleri izlemek mümkündür. Kale, Bizans ve Osmanlı dönemlerinden kalma izler taşır.',
        },
        {
          'ad': 'Köprülü Mehmet Paşa Camii',
          'bilgi':
              'Bilecik il merkezinde yer alan bu cami, Osmanlı dönemine ait mimarisiyle dikkat çeker. Şehirdeki en eski camilerden biridir ve tarihi dokusu ile önemli bir yapıdır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Osman Gazi Türbesi',
          'bilgi':
              'Osman Gazi Türbesi, Osmanlı İmparatorluğu’nun kurucusu Osman Gazi’nin mezarının bulunduğu yerdir. Söğüt kasabasında yer alan türbe, Osmanlı tarihinin en önemli simgelerindendir.',
        },
        {
          'ad': 'Frig Vadisi',
          'bilgi':
              'Frig Vadisi, Bilecik il sınırlarında yer alan ve Frig uygarlığına ait kalıntıları barındıran önemli bir arkeolojik bölgedir. Kaya mezarları, tapınaklar ve eski yerleşim alanları bu vadide yer alır.',
        },
        {
          'ad': 'Gölpazarı Taş Mektep',
          'bilgi':
              'Gölpazarı ilçesinde yer alan bu taş okul, Osmanlı dönemine ait taş yapılar arasında önemli bir örnektir. 19. yüzyılda inşa edilmiştir.',
        },
      ],
    },
    'Bingöl': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bingöl Müzesi',
          'bilgi':
              'Bingöl Müzesi, bölgenin tarihî geçmişini yansıtan önemli arkeolojik eserleri sergileyen bir müzedir. Müzede, Hitit, Urartu ve Osmanlı dönemlerine ait eserler bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Bingöl Ovası',
          'bilgi':
              'Bingöl Ovası, doğa severler için ideal bir gezilecek yerdir. Ova, çevresindeki dağlarla çevrili olup, muazzam bir doğa manzarası sunar. Özellikle dağcılık ve yürüyüş yapmak isteyenler için harika bir bölgedir.',
        },
        {
          'ad': 'Yedisu Şelalesi',
          'bilgi':
              'Yedisu Şelalesi, Bingöl’ün en güzel doğal alanlarından biridir. Şelale çevresindeki yeşil alanlar, huzurlu bir atmosfer sunar ve yaz aylarında serinlemek için popüler bir yerdir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Kovancılar Kalesi',
          'bilgi':
              'Kovancılar Kalesi, Bingöl il sınırlarında yer alan tarihi bir yapıdır. Bizans dönemine ait kalıntılar taşıyan bu kale, bölgenin tarihî önemini gözler önüne serer.',
        },
        {
          'ad': 'Ulu Camii',
          'bilgi':
              'Bingöl şehir merkezinde yer alan Ulu Camii, Osmanlı dönemi mimarisinin güzel bir örneğidir. Caminin zarif taş işçiliği ve tarihi yapısı, ziyaretçilere büyüleyici bir atmosfer sunar.',
        },
      ],
    },
    'Bitlis': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bitlis Müzesi',
          'bilgi':
              'Bitlis Müzesi, bölgenin tarihî geçmişine ait eserleri sergileyen önemli bir mekandır. Hitit, Urartu, Roma ve Osmanlı dönemlerine ait kalıntılar burada sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Nemrut Krater Gölü',
          'bilgi':
              'Nemrut Krater Gölü, Bitlis il sınırları içinde yer alan muazzam bir doğal güzelliktir. Yüksek dağların arasında yer alan bu göl, eşsiz manzarasıyla doğa severler için popüler bir yerdir.',
        },
        {
          'ad': 'Bitlis Kalesi',
          'bilgi':
              'Bitlis Kalesi, şehir merkezine hakim bir tepe üzerinde yer alır ve tarihî bir yapıdır. Kale, Selçuklu dönemine ait kalıntılar taşır ve Bitlis’in tarihiyle ilgili önemli bir simgedir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'İhlasiye Camii',
          'bilgi':
              'İhlasiye Camii, Bitlis’in en önemli Osmanlı dönemi camilerinden biridir. 16. yüzyıldan kalma bu cami, Bitlis’in dini mimarisinin güzel bir örneğidir.',
        },
        {
          'ad': 'Bitlis Ulu Camii',
          'bilgi':
              'Bitlis Ulu Camii, 12. yüzyılda inşa edilmiştir ve şehirdeki en eski camilerden biridir. Selçuklu dönemi taş işçiliğiyle dikkat çeker.',
        },
        {
          'ad': 'Ahlat Selçuklu Mezarlığı',
          'bilgi':
              'Ahlat, Bitlis’e bağlı önemli bir yerleşim yeridir ve burada yer alan Selçuklu Mezarlığı, Türkiye’nin en büyük Selçuklu dönemi mezarlık alanlarından biridir. Taş eserler ve mezar taşları büyük bir tarihi değere sahiptir.',
        },
      ],
    },
    'Bolu': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bolu Müzesi',
          'bilgi':
              'Bolu Müzesi, Bolu il sınırları içinde bulunan önemli bir arkeoloji müzesidir. Müze, bölgenin tarihî geçmişine ait eserleri sergileyerek, Hitit, Frig ve Osmanlı dönemlerinden izler taşır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Abant Gölü',
          'bilgi':
              'Abant Gölü, Bolu’nun en ünlü doğal güzelliklerinden biridir. Doğal park ve gölet, ziyaretçilere huzurlu bir ortam sunar ve özellikle doğa yürüyüşleri yapmak için popülerdir.',
        },
        {
          'ad': 'Yedigöller Milli Parkı',
          'bilgi':
              'Yedigöller Milli Parkı, yedi gölden oluşan ve her mevsim ayrı bir güzellik sunan bir doğa cennetidir. Özellikle yaz aylarında yürüyüş ve kamp yapmak isteyenler için idealdir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Bolu Kalesi',
          'bilgi':
              'Bolu Kalesi, Bolu şehrinin tarihi simgelerinden biridir. Kale, Bizans dönemine ait kalıntılar taşır ve Bolu şehrine hakim bir tepe üzerinde yer alır.',
        },
        {
          'ad': 'Mudurnu Evleri',
          'bilgi':
              'Mudurnu ilçesinde bulunan Osmanlı dönemi evleri, geleneksel Türk ev mimarisinin güzel örneklerinden biridir. Bu evler, taş ve ahşap işçiliğiyle dikkat çeker.',
        },
        {
          'ad': 'Gerede Tarihi Çarşısı',
          'bilgi':
              'Gerede ilçesinde yer alan tarihi çarşı, geleneksel el sanatları ve el yapımı ürünleri ile ünlüdür. Osmanlı dönemine ait yapılar ve çarşı atmosferi, burayı keşfetmek için harika bir yerdir.',
        },
      ],
    },
    'Burdur': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Burdur Arkeoloji Müzesi',
          'bilgi':
              'Burdur Arkeoloji Müzesi, bölgenin tarihî geçmişine ışık tutan önemli bir müzedir. Burdur ve çevresindeki antik kalıntılardan, Osmanlı dönemine kadar uzanan eserler sergilenmektedir.',
        },
        {
          'ad': 'Sagalassos Antik Kenti Müzesi',
          'bilgi':
              'Sagalassos, Burdur il sınırlarında yer alan antik bir kenttir. Müzede, Sagalassos’tan çıkarılan heykeller, taş eserler ve diğer antik buluntular sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Salda Gölü',
          'bilgi':
              'Salda Gölü, Burdur ilinin en ünlü doğal harikalarından biridir. Bembeyaz kumsalları ve turkuaz renkli suyu ile “Türkiye’nin Maldivleri” olarak da bilinir.',
        },
        {
          'ad': 'Göller Yöresi',
          'bilgi':
              'Burdur’un Göller Yöresi, doğal güzellikleriyle ünlüdür. Bu bölge, göller ve çevresindeki doğal alanları keşfetmek isteyen doğa severler için popüler bir yerdir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Sagalassos Antik Kenti',
          'bilgi':
              'Sagalassos, Roma İmparatorluğu dönemine ait önemli bir antik kenttir. Burada yer alan tapınaklar, tiyatro, hamamlar ve diğer yapılar, kentin tarihî önemini gösterir.',
        },
        {
          'ad': 'Burdur Ulu Camii',
          'bilgi':
              'Burdur Ulu Camii, Osmanlı döneminin erken örneklerinden biridir. 14. yüzyıldan kalma olan cami, taş işçiliğiyle dikkat çeker.',
        },
      ],
    },
    'Bursa': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Bursa Arkeoloji Müzesi',
          'bilgi':
              'Bursa Arkeoloji Müzesi, bölgenin tarihî geçmişini sergileyen önemli bir müzedir. Müzede, Frig, Roma, Bizans ve Osmanlı dönemlerine ait eserler yer alır.',
        },
        {
          'ad': 'Türk ve İslam Eserleri Müzesi',
          'bilgi':
              'Türk ve İslam Eserleri Müzesi, Osmanlı dönemi ve önceki İslam medeniyetlerine ait nadir eserleri içermektedir. Müze, Bursa’daki kültürel mirası yansıtmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Uludağ',
          'bilgi':
              'Uludağ, Türkiye’nin en yüksek dağlarından biridir ve kış turizminin merkezi olarak bilinir. Ayrıca yaz aylarında doğa yürüyüşleri için de popüler bir yerdir.',
        },
        {
          'ad': 'Cumalıkızık Köyü',
          'bilgi':
              'Cumalıkızık, Osmanlı dönemine ait geleneksel köy yapıları ve sokaklarıyla ünlüdür. UNESCO Dünya Mirası Listesi’nde yer alan bu köy, Bursa’nın kültürel mirasını yansıtır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Bursa Ulu Camii',
          'bilgi':
              'Bursa Ulu Camii, Osmanlı İmparatorluğu’nun ilk büyük camisi olup, mimarisiyle dikkat çeker. 1399 yılında inşa edilmiştir ve Türk İslam mimarisinin önemli örneklerinden biridir.',
        },
        {
          'ad': 'Yeşil Türbe',
          'bilgi':
              'Yeşil Türbe, Osmanlı Padişahı Çelebi Mehmet’in türbesidir ve Bursa’daki önemli yapılar arasında yer alır. Özellikle yeşil çinilerle süslü olan yapısı ile ünlüdür.',
        },
        {
          'ad': 'Tophane',
          'bilgi':
              'Bursa’da yer alan Tophane, Osmanlı döneminde yapılan askeri yapıları ve Bursa’nın tarihi çehresini keşfetmek için ziyaret edilmesi gereken önemli bir alandır.',
        },
      ],
    },
    'Çanakkale': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Çanakkale Arkeoloji Müzesi',
          'bilgi':
              'Çanakkale Arkeoloji Müzesi, bölgedeki antik yerleşim yerlerinden çıkan eserlerin sergilendiği önemli bir kültürel mekandır. Troya, Assos ve diğer antik kentlerden çıkarılan eserler burada bulunmaktadır.',
        },
        {
          'ad': 'Troya Müzesi',
          'bilgi':
              'Troya Müzesi, Çanakkale il sınırlarında yer alan Troya Antik Kenti’nden çıkarılan eserlerin sergilendiği bir müzedir. Müzede, Antik Yunan dönemine ait birçok heykel ve diğer eserler bulunur.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Troya Antik Kenti',
          'bilgi':
              'Troya Antik Kenti, ünlü Troya Savaşı’na ev sahipliği yapmış bir antik kenttir. UNESCO Dünya Mirası Listesi’nde yer alan bu kent, ziyaretçilere antik tarih hakkında derin bilgiler sunar.',
        },
        {
          'ad': 'Çanakkale Şehitler Anıtı',
          'bilgi':
              'Çanakkale Şehitler Anıtı, Çanakkale Savaşları’nda hayatını kaybeden Türk askerlerini anmak için yapılmış büyük bir anıttır. Bölgeyi ziyaret edenler, Türk milletinin kahramanlık tarihine tanıklık ederler.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Çanakkale Savaşları Gelibolu Yarımadası Tarihi Milli Parkı',
          'bilgi':
              'Gelibolu Yarımadası, Birinci Dünya Savaşı’nda Türk ve İtilaf Devletleri arasındaki büyük çatışmaların merkeziydi. Tarihi Milli Park, savaşın izlerini günümüze taşır ve pek çok anıt ve mezarlık içerir.',
        },
        {
          'ad': 'Assos Antik Kenti',
          'bilgi':
              'Assos, Antik Yunan döneminden kalma bir kenttir ve ünlü filozof Aristo’nun burada yaşamış olmasıyla bilinir. Antik kent, deniz manzaralı yapıları ve kalıntılarıyla oldukça etkileyicidir.',
        },
      ],
    },

    'Çankırı': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Çankırı Müzesi',
          'bilgi':
              'Çankırı Müzesi, bölgenin tarihî geçmişini yansıtan önemli eserleri sergileyen bir müzedir. Müzede, Hititler ve Frigler gibi eski uygarlıklara ait eserler bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Çankırı Kalesi',
          'bilgi':
              'Çankırı Kalesi, şehrin merkezinde bulunan ve tarihi çok eskiye dayanan bir kaledir. Kalenin üst katlarından şehri yüksekten görmek mümkündür.',
        },
        {
          'ad': 'Atatürk Caddesi',
          'bilgi':
              'Çankırı’nın en önemli caddelerinden biri olan Atatürk Caddesi, şehri keşfetmek için harika bir yürüyüş yoludur. Caddede eski Osmanlı yapıları ve modern dükkanlar bir arada bulunur.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Kösrelik Mağarası',
          'bilgi':
              'Kösrelik Mağarası, Çankırı’nın doğal zenginliklerinden biridir. Bu mağara, eski çağlardan kalma taş duvarlarla yapılmış ve çok sayıda kalıntı barındırmaktadır.',
        },
        {
          'ad': 'Ilgaz Dağı Milli Parkı',
          'bilgi':
              'Ilgaz Dağı, Çankırı ile Kastamonu illeri arasında yer alan yüksek bir dağdır. Milli park, dağcılık ve kış sporları için popüler bir yerdir.',
        },
      ],
    },

    'Çorum': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Çorum Arkeoloji Müzesi',
          'bilgi':
              'Çorum Arkeoloji Müzesi, bölgenin tarihini yansıtan önemli eserleri sergileyen bir müzedir. Hititler ve Frigler gibi eski uygarlıklara ait çok sayıda eser burada sergilenmektedir.',
        },
        {
          'ad': 'Hattuşa Müzesi',
          'bilgi':
              'Hattuşa Müzesi, Çorum’a bağlı Boğazkale ilçesinde yer alan Hattuşa antik kentinin kalıntılarından çıkarılan eserleri sergileyen bir müzedir. Müzede, Hitit İmparatorluğu’na ait taş tabletler ve heykeller bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Hattuşa Antik Kenti',
          'bilgi':
              'Hattuşa, Hitit İmparatorluğu’nun başkenti olarak bilinen tarihi bir kenttir. UNESCO Dünya Mirası Listesi’nde yer alan bu antik kent, tapınakları, surları ve kalıntılarıyla dikkat çekmektedir.',
        },
        {
          'ad': 'Alacahöyük',
          'bilgi':
              'Alacahöyük, Hititler öncesi döneme ait çok önemli bir arkeolojik alandır. Burada, tarihi mezar yapıları ve tapınak kalıntıları ziyaretçileri beklemektedir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Çorum Kalesi',
          'bilgi':
              'Çorum Kalesi, şehre hakim bir tepe üzerinde yer alır ve kalıntıları günümüze kadar ulaşmıştır. Kale, Orta Çağ’dan kalma bir yapı olup, şehri yüksekten görmek için mükemmel bir yerdir.',
        },
        {
          'ad': 'Ulukavak Cami',
          'bilgi':
              'Ulukavak Cami, 15. yüzyıldan kalma tarihi bir Osmanlı camidir. Cami, mimari yapısıyla dikkat çekicidir ve bölgenin önemli dini yapılarından biridir.',
        },
      ],
    },
    'Denizli': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Denizli Arkeoloji Müzesi',
          'bilgi':
              'Denizli Arkeoloji Müzesi, bölgenin tarihini yansıtan çok sayıda eseri sergileyen önemli bir müzedir. Müzede, Frig, Roma ve Bizans dönemlerine ait eserler yer almaktadır.',
        },
        {
          'ad': 'Laodikya Müzesi',
          'bilgi':
              'Laodikya Müzesi, Laodikya antik kentinden çıkarılan arkeolojik eserleri sergileyen bir müzedir. Bu müzede, Roma dönemine ait heykeller, yazıtlar ve diğer önemli kalıntılar bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Pamukkale',
          'bilgi':
              'Pamukkale, dünyaca ünlü beyaz traverten teraslarıyla tanınır. Termal sularının oluşturduğu bu muazzam doğal oluşum, UNESCO Dünya Mirası Listesi’nde yer alır.',
        },
        {
          'ad': 'Hierapolis Antik Kenti',
          'bilgi':
              'Pamukkale’nin yakınında yer alan Hierapolis, Roma döneminden kalma önemli bir antik kenttir. Antik tiyatro, hamamlar ve nekropol ile ünlüdür.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Laodikya Antik Kenti',
          'bilgi':
              'Laodikya, Antik Roma döneminden kalan önemli bir şehirdir. Kentte, çok sayıda tapınak, tiyatro, bazilika ve stadyum kalıntıları bulunmaktadır.',
        },
        {
          'ad': 'Akhisar Hamamı',
          'bilgi':
              'Akhisar Hamamı, Osmanlı döneminden kalma tarihi bir yapıdır ve Denizli şehir merkezine oldukça yakındır.',
        },
      ],
    },
    'Diyarbakır': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Diyarbakır Arkeoloji Müzesi',
          'bilgi':
              'Diyarbakır Arkeoloji Müzesi, bölgenin tarih öncesi dönemlerinden Osmanlı dönemine kadar pek çok önemli eseri sergileyen bir müzedir. Müze, taş yapıtlar, heykeller ve çeşitli arkeolojik buluntularla zenginleşmiştir.',
        },
        {
          'ad': 'Diyarbakır Ulu Cami Müzesi',
          'bilgi':
              'Diyarbakır Ulu Cami, Selçuklu dönemi mimarisinin en önemli örneklerinden biridir ve caminin içindeki bazı tarihi eserler de müze olarak sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Diyarbakır Surları',
          'bilgi':
              'Diyarbakır Surları, şehri çevreleyen tarihi surlar, dünyanın en uzun ve en sağlam surlarından biridir. UNESCO Dünya Mirası Listesi’nde yer alır.',
        },
        {
          'ad': 'Hevsel Bahçeleri',
          'bilgi':
              'Hevsel Bahçeleri, Diyarbakır şehir merkezine yakın, tarihi sulama sistemleriyle ünlü yeşil alanlardır. Burada organik tarım yapılmakta ve şehre doğal güzellik katmaktadır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Ulu Cami',
          'bilgi':
              'Diyarbakır Ulu Cami, 11. yüzyılda Selçuklu döneminde inşa edilmiştir ve bölgenin en eski camilerinden biridir. Mimari açıdan önemli bir yapıdır.',
        },
        {
          'ad': 'Ziya Gökalp Müzesi',
          'bilgi':
              'Diyarbakır’ın önemli kültürel figürlerinden biri olan Ziya Gökalp’in doğduğu ev olan bu müze, Türk kültürüne olan katkılarını anlatan eserler sunmaktadır.',
        },
      ],
    },

    'Düzce': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Düzce Arkeoloji Müzesi',
          'bilgi':
              'Düzce Arkeoloji Müzesi, bölgenin tarihine ışık tutan çeşitli arkeolojik buluntuları sergileyen önemli bir müzedir. Müzede, Hitit, Frig ve Roma dönemlerine ait eserler bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Gölköy Yaylası',
          'bilgi':
              'Gölköy Yaylası, Düzce’nin doğal güzelliklerini keşfetmek isteyenler için mükemmel bir yerdir. Yaylada, doğa yürüyüşleri yapılabilir ve yeşillikler arasında dinlenilebilir.',
        },
        {
          'ad': 'Samandere Şelalesi',
          'bilgi':
              'Samandere Şelalesi, Düzce il sınırları içinde yer alan ve doğa severlerin ilgisini çeken muazzam bir şelaledir. Etrafındaki ormanlık alanla birlikte doğa harikası bir manzara sunar.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Konuralp Antik Kenti',
          'bilgi':
              'Konuralp Antik Kenti, Düzce’nin Konuralp beldesinde yer alır ve Roma dönemine ait kalıntılar içermektedir. Antik kentte bir tiyatro, hamam ve diğer yapılar yer alır.',
        },
        {
          'ad': 'Düzce Evleri',
          'bilgi':
              'Düzce Evleri, Osmanlı dönemi taş yapılarıyla dikkat çeker. Düzce’nin eski sokaklarında yer alan bu evler, tarihi mimarisiyle önemli bir kültürel miras bırakmaktadır.',
        },
      ],
    },
    'Edirne': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Edirne Arkeoloji Müzesi',
          'bilgi':
              'Edirne Arkeoloji Müzesi, bölgedeki tarihi eserlerin sergilendiği önemli bir kültürel mekandır. Müzede, Roma, Bizans, Osmanlı dönemlerine ait pek çok eser bulunmaktadır.',
        },
        {
          'ad': 'Beyazıt Külliyesi Müzesi',
          'bilgi':
              'Osmanlı dönemine ait Beyazıt Külliyesi içinde yer alan bu müze, dönemin mimarisi ve kültürel mirasına dair değerli eserler barındırmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Selimiye Camii',
          'bilgi':
              'Mimar Sinan tarafından inşa edilen ve UNESCO Dünya Mirası Listesi’nde yer alan Selimiye Camii, Edirne’nin en önemli simgelerindendir. Mükemmel mimarisiyle dikkat çeker.',
        },
        {
          'ad': 'Edirne Sarayı (Saray-ı Cedid-i Amire)',
          'bilgi':
              'Osmanlı dönemine ait olan Edirne Sarayı, tarihi dokusu ve büyük avlusuyla oldukça etkileyici bir yapıdır. Saray, Edirne’nin zengin tarihi geçmişini yansıtır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Edirne Kalesi',
          'bilgi':
              'Edirne Kalesi, Bizans dönemine ait olup Osmanlı döneminde genişletilmiştir. Kale, Edirne’nin stratejik önemini gösteren bir yapıdır ve şehir manzarası sunar.',
        },
        {
          'ad': 'Karaağaç',
          'bilgi':
              'Edirne’nin Karaağaç mahallesi, Osmanlı döneminden kalma yapıları ve doğal güzellikleriyle ünlüdür. Yunanistan’a sınır olan bu bölge, tarihsel olarak da önemli bir yer tutar.',
        },
      ],
    },
    'Elazığ': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Elazığ Arkeoloji Müzesi',
          'bilgi':
              'Elazığ Arkeoloji Müzesi, bölgenin antik geçmişine ışık tutan eserlerin sergilendiği önemli bir kültürel mekandır. Müzede, Hitit, Urartu, Roma ve Osmanlı dönemlerine ait pek çok eser bulunmaktadır.',
        },
        {
          'ad': 'Harput Müzesi',
          'bilgi':
              'Harput Müzesi, Harput bölgesinde bulunan tarihi eserleri sergileyen bir müzedir. Urartu dönemine ait kalıntılar ve Osmanlı dönemi eserleri burada yer almaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Harput Kalesi',
          'bilgi':
              'Harput Kalesi, Elazığ’ın en eski yerleşimlerinden biri olan Harput’ta yer alır. Kale, bölgenin tarihi geçmişi hakkında bilgi veren önemli bir yapıdır. Aynı zamanda muazzam bir manzara sunmaktadır.',
        },
        {
          'ad': 'Hazar Gölü',
          'bilgi':
              'Hazar Gölü, Elazığ’ın doğal güzelliklerinden biridir. Gölde, balık tutma, yüzme ve doğa yürüyüşleri gibi aktiviteler yapılabilir. Çevresinde piknik alanları bulunmaktadır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Harput Evleri',
          'bilgi':
              'Harput, Elazığ’ın tarihi bir mahallesidir. Osmanlı dönemine ait taş yapılarıyla ünlüdür ve bu evler, bölgenin kültürel mirasını yansıtır.',
        },
        {
          'ad': 'Ulu Camii',
          'bilgi':
              'Ulu Camii, Elazığ şehir merkezinde yer alan tarihi bir camidir. Selçuklu dönemine ait mimarisi ve zarif işçilikleriyle dikkat çeker.',
        },
      ],
    },
    'Erzincan': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Erzincan Arkeoloji Müzesi',
          'bilgi':
              'Erzincan Arkeoloji Müzesi, bölgedeki eski medeniyetlere ait eserlerin sergilendiği önemli bir kültürel mekandır. Müze, Hititler, Urartular ve Osmanlı dönemlerinden kalma eserleri içermektedir.',
        },
        {
          'ad': 'Erzincan Atatürk Evi ve Müzesi',
          'bilgi':
              'Erzincan’daki Atatürk Evi, Mustafa Kemal Atatürk’ün Erzincan’ı ziyaret ettiği dönemde kaldığı evdir. Bugün müze olarak kullanılmaktadır ve bu ev, Atatürk’ün Erzincan’da geçirdiği zamanın izlerini taşır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Erzincan Kalesi',
          'bilgi':
              'Erzincan Kalesi, Erzincan şehir merkezine hakim bir tepede yer alır ve tarihi Bizans dönemine kadar uzanır. Kalenin tepe kısmından Erzincan manzarası oldukça etkileyicidir.',
        },
        {
          'ad': 'Munzur Vadisi Milli Parkı',
          'bilgi':
              'Munzur Vadisi Milli Parkı, Erzincan’ın doğal güzelliklerinden biridir. Zengin flora ve fauna çeşitliliğiyle ünlüdür. Doğa yürüyüşleri, kampçılık gibi etkinlikler için idealdir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Erzincan Evleri',
          'bilgi':
              'Erzincan Evleri, Osmanlı ve Türk mimarisinin güzel örneklerini sergileyen geleneksel Türk evleridir. Bu evler, Erzincan’ın kültürel mirasını yansıtan önemli yapılardır.',
        },
        {
          'ad': 'Taşbaşı Kilisesi',
          'bilgi':
              'Taşbaşı Kilisesi, Erzincan’daki en eski kiliselerden biridir. 19. yüzyılda inşa edilmiş olan bu kilise, Ermeniler tarafından kullanılmış ve güzel taş işçiliğiyle dikkat çekmektedir.',
        },
      ],
    },
    'Erzurum': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Erzurum Arkeoloji Müzesi',
          'bilgi':
              'Erzurum Arkeoloji Müzesi, bölgedeki tarih öncesi ve antik dönemlere ait önemli eserlerin sergilendiği bir müzedir. Erzurum’un geçmişi hakkında bilgi edinmek isteyenler için önemli bir kaynaktır.',
        },
        {
          'ad': 'Erzurum Atatürk Evi ve Müzesi',
          'bilgi':
              'Atatürk Evi, Mustafa Kemal Atatürk’ün Erzurum’u ziyaret ettiği dönemde kaldığı evdir. Bugün müze olarak ziyaretçilerine açık olup, Türkiye Cumhuriyeti’nin kurucusunun Erzurum’daki hatıralarını yaşatmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Palandöken Dağı',
          'bilgi':
              'Palandöken Dağı, kış sporları meraklıları için Türkiye’nin en önemli kayak merkezlerinden biridir. Aynı zamanda doğa yürüyüşleri için de popüler bir alandır.',
        },
        {
          'ad': 'Erzurum Kalesi',
          'bilgi':
              'Erzurum Kalesi, şehri yüksekten görebileceğiniz ve tarihî dokusu ile dikkat çeken bir yapıdır. Kalede yapılan kazılarda önemli tarihi kalıntılar bulunmuştur.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Çifte Minareli Medrese',
          'bilgi':
              'Çifte Minareli Medrese, Erzurum’un en bilinen tarihi yapılarından biridir. Selçuklu dönemi mimarisini yansıtan bu medrese, çift minaresiyle dikkat çeker.',
        },
        {
          'ad': 'Yakutiye Medrese',
          'bilgi':
              'Yakutiye Medrese, Erzurum’un en güzel Selçuklu dönemi yapılarından biridir. Medrese, mimarisi ve taş işçiliğiyle ünlüdür ve Erzurum’un tarihini gözler önüne serer.',
        },
      ],
    },

    'Eskişehir': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Eskişehir Arkeoloji Müzesi',
          'bilgi':
              'Eskişehir Arkeoloji Müzesi, Eskişehir il sınırlarında bulunan höyükler ve antik kentlerden çıkarılan önemli eserlerin sergilendiği bir müzedir. Müzede, bölgedeki farklı uygarlıklara ait kalıntılar bulunmaktadır.',
        },
        {
          'ad': 'Odunpazarı Modern Müze (OMM)',
          'bilgi':
              'Odunpazarı Modern Müze, Eskişehir’in modern sanat alanındaki önemli temsilcilerinden biridir. Çağdaş sanat eserlerinin sergilendiği bu müze, Eskişehir’in kültürel zenginliğine katkı sağlamaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Porsuk Çayı',
          'bilgi':
              'Eskişehir şehir merkezinden geçen Porsuk Çayı, etrafındaki yürüyüş yolları ve kafelerle ünlüdür. Çay boyunca yapılacak tekne turları, Eskişehir’i farklı bir açıdan görmenize olanak tanır.',
        },
        {
          'ad': 'Sazova Parkı',
          'bilgi':
              'Sazova Parkı, Eskişehir’in en büyük ve en popüler parklarından biridir. İçerisinde gölet, bilim merkezi, masal şatosu gibi çeşitli eğlence ve eğitim alanları bulunmaktadır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Odunpazarı Evleri',
          'bilgi':
              'Eskişehir’in tarihi Odunpazarı bölgesinde yer alan geleneksel Türk evleri, Osmanlı dönemi mimarisini yansıtan önemli yapılardır. Bu evler, Eskişehir’in kültürel mirasını gözler önüne serer.',
        },
        {
          'ad': 'Eskişehir Mevlevihanesi',
          'bilgi':
              'Eskişehir Mevlevihanesi, Mevlevi tarikatının önemli merkezlerinden biridir. İçerisinde Sema gösterilerinin yapıldığı bu mekân, tarihî ve kültürel açıdan büyük bir öneme sahiptir.',
        },
      ],
    },

    'Gaziantep': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Zeugma Mozaik Müzesi',
          'bilgi':
              'Zeugma Mozaik Müzesi, Gaziantep’in en ünlü arkeolojik müzesidir. Zeugma antik kentinden çıkarılan mozaikler burada sergilenmektedir. Mozaikler, Roma dönemine ait en değerli eserlerdendir.',
        },
        {
          'ad': 'Gaziantep Arkeoloji Müzesi',
          'bilgi':
              'Gaziantep Arkeoloji Müzesi, bölgedeki tarih öncesi ve antik dönemlere ait eserlerin sergilendiği önemli bir müzedir. Eski uygarlıklara ait çeşitli eserler burada ziyaretçilere sunulmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Gaziantep Kalesi',
          'bilgi':
              'Gaziantep Kalesi, şehri yüksekten izleyebileceğiniz ve tarihi dokusunu keşfedebileceğiniz önemli bir yapıdır. Roma dönemine ait kalıntılar üzerine inşa edilmiştir.',
        },
        {
          'ad': 'Almacı Pazarı',
          'bilgi':
              'Almacı Pazarı, Gaziantep’in en ünlü alışveriş alanlarından biridir. El yapımı bakır ürünler, baharatlar, hediyelik eşyalar ve yerel lezzetler burada satılmaktadır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Rumkale',
          'bilgi':
              'Rumkale, Fırat Nehri üzerinde yer alan tarihi bir kaleyle birlikte, bölgedeki en eski yerleşim alanlarından biridir. Hem Bizans hem de Osmanlı dönemlerine ait kalıntılar bulunmaktadır.',
        },
        {
          'ad': 'Dülük Baba Tekkesi',
          'bilgi':
              'Dülük Baba Tekkesi, Gaziantep il sınırlarında yer alan bir dergah ve tarihe ışık tutan bir mekandır. Tarihi dokusu ve doğal güzellikleri ile ünlüdür.',
        },
      ],
    },

    'Giresun': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Giresun Müzesi',
          'bilgi':
              'Giresun Müzesi, bölgenin tarih öncesi çağlarından Osmanlı dönemine kadar geniş bir koleksiyona sahip bir müzedir. Müzede, antik çağlara ait taş eserler, heykeller ve etnografik koleksiyonlar sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Giresun Kalesi',
          'bilgi':
              'Giresun Kalesi, şehir merkezine hakim bir tepede yer alır ve hem tarihi hem de muazzam bir manzaraya sahiptir. Kale, Bizans dönemine ait kalıntıları barındırmaktadır.',
        },
        {
          'ad': 'Giresun Adası',
          'bilgi':
              'Giresun Adası, Karadeniz’deki tek yerleşim adası olup, doğal güzellikleri ve zengin flora ve faunasıyla ünlüdür. Aynı zamanda adada bir fener de bulunmaktadır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Giresun Kalesi',
          'bilgi':
              'Giresun Kalesi, şehri yüksekten görebileceğiniz ve tarihi izleri keşfedeceğiniz önemli bir yapıdır. Kale, Bizans dönemine ait yapılarla birlikte Selçuklu ve Osmanlı etkilerini de taşımaktadır.',
        },
        {
          'ad': 'Şebinkarahisar Kalesi',
          'bilgi':
              'Şebinkarahisar Kalesi, Giresun il sınırları içinde yer alan, Osmanlı döneminden kalan önemli bir yapıdır. Kalenin bulunduğu yüksek tepeden, çevre köyler ve Giresun il sınırları manzarasına sahip olunabilir.',
        },
      ],
    },

    'Gümüşhane': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Gümüşhane Müzesi',
          'bilgi':
              'Gümüşhane Müzesi, bölgedeki arkeolojik kazılardan çıkarılan eserler ile zengin bir koleksiyona sahiptir. Müzede, Gümüşhane ve çevresindeki antik yerleşimlerden gelen taş eserler, madencilik tarihine dair objeler ve etnografik koleksiyonlar sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Karaca Mağarası',
          'bilgi':
              'Karaca Mağarası, Gümüşhane’nin en önemli doğal oluşumlarından biridir. Mağara, yer altı su yolları ve sarkıtları ile ünlüdür. Aynı zamanda içerdiği mineral zenginlikleri ile dikkat çekmektedir.',
        },
        {
          'ad': 'Limni Gölü',
          'bilgi':
              'Limni Gölü, Gümüşhane’nin en bilinen doğa harikalarından biridir. Göl, çevresindeki ormanlık alanlarla birleşerek huzurlu bir doğal güzellik sunar. Yürüyüş yapmaya elverişli bir alan olup, fotoğrafçılar için de cazip bir yerdir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Kalesi (Gümüşhane Kalesi)',
          'bilgi':
              'Gümüşhane Kalesi, şehri yüksekten görebileceğiniz bir tepeye inşa edilmiştir. Kale, Bizans dönemine ait kalıntıları ve Selçuklu izlerini taşır. Şehir merkeziyle bütünleşmiş bir manzaraya sahiptir.',
        },
        {
          'ad': 'Santa Harabeleri',
          'bilgi':
              'Santa Harabeleri, Gümüşhane il sınırlarında yer alan eski bir yerleşim alanıdır. Bizans dönemine ait kilise ve diğer yapılarla birlikte bu antik alan, tarihi ve kültürel bir öneme sahiptir.',
        },
      ],
    },
    'Hakkâri': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Hakkâri Müzesi',
          'bilgi':
              'Hakkâri Müzesi, bölgenin tarihini yansıtan arkeolojik eserlerin sergilendiği önemli bir mekandır. Bu müze, bölgedeki erken yerleşimlere ait taş eserler, mezar taşları ve etnografik objeleri içerir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Cilo Dağı',
          'bilgi':
              'Cilo Dağı, Hakkâri’nin en yüksek dağıdır ve dağcılar için popüler bir yerdir. Aynı zamanda eşsiz manzaralarıyla doğa severlere harika bir deneyim sunar.',
        },
        {
          'ad': 'Zap Vadisi',
          'bilgi':
              'Zap Vadisi, Hakkâri’nin en bilinen doğal alanlarından biridir. Vadi, sakin ve huzurlu atmosferi, yeşil doğası ve yürüyüş yolları ile ziyaretçileri cezbetmektedir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Hakkâri Kalesi',
          'bilgi':
              'Hakkâri Kalesi, şehri yüksekten izleyebileceğiniz önemli bir yapıdır. Kale, Osmanlı döneminden kalan kalıntıları ile hem tarihi hem de panoramik manzarası ile dikkat çeker.',
        },
        {
          'ad': 'Vangölü Kalesi',
          'bilgi':
              'Vangölü Kalesi, Hakkâri’ye yakın bir bölgede yer alan tarihi bir yapıdır. Kale, Bizans dönemine ait kalıntılar ve stratejik bir konumda bulunmasıyla tarihe ışık tutar.',
        },
      ],
    },

    'Hatay': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Hatay Arkeoloji Müzesi',
          'bilgi':
              'Hatay Arkeoloji Müzesi, bölgedeki en eski yerleşimlerin kalıntılarına ve bölgenin farklı uygarlıklara ait eserlerine ev sahipliği yapmaktadır. Müze, özellikle Roma ve Bizans dönemlerine ait mozaikler ve heykelleriyle ünlüdür.',
        },
        {
          'ad': 'Antakya Mozaik Müzesi',
          'bilgi':
              'Antakya Mozaik Müzesi, Roma dönemine ait etkileyici mozaikleri ile tanınır. Bu mozaikler, bölgenin geçmişi hakkında bilgi verir ve antik Antakya’nın zengin kültürel mirasını gözler önüne serer.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Harbiye Şelaleleri',
          'bilgi':
              'Harbiye Şelaleleri, doğa severler için mükemmel bir gezi noktasıdır. Zengin flora ve fauna, şelalenin etrafını saran huzurlu bir ortam yaratır. Ayrıca bölge, tarihi olarak da önemli bir mekandır.',
        },
        {
          'ad': 'Antakya Eski Şehir Merkezi',
          'bilgi':
              'Antakya’nın tarihi dokusunu yansıtan eski şehir merkezi, dar sokakları, geleneksel evleri ve restoranlarıyla ünlüdür. Ziyaretçilere geçmişe dair izler sunar ve Antakya’nın zengin kültürel mirasını keşfetme fırsatı verir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Saint Pierre Kilisesi',
          'bilgi':
              'Saint Pierre Kilisesi, Hristiyanlığın ilk dönemlerine ait önemli bir yapıdır. Kayalar içine inşa edilmiş olan bu kilise, dünyanın en eski kiliselerinden biri olarak kabul edilir.',
        },
        {
          'ad': 'Antakya Mozaikleri',
          'bilgi':
              'Antakya, Roma dönemine ait çok sayıda mozaik ile ünlüdür. Bu mozaikler, Antakya’nın eski zenginliğini ve kültürel mirasını sergiler. Mozaikler, müzelerde ve açık alanlarda sergilenmektedir.',
        },
      ],
    },
    'Iğdır': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Iğdır Müzesi',
          'bilgi':
              'Iğdır Müzesi, bölgenin tarihini ve kültürel geçmişini yansıtan birçok esere ev sahipliği yapmaktadır. Müze, özellikle Urartulara ait eserler ve taşlar ile dikkat çekmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Iğdır Ovası',
          'bilgi':
              'Iğdır Ovası, büyüleyici manzarasıyla doğa severler için mükemmel bir gezi alanıdır. Özellikle kuş gözlemciliği için popüler bir yerdir.',
        },
        {
          'ad': 'Aras Nehri',
          'bilgi':
              'Aras Nehri, Iğdır’ın önemli doğal alanlarından biridir. Nehir boyunca yapılan yürüyüşler ve doğa gezileri bölgenin eşsiz doğasını keşfetmek için harika bir fırsat sunar.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Urartu Kalesi',
          'bilgi':
              'Urartu Kalesi, Iğdır’a bağlı Höyük Dağı’nda yer almaktadır. Urartular dönemine ait kalıntılar ve yapılar bu bölgede bulunmuştur ve bu kalıntılar bölgenin tarihi hakkında önemli ipuçları sunar.',
        },
        {
          'ad': 'Iğdır İslam Eserleri Müzesi',
          'bilgi':
              'Iğdır İslam Eserleri Müzesi, bölgedeki İslam dönemi eserlerini sergileyen bir müzedir. Bu müze, İslam kültürünün izlerini taşıyan eserlerle doludur.',
        },
      ],
    },

    'Isparta': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Isparta Müzesi',
          'bilgi':
              'Isparta Müzesi, bölgenin tarih öncesi dönemlerinden Osmanlı dönemine kadar birçok önemli arkeolojik eseri sergileyen bir müzedir. Müzede, Roma ve Bizans dönemlerine ait eserler yoğunluktadır.',
        },
        {
          'ad': 'Eğirdir Arkeoloji Müzesi',
          'bilgi':
              'Eğirdir Arkeoloji Müzesi, Eğirdir Gölü çevresinde bulunan tarihi eserlerin sergilendiği önemli bir kültürel alandır. Özellikle antik dönemlerden kalan taş eserler ve heykeller dikkat çekicidir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Eğirdir Gölü',
          'bilgi':
              'Eğirdir Gölü, Isparta il sınırlarında yer alan ve doğa severlerin ilgisini çeken bir alandır. Göl çevresinde yapılacak yürüyüşler ve piknikler, bölgenin doğal güzelliklerini keşfetmek için idealdir.',
        },
        {
          'ad': 'Göller Yöresi',
          'bilgi':
              'Göller Yöresi, Isparta’nın doğal güzellikleriyle ünlü bir bölgesidir. Burada, özellikle Yalvaç ve Senirkent gibi yerleşim yerleri, göller ve doğal parklar ile çevrilidir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Antalya Yolu Üzerindeki Tarihi Köprüler',
          'bilgi':
              'Isparta il sınırları içerisinde yer alan eski köprüler, Osmanlı döneminin izlerini taşır ve bu köprüler, bölgenin ulaşım geçmişine ışık tutar.',
        },
        {
          'ad': 'Sagalassos Antik Kenti',
          'bilgi':
              'Sagalassos, Pisidya bölgesinin en önemli antik kentlerinden biridir. Burada, Roma dönemine ait hamamlar, tapınaklar ve amfi tiyatro gibi yapılar bulunmaktadır. Sagalassos, aynı zamanda etkileyici manzarasıyla da dikkat çeker.',
        },
      ],
    },
    'Kahramanmaraş': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kahramanmaraş Müzesi',
          'bilgi':
              'Kahramanmaraş Müzesi, bölgenin tarihini ve kültürünü yansıtan zengin bir koleksiyona sahiptir. Müzede, özellikle Hitit, Roma ve Osmanlı dönemlerine ait birçok önemli eser sergilenmektedir.',
        },
        {
          'ad': 'Andırın Arkeoloji Müzesi',
          'bilgi':
              'Andırın Arkeoloji Müzesi, Kahramanmaraş’ın antik tarihine ışık tutan eserlerin sergilendiği bir mekandır. Burada, bölgenin eski yerleşimlerinden gelen taş yapılar ve heykeller bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kahramanmaraş Kalesi',
          'bilgi':
              'Kahramanmaraş Kalesi, şehri yüksekten görebileceğiniz ve bölgenin tarihi dokusunu keşfedebileceğiniz bir yapıdır. Kale, Roma ve Bizans dönemlerinden izler taşımaktadır.',
        },
        {
          'ad': 'Dulkadiroğlu Parkı',
          'bilgi':
              'Kahramanmaraş’ın merkezine yakın olan Dulkadiroğlu Parkı, doğayla iç içe bir alan sunar. Piknik yapmak, yürüyüş yapmak ve rahatlamak için ideal bir mekandır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Ulu Cami',
          'bilgi':
              'Ulu Cami, Kahramanmaraş’ta Selçuklu dönemine ait önemli bir yapıdır. Caminin mimarisi, taş işçiliği ve iç mekanındaki işlemeleriyle dikkat çeker.',
        },
        {
          'ad': 'Kahramanmaraş Çarşısı',
          'bilgi':
              'Kahramanmaraş Çarşısı, hem yerel halkın hem de turistlerin ilgisini çeken tarihi bir çarşıdır. Burada, Maraş dondurması, yöresel hediyelikler ve geleneksel el sanatları satılmaktadır.',
        },
      ],
    },
    'Karabük': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Karabük Müzesi',
          'bilgi':
              'Karabük Müzesi, bölgenin tarihine ışık tutan eserleri barındıran bir mekandır. Müzede, Roma ve Osmanlı dönemlerine ait birçok önemli eser sergilenmektedir. Ayrıca, bölgedeki endüstriyel geçmişi yansıtan sergiler de mevcuttur.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Safranbolu',
          'bilgi':
              'Safranbolu, Karabük’ün en bilinen ve UNESCO Dünya Mirası Listesi’nde yer alan tarihi bir kasabasıdır. Osmanlı dönemine ait evleri, dar sokakları ve tarihi çarşıları ile ünlüdür. Safranbolu’da zaman adeta durur.',
        },
        {
          'ad': 'Karabük Kent Ormanı',
          'bilgi':
              'Karabük Kent Ormanı, şehre yakın doğa yürüyüşleri yapmak, piknik yapmak veya dinlenmek için ideal bir alandır. Bu yeşil alan, doğal güzellikleriyle bölgeye gelen doğa severlerin ilgisini çeker.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Safranbolu Evleri',
          'bilgi':
              'Safranbolu evleri, Osmanlı dönemine ait geleneksel Türk evlerinin en güzel örneklerinden biridir. Ahşap yapılar ve taş işçiliğiyle dikkat çeker. Safranbolu, bu evlerle adeta bir açık hava müzesi gibidir.',
        },
        {
          'ad': 'Beypazarı',
          'bilgi':
              'Beypazarı, Safranbolu ile benzer şekilde tarihi dokusunu koruyan bir yerleşimdir. Osmanlı mimarisine ait evleri, dar sokakları ve eski çarşıları ile ünlüdür.',
        },
      ],
    },
    'Karaman': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Karaman Müzesi',
          'bilgi':
              'Karaman Müzesi, şehrin tarihi geçmişine ait çok sayıda arkeolojik eserin sergilendiği bir mekandır. Müze, özellikle Roma, Bizans ve Selçuklu dönemlerinden önemli kalıntıları barındırmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Karaman Kalesi',
          'bilgi':
              'Karaman Kalesi, şehri yüksekten görebileceğiniz tarihi bir yapıdır. Selçuklu dönemine ait izler taşıyan kale, şehri savunma amaçlı inşa edilmiştir.',
        },
        {
          'ad': 'Ağaçören Göleti',
          'bilgi':
              'Ağaçören Göleti, doğa ile iç içe vakit geçirmek isteyenler için harika bir gezi alanıdır. Yürüyüş yapabilir veya piknik yapabilirsiniz.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Karamanoğlu Beyliği Camii',
          'bilgi':
              'Karamanoğlu Beyliği Camii, Selçuklu dönemi mimarisinin izlerini taşıyan ve Karaman’ın simgelerinden biri olan önemli bir camidir.',
        },
        {
          'ad': 'İçeri Cami',
          'bilgi':
              'İçeri Cami, Karaman’daki en eski camilerden biridir. Osmanlı dönemi mimarisiyle dikkat çeker ve şehrin en önemli dini yapılarından biridir.',
        },
      ],
    },
    'Kars': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kars Müzesi',
          'bilgi':
              'Kars Müzesi, bölgedeki arkeolojik kazılardan elde edilen eserlerin sergilendiği bir müzedir. Burada, Urartular, Bizans ve Selçuklu dönemlerine ait eserler bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Ani Harabeleri',
          'bilgi':
              'Ani Harabeleri, Kars’a 45 km uzaklıkta, Ermenistan sınırına yakın bir alanda yer alan tarihi bir bölgedir. UNESCO Dünya Mirası Listesi’nde yer alan bu antik kent, Orta Çağ’ın önemli kültürel miraslarından biridir.',
        },
        {
          'ad': 'Kars Kalesi',
          'bilgi':
              'Kars Kalesi, şehri yüksekten görebileceğiniz, tarihsel açıdan önemli bir yapıdır. Bizans dönemine ait kalıntılar ve Osmanlı izleri taşıyan kale, Kars’ın simgelerindendir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Fethiye Camii',
          'bilgi':
              'Fethiye Camii, Osmanlı dönemine ait önemli bir yapıdır. İlk olarak bir kilise olarak inşa edilmiş ve sonrasında camiye dönüştürülmüştür. Kars’ın en eski camilerinden biridir.',
        },
        {
          'ad': 'Kümbet Camii',
          'bilgi':
              'Kümbet Camii, Selçuklu dönemi mimarisine sahip bir camidir. Şehirdeki en önemli dini yapılarından biridir ve özellikle iç yapısı ile dikkat çeker.',
        },
      ],
    },
    'Kastamonu': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kastamonu Arkeoloji Müzesi',
          'bilgi':
              'Kastamonu Arkeoloji Müzesi, bölgenin tarih öncesi çağlardan Osmanlı dönemine kadar birçok eseri sergileyen önemli bir kültürel mekandır. Müzede, antik Yunan, Roma ve Bizans dönemlerine ait eserler bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kastamonu Kalesi',
          'bilgi':
              'Kastamonu Kalesi, şehri yüksekten görebileceğiniz tarihi bir yapıdır. Roma dönemine kadar uzanan geçmişiyle, birçok medeniyetin izlerini taşıyan kale, şehrin simgelerindendir.',
        },
        {
          'ad': 'İnceğiz Mağarası',
          'bilgi':
              'İnceğiz Mağarası, Kastamonu’nun doğal güzellikleri arasında yer alır. Mağara, ilginç sarkıtları ve dikitleri ile ziyaretçilere benzersiz bir deneyim sunar.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Nasrullah Camii',
          'bilgi':
              'Nasrullah Camii, Kastamonu’nun en önemli Osmanlı dönemi yapılarından biridir. 16. yüzyılda inşa edilmiş olan cami, zarif mimarisiyle dikkat çeker.',
        },
        {
          'ad': 'Liva Paşa Konağı',
          'bilgi':
              'Liva Paşa Konağı, Kastamonu’daki Osmanlı dönemi yapılarından biridir. Bu konak, geleneksel Türk ev mimarisini yansıtan özelliklere sahiptir ve günümüzde müze olarak kullanılmaktadır.',
        },
      ],
    },
    'Kastamonu': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kastamonu Arkeoloji Müzesi',
          'bilgi':
              'Kastamonu Arkeoloji Müzesi, bölgenin tarihini yansıtan çok sayıda eseri barındıran önemli bir kültürel mekandır. Müzede Roma, Bizans ve Osmanlı dönemlerine ait eserler sergilenmektedir.',
        },
        {
          'ad': 'Ilgaz Dağı Milli Parkı Doğa Müzesi',
          'bilgi':
              'Bu müze, Ilgaz Dağı Milli Parkı içerisinde yer alan doğal zenginlikleri tanıtan bir müzedir. Bölgenin flora ve faunası hakkında bilgi sunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kastamonu Kalesi',
          'bilgi':
              'Kastamonu Kalesi, şehri yüksekten görebileceğiniz tarihi bir yapıdır. Roma dönemine kadar uzanan geçmişiyle, birçok medeniyetin izlerini taşıyan kale, şehrin simgelerindendir.',
        },
        {
          'ad': 'İnceğiz Mağarası',
          'bilgi':
              'İnceğiz Mağarası, Kastamonu’nun doğal güzellikleri arasında yer alır. Mağara, ilginç sarkıtları ve dikitleri ile ziyaretçilere benzersiz bir deneyim sunar.',
        },
        {
          'ad': 'Pınarbaşı',
          'bilgi':
              'Pınarbaşı, Kastamonu il sınırlarında yer alan, doğa ile iç içe bir bölgedir. Doğal güzellikler ve yürüyüş parkurlarıyla ziyaretçilere harika bir atmosfer sunar.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Nasrullah Camii',
          'bilgi':
              'Nasrullah Camii, Kastamonu’nun en önemli Osmanlı dönemi yapılarından biridir. 16. yüzyılda inşa edilen bu cami, zarif mimarisi ve detaylı taş işçiliği ile dikkat çeker.',
        },
        {
          'ad': 'Liva Paşa Konağı',
          'bilgi':
              'Liva Paşa Konağı, Kastamonu’nun geleneksel Osmanlı ev mimarisini yansıtan önemli bir yapıdır. Bugün müze olarak kullanılan bu konak, Kastamonu’nun tarihi kültürünü sergiler.',
        },
        {
          'ad': 'Süleyman Paşa Camii',
          'bilgi':
              'Süleyman Paşa Camii, 14. yüzyılda inşa edilen tarihi bir camidir. Bu cami, Selçuklu ve Osmanlı izlerini taşıyan bir yapıdır ve şehrin önemli dini yapılarındandır.',
        },
      ],
    },

    'Kayseri': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kayseri Arkeoloji Müzesi',
          'bilgi':
              'Kayseri Arkeoloji Müzesi, bölgenin antik çağlardan Osmanlı dönemine kadar birçok önemli eserini sergileyen bir müzedir. Müzede, Hitit, Roma ve Bizans dönemlerine ait pek çok arkeolojik buluntu bulunmaktadır.',
        },
        {
          'ad': 'Erciyes Müzesi',
          'bilgi':
              'Erciyes Müzesi, Kayseri’nin Erciyes Dağı eteklerinde bulunan tarihî ve kültürel öğeleri sergileyen bir müzedir. Dağcılık ve dağ kültürüne dair birçok eseri içinde barındırır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kayseri Kalesi',
          'bilgi':
              'Kayseri Kalesi, şehir merkezinde yer alan ve Roma döneminden kalma bir yapıdır. Kaleye çıkarak şehri yüksekten görebilir ve tarihi atmosferin tadını çıkarabilirsiniz.',
        },
        {
          'ad': 'Erciyes Dağı',
          'bilgi':
              'Erciyes Dağı, Türkiye’nin beşinci en yüksek dağıdır ve kayak yapmak isteyenler için oldukça popüler bir destinasyondur. Kış aylarında kayak merkezine gelen ziyaretçiler, dağın zirvesinden muazzam bir manzara ile karşılaşır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Hunat Hatun Camii ve Külliyesi',
          'bilgi':
              'Hunat Hatun Camii ve Külliyesi, Selçuklu döneminin en önemli yapılarından biridir. 13. yüzyılda inşa edilmiştir ve dönemin mimari izlerini taşır.',
        },
        {
          'ad': 'Kayseri Ulu Camii',
          'bilgi':
              'Kayseri Ulu Camii, 12. yüzyılda inşa edilmiştir ve Selçuklu dönemine ait önemli bir dini yapıdır. İhtişamlı mimarisi ile dikkat çeker.',
        },
      ],
    },
    'Kırıkkale': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kırıkkale Müzesi',
          'bilgi':
              'Kırıkkale Müzesi, bölgenin tarihî geçmişini yansıtan önemli arkeolojik eserleri sergileyen bir müzedir. Roma ve Osmanlı dönemlerine ait pek çok eseri burada görebilirsiniz.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kırıkkale Kalesi',
          'bilgi':
              'Kırıkkale Kalesi, şehri yüksekten görebileceğiniz ve Roma döneminden kalma kalıntılara sahip bir yapıdır. Tarihi bir atmosferde gezinti yapmanızı sağlar.',
        },
        {
          'ad': 'Ahi Evran Camii',
          'bilgi':
              'Ahi Evran Camii, Kırıkkale’de önemli bir dini yapıdır. 13. yüzyılda inşa edilmiştir ve Selçuklu mimarisinin izlerini taşır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Delice Höyük',
          'bilgi':
              'Delice Höyük, Kırıkkale il sınırlarında yer alan bir höyüktür. Burada yapılan kazılarda çok sayıda tarihi kalıntı ve buluntuya rastlanmıştır. Neolitik döneme ait izler taşır.',
        },
        {
          'ad': 'Keskin Kalesi',
          'bilgi':
              'Keskin Kalesi, Kırıkkale’nin Keskin ilçesinde bulunan tarihi bir kaledir. Osmanlı ve Selçuklu dönemlerinden izler taşıyan kale, bölgenin tarihî zenginliklerini gösterir.',
        },
      ],
    },
    'Kırklareli': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kırklareli Müzesi',
          'bilgi':
              'Kırklareli Müzesi, bölgenin tarihî geçmişini yansıtan arkeolojik eserleri sergileyen bir müzedir. Yunan, Roma ve Bizans dönemlerine ait eserler burada sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Dupnisa Mağarası',
          'bilgi':
              'Dupnisa Mağarası, Kırklareli’nin Vize ilçesinde yer alan ve gezilebilen bir mağaradır. Büyüleyici iç yapısı ve doğal oluşumlarıyla doğa severler için harika bir keşif alanıdır.',
        },
        {
          'ad': 'Kıyıköy',
          'bilgi':
              'Kıyıköy, Kırklareli’nin Karadeniz kıyısında yer alan tarihi bir köydür. Karadeniz’in güzelliklerini keşfetmek isteyenler için ideal bir tatil yeridir. Aynı zamanda tarihi yapıları da barındırır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Kırklareli Kalesi',
          'bilgi':
              'Kırklareli Kalesi, şehir merkezine yakın bir konumda yer alır ve Osmanlı döneminden kalan önemli tarihi bir yapıdır. Kale, şehri savunma amaçlı yapılmış ve zamanla restore edilmiştir.',
        },
        {
          'ad': 'Ağlayan Kaya',
          'bilgi':
              'Ağlayan Kaya, Kırklareli il sınırlarında bulunan doğal bir oluşumdur. Adını, kayadan sızan suyun oluşturduğu bir görüntüden alır. Ziyaretçilerine benzersiz bir doğal manzara sunar.',
        },
      ],
    },
    'Kırşehir': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kırşehir Müzesi',
          'bilgi':
              'Kırşehir Müzesi, bölgedeki farklı medeniyetlere ait eserlerin sergilendiği bir müzedir. Frig, Roma ve Selçuklu dönemlerine ait eserler burada yer alır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Ahi Evran Camii ve Türbesi',
          'bilgi':
              'Ahi Evran Camii, Kırşehir’in en bilinen ve tarihi değeri büyük olan camilerinden biridir. Aynı zamanda Ahi Evran’ın türbesi de bu caminin içinde yer alır.',
        },
        {
          'ad': 'Cacabey Camii',
          'bilgi':
              'Cacabey Camii, Kırşehir’in en önemli tarihi yapılarından biridir ve Selçuklu mimarisinin harika örneklerinden biridir. Aynı zamanda eski bir medrese olarak kullanılmıştır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Kaman Kalehöyük',
          'bilgi':
              'Kaman Kalehöyük, Kırşehir il sınırlarında yer alan önemli bir höyüktür. Bu höyük, Neolitik ve Tunç çağlarına ait pek çok buluntuya sahiptir ve kazılar sonucu büyük öneme sahip eserler bulunmuştur.',
        },
        {
          'ad': 'Mucur Yeraltı Şehri',
          'bilgi':
              'Mucur Yeraltı Şehri, yerin altına inşa edilmiş bir yerleşim alanıdır. Eski zamanlarda savunma amaçlı kullanıldığı tahmin edilmektedir. Bu yeraltı şehirleri, bölgenin tarihî ve kültürel önemini gözler önüne serer.',
        },
      ],
    },
    'Kilis': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kilis Müzesi',
          'bilgi':
              'Kilis Müzesi, bölgede bulunan arkeolojik eserleri sergileyen önemli bir müzedir. Neolitik dönemden Roma İmparatorluğu’na kadar geniş bir yelpazede eserler barındırır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kilis Kalesi',
          'bilgi':
              'Kilis Kalesi, şehrin simgelerinden biridir. Tarihi Roma dönemine kadar dayanan kale, şehri savunma amaçlı inşa edilmiştir. Günümüzde hala sağlam bir şekilde ayakta durmaktadır.',
        },
        {
          'ad': 'Süleymanşah Camii',
          'bilgi':
              'Süleymanşah Camii, Kilis’in önemli tarihi camilerinden biridir. Selçuklu döneminden kalma olan bu cami, mimarisi ve iç dekorasyonuyla dikkat çekmektedir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Zeugma Antik Kenti',
          'bilgi':
              'Zeugma Antik Kenti, Gaziantep ve Kilis illerinin birleşim bölgesinde yer alır ve Roma dönemine ait önemli kalıntılarıyla ünlüdür. Mosaikleriyle meşhur olan bu kent, ziyaretçilerine tarihi bir yolculuk sunar.',
        },
        {
          'ad': 'Oylum Höyük',
          'bilgi':
              'Oylum Höyük, Kilis il sınırlarında yer alan önemli bir höyüktür. Neolitik döneme ait kalıntılar bu alanda yapılacak kazılarla gün yüzüne çıkarılmıştır.',
        },
      ],
    },
    'Kocaeli': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kocaeli Müzesi',
          'bilgi':
              'Kocaeli Müzesi, bölgede yapılan kazılar sonucunda ortaya çıkan arkeolojik eserleri sergileyen önemli bir kültürel mekandır. Roma, Bizans ve Osmanlı dönemlerine ait birçok eser burada bulunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Maşukiye',
          'bilgi':
              'Maşukiye, Kocaeli’nin doğal güzellikleriyle ünlü bir beldesidir. Yürüyüş parkurları, şelaleleri ve yemyeşil doğasıyla doğa severler için ideal bir yerdir.',
        },
        {
          'ad': 'Kartepe',
          'bilgi':
              'Kartepe, kış sporları ve kayak merkezleriyle ünlüdür. Ayrıca yaz aylarında da doğa yürüyüşleri ve piknik için mükemmel bir yerdir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'İzmit Saat Kulesi',
          'bilgi':
              'İzmit Saat Kulesi, Osmanlı döneminin sonlarına doğru inşa edilmiştir. Şehrin simgelerinden biri olan bu yapı, hem tarihi hem de estetik açıdan büyük öneme sahiptir.',
        },
        {
          'ad': 'Kocaeli Fuar Alanı',
          'bilgi':
              'Kocaeli Fuar Alanı, bölgenin kültürel etkinliklerinin düzenlendiği önemli bir yerdir. Fuarlar ve festivaller gibi etkinliklerle şehrin tarihine ve kültürüne katkıda bulunur.',
        },
      ],
    },
    'Konya': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Konya Arkeoloji Müzesi',
          'bilgi':
              'Konya Arkeoloji Müzesi, bölgedeki antik yerleşimlerden çıkarılan tarihi eserleri sergileyen önemli bir müzedir. Neolitik, Helenistik ve Roma dönemlerine ait birçok eseri burada görmek mümkündür.',
        },
        {
          'ad': 'Mevlana Müzesi',
          'bilgi':
              'Mevlana Müzesi, Sufizm’in büyük temsilcisi Mevlana Celaleddin Rumi’nin türbesini içinde barındıran ve aynı zamanda Konya’nın en önemli kültürel miraslarından biridir. Müze, Mevlana’nın hayatı ve öğretileri hakkında derinlemesine bilgi sunmaktadır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Mevlana Türbesi',
          'bilgi':
              'Mevlana Türbesi, Konya’nın en bilinen yapılarından biridir ve her yıl binlerce ziyaretçiyi ağırlamaktadır. Mevlana Celaleddin Rumi’nin türbesinin bulunduğu bu yer, aynı zamanda Sufizm ve Tasavvuf hakkında derin bilgiler edinilebilecek bir mekandır.',
        },
        {
          'ad': 'Karatay Medresesi',
          'bilgi':
              'Karatay Medresesi, Selçuklu dönemine ait bir medrese olup, Konya’nın önemli tarihi yapılarından biridir. Mozaik ve çini işçiliği ile ünlüdür. Günümüzde çini müzesi olarak kullanılmaktadır.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Alaeddin Tepesi',
          'bilgi':
              'Alaeddin Tepesi, Konya şehir merkezinin tam ortasında yer alır ve şehre hakim bir tepede bulunur. Bu tepede, Alaeddin Keykubad dönemine ait kalıntılar ve Alaeddin Camii bulunmaktadır.',
        },
        {
          'ad': 'Çatalhöyük',
          'bilgi':
              'Çatalhöyük, dünyadaki en eski ve en büyük yerleşim alanlarından biridir. Neolitik döneme ait kalıntılar burada keşfedilmiştir ve UNESCO Dünya Mirası Listesi’nde yer almaktadır.',
        },
      ],
    },
    'Kütahya': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Kütahya Arkeoloji Müzesi',
          'bilgi':
              'Kütahya Arkeoloji Müzesi, bölgedeki antik yerleşimlerden çıkarılan tarihi eserleri sergileyen önemli bir müzedir. Frigya, Roma ve Bizans dönemlerine ait eserlerin sergilendiği müze, ziyaretçilere Kütahya’nın tarihsel mirası hakkında bilgi verir.',
        },
        {
          'ad': 'Kütahya Çinili Camii ve Müzesi',
          'bilgi':
              'Kütahya’nın ünlü çini ve seramik işçiliğiyle tanınan bir başka önemli müzesidir. Çini sanatının en güzel örneklerinin sergilendiği bu müze, Türk-İslam sanatını keşfetmek isteyenler için idealdir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kütahya Kalesi',
          'bilgi':
              'Kütahya Kalesi, şehri yüksekten görebileceğiniz bir tepeye kurulmuştur. Roma ve Bizans dönemlerinden kalan kalıntılarıyla tarihi bir atmosfer sunar. Aynı zamanda çevresindeki park ve yeşil alanlar, ziyaretçilere hoş bir gezinti sunar.',
        },
        {
          'ad': 'Çinicilik Atölyeleri',
          'bilgi':
              'Kütahya, çinicilikteki uzun geçmişiyle ünlüdür. Şehirdeki çini atölyelerini ziyaret ederek, geleneksel Türk çini işçiliği hakkında bilgi alabilir ve el yapımı çiniler satın alabilirsiniz.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Osmanlı Evleri',
          'bilgi':
              'Kütahya’nın merkezinde yer alan Osmanlı dönemi evleri, geleneksel Türk ev mimarisinin güzel örneklerini sergiler. Bu evler, Osmanlı döneminin sosyal ve kültürel yapısını anlamak açısından oldukça önemli yerlerdir.',
        },
        {
          'ad': 'Dumlupınar Anıtı',
          'bilgi':
              'Dumlupınar, Kurtuluş Savaşı’nın son büyük zaferi olan Dumlupınar Meydan Muharebesi’nin yapıldığı yerdir. Burada bir anıt bulunur ve ziyaretçilere tarihi olaylar hakkında bilgi verir.',
        },
      ],
    },
    'Malatya': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Malatya Arkeoloji Müzesi',
          'bilgi':
              'Malatya Arkeoloji Müzesi, bölgedeki antik medeniyetlerden kalma eserleri sergileyen önemli bir müzedir. Hitit, Roma ve Osmanlı dönemine ait eserler burada sergilenmektedir. Ayrıca, Paleolitik ve Neolitik döneme ait taş yapılar ve figürler de bu müzede görülebilir.',
        },
        {
          'ad': 'Battalgazi Ulu Camii ve Müzesi',
          'bilgi':
              'Battalgazi ilçesinde yer alan bu müze, hem camii hem de müze olarak kullanılır. Bölgedeki tarihi eserler ve kültürel miraslar sergilenirken, camii kısmı da Osmanlı dönemine ait önemli bir yapıdır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Nemrut Dağı',
          'bilgi':
              'Nemrut Dağı, UNESCO Dünya Mirası Listesi’nde yer alır ve dünyanın en büyük açık hava heykel müzesidir. Kommagene Krallığı’nın kralı Antiochos’un anıt mezarının bulunduğu bu dağ, devasa heykelleriyle ünlüdür.',
        },
        {
          'ad': 'Malatya Kalesi',
          'bilgi':
              'Malatya Kalesi, şehrin merkezine hakim bir tepeye kuruludur. Tarihi Roma ve Selçuklu dönemlerinden kalma kalıntılar ve surlar, ziyaretçilere eski zamanlara dair bilgi verir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Battalgazi',
          'bilgi':
              'Battalgazi, Malatya’nın en eski yerleşim alanlarından biridir ve burada birçok tarihi yapının kalıntıları bulunmaktadır. Ayrıca, Battalgazi Ulu Camii de önemli bir Osmanlı yapısıdır.',
        },
        {
          'ad': 'Aslantepe Höyüğü',
          'bilgi':
              'Aslantepe Höyüğü, Malatya il sınırlarında bulunan tarihi bir höyüktür ve özellikle Erken Tunç Çağı’na ait önemli kalıntılar bulundurur. Bu höyük, ilk yerleşik hayata dair çok sayıda bulguya sahiptir.',
        },
      ],
    },
    'Manisa': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Manisa Arkeoloji Müzesi',
          'bilgi':
              'Manisa Arkeoloji Müzesi, bölgedeki farklı medeniyetlere ait eserleri sergileyen önemli bir müzedir. Eski Yunan, Roma ve Bizans dönemlerine ait eserlerin yanı sıra, Neolitik döneme ait taş yapılar da burada sergilenmektedir.',
        },
        {
          'ad': 'Akhisar Müzesi',
          'bilgi':
              'Akhisar Müzesi, özellikle Akhisar ve çevresinde bulunan arkeolojik eserleri barındıran bir müzedir. Bölgedeki antik yerleşimlere ait eserler burada görülebilir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Spil Dağı Milli Parkı',
          'bilgi':
              'Manisa’nın en yüksek dağı olan Spil Dağı, hem doğal güzellikleriyle hem de tarihi kalıntılarıyla dikkat çeker. Spil Dağı Milli Parkı, yürüyüş yolları ve kuş gözlemi için popüler bir yerdir.',
        },
        {
          'ad': 'Manisa Kalesi',
          'bilgi':
              'Manisa Kalesi, şehri yüksekten görebileceğiniz tarihi bir kaledir. Roma ve Bizans dönemlerinden kalan kalıntılar burada mevcuttur. Manisa Kalesi’nden şehri ve çevresini görmek mümkündür.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Sardes Antik Kenti',
          'bilgi':
              'Sardes Antik Kenti, Lidya Krallığı’na başkentlik yapmış önemli bir antik kenttir. Burada antik tapınaklar, kalıntılar ve Lidya dönemine ait altın işleme eserleri bulunmaktadır.',
        },
        {
          'ad': 'Akhisar Tarihi Evleri',
          'bilgi':
              'Akhisar ilçesinde yer alan bu tarihi evler, Osmanlı döneminin geleneksel mimarisini yansıtan örnekler sunar. Özellikle taş yapılar ve ahşap işçilikleriyle dikkat çeker.',
        },
      ],
    },
    'Mardin': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Mardin Müzesi',
          'bilgi':
              'Mardin Müzesi, bölgedeki farklı uygarlıklara ait eserleri sergileyen önemli bir müzedir. Burada Mezopotamya, Roma, Bizans ve Osmanlı dönemlerine ait çok sayıda eser yer almaktadır. Ayrıca, taş işçiliğiyle ünlü Mardin Evleri’ne ait kalıntılar da sergilenmektedir.',
        },
        {
          'ad': 'Zinciriye Medresesi ve Müzesi',
          'bilgi':
              'Mardin’in tarihi medreselerinden biri olan Zinciriye Medresesi, aynı zamanda bir müze olarak da hizmet vermektedir. Selçuklu dönemine ait taş işçiliklerini gözler önüne seren bu yapıda, çeşitli tarihi eserler sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Mardin Kalesi',
          'bilgi':
              'Mardin Kalesi, şehri yüksekten görebileceğiniz bir noktada yer alır. Kale, Roma, Bizans, Artuklu ve Osmanlı dönemlerinden izler taşır. Buradan, Mardin’in tarihi taş yapıları ve Mezopotamya Ovası’nın muazzam manzarası izlenebilir.',
        },
        {
          'ad': 'Deyrulzafaran Manastırı',
          'bilgi':
              'Deyrulzafaran Manastırı, Mardin’in Süryani Ortodoks kilisesinin önemli bir merkezidir. Bu manastır, tarihi ve dini önemi nedeniyle bölgenin en çok ziyaret edilen yerlerinden biridir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Mor Gabriel Manastırı',
          'bilgi':
              'Mor Gabriel Manastırı, Mardin’in Midyat ilçesinde yer alır ve dünyanın en eski Süryani Ortodoks manastırlarından biridir. 397 yılında inşa edilmiştir ve bölgenin tarihi mirası açısından son derece önemlidir.',
        },
        {
          'ad': 'Mardin Evleri',
          'bilgi':
              'Mardin Evleri, şehir merkezinde sıklıkla karşılaşılan ve taş işçiliğiyle ünlü geleneksel evlerdir. Bu evler, Mardin’in tarihi dokusunu ve mimarisini yansıtan en önemli unsurlardan biridir.',
        },
      ],
    },
    'Mersin': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Mersin Arkeoloji Müzesi',
          'bilgi':
              'Mersin Arkeoloji Müzesi, bölgedeki farklı medeniyetlere ait önemli eserleri sergileyen bir müzedir. Roma, Bizans ve Neolitik döneme ait eserlerin yanı sıra, Mersin’in antik şehirlerinden çıkarılan kalıntılar da burada sergilenmektedir.',
        },
        {
          'ad': 'Soloi Pompeiopolis Antik Kenti Müzesi',
          'bilgi':
              'Soloi Pompeiopolis, Mersin il sınırlarında yer alan antik bir kenttir. Bu müze, kentte yapılan kazılarda ortaya çıkan arkeolojik eserleri ve tarihi kalıntıları sergileyen önemli bir kültürel mekandır.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kızkalesi',
          'bilgi':
              'Kızkalesi, Mersin’in Erdemli ilçesinde yer alan ve denizle iç içe geçmiş tarihi bir kaledir. Efsaneye göre, bir prensesin kızının kaldığı kalenin çevresindeki manzara oldukça etkileyicidir. Kaleye, denizden tekne ile ulaşmak mümkündür.',
        },
        {
          'ad': 'Cennet-Cehennem Oyuğu',
          'bilgi':
              'Cennet-Cehennem Oyuğu, Mersin’in Silifke ilçesinde yer alan büyük bir mağara ve doğal oluşumdur. Burada, yer altı göletleri ve tarihi kalıntılarla birlikte etkileyici bir doğal güzellik bulunur.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Tarsus Antik Kenti',
          'bilgi':
              'Tarsus, Roma ve Bizans dönemlerinden kalma kalıntılarıyla ünlü bir antik kenttir. Şehirdeki en dikkat çekici yerler arasında St. Paul’ün doğduğuna inanılan ev ve antik Roma köprüsü yer almaktadır.',
        },
        {
          'ad': 'Mamure Kalesi',
          'bilgi':
              'Mamure Kalesi, Mersin’in Anamur ilçesinde yer alan tarihi bir kaledir. Roma ve Bizans dönemlerinden izler taşıyan bu kalede, surlar, kuleler ve savunma yapıları günümüze kadar iyi korunmuştur.',
        },
      ],
    },
    'Muğla': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Muğla Müzesi',
          'bilgi':
              'Muğla Müzesi, Ege bölgesinin antik medeniyetlerine ait eserleri barındıran bir müzedir. Müzede, Helenistik, Roma ve Bizans dönemlerine ait birçok eser bulunmaktadır.',
        },
        {
          'ad': 'Knidos Antik Kenti Müzesi',
          'bilgi':
              'Knidos Antik Kenti, Muğla’nın Datça ilçesinde bulunan önemli bir antik kenttir. Burada çıkarılan eserler, Muğla Müzesi’nde sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Ölüdeniz',
          'bilgi':
              'Muğla’nın Fethiye ilçesinde bulunan Ölüdeniz, dünyaca ünlü plajları ve sakin suları ile ünlüdür. Ayrıca yamaç paraşütü yapma imkânı da sunan bu bölge, eşsiz manzaraları ile dikkat çeker.',
        },
        {
          'ad': 'Bodrum Kalesi',
          'bilgi':
              'Bodrum’un simgelerinden biri olan Bodrum Kalesi, Orta Çağ’dan kalma bir yapıdır. Kale, Bodrum’un tarihi ve kültürel mirasıyla birleşir. Ziyaretçilere tarihi bir yolculuk yapma fırsatı sunar.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Marmaris Kalesi',
          'bilgi':
              'Marmaris Kalesi, Osmanlı döneminden kalan tarihi bir kaleydi. Günümüzde, kale, Marmaris’i yüksekten görebileceğiniz ve tarihi surlarını keşfedebileceğiniz bir noktadır.',
        },
        {
          'ad': 'Letoon Antik Kenti',
          'bilgi':
              'Letoon, Muğla’nın Fethiye ilçesinde yer alan antik bir Yunan kentidir. Burada bulunan tapınaklar ve kalıntılar, antik dönemde Letoon’un dini önemini ortaya koymaktadır.',
        },
      ],
    },
    'Muş': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Muş Müzesi',
          'bilgi':
              'Muş Müzesi, Muş il sınırlarında bulunan tarihî eserleri ve arkeolojik buluntuları sergileyen bir müzedir. Bölgenin eski yerleşimlerine ait taş eserler ve halk kültürüne dair örnekler burada sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Muş Kalesi',
          'bilgi':
              'Muş Kalesi, şehir merkezine yakın bir konumda yer alır. Kale, Bizans ve Selçuklu dönemlerinden kalma surlar ve kalıntılarla dikkat çeker. Buradan, şehri yüksekten görmek mümkündür.',
        },
        {
          'ad': 'Bulanık Gölü',
          'bilgi':
              'Bulanık ilçesinde yer alan Bu doğal göl, doğa severler için ideal bir gezi noktasıdır. Göl çevresindeki yürüyüş parkurları ve manzaralar oldukça etkilidir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Malazgirt Meydanı',
          'bilgi':
              'Malazgirt Meydanı, 1071 Malazgirt Meydan Muharebesi’nin yapıldığı yerdir. Türklerin Anadolu’ya girişinin simgesi olan bu meydan, Türk tarihinde önemli bir yere sahiptir.',
        },
        {
          'ad': 'Hasköy Taş Köprü',
          'bilgi':
              'Hasköy Taş Köprü, Selçuklu döneminden kalan tarihi bir köprüdür. Bu köprü, tarihî ve mimari yapısıyla bölgedeki en dikkat çekici yapılardan biridir.',
        },
      ],
    },
    'Nevşehir': {
      'Arkeolojik Müzeler': [
        {
          'ad': 'Nevşehir Müzesi',
          'bilgi':
              'Nevşehir Müzesi, bölgedeki tarihî eserleri ve arkeolojik buluntuları sergileyen önemli bir müzedir. Hititler, Frigler ve Roma dönemlerine ait eserler burada sergilenmektedir.',
        },
      ],
      'Gezilecek Yerler': [
        {
          'ad': 'Kapadokya',
          'bilgi':
              'Kapadokya, peri bacalarıyla ünlü, benzersiz kaya oluşumlarına sahip bir bölgedir. Yerin altına yapılmış yerleşim yerleri ve mağara evler, bu bölgenin tarihi ve kültürel mirasını yansıtır.',
        },
        {
          'ad': 'Uçhisar Kalesi',
          'bilgi':
              'Uçhisar Kalesi, Kapadokya bölgesinin en yüksek noktasında yer alır ve bölgeyi yüksekten izleme imkanı sunar. Ayrıca, bölgedeki kaya evlerini görebileceğiniz güzel bir manzaraya sahiptir.',
        },
      ],
      'Tarihi Yerler': [
        {
          'ad': 'Derinkuyu Yeraltı Şehri',
          'bilgi':
              'Derinkuyu, yerin altına inşa edilmiş devasa bir yeraltı şehri olup, antik zamanlarda bölge halkı tarafından savunma amacıyla kullanılmıştır. Şehir, çok katlı yapıları ve gizli geçitleriyle oldukça etkileyicidir.',
        },
        {
          'ad': 'Zelve Vadisi',
          'bilgi':
              'Zelve Vadisi, bölgenin tarihi kaya yerleşimlerinin bulunduğu bir alandır. Kaya kiliseleri, şapeller ve yerleşim yerleri, erken Hristiyanlık dönemine ait izler taşır.',
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
