import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    MaterialApp(
      home: IlDetaySayfasi(il: 'Iğdır'), // Varsayılan olarak Iğdır'ı göster
      debugShowCheckedModeBanner: false, // Debug bandını kaldırır
    ),
  );
}

class IlDetaySayfasi extends StatefulWidget {
  final String il;
  const IlDetaySayfasi({Key? key, required this.il}) : super(key: key);

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
      {
        'ad': 'Konum',
        'detay':
            'Akdeniz Bölgesi’nde yer alır. Verimli Çukurova Ovası üzerinde konumlanmıştır.',
      },
      {
        'ad': 'Nüfus',
        'detay':
            '2023 TÜİK verilerine göre yaklaşık 2.270.000 nüfusu ile Türkiye\'nin en kalabalık altıncı şehridir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Tipik Akdeniz iklimi hakimdir; yazları sıcak ve kurak, kışları ılık ve yağışlı geçer. Özellikle yaz aylarında sıcaklıklar oldukça yüksek seyreder.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Ekonomisi tarım, sanayi ve ticarete dayanır. Çukurova\'nın verimli toprakları sayesinde pamuk, buğday, mısır gibi ürünlerin üretiminde önemli bir merkezdir. Tekstil, gıda ve kimya sanayii de gelişmiştir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Köklü bir tarihe sahip olan Adana, Hititler, Asurlular, Romalılar, Bizanslılar, Selçuklular ve Osmanlılar gibi birçok medeniyete ev sahipliği yapmıştır. Taşköprü, Adana Ulu Camii, Sabancı Merkez Camii gibi tarihi yapıları ve zengin mutfak kültürüyle (Adana Kebap) öne çıkar.',
      },
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
      {
        'ad': 'Konum',
        'detay':
            'Güneydoğu Anadolu Bölgesi\'nde yer alır ve Fırat Nehri\'nin batı kıyısında konumlanmıştır. Tarihi İpek Yolu üzerinde önemli bir geçiş noktasıdır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 635.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim etkisindedir; yazları çok sıcak ve kurak, kışları soğuk ve yağışlı geçer. Özellikle yaz aylarında Güneydoğu Anadolu\'nun tipik yüksek sıcaklıkları görülür.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Ekonomisi ağırlıklı olarak tarım ve hayvancılığa dayanır. Başlıca ürünler buğday, arpa, pamuk, tütün ve mercimektir. Nemrut Dağı gibi turistik yerler sayesinde turizm de ekonomide pay sahibidir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Adıyaman, köklü tarihiyle birçok medeniyete ev sahipliği yapmıştır. Kommagene Krallığı\'nın başkenti olan Arsameia Antik Kenti ve dünyaca ünlü Nemrut Dağı Milli Parkı, bölgenin en önemli tarihi ve kültürel miraslarıdır. Ayrıca Cendere Köprüsü ve Karakuş Tümülüsü de dikkat çeken diğer tarihi yapılardır.',
      },
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
        'detay':
            'Ege Bölgesi’nin İç Batı Anadolu bölümünde yer alır. Önemli karayolları üzerinde bir kavşak noktasında bulunur.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 750.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim hakimdir; kışlar soğuk ve kar yağışlı, yazlar ise sıcak ve kurak geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Mermercilik, gıda sanayii (özellikle sucuk ve lokum üretimi) ve termal turizm ekonominin ana direkleridir. Afyon Kaymağı ve Afyon Sucuğu coğrafi işaretli ürünlerdir. Tarım ve hayvancılık da önemli yer tutar.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Tarih boyunca Hititler, Frigler, Lidyalılar, Romalılar, Bizanslılar, Selçuklular ve Osmanlılar gibi birçok medeniyete ev sahipliği yapmıştır. Afyonkarahisar Kalesi, Frig Vadisi, Ulu Cami gibi tarihi yapıları ve termal sularıyla ünlüdür. Kurtuluş Savaşı\'nda önemli bir yere sahiptir.',
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
        'konum': 'Iğdır ve Ağrı sınırı',
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
      {
        'ad': 'Konum',
        'detay':
            'Doğu Anadolu Bölgesi\'nin en doğusunda yer alır. İran ile sınır komşusudur. Ağrı Dağı\'nın eteklerinde geniş ovalar ve yüksek dağlık alanlar bulunur.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 540.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Şiddetli karasal iklim hüküm sürer; kışlar uzun, çok soğuk ve kar yağışlı, yazlar ise kısa ve serin geçer. Türkiye\'nin en soğuk illerinden biridir.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Ekonomisi büyük ölçüde hayvancılık (özellikle büyükbaş hayvancılık) ve kısmen tarıma dayanır. Yöresel ürünler ve sınır ticareti de ekonomide rol oynar. İshak Paşa Sarayı gibi tarihi ve doğal güzellikler turizm potansiyeli taşır.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Tarih boyunca çeşitli medeniyetlere ev sahipliği yapmış olan Ağrı, özellikle Osmanlı döneminden kalma İshak Paşa Sarayı ile bilinir. Aynı zamanda Nuh\'un Gemisi efsanesine ev sahipliği yaptığı düşünülen Ağrı Dağı ile de önemli bir yere sahiptir. Bölge, kendine özgü folklorik yapısı ve geleneksel yaşam tarzıyla dikkat çeker.',
      },
    ],
  },
  'Iğdır': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Iğdır Müzesi',
        'bilgi':
            'İl merkezinde yer alan müze, bölgenin arkeolojik ve etnografik eserlerini sergiler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Tuzluca Tuz Mağaraları',
        'bilgi':
            'Tuzluca ilçesinde yer alan doğal mağaralar, ziyaretçilere farklı bir deneyim sunar.',
      },
      {
        'ad': 'Ağrı Dağı (Doğu Etekleri)',
        'bilgi':
            'Türkiye\'nin en yüksek dağı olan Ağrı Dağı\'nın Iğdır sınırları içindeki etekleri, doğa ve fotoğraf tutkunları için cazip bir noktadır.',
      },
      {
        'ad': 'Meteor Çukuru',
        'bilgi':
            'Karakoyunlu ilçesi yakınlarında bulunan, meteor çarpması sonucu oluştuğu düşünülen büyük bir çukur.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Yöresel Lezzetler Restoranı',
        'bilgi':
            'Iğdır tava, bozbaş gibi yöresel yemekleri tadabileceğiniz bir mekan.',
      },
      {
        'ad': 'Iğdır Sofrası',
        'bilgi': 'Geleneksel Iğdır mutfağının örneklerini sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Aras Nehri Kıyısı',
        'bilgi': 'Aras Nehri boyunca uzanan yeşil alanlar ve mesire yerleri.',
      },
      {
        'ad': 'Melekli Parkı',
        'bilgi': 'İl merkezindeki dinlenme alanlarından biri.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Iğdır, Türkiye\'nin Doğu Anadolu Bölgesi\'nin en doğusunda, stratejik bir konumda yer alan bir ildir. Ermenistan, Azerbaycan\'a (Nahçıvan Özerk Cumhuriyeti) ve İran ile kara sınırı bulunmaktadır. Ağrı Dağı\'nın kuzeybatı eteklerinde, Aras Nehri\'nin suladığı verimli Iğdır Ovası üzerinde kurulmuştur. Rakımı nispeten düşüktür (ortalama 850 metre), bu da çevresindeki yüksek dağlarla tezat oluşturarak kendine özgü bir mikroklima yaratır.',
      },
      {
        'ad': 'Nüfus',
        'detay':
            '2023 TÜİK verilerine göre yaklaşık 209.792 nüfusa sahiptir. Nüfusun önemli bir kısmı il merkezinde ve ovadaki yerleşim yerlerinde yoğunlaşmıştır.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Çevresindeki yüksek dağların yarattığı "çukur alan" etkisiyle, Doğu Anadolu Bölgesi\'nin genelinden farklı olarak karasal iklime göre daha ılıman bir mikroklima görülür. Yazları oldukça sıcak ve kurak, kışları ise bölge geneline göre daha az şiddetli ve kar yağışlıdır. Bu özelliği nedeniyle "Doğu\'nun Çukurovası" olarak anılır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Ekonomisi büyük ölçüde tarım ve hayvancılığa dayanır. Verimli Iğdır Ovası\'nda pamuk, kayısı, buğday, arpa, mısır ve çeşitli sebze-meyveler bolca yetiştirilir. Özellikle "Iğdır Kayısısı" coğrafi işaretli ve meşhurdur. Hayvancılık da önemli bir gelir kaynağıdır. Sınır komşusu olması nedeniyle sınır ticareti de il ekonomisinde yer tutar.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Tarih boyunca İpek Yolu üzerinde önemli bir geçiş noktası olan Iğdır, Urartular, Persler, Romalılar, Selçuklular ve Osmanlılar gibi birçok medeniyete ev sahipliği yapmıştır. İl, zengin kültürel çeşitliliğe sahiptir. Tarihi Tuz Mağaraları, Kültepe (Karakale) ve çeşitli anıtlar kültürel mirasın parçalarıdır.',
      },
    ],
  },
  'Amasya': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Amasya Müzesi',
        'kuruluşYılı': '1925',
        'önem': 'Hitit, Frig, Roma, Bizans, Selçuklu ve Osmanlı eserleri.',
        'koleksiyon': 'Mumyalar, heykeller, sikkeler, yazıtlar.',
        'adres': 'Hazeranlar Sok. Merkez/Amasya',
        'telefon': '+90 358 218 24 15',
        'web': 'http://amasyamuzesi.gov.tr',
        'bilgi': 'Ünlü Amasya mumyaları bu müzede sergilenir.',
        'ziyaretSaatleri': '08:30 - 17:30',
        'girişÜcreti': '30 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Amasya Kalesi',
        'tip': 'Tarihi Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Harşena Dağı',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi': 'Pontus Krallığı dönemine ait tarihi kale.',
      },
      {
        'ad': 'Kral Kaya Mezarları',
        'tip': 'Antik Kaya Mezarları',
        'girişÜcreti': '10 TL',
        'konum': 'Yeşilırmak Vadisi',
        'bilgi': 'Pontus krallarına ait mezar yapıları.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Amasya Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Keşkek, toyga çorbası, bakla dolması',
        'fiyat': 'Orta',
        'bilgi': 'Yöresel lezzetleriyle bilinir.',
        'adres': 'Merkez/Amasya',
        'telefon': '+90 358 213 45 67',
      },
      {
        'ad': 'Yeşilırmak Kenarı Kafeleri',
        'tip': 'Kafe',
        'yemekler': 'Tatlılar, çay, gözleme',
        'fiyat': 'Uygun',
        'bilgi': 'Nehir manzaralı keyifli mekanlar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Yavuz Selim Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Yürüyüş yolları, oturma alanları, çocuk parkı.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Karadeniz Bölgesi’nde yer alır. Dağlık ve engebeli yapıya sahip olup Yeşilırmak vadisinde kuruludur.',
      },
      {
        'ad': 'Nüfus',
        'detay':
            '2023 TÜİK verilerine göre yaklaşık 330.000 civarında nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim ile Karadeniz iklimi arasında geçiş özelliği taşır. Yazlar sıcak ve kurak, kışlar soğuk ve yağışlıdır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım ve hayvancılığa dayalıdır. Elma üretimiyle ünlüdür. Ayrıca turizm de önemli yer tutar.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Antik çağlardan itibaren önemli bir yerleşim yeridir. Osmanlı döneminde şehzadeler şehri olarak bilinir. Mumyalar, kaleler ve kaya mezarları ile tarihi zengindir.',
      },
    ],
  },
  'Artvin': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Artvin Müzesi',
        'kuruluşYılı': '2017',
        'önem': 'Yöresel etnografik ve arkeolojik eserlerin sergilendiği müze.',
        'koleksiyon':
            'Antik dönem objeleri, yöresel giysiler, el işçiliği ürünler.',
        'adres': 'Çarşı Mahallesi, Merkez',
        'telefon': '+90 466 212 3456',
        'web': 'http://artvinmuzesi.gov.tr',
        'bilgi': 'Yeni kurulan, modern bir müze binasında hizmet vermektedir.',
        'ziyaretSaatleri': '08:30 - 17:30',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Karagöl Sahara Milli Parkı',
        'tip': 'Milli Park',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Şavşat',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Doğal göller, ormanlar ve yaylalarla çevrili, kamp ve doğa yürüyüşü için ideal bir alan.',
      },
      {
        'ad': 'Mençuna Şelalesi',
        'tip': 'Şelale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Arhavi',
        'bilgi':
            'Doğal güzelliğiyle ünlü, yeşilliklerin içinde yüksekten akan şelale.',
      },
      {
        'ad': 'Artvin Kalesi',
        'tip': 'Tarihi Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Orta Çağ’dan kalma savunma amaçlı inşa edilmiş tarihi kale kalıntısı.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Yörem Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Kuymak, mısır ekmeği, karalahana sarması',
        'fiyat': 'Orta',
        'bilgi': 'Yöresel Karadeniz yemekleri sunar.',
        'adres': 'Merkez Mahallesi, Artvin',
        'telefon': '+90 466 222 3344',
      },
      {
        'ad': 'Kafkasör Yayla Evi',
        'tip': 'Yayla Lokantası',
        'yemekler': 'Tereyağlı alabalık, yayla çorbası',
        'fiyat': 'Uygun',
        'bilgi': 'Kafkasör yaylasında doğa ile iç içe bir mekan.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kafkasör Yaylası',
        'tip': 'Yayla',
        'konum': 'Artvin Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Yayla şenlikleriyle ünlü, doğa yürüyüşü ve kampçılık için elverişli alan.',
      },
      {
        'ad': 'Borçka Karagöl',
        'tip': 'Gölet / Tabiat Parkı',
        'konum': 'Borçka',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Doğal göl, sık ormanlarla çevrili manzara cenneti.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Karadeniz Bölgesi’nin Doğu Karadeniz kısmında, Gürcistan sınırında yer alır. Dağlık ve ormanlık alanlara sahiptir.',
      },
      {
        'ad': 'Nüfus',
        'detay':
            '2023 TÜİK verilerine göre yaklaşık 170.000 nüfusa sahiptir. Türkiye’nin en az nüfuslu illerinden biridir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Doğu Karadeniz iklimi hakimdir. Her mevsim yağış alır. Yazları serin, kışları ılımandır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Hayvancılık, ormancılık ve küçük çaplı tarım ekonomiye yön verir. Arıcılık da yaygındır.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Artvin, tarih boyunca Laz, Gürcü, Bizans, Osmanlı gibi birçok medeniyete ev sahipliği yapmıştır. Geleneksel el sanatları ve halk oyunlarıyla tanınır.',
      },
    ],
  },
  'Antalya': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Antalya Müzesi',
        'kuruluşYılı': '1922',
        'önem': 'Likya, Pamfilya ve Roma dönemine ait geniş koleksiyon.',
        'koleksiyon': 'Heykeller, mozaikler, lahitler, sikkeler.',
        'adres': 'Konyaaltı Cad. No:88, Muratpaşa',
        'telefon': '+90 242 238 5688',
        'web': 'http://antalyamuzesi.gov.tr',
        'bilgi': 'Türkiye’nin en büyük arkeoloji müzelerinden biri.',
        'ziyaretSaatleri': '08:30 - 17:30',
        'girişÜcreti': '50 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Kaleiçi',
        'tip': 'Tarihi Mahalle',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Muratpaşa',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Osmanlı evleri, dar sokaklar, butik oteller ve restoranlarla dolu tarihi bölge.',
      },
      {
        'ad': 'Aspendos Antik Tiyatrosu',
        'tip': 'Antik Tiyatro',
        'girişÜcreti': '100 TL',
        'konum': 'Serik',
        'bilgi': 'Roma döneminden kalma en iyi korunmuş tiyatrolardan biridir.',
      },
      {
        'ad': 'Düden Şelalesi',
        'tip': 'Doğal Güzellik',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Kepez',
        'bilgi': 'Şehir merkezine yakın doğal bir şelale.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': '7 Mehmet',
        'tip': 'Restoran',
        'yemekler': 'Deniz ürünleri, et yemekleri, Akdeniz mutfağı',
        'fiyat': 'Yüksek',
        'bilgi': 'Şehirdeki en ünlü fine dining restoranlardan biri.',
        'adres': 'Atatürk Kültür Parkı, Muratpaşa',
        'telefon': '+90 242 238 5200',
      },
      {
        'ad': 'Piyazcı Sami',
        'tip': 'Lokanta',
        'yemekler': 'Antalya usulü piyaz, köfte',
        'fiyat': 'Uygun',
        'bilgi': 'Tahilli piyazıyla meşhur geleneksel mekan.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Karaalioğlu Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Muratpaşa',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Deniz manzaralı büyük şehir parkı.',
      },
      {
        'ad': 'Konyaaltı Plajı',
        'tip': 'Halk Plajı',
        'konum': 'Konyaaltı',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Mavi bayraklı, şehrin en popüler plajlarından biri.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Akdeniz Bölgesi’nde yer alır. Toros Dağları ve Akdeniz arasında uzanır.',
      },
      {
        'ad': 'Nüfus',
        'detay':
            '2023 TÜİK verilerine göre yaklaşık 2.688.000 nüfusa sahiptir. Türkiye’nin beşinci büyük ilidir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Akdeniz iklimi hâkimdir. Yazlar sıcak ve kurak, kışlar ılık ve yağışlı geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Turizm, tarım ve hizmet sektörü ekonominin temelini oluşturur. Türkiye’nin en önemli turizm merkezidir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Antik çağlardan bu yana önemli bir yerleşim merkezidir. Likya, Pamfilya, Roma ve Bizans dönemlerinden kalma birçok tarihi yapıya sahiptir.',
      },
    ],
  },
  'Aydın': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Aydın Arkeoloji Müzesi',
        'kuruluşYılı': '1959',
        'önem': 'Tralleis, Nysa, Alinda gibi antik kentlerden eserler içerir.',
        'koleksiyon': 'Heykeller, lahitler, seramikler, cam eserler, sikkeler.',
        'adres': 'Cuma Mahallesi, Müze Cd. No:4, Efeler/Aydın',
        'telefon': '+90 256 212 3883',
        'web': 'http://aydinmuzesi.gov.tr',
        'bilgi': 'Modern sergi salonlarıyla zengin bir koleksiyona sahiptir.',
        'ziyaretSaatleri': '08:30 - 17:30',
        'girişÜcreti': '50 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Tralleis Antik Kenti',
        'tip': 'Antik Kent',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Efeler',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Helenistik döneme ait tiyatro, hamam ve gymnasium kalıntıları bulunur.',
      },
      {
        'ad': 'Afrodisyas Antik Kenti',
        'tip': 'Antik Kent',
        'girişÜcreti': '100 TL',
        'konum': 'Karacasu',
        'bilgi':
            'UNESCO Dünya Mirası Listesi’nde yer alır, antik dönemin önemli sanat merkezlerindendir.',
      },
      {
        'ad': 'Aydın Kent Ormanı',
        'tip': 'Doğal Alan',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Efeler',
        'bilgi':
            'Şehir manzaralı yürüyüş parkurları ve piknik alanlarıyla tercih edilir.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Ciğerci Ahmet',
        'tip': 'Restoran',
        'yemekler': 'Ciğer, kebap çeşitleri',
        'fiyat': 'Orta',
        'bilgi': 'Aydın’ın meşhur ciğercilerindendir.',
        'adres': 'Efeler, Aydın',
        'telefon': '+90 256 212 1122',
      },
      {
        'ad': 'Menderes Lokantası',
        'tip': 'Lokanta',
        'yemekler': 'Zeytinyağlılar, keşkek, kuru börülce',
        'fiyat': 'Uygun',
        'bilgi': 'Ev yemekleriyle tanınır, yerli halkın uğrak yeridir.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Dilek Yarımadası – Büyük Menderes Deltası Milli Parkı',
        'tip': 'Milli Park',
        'konum': 'Kuşadası',
        'girişÜcreti': '20 TL',
        'bilgi':
            'Plajları, trekking rotaları ve doğal hayatıyla zengin bir ekosisteme sahiptir.',
      },
      {
        'ad': 'Kuşadası Kadınlar Plajı',
        'tip': 'Plaj',
        'konum': 'Kuşadası',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Aydın’ın en popüler plajlarından biri olup geniş sahili ile bilinir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Ege Bölgesi’nde yer alır; batıda Kuşadası ile Ege Denizi’ne kıyısı vardır.',
      },
      {
        'ad': 'Nüfus',
        'detay':
            '2023 TÜİK verilerine göre yaklaşık 1.148.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Tipik Akdeniz iklimi görülür; yazlar sıcak ve kurak, kışlar ılık ve yağışlıdır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, turizm ve hayvancılık önde gelir. Zeytin, incir ve pamuk üretimi yaygındır.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Tralleis, Afrodisyas gibi önemli antik kentlere ev sahipliği yapar. Zeybek kültürü ve Ege oyunları önemli halk kültürüdür.',
      },
    ],
  },
  'Balıkesir': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Balıkesir Kuvayi Milliye Müzesi',
        'kuruluşYılı': '1996',
        'önem':
            'Kurtuluş Savaşı ve Balıkesir’in yerel tarihi hakkında bilgiler içerir.',
        'koleksiyon':
            'Arkeolojik eserler, etnografik objeler, tarihi belgeler.',
        'adres': 'Paşa Mah. Milli Kuvvetler Cad. No:45, Balıkesir Merkez',
        'telefon': '+90 266 239 4801',
        'web': 'http://balikesirmuzesi.gov.tr',
        'bilgi': 'Milli Mücadele dönemine dair önemli koleksiyonları içerir.',
        'ziyaretSaatleri': '08:30 - 17:30',
        'girişÜcreti': 'Ücretsiz',
      },
      {
        'ad': 'Bandırma Arkeoloji Müzesi',
        'kuruluşYılı': '2003',
        'önem': 'Erdek ve çevresinden çıkarılan antik eserleri barındırır.',
        'koleksiyon': 'Mermer heykeller, mezar stelleri, sikkeler.',
        'adres': 'Bandırma, Balıkesir',
        'telefon': '+90 266 721 3123',
        'bilgi': 'Antik çağlara ait zengin koleksiyon.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': '20 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Cunda Adası (Alibey Adası)',
        'tip': 'Tarihi Ada',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Ayvalık',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Tarihi Rum evleri, taş sokakları ve deniz manzarasıyla ünlü tatil adası.',
      },
      {
        'ad': 'Kaz Dağları Milli Parkı',
        'tip': 'Milli Park',
        'girişÜcreti': '30 TL',
        'konum': 'Edremit',
        'ziyaretSaatleri': '08:00 - 20:00',
        'bilgi':
            'Doğa yürüyüşleri ve kamp alanları ile bilinen oksijen zengini bölge.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Meşhur Ayvalık Tostçusu',
        'tip': 'Fast Food',
        'yemekler': 'Ayvalık tostu, limonata',
        'fiyat': 'Uygun',
        'bilgi': 'Ayvalık’ın sembolü haline gelmiş tostlar sunar.',
        'adres': 'Ayvalık Çarşısı, Balıkesir',
        'telefon': '+90 266 312 0001',
      },
      {
        'ad': 'Sultan Sofrası',
        'tip': 'Lokanta',
        'yemekler': 'Balıkesir kaymaklısı, et yemekleri',
        'fiyat': 'Orta',
        'bilgi': 'Yöresel tatlar sunan aile lokantası.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Manyas Kuş Cenneti Milli Parkı',
        'tip': 'Milli Park / Doğa Koruma Alanı',
        'konum': 'Manyas',
        'girişÜcreti': '20 TL',
        'bilgi':
            'Göçmen kuşların uğrak yeri olan göl ve çevresi, gözlem kuleleriyle ünlüdür.',
      },
      {
        'ad': 'Şeytan Sofrası',
        'tip': 'Doğa Manzara Noktası',
        'konum': 'Ayvalık',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Gün batımı ve panoramik Ege manzarasıyla tanınır.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Marmara ve Ege bölgeleri arasında yer alır, iki denize kıyısı olan nadir illerdendir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 1.260.000 nüfusu vardır.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Kıyılarda Akdeniz, iç kesimlerde karasal iklim görülür. Yazlar sıcak, kışlar serin geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım (zeytin, buğday), hayvancılık, sanayi ve turizm ön plandadır.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Antik dönemlerden kalma yerleşimlerin yanı sıra zengin folklorik kültüre sahiptir. Ayvalık, Edremit, Bandırma gibi önemli ilçeleri barındırır.',
      },
    ],
  },
  'Bilecik': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Bilecik Müzesi',
        'kuruluşYılı': '2006',
        'önem':
            'Osmanlı Devleti’nin kurulduğu topraklarda yer alan müze, bölgenin tarihi ve kültürel mirasını yansıtır.',
        'koleksiyon':
            'Arkeolojik eserler, etnografik eşyalar, Osmanlı dönemi kalıntıları.',
        'adres': 'Cumhuriyet Mahallesi, Müze Sokak No:4, Merkez/Bilecik',
        'telefon': '+90 228 212 1556',
        'web': 'http://bilecikmuzesi.gov.tr',
        'bilgi':
            'Şehrin tarihine ışık tutan zengin koleksiyonlarıyla önemli bir kültür merkezidir.',
        'ziyaretSaatleri': '08:30 - 17:30',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Şeyh Edebali Türbesi',
        'tip': 'Türbe',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Osmanlı’nın manevi kurucularından Şeyh Edebali’nin türbesi, tarih ve kültür meraklıları için önemli bir ziyaret noktasıdır.',
      },
      {
        'ad': 'Osman Gazi Türbesi',
        'tip': 'Türbe',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Söğüt',
        'bilgi':
            'Osmanlı Devleti’nin kurucusu Osman Gazi’nin türbesi, Söğüt ilçesinde yer alır ve tarihi önem taşır.',
      },
      {
        'ad': 'Saat Kulesi',
        'tip': 'Tarihî Yapı',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Şehrin simgelerinden biri olan saat kulesi, Osmanlı mimarisi özellikleri taşır.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Bilecik Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Peltek, bıldırcın kebabı, ovmaç çorbası',
        'fiyat': 'Orta',
        'bilgi':
            'Yöresel lezzetler sunan, yerel halkın tercih ettiği meşhur restoranlardan biridir.',
        'adres': 'Merkez/Bilecik',
        'telefon': '+90 228 214 1234',
      },
      {
        'ad': 'Osmanlı Konağı',
        'tip': 'Kafe & Restoran',
        'yemekler': 'Sac tava, kuzu etleri, yöresel tatlılar',
        'fiyat': 'Uygun',
        'bilgi':
            'Osmanlı tarzı dekorasyonuyla nostaljik bir ortamda yöresel yemekler sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Pelitözü Gölpark',
        'tip': 'Göl ve Rekreasyon Alanı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Göl çevresinde yürüyüş, piknik ve dinlenme imkanı sunan şehir parkıdır.',
      },
      {
        'ad': 'Sırakayalar Şelalesi',
        'tip': 'Doğal Güzellik',
        'konum': 'Osmaneli',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Doğa yürüyüşü ve fotoğrafçılık için ideal, sakin bir doğa harikasıdır.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Marmara Bölgesi’nde yer alır, kuzeyde Sakarya, doğuda Bilecik, güneyde Kütahya, batıda Bursa ile çevrilidir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 230.000 civarındadır.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim etkisi hakimdir; kışlar soğuk ve kar yağışlı, yazlar sıcak ve kuraktır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, seramik ve mermer üretimi önemli ekonomik faaliyetlerdir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Osmanlı Devleti’nin doğduğu topraklarda yer alır. Şeyh Edebali ve Osman Gazi tarihi figürlerdir. Şehir Osmanlı kültürünü yaşatır.',
      },
    ],
  },
  'Bitlis': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Bitlis Müzesi',
        'kuruluşYılı': '1997',
        'önem':
            'Bitlis ve çevresindeki tarihi eserleri koruyan ve sergileyen önemli müzedir.',
        'koleksiyon':
            'Tarih öncesi buluntular, etnografik eserler, el yazmaları, mezar taşları.',
        'adres': 'İzzetpaşa Mahallesi, Müze Caddesi No: 23, Merkez/Bitlis',
        'telefon': '+90 434 212 1434',
        'web': 'http://bitlismuzesi.gov.tr',
        'bilgi':
            'Bölgenin zengin kültürel mirasını tanıtan kapsamlı koleksiyonlara sahiptir.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Bitlis Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Şehrin simgesi olan ve muhteşem manzaralar sunan tarihi kale, bölgenin savunma mimarisini yansıtır.',
      },
      {
        'ad': 'Nemrut Gölü',
        'tip': 'Doğal Göl',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Tatvan',
        'bilgi':
            'Volkanik bir krater gölü olup doğal güzellikleri ve kuş türleriyle dikkat çeker.',
      },
      {
        'ad': 'Ahlat Selçuklu Mezarlığı',
        'tip': 'Tarihî Mezarlık',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Ahlat',
        'bilgi':
            'Türkiye’nin en büyük Türk-İslam mezarlıklarından biridir ve taş işçiliği açısından zengindir.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Tatvan Balıkçısı',
        'tip': 'Restoran',
        'yemekler': 'Tatvan usulü alabalık, kebaplar',
        'fiyat': 'Orta',
        'bilgi': 'Nemrut Gölü yakınında taze balık ve yöresel lezzetler sunar.',
        'adres': 'Tatvan, Bitlis',
        'telefon': '+90 434 212 5678',
      },
      {
        'ad': 'Bitlis Mutfağı',
        'tip': 'Lokanta',
        'yemekler': 'Keledoş, haşlama, etli ekmek',
        'fiyat': 'Uygun',
        'bilgi':
            'Bölgesel tatları deneyebileceğiniz geleneksel yemekler sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Nemrut Dağı Milli Parkı',
        'tip': 'Milli Park',
        'konum': 'Tatvan',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Volkanik dağları, gölü ve endemik bitki örtüsüyle doğa tutkunları için cazip bir yerdir.',
      },
      {
        'ad': 'Süphan Dağı',
        'tip': 'Dağ ve Doğa',
        'konum': 'Tatvan',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Türkiye’nin üçüncü yüksek dağıdır, dağcılık ve doğa yürüyüşü için popülerdir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Doğu Anadolu Bölgesi’nde yer alır, güneyde Van Gölü, kuzeyde Erzurum, doğuda Muş, batıda Siirt ile çevrilidir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 350.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim hakimdir; kışlar sert ve soğuk, yazlar kısa ve ılımandır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, hayvancılık ve balıkçılık başlıca ekonomik faaliyetlerdendir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Zengin tarihî miras, Selçuklu ve Osmanlı dönemlerinden kalma eserler içerir. Ahlat mezarlığı ve Nemrut Dağı önemli kültür unsurlarıdır.',
      },
    ],
  },
  'Bolu': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Bolu Müzesi',
        'kuruluşYılı': '1980',
        'önem':
            'Bolu ve çevresindeki tarihî eserleri sergileyen önemli kültür merkezi.',
        'koleksiyon':
            'Prehistorik dönemden Osmanlı dönemine kadar arkeolojik ve etnografik eserler.',
        'adres': 'Mengen Mahallesi, Müze Caddesi No:2, Merkez/Bolu',
        'telefon': '+90 374 212 5050',
        'web': 'http://bolumuzesi.gov.tr',
        'bilgi':
            'Zengin arkeolojik koleksiyonları ve etnografik eserleriyle bölgenin kültürünü yansıtır.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Abant Gölü',
        'tip': 'Doğal Göl',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Mudurnu',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Bolu’nun simgesi olan doğal göl, doğa yürüyüşleri ve piknik için ideal bir yerdir.',
      },
      {
        'ad': 'Yedigöller Milli Parkı',
        'tip': 'Milli Park',
        'girişÜcreti': '20 TL',
        'konum': 'Bolu',
        'bilgi':
            'Yedi adet gölden oluşan bu milli park, sonbaharda eşsiz manzaralar sunar.',
      },
      {
        'ad': 'Gölcük Tabiat Parkı',
        'tip': 'Tabiat Parkı',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Doğa yürüyüşü ve piknik için çok tercih edilen sakin bir doğal alan.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'İzzet Çapkın Balıkçısı',
        'tip': 'Restoran',
        'yemekler': 'Alabalık, yöresel tatlar',
        'fiyat': 'Orta',
        'bilgi': 'Bolu’nun meşhur alabalık restoranlarından biridir.',
        'adres': 'Mengen Yolu, Merkez/Bolu',
        'telefon': '+90 374 212 1234',
      },
      {
        'ad': 'Abant Köşk Restoran',
        'tip': 'Restoran',
        'yemekler': 'Et yemekleri, alabalık, kahvaltı',
        'fiyat': 'Orta-yüksek',
        'bilgi': 'Abant Gölü kenarında doğa ile iç içe yemek deneyimi sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kartalkaya Kayak Merkezi',
        'tip': 'Kış Sporları Merkezi',
        'konum': 'Seben',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Kış sporları ve kayak için popüler bir merkezdir.',
      },
      {
        'ad': 'Gölcük Tabiat Parkı',
        'tip': 'Tabiat Parkı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Doğa yürüyüşü ve piknik alanlarıyla dinlenmek için uygundur.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Batı Karadeniz Bölgesi’nde yer alır, İstanbul-Ankara karayolu üzerindedir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 320.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim hakimdir; kışlar soğuk ve karlı, yazlar serin ve yağışlıdır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, ormancılık, turizm ve kış sporları önemli ekonomik faaliyetlerdir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Tarih boyunca birçok medeniyete ev sahipliği yapmıştır. Doğa sporları ve tarihî eserleriyle dikkat çeker.',
      },
    ],
  },
  'Burdur': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Burdur Müzesi',
        'kuruluşYılı': '1969',
        'önem':
            'Burdur ve çevresindeki antik kentlerden çıkarılan eserleri sergiler.',
        'koleksiyon':
            'Likya, Pisidya dönemlerine ait heykeller, sikkeler, seramikler ve mezar stelleri.',
        'adres': 'Cumhuriyet Mahallesi, Müze Caddesi No:14, Merkez/Burdur',
        'telefon': '+90 248 213 4646',
        'web': 'http://burdurmuzesi.gov.tr',
        'bilgi':
            'Likya ve Pisidya uygarlıklarına ait zengin koleksiyonları ile bölgenin tarihini yansıtır.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Sagalassos Antik Kenti',
        'tip': 'Antik Kent',
        'girişÜcreti': '50 TL',
        'konum': 'Ağlasun',
        'ziyaretSaatleri': '08:00 - 19:00',
        'bilgi':
            'Pisidya bölgesinin önemli antik kenti, iyi korunmuş yapıları ve kalıntıları ile ünlüdür.',
      },
      {
        'ad': 'Burdur Gölü',
        'tip': 'Doğal Göl',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Türkiye’nin önemli kuş cennetlerinden biri, doğa ve kuş gözlemciliği için popülerdir.',
      },
      {
        'ad': 'İnsuyu Mağarası',
        'tip': 'Mağara',
        'girişÜcreti': '15 TL',
        'konum': 'Yeşilova',
        'bilgi':
            'Türkiye’nin önemli yer altı mağaralarından biri, sarkıt ve dikit oluşumlarıyla dikkat çeker.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Burdur Pilavcısı',
        'tip': 'Restoran',
        'yemekler': 'Burdur yöresine özgü pilav, et yemekleri',
        'fiyat': 'Orta',
        'bilgi':
            'Burdur’un meşhur pilavını deneyebileceğiniz bilinen bir mekandır.',
        'adres': 'Merkez, Burdur',
        'telefon': '+90 248 213 2233',
      },
      {
        'ad': 'Sagalassos Restaurant',
        'tip': 'Restoran',
        'yemekler': 'Türk mutfağı, yöresel tatlar',
        'fiyat': 'Orta',
        'bilgi':
            'Antik kent yakınında yer alan güzel bir restoran, tarihi atmosferde yemek sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Salda Gölü',
        'tip': 'Doğal Göl',
        'konum': 'Yeşilova',
        'girişÜcreti': '20 TL',
        'bilgi':
            'Türkiye’nin Maldivleri olarak bilinir, berrak suyu ve beyaz kumlarıyla ünlüdür.',
      },
      {
        'ad': 'İnsuyu Mağarası Tabiat Parkı',
        'tip': 'Tabiat Parkı',
        'konum': 'Yeşilova',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Mağara çevresindeki doğal alan yürüyüş ve piknik için tercih edilir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Akdeniz Bölgesi’nde yer alır; kuzeyde Isparta, doğuda Denizli, güneyde Antalya ile çevrilidir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 270.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal ve Akdeniz iklimi karışımı görülür; yazlar sıcak, kışlar ılık geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, hayvancılık, turizm önemli ekonomik faaliyetlerdir. Özellikle Salda Gölü turizmi gelişmektedir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Pisidya uygarlıklarının önemli merkezlerinden biridir; antik kentler ve doğal güzellikler kültürel zenginliktir.',
      },
    ],
  },
  'Bursa': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Bursa Arkeoloji Müzesi',
        'kuruluşYılı': '1904',
        'önem': 'Bursa ve çevresindeki tarihî eserlerin korunduğu önemli müze.',
        'koleksiyon':
            'Roma, Bizans, Osmanlı dönemlerine ait heykeller, seramikler, sikkeler, el yazmaları.',
        'adres': 'Yıldırım, Atatürk Caddesi No:15, Bursa',
        'telefon': '+90 224 221 5555',
        'web': 'http://bursaarkeolojimuze.gov.tr',
        'bilgi':
            'Tarih boyunca Bursa’nın zengin kültür mirasını yansıtan çok sayıda eseri barındırır.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Uludağ Milli Parkı',
        'tip': 'Milli Park / Kayak Merkezi',
        'girişÜcreti': '20-30 TL',
        'konum': 'Keles, Bursa',
        'ziyaretSaatleri': '7/24',
        'bilgi':
            'Türkiye’nin en önemli kış turizmi merkezlerinden biri, doğa yürüyüşü ve kamp alanlarıyla da popülerdir.',
      },
      {
        'ad': 'Yeşil Türbe',
        'tip': 'Tarihî Türbe',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Osmangazi, Bursa',
        'bilgi':
            'Osmanlı Sultanı Çelebi Mehmed’in türbesi, yeşil çinilerle kaplı mimarisiyle dikkat çeker.',
      },
      {
        'ad': 'Cumalıkızık Köyü',
        'tip': 'Tarihî Köy',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Yıldırım, Bursa',
        'bilgi':
            'Osmanlı’dan kalma evleriyle UNESCO Dünya Mirası Listesi’nde yer alan geleneksel köy.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'İskender Efendi Konağı',
        'tip': 'Restoran',
        'yemekler': 'İskender kebap, Osmanlı mutfağı',
        'fiyat': 'Orta-yüksek',
        'bilgi':
            'Bursa’nın meşhur İskender kebabını deneyebileceğiniz tarihi mekanlardan biri.',
        'adres': 'Osmangazi, Bursa',
        'telefon': '+90 224 234 5678',
      },
      {
        'ad': 'Kebapçı İskender',
        'tip': 'Restoran',
        'yemekler': 'İskender kebap, pide, mezeler',
        'fiyat': 'Orta',
        'bilgi':
            'Bursa’da orijinal İskender kebap servisi yapan tanınmış restoran.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Botanik Parkı',
        'tip': 'Park',
        'konum': 'Nilüfer, Bursa',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Şehir içinde doğayla iç içe yürüyüş ve dinlenme alanları sunar.',
      },
      {
        'ad': 'Soğukpınar Parkı',
        'tip': 'Park',
        'konum': 'Osmangazi, Bursa',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Huzurlu ortamıyla ailelerin tercih ettiği bir park.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Marmara Bölgesi’nde, İstanbul’a yakın, Karadeniz ve Ege bölgelerine geçiş noktasıdır.',
      },
      {
        'ad': 'Nüfus',
        'detay':
            '2023 TÜİK verilerine göre yaklaşık 3,1 milyon nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay': 'Marmara iklimi, ılıman kışlar ve sıcak yazlar görülür.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Sanayi, turizm, tarım ve ticaret Bursa ekonomisinin temelini oluşturur.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Osmanlı’nın ilk başkenti, zengin tarihî eserleri, kültürel mirası ve doğal güzellikleriyle önemli bir şehir.',
      },
    ],
  },
  'Çanakkale': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Çanakkale Arkeoloji Müzesi',
        'kuruluşYılı': '1960',
        'önem':
            'Troya ve bölgedeki diğer antik kentlerden çıkan eserlerin sergilendiği önemli müze.',
        'koleksiyon':
            'Troya dönemine ait heykeller, seramikler, sikke ve diğer arkeolojik buluntular.',
        'adres': 'Çınarlı Mah. Dr. Ziya Kaya Cad. No:6, Çanakkale Merkez',
        'telefon': '+90 286 217 1437',
        'web': 'http://canakkalearkeolojimuze.gov.tr',
        'bilgi':
            'Troya antik kentinin kalıntılarına dair çok sayıda önemli eseri içerir.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': '20 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Troya Antik Kenti',
        'tip': 'Antik Kent',
        'girişÜcreti': '40 TL',
        'konum': 'Çanakkale Merkez',
        'ziyaretSaatleri': '08:00 - 19:00',
        'bilgi':
            'UNESCO Dünya Mirası Listesi’nde yer alan, Homeros’un İlyada destanında geçen tarihi kent.',
      },
      {
        'ad': 'Çanakkale Şehitler Abidesi',
        'tip': 'Anıt / Tarihî Yer',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Eceabat',
        'bilgi':
            'Çanakkale Savaşları’nda hayatını kaybeden askerler anısına yapılmış önemli bir anıt.',
      },
      {
        'ad': 'Assos Antik Kenti',
        'tip': 'Antik Kent',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Bayramiç',
        'bilgi':
            'Antik felsefe merkezi olarak bilinir, Athena Tapınağı ve limanı ile ünlüdür.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Kordon Restoran',
        'tip': 'Restoran',
        'yemekler': 'Deniz ürünleri, mezeler',
        'fiyat': 'Orta',
        'bilgi':
            'Deniz manzarası eşliğinde taze balık ve yöresel lezzetler sunar.',
        'adres': 'Çanakkale Merkez, Kordon Boyu',
        'telefon': '+90 286 217 5566',
      },
      {
        'ad': 'Güler Balık Evi',
        'tip': 'Balık Lokantası',
        'yemekler': 'Balık çeşitleri, mezeler',
        'fiyat': 'Orta',
        'bilgi':
            'Uzun yıllardır hizmet veren, taze ve kaliteli balık ürünleriyle tanınır.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kazdağı Milli Parkı',
        'tip': 'Milli Park',
        'konum': 'Edremit Körfezi',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Zengin bitki örtüsü, şelaleleri ve trekking rotaları ile doğa severler için popüler bir bölge.',
      },
      {
        'ad': 'Gökçeada Plajları',
        'tip': 'Plaj',
        'konum': 'Gökçeada',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Temiz denizi ve doğal plajları ile Türkiye’nin en güzel adalarından biridir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Marmara ve Ege bölgeleri arasında, Çanakkale Boğazı kıyısında stratejik bir şehir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 550.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Geçiş iklimi; yazlar sıcak ve kurak, kışlar ılık ve yağışlıdır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Turizm, tarım, deniz taşımacılığı ve seramik üretimi önde gelir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Çanakkale Savaşları ve Troya Antik Kenti ile Türkiye’nin önemli tarihî ve kültürel merkezlerinden biridir.',
      },
    ],
  },
  'Çankırı': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Çankırı Müzesi',
        'kuruluşYılı': '1967',
        'önem': 'Çankırı ve çevresindeki tarihî eserlerin korunduğu müze.',
        'koleksiyon':
            'Tarih öncesi buluntular, Roma ve Osmanlı dönemine ait eserler, etnografik materyaller.',
        'adres': 'Kale Mahallesi, Cumhuriyet Caddesi No:12, Çankırı Merkez',
        'telefon': '+90 376 212 3456',
        'web': 'http://cankirimuzesi.gov.tr',
        'bilgi': 'Şehrin tarihî ve kültürel mirasını sergileyen önemli müze.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Çankırı Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Şehrin merkezinde yer alan, tarihi Bizans ve Osmanlı dönemine uzanan kale.',
      },
      {
        'ad': 'Ilgaz Dağı Milli Parkı',
        'tip': 'Milli Park',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Ilgaz',
        'bilgi':
            'Doğa yürüyüşü, kamp ve kış sporları için uygun doğal alanlar içerir.',
      },
      {
        'ad': 'Korgun Kaplıcaları',
        'tip': 'Termal Kaynaklar',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Korgun',
        'bilgi':
            'Sağlık turizmi açısından önemli termal su kaynakları barındırır.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Çankırı Ev Yemekleri',
        'tip': 'Lokanta',
        'yemekler': 'Etli ekmek, mantı, kuymak',
        'fiyat': 'Orta',
        'bilgi': 'Geleneksel yöresel yemeklerin sunulduğu samimi bir mekan.',
        'adres': 'Merkez, Çankırı',
        'telefon': '+90 376 212 6789',
      },
      {
        'ad': 'Kale Restoran',
        'tip': 'Restoran',
        'yemekler': 'Izgara çeşitleri, kebaplar',
        'fiyat': 'Orta',
        'bilgi': 'Lezzetli kebaplar ve et yemekleri ile tanınır.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Ilgaz Dağı Milli Parkı',
        'tip': 'Milli Park',
        'konum': 'Ilgaz',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Zengin flora ve faunasıyla doğa tutkunlarına hitap eder.',
      },
      {
        'ad': 'Çankırı Kent Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Ailelerin dinlenme ve yürüyüş için tercih ettiği yeşil alan.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'İç Anadolu Bölgesi’nde, Ankara’nın kuzeydoğusunda yer alır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 180.000 nüfus.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim hakimdir; kışlar soğuk ve kar yağışlı, yazlar sıcak geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, hayvancılık ve madencilik başlıca ekonomik faaliyetlerdir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Hititler ve Roma döneminden izler taşıyan tarihi mirasa sahiptir. Osmanlı döneminden kalma eserler bulunur.',
      },
    ],
  },
  'Çorum': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Çorum Müzesi',
        'kuruluşYılı': '1968',
        'önem': 'Hitit medeniyetine ait önemli eserlerin sergilendiği müze.',
        'koleksiyon':
            'Hitit tabletleri, heykeller, seramikler, etnografik eserler.',
        'adres': 'Bahçelievler Mahallesi, Müzeler Caddesi No:5, Çorum Merkez',
        'telefon': '+90 364 213 1521',
        'web': 'http://corummuzesi.gov.tr',
        'bilgi':
            'Hitit uygarlığına dair zengin koleksiyonları ile bölgenin tarihini tanıtır.',
        'ziyaretSaatleri': '09:00 - 17:30',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Hattuşaş Antik Kenti',
        'tip': 'Antik Kent',
        'girişÜcreti': '120 TL',
        'konum': 'Boğazkale',
        'ziyaretSaatleri': '08:00 - 19:00',
        'bilgi':
            'Hititler’in başkenti, UNESCO Dünya Mirası Listesi’nde yer alır.',
      },
      {
        'ad': 'Alacahöyük',
        'tip': 'Antik Yerleşim',
        'girişÜcreti': '100 TL',
        'konum': 'Alaca',
        'bilgi':
            'Hititler öncesi dönemlere ait önemli arkeolojik kalıntılar bulunmaktadır.',
      },
      {
        'ad': 'İskilip Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'İskilip',
        'bilgi': 'Roma ve Bizans dönemlerinden kalma savunma yapısıdır.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Çorum Leblebicisi',
        'tip': 'Atıştırmalık',
        'yemekler': 'Çorum leblebisi, yöresel tatlılar',
        'fiyat': 'Uygun',
        'bilgi': 'Ünlü Çorum leblebisi ve yöresel ürünlerin satıldığı mekan.',
        'adres': 'Merkez, Çorum',
        'telefon': '+90 364 212 3344',
      },
      {
        'ad': 'Hitit Restoran',
        'tip': 'Restoran',
        'yemekler': 'Et yemekleri, kebaplar',
        'fiyat': 'Orta',
        'bilgi': 'Yöresel ve geleneksel Türk mutfağı sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Osmancık Çayı ve Mesire Alanı',
        'tip': 'Doğal Alan',
        'konum': 'Osmancık',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Piknik ve yürüyüş için tercih edilen doğal güzellik.',
      },
      {
        'ad': 'Çorum Kent Ormanı',
        'tip': 'Şehir Ormanı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Yeşil alan, yürüyüş yolları ve çocuk oyun alanlarıyla ailelere uygundur.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Karadeniz Bölgesi’nin güneyinde, İç Anadolu ile Karadeniz arasında yer alır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 530.000 nüfus.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim özellikleri hakimdir; kışlar soğuk ve kar yağışlı, yazlar sıcak ve kurak geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, sanayi ve ticaret önemli ekonomik faaliyetlerdir. Çorum leblebisi ile ünlüdür.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Hitit uygarlığı başta olmak üzere birçok medeniyete ev sahipliği yapmıştır. Hitit mirası şehirde önemli kültürel değerdir.',
      },
    ],
  },
  'Denizli': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Denizli Arkeoloji Müzesi',
        'kuruluşYılı': '1969',
        'önem':
            'Denizli ve çevresindeki antik dönem eserlerinin sergilendiği önemli müze.',
        'koleksiyon':
            'Helenistik, Roma ve Bizans dönemlerine ait heykeller, seramikler, sikke koleksiyonları.',
        'adres': 'Muzeler Mh., İncilipınar Cd. No:7, Denizli Merkez',
        'telefon': '+90 258 212 2463',
        'web': 'http://denizliarkeolojimizesi.gov.tr',
        'bilgi':
            'Bölgenin zengin tarihini yansıtan kapsamlı arkeolojik eserler içerir.',
        'ziyaretSaatleri': '09:00 - 18:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Pamukkale Travertenleri',
        'tip': 'Doğal ve Tarihi Alan',
        'girişÜcreti': '150 TL',
        'konum': 'Pamukkale',
        'ziyaretSaatleri': '08:00 - 20:00',
        'bilgi':
            'Beyaz traverten terasları ve antik Hierapolis kenti ile UNESCO Dünya Mirası.',
      },
      {
        'ad': 'Hierapolis Antik Kenti',
        'tip': 'Antik Kent',
        'girişÜcreti': '150 TL (Pamukkale bileti ile birlikte)',
        'konum': 'Pamukkale',
        'bilgi':
            'Roma döneminden kalma antik tiyatro, nekropol alanları ve kutsal havuzları içerir.',
      },
      {
        'ad': 'Laodikya Antik Kenti',
        'tip': 'Antik Kent',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Denizli Merkez’e 6 km',
        'bilgi':
            'Roma döneminden kalma zengin yapılarıyla tarih meraklıları için önemli bir alan.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Kebapçı Hasan Usta',
        'tip': 'Restoran',
        'yemekler': 'Denizli kebabı, çöp şiş, mezeler',
        'fiyat': 'Orta',
        'bilgi':
            'Yerel lezzetlerin ve kebap çeşitlerinin tadılabileceği popüler mekan.',
        'adres': 'Merkez, Denizli',
        'telefon': '+90 258 212 3344',
      },
      {
        'ad': 'Mutfak Denizli',
        'tip': 'Restoran',
        'yemekler': 'Ege mutfağı, zeytinyağlılar, deniz ürünleri',
        'fiyat': 'Orta',
        'bilgi': 'Ege’nin taze ve sağlıklı yemeklerini sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Denizli Botanik Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Denizli Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Bitki çeşitliliği ve yürüyüş yolları ile şehir içinde doğa keyfi sunar.',
      },
      {
        'ad': 'Honaz Dağı Milli Parkı',
        'tip': 'Milli Park',
        'konum': 'Honaz',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Zengin flora ve fauna ile doğa yürüyüşü ve piknik alanları sunar.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Ege Bölgesi’nin iç kesiminde, önemli bir tarım ve turizm merkezidir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 1.1 milyon nüfus.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Akdeniz iklimi hakim; yazlar sıcak ve kurak, kışlar ılık geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, tekstil, turizm ve seracılık önde gelen ekonomik faaliyetlerdir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Zengin tarihi geçmişi ile antik çağlardan Osmanlı dönemine kadar birçok medeniyete ev sahipliği yapmıştır.',
      },
    ],
  },
  'Diyarbakır': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Diyarbakır Müzesi',
        'kuruluşYılı': '1983',
        'önem':
            'Diyarbakır ve çevresinin zengin tarihî ve kültürel mirasını sergiler.',
        'koleksiyon':
            'Hitit, Roma, Bizans dönemlerine ait eserler, el yazmaları, etnografik objeler.',
        'adres': 'Ofis Mahallesi, Müze Caddesi No: 1, Diyarbakır Merkez',
        'telefon': '+90 412 231 1234',
        'web': 'http://diyarbakirmuzesi.gov.tr',
        'bilgi':
            'Bölgenin tarihî geçmişini geniş bir yelpazede ziyaretçilere sunar.',
        'ziyaretSaatleri': '09:00 - 18:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Diyarbakır Surları',
        'tip': 'Tarihî Kale ve Surlar',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Dünyanın en uzun ve en iyi korunmuş surlarından biridir, UNESCO Dünya Mirası listesinde.',
      },
      {
        'ad': 'Ulu Camii',
        'tip': 'Tarihî Camii',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Türkiye’nin en eski camilerinden biri olup Artuklu dönemine aittir.',
      },
      {
        'ad': 'Hevsel Bahçeleri',
        'tip': 'Doğal ve Tarihi Bahçe',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Dicle Nehri kıyısı',
        'bilgi':
            'Surlarla birlikte UNESCO Dünya Mirası olarak korunmaktadır, bereketli tarım alanlarıdır.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Ciğerci Mahmut',
        'tip': 'Restoran',
        'yemekler': 'Diyarbakır usulü ciğer kebabı, lahmacun',
        'fiyat': 'Orta',
        'bilgi':
            'Şehrin meşhur ciğer kebabını deneyebileceğiniz popüler mekan.',
        'adres': 'Merkez, Diyarbakır',
        'telefon': '+90 412 231 5678',
      },
      {
        'ad': 'Kasap Döner',
        'tip': 'Restoran',
        'yemekler': 'Döner, kebap çeşitleri',
        'fiyat': 'Orta',
        'bilgi': 'Lezzetli ve hızlı servis yapan dönerci.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Dicle Nehri ve Parkları',
        'tip': 'Doğal Alan',
        'konum': 'Diyarbakır Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Nehir kıyısında yürüyüş ve dinlenme alanları bulunur.',
      },
      {
        'ad': 'On Gözlü Köprü Çevresi',
        'tip': 'Tarihî Doğa Alanı',
        'konum': 'Diyarbakır Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Tarihi köprü çevresi piknik ve gezi için tercih edilir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Güneydoğu Anadolu Bölgesi’nde, Dicle Nehri kıyısında stratejik konuma sahiptir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 1.9 milyon nüfus.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim hakimdir; yazlar sıcak ve kurak, kışlar soğuk geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, ticaret ve hizmet sektörü ekonominin temel taşlarıdır.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Çok eski medeniyetlere ev sahipliği yapmış, zengin kültürel miras ve tarihî yapılarla doludur.',
      },
    ],
  },
  'Edirne': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Edirne Arkeoloji ve Etnografya Müzesi',
        'kuruluşYılı': '1925',
        'önem': 'Trakya bölgesinin tarihî ve kültürel mirasını sergiler.',
        'koleksiyon':
            'Roma, Bizans, Osmanlı dönemlerine ait eserler, sikkeler, etnografik objeler.',
        'adres': 'Saraçlar Caddesi No:2, Edirne Merkez',
        'telefon': '+90 284 214 1480',
        'web': 'http://edirnemuze.gov.tr',
        'bilgi': 'Zengin koleksiyonuyla bölgenin tarihine ışık tutar.',
        'ziyaretSaatleri': '09:00 - 17:30',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Selimiye Camii',
        'tip': 'Tarihî Camii',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Mimar Sinan’ın ustalık eseri, UNESCO Dünya Mirası Listesi’nde yer alır.',
      },
      {
        'ad': 'Edirne Surları ve Üç Şerefeli Camii',
        'tip': 'Tarihî Yapılar',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi': 'Şehrin Osmanlı döneminden kalan önemli yapılarındandır.',
      },
      {
        'ad': 'Meriç Nehri Kenarı',
        'tip': 'Doğal Alan',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Şehir merkezi yakınları',
        'bilgi': 'Yürüyüş, piknik ve doğa keyfi için tercih edilir.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Ciğerci Niyazi',
        'tip': 'Restoran',
        'yemekler': 'Edirne usulü ciğer tava',
        'fiyat': 'Orta',
        'bilgi':
            'Edirne’nin meşhur ciğerini deneyebileceğiniz tarihi mekanlardan biri.',
        'adres': 'Saraçlar Caddesi, Edirne',
        'telefon': '+90 284 213 1234',
      },
      {
        'ad': 'Edirne Köftecisi',
        'tip': 'Restoran',
        'yemekler': 'Edirne köftesi, piyaz',
        'fiyat': 'Orta',
        'bilgi': 'Lezzetli köfteleri ve yöresel tatları sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Sarayiçi Parkı',
        'tip': 'Park ve Rekreasyon Alanı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Tarihî Sarayiçi alanında yeşil alanlar, yürüyüş ve spor imkânları.',
      },
      {
        'ad': 'Merkez Kent Ormanı',
        'tip': 'Orman ve Doğa Alanı',
        'konum': 'Edirne Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Şehir içindeki doğal alanlardan biridir, piknik ve yürüyüş için ideal.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Marmara Bölgesi’nin Trakya kesiminde, Türkiye’nin Avrupa’ya açılan kapısıdır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 406.000 nüfus.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal ve Marmara iklim özelliklerinin karışımı, yazları sıcak, kışları soğuk ve yağışlıdır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Ticaret, tarım, turizm ve sınır kapısı nedeniyle lojistik önemli ekonomik faaliyetlerdir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Osmanlı İmparatorluğu’nun erken başkentlerinden, zengin tarihî ve kültürel mirasa sahiptir.',
      },
    ],
  },
  'Elazığ': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Elazığ Arkeoloji ve Etnografya Müzesi',
        'kuruluşYılı': '1967',
        'önem':
            'Bölgede bulunan tarihî eserlerin korunması ve sergilenmesi amacıyla kurulmuştur.',
        'koleksiyon':
            'Paleolitik çağdan Osmanlı dönemine kadar çeşitli eserler, el yazmaları, etnografik objeler.',
        'adres': 'Gazi Caddesi No: 42, Elazığ Merkez',
        'telefon': '+90 424 236 1234',
        'web': 'http://elazigmuzesi.gov.tr',
        'bilgi': 'Zengin arkeolojik ve kültürel miras koleksiyonuna sahiptir.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Harput Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Harput Mahallesi, Elazığ',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Şehrin simgesi olan tarihi kale, bölgenin tarihi ve kültürel geçmişini yansıtır.',
      },
      {
        'ad': 'Hazar Gölü',
        'tip': 'Doğal Göl',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Elazığ’ın 20 km doğusunda',
        'bilgi':
            'Doğa yürüyüşü, piknik ve su sporları için popüler bir destinasyondur.',
      },
      {
        'ad': 'Meryem Ana Kilisesi',
        'tip': 'Tarihî Kilise',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Harput',
        'bilgi':
            'Bölgedeki önemli Ermeni yapılarından biridir, mimarisi dikkat çeker.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Elazığ Mutfağı Restoranı',
        'tip': 'Restoran',
        'yemekler': 'Harput köftesi, içli köfte, ciğer kebabı',
        'fiyat': 'Orta',
        'bilgi': 'Geleneksel Elazığ yemeklerini tadabileceğiniz popüler mekan.',
        'adres': 'Merkez, Elazığ',
        'telefon': '+90 424 236 5678',
      },
      {
        'ad': 'Hazar Balıkçısı',
        'tip': 'Restoran',
        'yemekler': 'Taze balık ve yöresel mezeler',
        'fiyat': 'Orta',
        'bilgi': 'Hazar Gölü manzarası eşliğinde balık ve mezeler sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Hazar Gölü Milli Parkı',
        'tip': 'Milli Park',
        'konum': 'Elazığ',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Göl ve çevresi doğal güzelliklerle doludur, kamp ve doğa yürüyüşü için ideal.',
      },
      {
        'ad': 'Elazığ Kent Ormanı',
        'tip': 'Orman ve Rekreasyon Alanı',
        'konum': 'Şehir merkezi yakınları',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Yürüyüş, piknik ve spor aktiviteleri için tercih edilir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Doğu Anadolu Bölgesi’nde, Malatya’nın kuzeyinde yer alır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 580.000 nüfus.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim hakimdir; kışlar soğuk ve kar yağışlı, yazlar sıcak ve kuraktır.',
      },
      {
        'ad': 'Ekonomi',
        'detay': 'Tarım, hayvancılık ve sanayi ekonominin temelini oluşturur.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Tarih boyunca birçok medeniyete ev sahipliği yapmış, zengin kültürel miras taşır.',
      },
    ],
  },
  'Erzincan': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Erzincan Müzesi',
        'kuruluşYılı': '1985',
        'önem':
            'Erzincan ve çevresindeki tarihî eserleri koruyup sergileyen önemli müzedir.',
        'koleksiyon':
            'Tarih öncesi dönemlerden Osmanlı’ya kadar çeşitli arkeolojik ve etnografik eserler.',
        'adres': 'İstasyon Mahallesi, Müzeler Caddesi No:12, Erzincan Merkez',
        'telefon': '+90 446 212 1234',
        'web': 'http://erzincanmuzesi.gov.tr',
        'bilgi':
            'Bölgede yapılan kazılardan çıkan zengin koleksiyonları içerir.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Erzincan Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Şehrin sembollerinden, tarih boyunca birçok medeniyetin kullandığı savunma yapısıdır.',
      },
      {
        'ad': 'Girlevik Şelalesi',
        'tip': 'Doğal Güzellik',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez’e 12 km uzaklıkta',
        'bilgi':
            'Türkiye’nin en büyük doğal şelalelerinden biridir, doğa yürüyüşü için ideal.',
      },
      {
        'ad': 'Otlukbeli Gölü',
        'tip': 'Doğal Göl',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Otlukbeli ilçesi yakınları',
        'bilgi': 'Doğa ve balıkçılık için tercih edilen sakin bir göldür.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Erzincan Mutfağı Restoranı',
        'tip': 'Restoran',
        'yemekler': 'Cağ Kebabı, Tandır, Erzincan tulumu peyniri',
        'fiyat': 'Orta',
        'bilgi': 'Yöresel lezzetleri tatmak için ideal bir mekandır.',
        'adres': 'Merkez, Erzincan',
        'telefon': '+90 446 212 5678',
      },
      {
        'ad': 'Cağ Kebapçı',
        'tip': 'Restoran',
        'yemekler': 'Cağ Kebabı',
        'fiyat': 'Orta',
        'bilgi': 'Erzincan’ın meşhur cağ kebabını sunan ünlü restoran.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kazıkbeli Yaylası',
        'tip': 'Yayla ve Doğa Alanı',
        'konum': 'Merkez’e 30 km uzaklıkta',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Yayla turizmi için tercih edilen serin ve yeşil alan.',
      },
      {
        'ad': 'Şehitler Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Şehirde dinlenmek ve yürüyüş yapmak için ideal bir park.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Doğu Anadolu Bölgesi’nde, Erzurum’un batısında, Sivas’ın kuzeyindedir.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 230.000 nüfus.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim hakimdir; kışlar soğuk ve uzun, yazlar kısa ve sıcak geçer.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, hayvancılık ve küçük ölçekli sanayi ekonominin temelini oluşturur.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Zengin tarihî geçmişi, hititler, persler ve Osmanlı izlerini taşır.',
      },
    ],
  },
  'Erzurum': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Erzurum Atatürk Üniversitesi Arkeoloji Müzesi',
        'kuruluşYılı': '1978',
        'önem':
            'Bölgede yapılan kazılardan çıkan arkeolojik eserleri sergiler.',
        'koleksiyon':
            'Paleolitik çağdan Osmanlı dönemine kadar uzanan eserler, sikkeler, heykeller, seramikler.',
        'adres': 'Atatürk Üniversitesi Kampüsü, Yakutiye/Erzurum',
        'telefon': '+90 442 231 0000',
        'web': 'http://atauni.edu.tr',
        'bilgi': 'Zengin koleksiyonu ve araştırma merkezi olarak hizmet verir.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Çifte Minareli Medrese',
        'tip': 'Tarihî Yapı',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Palandöken',
        'bilgi':
            'Selçuklu mimarisinin en güzel örneklerinden biridir, simge yapı olarak kabul edilir.',
      },
      {
        'ad': 'Erzurum Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Roma, Bizans ve Selçuklu dönemlerine ait kalıntıları barındırır.',
      },
      {
        'ad': 'Palandöken Kayak Merkezi',
        'tip': 'Doğa ve Spor Merkezi',
        'girişÜcreti': 'Sezona göre değişir',
        'konum': 'Palandöken Dağları',
        'bilgi':
            'Türkiye’nin önemli kayak merkezlerinden biri, kış turizminin kalbidir.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Cağ Kebapçı İskender',
        'tip': 'Restoran',
        'yemekler': 'Cağ kebabı, kuzu etleri',
        'fiyat': 'Orta',
        'bilgi':
            'Erzurum’un meşhur cağ kebabını sunan köklü restoranlardan biridir.',
        'adres': 'Yakutiye, Erzurum',
        'telefon': '+90 442 212 3456',
      },
      {
        'ad': 'İspir Mantısı Evi',
        'tip': 'Restoran',
        'yemekler': 'İspir mantısı, yöresel tatlar',
        'fiyat': 'Uygun',
        'bilgi':
            'Erzurum’un yöresel mantısı olan İspir mantısını deneyebileceğiniz yer.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Narman Peribacaları',
        'tip': 'Doğal Oluşum',
        'konum': 'Narman ilçesi',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Erzurum’un doğal güzelliklerinden biri, benzersiz peribacası oluşumları vardır.',
      },
      {
        'ad': 'Yakutiye Medresesi Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Tarihî medrese çevresinde huzurlu bir park alanı sunar.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Doğu Anadolu Bölgesi’nin önemli şehirlerinden biri, Erzincan ve Ağrı arasında yer alır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 760.000 nüfus.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim özellikleri baskındır; kışlar uzun ve sert, yazlar kısa ve serindir.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, hayvancılık ve kış turizmi ekonomide önemli yer tutar.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Büyük Selçuklu ve Osmanlı mirasını taşıyan zengin kültürel geçmişe sahiptir.',
      },
    ],
  },
  'Gaziantep': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Zeugma Mozaik Müzesi',
        'kuruluşYılı': '2011',
        'önem': 'Dünyanın en büyük mozaik müzelerinden biridir.',
        'koleksiyon': 'Roma dönemi mozaikleri, heykeller, seramikler.',
        'adres': 'Şahinbey, Gaziantep',
        'telefon': '+90 342 231 5656',
        'web': 'http://gaziantepmuze.gov.tr',
        'bilgi': 'Mozaikler Zeugma Antik Kenti’nden çıkarılmıştır.',
        'ziyaretSaatleri': '09:00 - 18:00',
        'girişÜcreti': '80 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Gaziantep Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Şahinbey',
        'bilgi':
            'Roma ve Selçuklu dönemlerinden kalma kalenin tarihi dokusu korunmuştur.',
      },
      {
        'ad': 'Baklava Müzesi',
        'tip': 'Kültürel Mekan',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Şehreküstü',
        'bilgi':
            'Gaziantep’in ünlü baklavasının tarihçesi ve yapımı anlatılır.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Metanet Lokantası',
        'tip': 'Restoran',
        'yemekler': 'Antep fıstıklı baklava, beyran çorbası',
        'fiyat': 'Orta',
        'bilgi': 'Gaziantep mutfağının en lezzetli örneklerini sunar.',
        'adres': 'Şahinbey, Gaziantep',
        'telefon': '+90 342 234 1234',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Karataş Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Şehreküstü',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Dinlenme ve yürüyüş için popüler park.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Güneydoğu Anadolu Bölgesi’nde, Suriye sınırına yakın.',
      },
      {'ad': 'Nüfus', 'detay': '2023 TÜİK verilerine göre yaklaşık 2 milyon.'},
      {
        'ad': 'İklim',
        'detay': 'Sıcak yazlar ve soğuk kışlar görülen karasal iklim.',
      },
      {
        'ad': 'Ekonomi',
        'detay': 'Sanayi, ticaret ve zengin gastronomi ile ön plandadır.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Tarihi İpek Yolu üzerinde önemli bir merkez, zengin kültürel mirasa sahip.',
      },
    ],
  },
  'Giresun': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Giresun Müzesi',
        'kuruluşYılı': '1987',
        'önem': 'Karadeniz bölgesinin tarihini yansıtan eserler sergilenir.',
        'koleksiyon': 'Tarih öncesi, Roma dönemi eserleri, etnografik objeler.',
        'adres': 'Merkez, Giresun',
        'telefon': '+90 454 212 3456',
        'web': 'http://giresunmuze.gov.tr',
        'bilgi': 'Bölgenin kültürel zenginliklerini tanıtan önemli müze.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Giresun Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi':
            'Karadeniz’in eşsiz manzarasını sunan kalenin tarihi Roma dönemine dayanır.',
      },
      {
        'ad': 'Giresun Adası',
        'tip': 'Doğal ve Tarihî Alan',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Karadeniz açıkları',
        'bilgi': 'Mitolojik hikâyelerle ünlü ada, doğal güzelliklere sahiptir.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Fındık Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Karadeniz mutfağı, mısır ekmeği, hamsi',
        'fiyat': 'Orta',
        'bilgi': 'Giresun’un yöresel tatlarını sunar.',
        'adres': 'Merkez, Giresun',
        'telefon': '+90 454 212 6789',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kavakdere Mesire Alanı',
        'tip': 'Doğa Alanı',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Doğa yürüyüşü ve piknik için tercih edilir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Karadeniz Bölgesi’nde, Ordu ve Trabzon arasında yer alır.',
      },
      {'ad': 'Nüfus', 'detay': '2023 TÜİK verilerine göre yaklaşık 450.000.'},
      {
        'ad': 'İklim',
        'detay': 'Karadeniz iklimi; yağışlı ve serin yazlar, ılıman kışlar.',
      },
      {
        'ad': 'Ekonomi',
        'detay': 'Fındık üretimi ve balıkçılık önemli ekonomik faaliyetlerdir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay': 'Zengin Karadeniz kültürü ve tarihî kalıntılarla doludur.',
      },
    ],
  },

  'Gümüşhane': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Gümüşhane Müzesi',
        'kuruluşYılı': '1999',
        'önem':
            'Tarihî ve arkeolojik eserler içerir, bölge kültürünü yansıtır.',
        'koleksiyon':
            'Orta Çağ eserleri, mezar taşları, Osmanlı dönemi objeleri.',
        'adres': 'Merkez, Gümüşhane',
        'telefon': '+90 456 212 3456',
        'web': 'http://gumushane.mu.gov.tr',
        'bilgi': 'Bölge tarihi ve kültürüne ışık tutar.',
        'ziyaretSaatleri': '08:30 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Santa Harabeleri',
        'tip': 'Tarihî Yer',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi': 'Orta Çağ’dan kalma önemli Bizans kalıntılarıdır.',
      },
      {
        'ad': 'Karaca Mağarası',
        'tip': 'Doğal Mağara',
        'girişÜcreti': '15 TL',
        'konum': 'Torul ilçesi',
        'bilgi':
            'Türkiye’nin en büyük mağaralarından biri, sarkıt ve dikitleriyle ünlüdür.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Hamsiköy Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Karadeniz mutfağı, mısır ekmeği, kuymak',
        'fiyat': 'Orta',
        'bilgi': 'Yöresel lezzetlerin tadılabileceği mekandır.',
        'adres': 'Merkez, Gümüşhane',
        'telefon': '+90 456 212 5678',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Altındere Milli Parkı',
        'tip': 'Milli Park',
        'konum': 'Maçka',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Doğa yürüyüşü ve trekking için popüler alandır.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Karadeniz Bölgesi’nin iç kesiminde, Trabzon ve Erzincan arasında yer alır.',
      },
      {'ad': 'Nüfus', 'detay': '2023 TÜİK verilerine göre yaklaşık 150.000.'},
      {'ad': 'İklim', 'detay': 'Karadeniz iklimi etkisinde, yağışlı ve serin.'},
      {
        'ad': 'Ekonomi',
        'detay': 'Madencilik, tarım ve hayvancılık önemli sektörlerdir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay': 'Zengin kültürel miras ve tarihi kalıntılar bulunur.',
      },
    ],
  },
  'Hakkâri': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Hakkâri Müzesi',
        'kuruluşYılı': '2015',
        'önem': 'Bölgenin tarihî ve kültürel mirasını koruyan önemli müze.',
        'koleksiyon':
            'Paleolitik döneme ait aletler, etnografik eserler, yöresel kıyafetler.',
        'adres': 'İstasyon Mahallesi, Cumhuriyet Caddesi No:12, Hakkâri Merkez',
        'telefon': '+90 438 212 3456',
        'web': '',
        'bilgi':
            'Yeni kurulan müze, Hakkâri ve çevresindeki tarihî buluntuları sergiler.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Cilo Dağları',
        'tip': 'Doğal Alan',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez ve Yüksekova arasında',
        'ziyaretSaatleri': '7/24 açık',
        'bilgi':
            'Türkiye’nin üçüncü yüksek dağı olan Cilo Dağları, trekking ve dağcılık için uygundur.',
      },
      {
        'ad': 'Zap Vadisi',
        'tip': 'Doğal Vadı',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Hakkâri Merkez',
        'bilgi': 'Eşsiz doğal güzellikleri ve yürüyüş rotaları ile ünlüdür.',
      },
      {
        'ad': 'Mereto Dağı',
        'tip': 'Dağ',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Yüksekova',
        'bilgi':
            'Bölgenin en yüksek dağlarından biri olup, doğa severlerin ilgisini çeker.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Hakkâri Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Kürt mutfağı, et yemekleri, sac kavurma',
        'fiyat': 'Orta',
        'bilgi': 'Yöresel tatları deneyebileceğiniz nezih mekanlardan biridir.',
        'adres': 'Merkez, Hakkâri',
        'telefon': '+90 438 212 7890',
      },
      {
        'ad': 'Dicle Lokantası',
        'tip': 'Lokanta',
        'yemekler': 'Etli yemekler, çorbalar',
        'fiyat': 'Uygun',
        'bilgi': 'Hakkâri’nin geleneksel lezzetlerini sunar.',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Şemdinli Yaylası',
        'tip': 'Doğal Yayla',
        'konum': 'Şemdinli',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Serin havası ve doğal güzellikleriyle tercih edilen yayla.',
      },
      {
        'ad': 'Güzelkonak Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Hakkâri Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Ailelerin ve çocukların sıkça ziyaret ettiği yeşil alan.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Türkiye’nin güneydoğusunda, İran ve Irak sınırına yakın konumda bulunur.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 280.000 nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim etkisi altındadır; kışlar çok soğuk ve karlı, yazlar sıcak ve kuraktır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Hayvancılık ve tarım ekonominin temelini oluşturur. Ayrıca sınır ticareti önemlidir.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Bölge zengin tarihî mirasa sahiptir; Kürt kültürü ve geleneksel yaşam yaygındır.',
      },
    ],
  },
  'Hatay': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Hatay Arkeoloji Müzesi',
        'kuruluşYılı': '1934',
        'önem': 'Türkiye’nin en zengin mozaik koleksiyonuna sahip önemli müze.',
        'koleksiyon':
            'Roma, Bizans, Helenistik döneme ait mozaikler, heykeller, seramikler.',
        'adres': 'Atatürk Caddesi, Antakya',
        'telefon': '+90 326 214 3856',
        'web': 'http://hatayarkeoloji.gov.tr',
        'bilgi':
            'Dünyaca ünlü mozaik koleksiyonu ile bölgenin tarihini gözler önüne serer.',
        'ziyaretSaatleri': '09:00 - 18:00',
        'girişÜcreti': '30 TL',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Saint Pierre Kilisesi',
        'tip': 'Tarihî Kilise',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Antakya',
        'ziyaretSaatleri': '09:00 - 17:00',
        'bilgi': 'Hristiyanlığın ilk kiliselerinden biri olarak kabul edilir.',
      },
      {
        'ad': 'Harbiye Şelaleleri',
        'tip': 'Doğal Güzellik',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Antakya',
        'bilgi': 'Yeşillikler içinde güzel şelaleler ve piknik alanları sunar.',
      },
      {
        'ad': 'Titus Tüneli',
        'tip': 'Antik Su Tüneli',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Samandağ',
        'bilgi': 'Roma döneminden kalma mühendislik harikası su kanalıdır.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Antakya Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Künefe, zahterli ekmek, mezeler',
        'fiyat': 'Orta',
        'bilgi':
            'Hatay’ın zengin mutfak kültürünü deneyimleyebileceğiniz yerlerden.',
        'adres': 'Antakya Merkez',
        'telefon': '+90 326 123 4567',
      },
      {
        'ad': 'Künefeci Yusuf',
        'tip': 'Tatlıcı',
        'yemekler': 'Künefe',
        'fiyat': 'Uygun',
        'bilgi': 'Hatay’ın meşhur künefesini tadabileceğiniz popüler mekan.',
        'adres': 'Antakya',
        'telefon': '+90 326 765 4321',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Harbiye Parkı',
        'tip': 'Şehir Parkı',
        'konum': 'Antakya',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Şelaleler ve yeşil alanlarıyla şehir içinde huzurlu bir doğa noktasıdır.',
      },
      {
        'ad': 'Amik Ovası',
        'tip': 'Doğal Alan',
        'konum': 'Hatay',
        'girişÜcreti': 'Ücretsiz',
        'bilgi':
            'Geniş tarım alanları ve kuş gözlem alanları ile doğa severlere hitap eder.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Akdeniz Bölgesi’nin güneydoğusunda, Suriye sınırında yer alır.',
      },
      {
        'ad': 'Nüfus',
        'detay':
            '2023 TÜİK verilerine göre yaklaşık 1.7 milyon nüfusa sahiptir.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Akdeniz iklimi; yazlar sıcak ve kurak, kışlar ılık ve yağışlıdır.',
      },
      {
        'ad': 'Ekonomi',
        'detay':
            'Tarım, ticaret ve sınır ticareti ekonominin ana dayanaklarıdır.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay':
            'Çok kültürlü yapısı ve zengin tarihi ile özellikle mozaik ve mutfağıyla ünlüdür.',
      },
    ],
  },

  'Isparta': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Isparta Müzesi',
        'kuruluşYılı': '1985',
        'önem': 'Bölgede çıkarılan tarihî eserleri sergiler.',
      },
    ],
    'Gezilecek Yerler': [
      {'ad': 'Yalvaç Pisidia Antik Kenti', 'tip': 'Antik Kent'},
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Gül Lokantası',
        'tip': 'Restoran',
        'yemekler': 'Isparta güllü tatlıları',
      },
    ],
    'Doğa ve Parklar': [
      {'ad': 'Egirdir Gölü', 'tip': 'Doğal Göl'},
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Akdeniz Bölgesi’nin iç kesiminde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 440.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim özellikleri gösterir.'},
    ],
  },

  'Mersin': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Mersin Müzesi',
        'kuruluşYılı': '1982',
        'önem': 'Tarihî eserleri ve etnografik koleksiyonları barındırır.',
      },
    ],
    'Gezilecek Yerler': [
      {'ad': 'Kızkalesi', 'tip': 'Tarihî Kale'},
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Deniz Restaurant',
        'tip': 'Restoran',
        'yemekler': 'Deniz ürünleri',
      },
    ],
    'Doğa ve Parklar': [
      {'ad': 'Narlıkuyu', 'tip': 'Doğal Güzellik'},
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Akdeniz Bölgesi’nde sahil şehri.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 1.8 milyon.'},
      {'ad': 'İklim', 'detay': 'Akdeniz iklimi hakim.'},
    ],
  },

  'İstanbul': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'İstanbul Arkeoloji Müzesi',
        'kuruluşYılı': '1891',
        'önem': 'Türkiye’nin en büyük ve en önemli arkeoloji müzesi.',
      },
    ],
    'Gezilecek Yerler': [
      {'ad': 'Ayasofya', 'tip': 'Tarihî Cami/Müze'},
      {'ad': 'Topkapı Sarayı', 'tip': 'Tarihî Saray'},
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Sultanahmet Köftecisi',
        'tip': 'Restoran',
        'yemekler': 'Köfte, Türk mutfağı',
      },
    ],
    'Doğa ve Parklar': [
      {'ad': 'Gülhane Parkı', 'tip': 'Şehir Parkı'},
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Marmara Bölgesi’nde, Asya ve Avrupa kıtalarını birleştiren şehir.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 16 milyon.'},
      {
        'ad': 'İklim',
        'detay': 'Geçiş iklimi, ılıman deniz iklimi özellikleri.',
      },
    ],
  },

  'İzmir': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'İzmir Arkeoloji Müzesi',
        'kuruluşYılı': '1927',
        'önem': 'Ege Bölgesi’nin önemli arkeoloji müzesi.',
      },
    ],
    'Gezilecek Yerler': [
      {'ad': 'Efes Antik Kenti', 'tip': 'Antik Kent'},
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Kemeraltı Çarşısı',
        'tip': 'Yiyecek Mekanı',
        'yemekler': 'Deniz ürünleri, zeytinyağlılar',
      },
    ],
    'Doğa ve Parklar': [
      {'ad': 'Kordon Boyu', 'tip': 'Sahil Parkı'},
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Ege Bölgesi’nde sahil şehri.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 4.3 milyon.'},
      {'ad': 'İklim', 'detay': 'Akdeniz iklimi.'},
    ],
  },

  'Kars': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kars Müzesi',
        'kuruluşYılı': '1990',
        'önem': 'Bölgede çıkan tarihî eserleri sergiler.',
      },
    ],
    'Gezilecek Yerler': [
      {'ad': 'Ani Harabeleri', 'tip': 'Tarihî Antik Kent'},
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Kaşarci Restoran',
        'tip': 'Restoran',
        'yemekler': 'Kars kaşarı, et yemekleri',
      },
    ],
    'Doğa ve Parklar': [
      {'ad': 'Çıldır Gölü', 'tip': 'Doğal Göl'},
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Doğu Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 280.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim, sert kışlar.'},
    ],
  },
  'Kastamonu': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kastamonu Müzesi',
        'kuruluşYılı': '1966',
        'önem':
            'Tarihî eserlerin ve etnografik koleksiyonların sergilendiği müze.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Kastamonu Kalesi',
        'tip': 'Tarihî Kale',
        'bilgi': 'Şehrin simgelerinden biri.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Taşköprü Restoran',
        'tip': 'Restoran',
        'yemekler': 'Et ve yöresel yemekler',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Ilgaz Dağı Milli Parkı',
        'tip': 'Doğa Parkı',
        'bilgi': 'Kayak ve doğa yürüyüşü için uygun alanlar.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Karadeniz Bölgesi’nin batısında yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 380.000.'},
      {'ad': 'İklim', 'detay': 'Karadeniz iklimi; bol yağışlı, ılıman.'},
    ],
  },

  'Kayseri': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kayseri Arkeoloji Müzesi',
        'kuruluşYılı': '1960',
        'önem': 'Bölgede bulunan çok sayıda arkeolojik eseri barındırır.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Erciyes Dağı',
        'tip': 'Dağ ve Kayak Merkezi',
        'bilgi': 'Kayseri’nin doğal simgelerinden.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Çemen Restaurant',
        'tip': 'Restoran',
        'yemekler': 'Mantı, pastırma',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Sultan Sazlığı Milli Parkı',
        'tip': 'Doğal Koruma Alanı',
        'bilgi': 'Göçmen kuşların uğrak yeri.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'İç Anadolu Bölgesi’nde stratejik konumda.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 1.4 milyon.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; kışlar soğuk, yazlar sıcak.'},
    ],
  },

  'Kırklareli': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kırklareli Müzesi',
        'kuruluşYılı': '1980',
        'önem': 'Etnografik ve arkeolojik eserleri içerir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Dupnisa Mağarası',
        'tip': 'Doğal Mağara',
        'bilgi': 'Bölgenin önemli doğal güzelliği.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Lüleburgaz Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Trakya mutfağı, et yemekleri',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'İğneada Longoz Ormanları',
        'tip': 'Doğal Alan',
        'bilgi': 'Türkiye’nin önemli sulak alanlarından biri.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Trakya Bölgesi’nde, Bulgaristan sınırına yakın.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 350.000.'},
      {
        'ad': 'İklim',
        'detay': 'Karadeniz iklimi etkisinde, ılıman ve yağışlı.',
      },
    ],
  },

  'Kırşehir': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kırşehir Müzesi',
        'kuruluşYılı': '1985',
        'önem': 'Tarihî ve kültürel eserlerin sergilendiği müze.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Cacabey Medresesi',
        'tip': 'Tarihî Yapı',
        'bilgi': 'Selçuklu döneminden kalma önemli bir eğitim kurumu.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Çiçek Restoran',
        'tip': 'Restoran',
        'yemekler': 'Anadolu mutfağı',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kaman Kalehöyük',
        'tip': 'Tarihî Kazı Alanı',
        'bilgi': 'Hitit ve Frig dönemlerine ait eserler.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'İç Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 250.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim özellikleri gösterir.'},
    ],
  },

  'Kocaeli': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kocaeli Müzesi',
        'kuruluşYılı': '1980',
        'önem': 'Sanayi ve tarihî eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Ballıkayalar Tabiat Parkı',
        'tip': 'Doğa Parkı',
        'bilgi': 'Doğa yürüyüşü ve tırmanış için popüler alan.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Gebze Balıkçısı',
        'tip': 'Restoran',
        'yemekler': 'Deniz ürünleri',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Seka Park',
        'tip': 'Şehir Parkı',
        'bilgi': 'Şehrin en büyük parklarından biri.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Marmara Bölgesi’nde, İstanbul’a yakın önemli sanayi şehri.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 2 milyon.'},
      {
        'ad': 'İklim',
        'detay': 'Geçiş iklimi, ılıman deniz iklimi özellikleri.',
      },
    ],
  },
  'Konya': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Konya Arkeoloji Müzesi',
        'kuruluşYılı': '1962',
        'önem':
            'Bölgede bulunan Selçuklu ve Anadolu uygarlıklarına ait eserleri sergiler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Mevlana Müzesi',
        'tip': 'Müze ve Türbe',
        'bilgi': 'Mevlana Celaleddin Rumi’nin türbesi ve dergahı.',
      },
      {
        'ad': 'Alaeddin Tepesi',
        'tip': 'Tarihî Tepesi',
        'bilgi': 'Selçuklu dönemine ait kalıntılar.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Somatçı Fihi Ma Fih',
        'tip': 'Restoran',
        'yemekler': 'Etli ekmek, bamya çorbası',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Karatay Botanik Parkı',
        'tip': 'Botanik Park',
        'bilgi': 'Şehir içinde doğal yaşam alanı.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'İç Anadolu Bölgesi’nde geniş bir yüzölçümüne sahip şehir.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 2.2 milyon.'},
      {
        'ad': 'İklim',
        'detay':
            'Karasal iklim; kışları soğuk ve kar yağışlı, yazları sıcak ve kurak.',
      },
    ],
  },

  'Kütahya': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kütahya Müzesi',
        'kuruluşYılı': '1950',
        'önem': 'Seramik ve arkeolojik eserler açısından zengin.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Çinili Cami',
        'tip': 'Tarihî Cami',
        'bilgi': '15. yüzyıldan kalma, çinilerle süslü.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Porsuk Çayı Kenarı Restoranları',
        'tip': 'Restoran',
        'yemekler': 'Kütahya mutfağı, çömlek kebabı',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Porsuk Çayı',
        'tip': 'Doğa Alanı',
        'bilgi': 'Şehir içinde dinlenme alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Ege Bölgesi’nin iç kesiminde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 580.000.'},
      {'ad': 'İklim', 'detay': 'Geçiş iklimi; kışlar soğuk, yazlar sıcak.'},
    ],
  },

  'Malatya': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Malatya Müzesi',
        'kuruluşYılı': '1975',
        'önem':
            'Hititler ve diğer Anadolu uygarlıklarına ait eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Arslantepe Höyüğü',
        'tip': 'Arkeolojik Alan',
        'bilgi': 'Dünyanın en eski yerleşim yerlerinden biri.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Malatya Mutfağı Restoranları',
        'tip': 'Restoran',
        'yemekler': 'Kayısı ürünleri, et yemekleri',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Orduzu Pınarbaşı Mesire Alanı',
        'tip': 'Doğa Alanı',
        'bilgi': 'Doğa yürüyüşü ve piknik alanı.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Doğu Anadolu ve İç Anadolu Bölgeleri sınırında yer alır.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 800.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; kışlar soğuk, yazlar sıcak.'},
    ],
  },

  'Manisa': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Manisa Müzesi',
        'kuruluşYılı': '1980',
        'önem': 'Lidya ve Roma dönemine ait eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Spil Dağı Milli Parkı',
        'tip': 'Milli Park',
        'bilgi': 'Doğa yürüyüşü ve piknik alanları.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Saray Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Manisa kebabı, zeytinyağlılar',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Manisa Mesire Alanları',
        'tip': 'Doğa Alanı',
        'bilgi': 'Çeşitli mesire ve dinlenme alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Ege Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 1.4 milyon.'},
      {
        'ad': 'İklim',
        'detay': 'Akdeniz iklimi; yazlar sıcak ve kurak, kışlar ılıman.',
      },
    ],
  },

  'Kahramanmaraş': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kahramanmaraş Müzesi',
        'kuruluşYılı': '1960',
        'önem': 'Roma ve Hitit dönemlerine ait eserler barındırır.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Dulkadiroğlu Kervansarayı',
        'tip': 'Tarihî Yapı',
        'bilgi': 'Selçuklu döneminden kalma kervansaray.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Maraş Dondurmacıları',
        'tip': 'Kafe',
        'yemekler': 'Meşhur Maraş dondurması',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kahramanmaraş Yaylaları',
        'tip': 'Doğa Alanı',
        'bilgi': 'Yaz aylarında serin yayla alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Akdeniz Bölgesi’nin doğusunda İç Anadolu’ya geçişte yer alır.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 1.2 milyon.'},
      {'ad': 'İklim', 'detay': 'Karasal ve Akdeniz iklimi karışımı.'},
    ],
  },

  'Mardin': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Mardin Müzesi',
        'kuruluşYılı': '1995',
        'önem': 'Mezopotamya uygarlıklarına ait eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Mardin Eski Şehir',
        'tip': 'Tarihî Bölge',
        'bilgi': 'Taş mimarisi ve dar sokaklarıyla ünlüdür.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Mardin Mutfağı Restoranları',
        'tip': 'Restoran',
        'yemekler': 'Kebap, içli köfte, Mezopotamya mutfağı',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Deyrulzafaran Manastırı',
        'tip': 'Tarihî ve Doğa Alanı',
        'bilgi': 'Tarihi Süryani manastırı.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Güneydoğu Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 850.000.'},
      {'ad': 'İklim', 'detay': 'Yarı kurak iklim.'},
    ],
  },

  'Muğla': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Muğla Müzesi',
        'kuruluşYılı': '1972',
        'önem': 'Bölge tarihine ait önemli eserler barındırır.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Bodrum Kalesi',
        'tip': 'Tarihî Kale',
        'bilgi': 'Ortaçağdan kalma önemli bir yapı.',
      },
      {
        'ad': 'Fethiye Ölüdeniz',
        'tip': 'Doğal Plaj',
        'bilgi': 'Türkiye’nin en güzel plajlarından.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Muğla Balıkçıları',
        'tip': 'Restoran',
        'yemekler': 'Taze deniz ürünleri',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Saklıkent Kanyonu',
        'tip': 'Doğa Alanı',
        'bilgi': 'Türkiye’nin en uzun kanyonlarından biri.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Ege Bölgesi’nin güneyinde, sahil şehri.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 1 milyon.'},
      {
        'ad': 'İklim',
        'detay': 'Akdeniz iklimi; yazları sıcak ve kurak, kışları ılıman.',
      },
    ],
  },

  'Muş': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Muş Müzesi',
        'kuruluşYılı': '1980',
        'önem': 'Doğu Anadolu kültürüne ait eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Muş Kalesi',
        'tip': 'Tarihî Kale',
        'bilgi': 'Tarihi savunma yapısı.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Muş Yöresel Yemekleri',
        'tip': 'Restoran',
        'yemekler': 'Etli yemekler, ayran çorbası',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Nemrut Dağı Milli Parkı',
        'tip': 'Milli Park',
        'bilgi': 'Doğa yürüyüşü ve dağcılık için ideal.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Doğu Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 400.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; kışları sert, yazları ılıman.'},
    ],
  },
  'Nevşehir': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Nevşehir Müzesi',
        'kuruluşYılı': '1987',
        'önem': 'Kapadokya bölgesine ait tarihi eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Göreme Açık Hava Müzesi',
        'tip': 'Tarihî ve Doğal Alan',
        'bilgi':
            'Kapadokya’nın en önemli kaya oyma kiliseleri ve manastırları.',
      },
      {
        'ad': 'Uçhisar Kalesi',
        'tip': 'Tarihî Kale',
        'bilgi': 'Kapadokya bölgesinin en yüksek noktası.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Kapadokya Mutfağı Restoranları',
        'tip': 'Restoran',
        'yemekler': 'Testi kebabı, çömlek fasulye',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Ihlara Vadisi',
        'tip': 'Doğa Alanı',
        'bilgi': 'Doğa yürüyüşü ve tarihi kiliselerle dolu vadidir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Kapadokya bölgesinde İç Anadolu Bölgesi’nde yer alır.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 320.000.'},
      {
        'ad': 'İklim',
        'detay': 'Karasal iklim; kışları soğuk ve kar yağışlı, yazları sıcak.',
      },
    ],
  },

  'Niğde': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Niğde Müzesi',
        'kuruluşYılı': '1983',
        'önem': 'Hititler ve Roma dönemine ait eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Tyana Antik Kenti',
        'tip': 'Arkeolojik Alan',
        'bilgi': 'Roma dönemine ait tarihi kalıntılar.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Niğde Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Etli ekmek, erişte, patatesli börek',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Aladağlar Milli Parkı',
        'tip': 'Milli Park',
        'bilgi': 'Doğa yürüyüşü ve dağcılık için popüler alan.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'İç Anadolu Bölgesi’nin güneyinde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 360.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; yazları sıcak, kışları soğuk.'},
    ],
  },

  'Ordu': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Ordu Müzesi',
        'kuruluşYılı': '1988',
        'önem': 'Karadeniz bölgesine ait arkeolojik ve etnografik eserler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Boztepe',
        'tip': 'Doğa ve Manzara',
        'bilgi': 'Ordu şehrinin panoramik manzarası.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Ordu Balıkçısı',
        'tip': 'Restoran',
        'yemekler': 'Deniz ürünleri, hamsi',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Çambaşı Yaylası',
        'tip': 'Yayla',
        'bilgi': 'Yayla turizmi ve doğa yürüyüşleri için ideal.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Karadeniz Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 750.000.'},
      {'ad': 'İklim', 'detay': 'Karadeniz iklimi; bol yağışlı, ılıman kışlar.'},
    ],
  },

  'Rize': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Rize Müzesi',
        'kuruluşYılı': '1993',
        'önem': 'Doğu Karadeniz kültürüne ait eserler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Zilkale',
        'tip': 'Tarihî Kale',
        'bilgi': 'Fırtına Vadisi’nde bulunan ortaçağ kalesi.',
      },
      {
        'ad': 'Ayder Yaylası',
        'tip': 'Doğa Yaylası',
        'bilgi': 'Termal kaynakları ve yeşil doğasıyla meşhur.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Rize Çay Bahçeleri',
        'tip': 'Kafe',
        'yemekler': 'Çay ve yöresel tatlar',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Fırtına Vadisi',
        'tip': 'Doğa Alanı',
        'bilgi': 'Doğa sporları ve rafting için ideal.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Karadeniz Bölgesi’nin doğusunda yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 350.000.'},
      {
        'ad': 'İklim',
        'detay': 'Karadeniz iklimi; yıl boyunca yağışlı ve nemli.',
      },
    ],
  },

  'Sakarya': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Sakarya Müzesi',
        'kuruluşYılı': '1983',
        'önem': 'Bölgede bulunan Bizans ve Osmanlı eserleri.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Sapanca Gölü',
        'tip': 'Doğal Göl',
        'bilgi': 'Hafta sonu dinlenme ve su sporları alanı.',
      },
      {
        'ad': 'Taraklı',
        'tip': 'Tarihî İlçe',
        'bilgi': 'Osmanlı dönemi mimarisi ve geleneksel evleri.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Sakarya Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Pişmaniye, balık',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Sakarya Nehri',
        'tip': 'Doğa Alanı',
        'bilgi': 'Nehrin çevresinde yürüyüş ve piknik alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Marmara Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 1 milyon.'},
      {'ad': 'İklim', 'detay': 'Geçiş iklimi; yazları sıcak, kışları ılıman.'},
    ],
  },

  'Samsun': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Samsun Arkeoloji ve Etnografya Müzesi',
        'kuruluşYılı': '1939',
        'önem': 'Karadeniz bölgesinin tarihi eserleri sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Bandırma Vapuru',
        'tip': 'Müze Gemi',
        'bilgi': 'Atatürk’ün Samsun’a çıktığı gemi replikası.',
      },
      {
        'ad': 'Amisos Tepesi',
        'tip': 'Tarihî ve Doğa Alanı',
        'bilgi': 'Samsun’un panoramik manzarası.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Samsun Balıkçısı',
        'tip': 'Restoran',
        'yemekler': 'Hamsi, Karadeniz mutfağı',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kavak Kuş Cenneti',
        'tip': 'Doğa Koruma Alanı',
        'bilgi': 'Kuş gözlem ve doğa yürüyüşü alanı.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Karadeniz Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 1.3 milyon.'},
      {'ad': 'İklim', 'detay': 'Karadeniz iklimi; bol yağışlı ve ılıman.'},
    ],
  },

  'Siirt': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Siirt Müzesi',
        'kuruluşYılı': '1995',
        'önem': 'Doğu Anadolu kültürüne ait eserler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Ulu Cami',
        'tip': 'Tarihî Cami',
        'bilgi': 'Osmanlı döneminden kalma önemli bir ibadethane.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Siirt Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Perde pilavı, büryan kebabı',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Şeyhan Dağı',
        'tip': 'Doğa Alanı',
        'bilgi': 'Doğa yürüyüşü için elverişli alan.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Güneydoğu Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 330.000.'},
      {'ad': 'İklim', 'detay': 'Karasal ve yarı kurak iklim özellikleri.'},
    ],
  },

  'Sinop': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Sinop Müzesi',
        'kuruluşYılı': '1982',
        'önem': 'Karadeniz’in tarihî eserlerini barındırır.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Sinop Cezaevi Müzesi',
        'tip': 'Müze',
        'bilgi': 'Tarihi cezaevi binası müzeye dönüştürülmüştür.',
      },
      {
        'ad': 'Hamsilos Koyu',
        'tip': 'Doğa Alanı',
        'bilgi': 'Türkiye’nin tek fiyordu.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Sinop Balık Lokantaları',
        'tip': 'Restoran',
        'yemekler': 'Taze balık, Karadeniz mutfağı',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Hamsilos Tabiat Parkı',
        'tip': 'Tabiat Parkı',
        'bilgi': 'Deniz ve orman manzarası sunar.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Karadeniz Bölgesi’nin en kuzey ucu.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 65.000.'},
      {'ad': 'İklim', 'detay': 'Karadeniz iklimi; yıl boyunca yağışlı.'},
    ],
  },

  'Sivas': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Sivas Arkeoloji Müzesi',
        'kuruluşYılı': '1984',
        'önem': 'Anadolu uygarlıklarına ait eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Divriği Ulu Camii ve Darüşşifası',
        'tip': 'UNESCO Dünya Mirası',
        'bilgi': '12. yüzyıla ait tarihi camii ve hastane.',
      },
      {
        'ad': 'Sivas Kalesi',
        'tip': 'Tarihî Kale',
        'bilgi': 'Şehrin simgelerinden biridir.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Sivas Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Etli ekmek, madımak, katmer',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Gökpınar Gölü',
        'tip': 'Doğa Alanı',
        'bilgi': 'Temiz ve sakin bir doğa gölü.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'İç Anadolu Bölgesi’nin doğusunda yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 620.000.'},
      {
        'ad': 'İklim',
        'detay': 'Karasal iklim; yazları sıcak, kışları soğuk ve kar yağışlı.',
      },
    ],
  },

  'Tekirdağ': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Tekirdağ Müzesi',
        'kuruluşYılı': '1967',
        'önem': 'Trakya bölgesi arkeolojik ve etnografik eserleri.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Şarköy',
        'tip': 'Plaj ve Tatil Bölgesi',
        'bilgi': 'Uzun sahilleri ve şarap bağları ile ünlüdür.',
      },
      {
        'ad': 'Rakoczi Müzesi',
        'tip': 'Müze',
        'bilgi': 'Macar prens II. Rákóczi Ferenc’in anısına yapılmıştır.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Tekirdağ Köftecileri',
        'tip': 'Restoran',
        'yemekler': 'Tekirdağ köftesi, yoğurtlu kebap',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Hoşköy Bağları',
        'tip': 'Doğa Alanı',
        'bilgi': 'Üzüm bağları ve bağcılık faaliyetleri.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Marmara Bölgesi’nde, Marmara Denizi kıyısında.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 1 milyon.'},
      {'ad': 'İklim', 'detay': 'Geçiş iklimi; yazları sıcak, kışları ılıman.'},
    ],
  },
  'Tokat': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Tokat Müzesi',
        'kuruluşYılı': '1971',
        'önem': 'Hitit, Roma, Bizans dönemlerine ait eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Tokat Kalesi',
        'tip': 'Tarihi Kale',
        'bilgi':
            'Şehri kuşbakışı izleyebileceğiniz Osmanlı döneminden kalma kale.',
      },
      {
        'ad': 'Ballıca Mağarası',
        'tip': 'Doğal Mağara',
        'bilgi': 'Türkiye’nin en büyük ve en güzel mağaralarından biri.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Tokat Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Tokat kebabı, zile pekmezi, baklava',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Reşadiye Ormanları',
        'tip': 'Orman Alanı',
        'bilgi': 'Yürüyüş ve piknik için ideal doğa alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Karadeniz Bölgesi’nin İç Anadolu’ya sınırı olan şehri.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 600.000.'},
      {
        'ad': 'İklim',
        'detay':
            'Karadeniz iklimi ile karasal iklim arasında geçiş özellikleri.',
      },
    ],
  },

  'Trabzon': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Trabzon Arkeoloji Müzesi',
        'kuruluşYılı': '1999',
        'önem': 'Trabzon ve çevresinin tarihini yansıtan eserler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Sümela Manastırı',
        'tip': 'Tarihî Manastır',
        'bilgi':
            'Maçka ilçesinde, sarp kayalıklara inşa edilmiş ikonik manastır.',
      },
      {
        'ad': 'Atatürk Köşkü',
        'tip': 'Müze',
        'bilgi': 'Atatürk’ün Trabzon ziyareti sırasında kaldığı tarihi köşk.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Trabzon Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Hamsi, kuymak, mısır ekmeği',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Uzungöl',
        'tip': 'Doğa Gölü',
        'bilgi': 'Muhteşem doğası ve yaylalarıyla ünlü turistik göl.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Karadeniz Bölgesi’nin doğusunda, Karadeniz kıyısında.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 800.000.'},
      {
        'ad': 'İklim',
        'detay': 'Karadeniz iklimi; yıl boyunca yağışlı ve nemli.',
      },
    ],
  },

  'Tunceli': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Tunceli Müzesi',
        'kuruluşYılı': '1986',
        'önem': 'Bölgede bulunan kültürel ve tarihî eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Munzur Vadisi Milli Parkı',
        'tip': 'Milli Park',
        'bilgi':
            'Türkiye’nin en büyük milli parklarından biri, doğal güzelliklerle dolu.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Tunceli Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Keşkek, mırra, sac kavurma',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Munzur Dağları',
        'tip': 'Doğa Alanı',
        'bilgi': 'Doğa yürüyüşü ve kampçılık için tercih edilir.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Doğu Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 85.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; sert kışlar, serin yazlar.'},
    ],
  },

  'Şanlıurfa': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Şanlıurfa Arkeoloji Müzesi',
        'kuruluşYılı': '1983',
        'önem': 'Göbekli Tepe ve çevresinden çıkan eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Göbekli Tepe',
        'tip': 'Tarihî Alan',
        'bilgi': 'Dünyanın bilinen en eski tapınağı.',
      },
      {
        'ad': 'Balıklıgöl',
        'tip': 'Doğal Göl',
        'bilgi': 'Efsaneleriyle ünlü kutsal göl.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Şanlıurfa Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Çiğ köfte, içli köfte, lahmacun',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Halfeti',
        'tip': 'Doğa Alanı',
        'bilgi': 'Sular altında kalan eski köy ve doğal güzellikler.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Güneydoğu Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 2 milyon.'},
      {'ad': 'İklim', 'detay': 'Sıcak ve kurak yazlar, ılıman kışlar.'},
    ],
  },

  'Uşak': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Uşak Arkeoloji Müzesi',
        'kuruluşYılı': '1970',
        'önem': 'Truva ve çevresinden bulunan eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Uşak Kalesi',
        'tip': 'Tarihi Kale',
        'bilgi': 'Şehre hakim eski kale.',
      },
      {
        'ad': 'Clandıras Şelalesi',
        'tip': 'Doğal Şelale',
        'bilgi': 'Doğa yürüyüşü için popüler yer.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Uşak Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Uşak köftesi, keşkek, bulgur pilavı',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Uşak Ormanları',
        'tip': 'Orman Alanı',
        'bilgi': 'Doğa yürüyüşü ve piknik alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Ege Bölgesi’nin doğusunda yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 370.000.'},
      {
        'ad': 'İklim',
        'detay': 'Akdeniz iklimi etkisi, sıcak yazlar, ılıman kışlar.',
      },
    ],
  },

  'Yozgat': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Yozgat Müzesi',
        'kuruluşYılı': '1974',
        'önem': 'Hitit ve Roma dönemine ait eserler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Yozgat Kalesi',
        'tip': 'Tarihî Kale',
        'bilgi': 'Şehir merkezinde yer alan tarihi yapı.',
      },
      {
        'ad': 'Çamlık Milli Parkı',
        'tip': 'Milli Park',
        'bilgi': 'Doğa yürüyüşü ve piknik için ideal.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Yozgat Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Yozgat kebabı, mantı, erişte',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Çamlık Milli Parkı',
        'tip': 'Doğa Alanı',
        'bilgi': 'Geniş çam ormanları ve yürüyüş alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'İç Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 420.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; sıcak yazlar, soğuk kışlar.'},
    ],
  },

  'Zonguldak': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Zonguldak Müzesi',
        'kuruluşYılı': '1985',
        'önem': 'Kömür madenciliği ve bölge tarihine dair eserler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Filyos Plajı',
        'tip': 'Plaj',
        'bilgi': 'Deniz ve kum keyfi için popüler alan.',
      },
      {
        'ad': 'Gökgöl Mağarası',
        'tip': 'Doğal Mağara',
        'bilgi': 'Türkiye’nin önemli mağaralarından biri.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Zonguldak Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Kömür kebabı, hamsi tava',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kozlu Ormanları',
        'tip': 'Orman Alanı',
        'bilgi': 'Yürüyüş ve piknik alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'Karadeniz Bölgesi’nde, deniz kıyısında.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 600.000.'},
      {'ad': 'İklim', 'detay': 'Karadeniz iklimi; yıl boyunca yağışlı.'},
    ],
  },

  'Aksaray': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Aksaray Müzesi',
        'kuruluşYılı': '1986',
        'önem': 'Kapadokya bölgesine ait arkeolojik eserler.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Ihlara Vadisi',
        'tip': 'Doğa ve Tarih',
        'bilgi': 'Yürüyüş yolları ve kaya kiliseleri ile ünlü.',
      },
      {
        'ad': 'Aksaray Kalesi',
        'tip': 'Tarihi Kale',
        'bilgi': 'Şehri koruyan eski kale.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Aksaray Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Testi kebabı, çömlek fasulye',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Hasandağı Doğa Alanı',
        'tip': 'Doğa Alanı',
        'bilgi': 'Dağcılık ve doğa sporları için ideal.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'İç Anadolu Bölgesi’nde, Kapadokya bölgesine yakın.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 430.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; sıcak yazlar, soğuk kışlar.'},
    ],
  },

  'Bayburt': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Bayburt Müzesi',
        'kuruluşYılı': '1998',
        'önem': 'Bölge tarihini yansıtan eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Bayburt Kalesi',
        'tip': 'Tarihi Kale',
        'bilgi': 'Şehir merkezinde yer alan eski kale.',
      },
      {
        'ad': 'Aydıntepe Yeraltı Şehri',
        'tip': 'Yeraltı Şehri',
        'bilgi': 'Tarihi yeraltı yapıları.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Bayburt Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Etli ekmek, mıhlama',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Bayburt Doğa Alanları',
        'tip': 'Doğa Alanı',
        'bilgi': 'Yürüyüş ve doğa sporları için uygun alanlar.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Karadeniz Bölgesi’nin güneydoğusunda yer alır.',
      },
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 80.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; kışları soğuk, yazları ılık.'},
    ],
  },

  'Karaman': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Karaman Müzesi',
        'kuruluşYılı': '1988',
        'önem': 'Bölgede bulunan tarihî eserler sergilenir.',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Karaman Kalesi',
        'tip': 'Tarihi Kale',
        'bilgi': 'Şehrin simgelerinden.',
      },
      {
        'ad': 'Binbir Kilise',
        'tip': 'Tarihi Kilise',
        'bilgi': 'Erken dönem Hristiyan yapısı.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Karaman Mutfağı',
        'tip': 'Restoran',
        'yemekler': 'Etli ekmek, sac kebabı',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Karaman Doğa Alanları',
        'tip': 'Doğa Alanı',
        'bilgi': 'Yürüyüş ve piknik alanları.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {'ad': 'Konum', 'detay': 'İç Anadolu Bölgesi’nde yer alır.'},
      {'ad': 'Nüfus', 'detay': 'Yaklaşık 250.000.'},
      {'ad': 'İklim', 'detay': 'Karasal iklim; yazları sıcak, kışları soğuk.'},
    ],
  },
  'Kilis': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Kilis Müzesi',
        'kuruluşYılı': '1990',
        'önem': 'Hitit, Roma ve Osmanlı dönemlerine ait eserler.',
        'adres': 'Merkez, Kilis',
        'telefon': '+90 348 412 3456',
        'web': 'http://kilismuzesi.gov.tr',
        'bilgi': 'Bölgenin tarihî kültürünü yansıtır.',
        'ziyaretSaatleri': '08:30 - 16:30',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Savrun Kanyonu',
        'tip': 'Doğa',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi': 'Doğa yürüyüşleri ve fotoğrafçılık için tercih edilir.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Kilis Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Yöresel yemekler, etli ve hamur işleri',
        'fiyat': 'Orta',
        'bilgi': 'Kilis mutfağının özgün tatlarını sunar.',
        'adres': 'Merkez, Kilis',
        'telefon': '+90 348 412 7890',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Dulkadiroğlu Parkı',
        'tip': 'Park',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Dinlenme ve yürüyüş alanı.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Güneydoğu Anadolu Bölgesi’nde, Suriye sınırına yakın yer alır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 140.000 nüfuslu.',
      },
      {
        'ad': 'İklim',
        'detay':
            'Akdeniz ve karasal iklim karışımı, yazları sıcak, kışları ılımandır.',
      },
      {
        'ad': 'Ekonomi',
        'detay': 'Tarım ve sınır ticareti ekonominin temelini oluşturur.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay': 'Çeşitli medeniyetlerin etkileriyle zengin kültürel yapı.',
      },
    ],
  },

  'Osmaniye': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Osmaniye Müzesi',
        'kuruluşYılı': '2006',
        'önem': 'Osmaniye ve çevresinin tarihî eserleri.',
        'koleksiyon': 'Hitit, Roma ve Osmanlı dönemlerine ait eserler.',
        'adres': 'Merkez, Osmaniye',
        'telefon': '+90 328 412 3456',
        'web': 'http://osmaniyemuzesi.gov.tr',
        'bilgi': 'Bölge tarihini yansıtan önemli kültürel merkez.',
        'ziyaretSaatleri': '08:30 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Harun Reşit Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi': 'Tarihî ve turistik önemli bir yapı.',
      },
      {
        'ad': 'Toprakkale Kalesi',
        'tip': 'Tarihî Kale',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Toprakkale',
        'bilgi': 'Tarihi önem taşıyan kale.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Osmaniye Sofrası',
        'tip': 'Restoran',
        'yemekler': 'Yöresel yemekler, etli ve sebze yemekleri',
        'fiyat': 'Orta',
        'bilgi': 'Lezzetli yöresel tatlar sunar.',
        'adres': 'Merkez, Osmaniye',
        'telefon': '+90 328 412 7890',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Kazdağı Parkı',
        'tip': 'Doğa Parkı',
        'konum': 'Osmaniye',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Doğa yürüyüşü ve piknik alanı.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay': 'Akdeniz Bölgesi’nde, Adana ve Gaziantep arasında yer alır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 550.000 nüfuslu.',
      },
      {
        'ad': 'İklim',
        'detay': 'Akdeniz iklimi, sıcak yazlar ve ılık kışlar görülür.',
      },
      {'ad': 'Ekonomi', 'detay': 'Tarım, sanayi ve ticaret gelişmiştir.'},
      {
        'ad': 'Tarih ve Kültür',
        'detay': 'Zengin kültürel miras ve tarihî eserler bulunur.',
      },
    ],
  },

  'Düzce': {
    'Arkeolojik Müzeler': [
      {
        'ad': 'Düzce Müzesi',
        'kuruluşYılı': '2000',
        'önem': 'Düzce ve çevresinin arkeolojik eserleri.',
        'koleksiyon': 'Roma, Bizans ve Osmanlı dönemlerinden eserler.',
        'adres': 'Merkez, Düzce',
        'telefon': '+90 380 412 3456',
        'web': 'http://duzcemuzesi.gov.tr',
        'bilgi': 'Bölgenin tarihî ve kültürel zenginliklerini sergiler.',
        'ziyaretSaatleri': '09:00 - 17:00',
        'girişÜcreti': 'Ücretsiz',
      },
    ],
    'Gezilecek Yerler': [
      {
        'ad': 'Samandere Şelalesi',
        'tip': 'Doğa',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Samandere Köyü',
        'bilgi': 'Türkiye’nin doğal güzelliklerinden biridir.',
      },
      {
        'ad': 'Gölkay Parkı',
        'tip': 'Park',
        'girişÜcreti': 'Ücretsiz',
        'konum': 'Merkez',
        'bilgi': 'Ailelerin tercih ettiği dinlenme alanı.',
      },
    ],
    'Yeme İçme Mekanları': [
      {
        'ad': 'Düzce Kebapçısı',
        'tip': 'Restoran',
        'yemekler': 'Kebap ve yöresel yemekler',
        'fiyat': 'Orta',
        'bilgi': 'Lezzetli kebaplarıyla ünlf5üdür.',
        'adres': 'Merkez, Düzce',
        'telefon': '+90 380 412 7890',
      },
    ],
    'Doğa ve Parklar': [
      {
        'ad': 'Gölkay Parkı',
        'tip': 'Park',
        'konum': 'Merkez',
        'girişÜcreti': 'Ücretsiz',
        'bilgi': 'Yürüyüş ve dinlenme alanı.',
      },
    ],
    'Konumu ve Genel Özellikleri': [
      {
        'ad': 'Konum',
        'detay':
            'Marmara Bölgesi’nde, Karadeniz ve İç Anadolu arasında yer alır.',
      },
      {
        'ad': 'Nüfus',
        'detay': '2023 TÜİK verilerine göre yaklaşık 390.000 nüfuslu.',
      },
      {'ad': 'İklim', 'detay': 'Karadeniz iklimi özellikleri taşır, nemlidir.'},
      {
        'ad': 'Ekonomi',
        'detay': 'Sanayi, tarım ve ticaret ekonomide ön plandadır.',
      },
      {
        'ad': 'Tarih ve Kültür',
        'detay': 'Doğal güzellikler ve tarihî eserler açısından zengindir.',
      },
    ],
  },
};

// ... Diğer şehirler buraya eklenecektir.
// Örn: 'İstanbul', 'Ankara', 'İzmir' gibi.
// Her bir şehir için yukarıdaki yapıya uygun detaylı bilgileri girmeyi unutmayın.

class _IlDetaySayfasiState extends State<IlDetaySayfasi>
    with SingleTickerProviderStateMixin {
  late String secilenKategori; // initState içinde başlatılacak
  String aramaKelimesi = '';
  Map<String, List<String>> yorumlar = {}; // Yorumlar haritası
  final TextEditingController _yorumController =
      TextEditingController(); // Yorum inputu için controller

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Varsayılan kategoriyi il bilgisi varsa ayarla
    final detaylar = sehirBilgileri[widget.il];
    secilenKategori = detaylar?.keys.first ?? 'Konumu ve Genel Özellikleri';

    _initializeYorumlar(); // Tüm mekanlar için boş yorum listelerini oluştur

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: -1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.repeat();
  }

  // Tüm mekanlar için yorumlar haritasını başlatır
  void _initializeYorumlar() {
    final detaylar = sehirBilgileri[widget.il] ?? {};
    detaylar.forEach((kategori, mekanListesi) {
      for (var mekan in mekanListesi) {
        if (mekan['ad'] != null) {
          yorumlar.putIfAbsent(mekan['ad']!, () => []);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _yorumController.dispose(); // Controller'ı dispose et
    super.dispose();
  }

  void _callPhone(String number) async {
    // Telefon numarası temizlemesi: boşlukları kaldır
    final cleanedNumber = number.replaceAll(RegExp(r'\s+'), '');
    final uri = Uri(scheme: 'tel', path: cleanedNumber);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        _showErrorDialog(
          'Telefon',
          'Arama yapılamıyor. Numara: $cleanedNumber',
        );
      }
    } catch (e) {
      _showErrorDialog('Hata', 'Telefon araması başlatılamadı: $e');
    }
  }

  void _openURL(String url) async {
    // URL'nin başında 'http' yoksa ekle
    final formattedUrl =
        url.startsWith('http://') || url.startsWith('https://')
            ? url
            : 'https://$url';
    final uri = Uri.parse(formattedUrl);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _showErrorDialog(
          'Web Sayfası',
          'Web sayfası açılamıyor. URL: $formattedUrl',
        );
      }
    } catch (e) {
      _showErrorDialog('Hata', 'Web sayfası açılamadı: $e');
    }
  }

  void _showLocation(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    // Google Haritalar uygulamasını doğrudan açmak için 'geo' şemasını kullanmak daha uygun.
    final geoUri = Uri.parse('geo:0,0?q=$encodedAddress');
    // Alternatif olarak, tarayıcıda Google Haritalar'ı açmak için.
    final webUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$encodedAddress', // Doğru Google Haritalar URL'si
    );

    try {
      if (await canLaunchUrl(geoUri)) {
        await launchUrl(geoUri);
      } else if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } else {
        _showErrorDialog(
          'Konum',
          'Harita açılamıyor. Lütfen cihazınızda bir harita uygulaması yüklü olduğundan emin olun veya internet bağlantınızı kontrol edin. Adres: $address',
        );
      }
    } catch (e) {
      _showErrorDialog('Hata', 'Harita başlatılamadı: $e');
    }
  }

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

  // Anahtarları daha okunabilir etiketlere dönüştürme fonksiyonu
  String _keyToLabel(String key) {
    switch (key) {
      case 'kuruluşYılı':
        return 'Kuruluş Yılı';
      case 'önem':
        return 'Önemi';
      case 'koleksiyon':
        return 'Koleksiyon';
      case 'adres':
        return 'Adres';
      case 'telefon':
        return 'Telefon';
      case 'web':
        return 'Web Sitesi';
      case 'bilgi':
        return 'Bilgi';
      case 'ziyaretSaatleri':
        return 'Ziyaret Saatleri';
      case 'girişÜcreti':
        return 'Giriş Ücreti';
      case 'tip':
        return 'Tipi';
      case 'konum':
        return 'Konum';
      case 'yemekler':
        return 'Popüler Yemekler';
      case 'fiyat':
        return 'Fiyat Aralığı';
      case 'detay': // "Konumu ve Genel Özellikleri" için eklendi
        return 'Detay';
      case 'ad': // 'ad' anahtarını göstermemek için
        return '';
      default:
        // İlk harfi büyüt ve alt çizgileri boşlukla değiştir
        return key
            .replaceFirst(key[0], key[0].toUpperCase())
            .replaceAll('_', ' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    final detaylar = sehirBilgileri[widget.il] ?? {};

    // Gosterilecek mekan listesini belirle
    List<Map<String, String>> gosterilecekMekanlar;
    if (aramaKelimesi.trim().isEmpty) {
      // Arama kelimesi yoksa sadece seçilen kategorideki mekanları göster
      gosterilecekMekanlar = detaylar[secilenKategori] ?? [];
    } else {
      // Arama kelimesi varsa tüm mekanlar içinde ara
      List<Map<String, String>> tumMekanlar = [];
      detaylar.forEach((kategori, mekanListesi) {
        tumMekanlar.addAll(mekanListesi);
      });
      gosterilecekMekanlar =
          tumMekanlar.where((mekan) {
            return mekan.entries.any((entry) {
              final val = entry.value.toLowerCase();
              return val.contains(aramaKelimesi.toLowerCase());
            });
          }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: RepaintBoundary(
          child: SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.7,
            child: OverflowBox(
              minWidth: 0.0,
              maxWidth: double.infinity,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
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
          // Kategori Butonları
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
                                ''; // Kategori değişince aramayı temizle
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

          // Arama Çubuğu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Mekan, bilgi veya özellik ara...',
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
                ),
              ),
              onChanged: (value) {
                setState(() {
                  aramaKelimesi = value;
                });
              },
            ),
          ),

          // Mekan Listesi
          Expanded(
            child:
                gosterilecekMekanlar.isEmpty
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
                      itemCount:
                          gosterilecekMekanlar
                              .length, // Değiştirildi: filtrelenmisMekanlar -> gosterilecekMekanlar
                      itemBuilder: (context, index) {
                        final mekan = gosterilecekMekanlar[index];
                        final mekanAdi = mekan['ad'] ?? 'İsimsiz Mekan';

                        // Yorumlar haritasını bu mekan için başlat (zaten initState'te yapıldığı için burada tekrar etmeye gerek yok, ama kontrol etmek iyidir)
                        yorumlar.putIfAbsent(mekanAdi, () => []);

                        // "Konumu ve Genel Özellikleri" kategorisi için özel liste öğesi
                        if (secilenKategori == 'Konumu ve Genel Özellikleri' &&
                            aramaKelimesi.isEmpty) {
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mekanAdi,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  if (mekan['detay'] != null &&
                                      mekan['detay']!.isNotEmpty)
                                    Text(
                                      mekan['detay']!,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  // Konumu ve Genel Özelliklerindeki diğer bilgileri de burada listeler
                                  ...mekan.entries
                                      .where(
                                        (e) =>
                                            e.key != 'ad' &&
                                            e.key != 'detay' &&
                                            e.value.isNotEmpty,
                                      )
                                      .map((entry) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${_keyToLabel(entry.key)}: ',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: entry.value,
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                      .toList(),
                                ],
                              ),
                            ),
                          );
                        } else {
                          // Diğer kategorilerdeki mekanlar için genel liste öğesi
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ExpansionTile(
                              leading: Icon(
                                kategoriIkonlari[secilenKategori] ??
                                    Icons.place, // Kategorinin ikonunu göster
                                color: Colors.blue.shade700,
                              ),
                              title: Text(
                                mekanAdi,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Tüm mekan bilgilerini listele
                                      ...mekan.entries
                                          .where(
                                            (e) =>
                                                e.key != 'ad' &&
                                                e.value.isNotEmpty,
                                          )
                                          .map((entry) {
                                            final label = _keyToLabel(
                                              entry.key,
                                            );
                                            final value = entry.value;

                                            // Telefon, web ve adres için tıklanabilir ikonlar
                                            if (entry.key == 'telefon') {
                                              return ListTile(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                leading: const Icon(
                                                  Icons.phone,
                                                  color: Colors.green,
                                                  size: 20,
                                                ),
                                                title: Text(value),
                                                trailing: IconButton(
                                                  icon: const Icon(
                                                    Icons.call,
                                                    size: 20,
                                                  ),
                                                  onPressed:
                                                      () => _callPhone(value),
                                                ),
                                              );
                                            } else if (entry.key == 'web') {
                                              return ListTile(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                leading: const Icon(
                                                  Icons.language,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                title: Text(value),
                                                trailing: IconButton(
                                                  icon: const Icon(
                                                    Icons.open_in_new,
                                                    size: 20,
                                                  ),
                                                  onPressed:
                                                      () => _openURL(value),
                                                ),
                                              );
                                            } else if (entry.key == 'adres' ||
                                                entry.key == 'konum') {
                                              return ListTile(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                leading: const Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                  size: 20,
                                                ),
                                                title: Text(value),
                                                trailing: IconButton(
                                                  icon: const Icon(
                                                    Icons.map,
                                                    size: 20,
                                                  ),
                                                  onPressed:
                                                      () =>
                                                          _showLocation(value),
                                                ),
                                              );
                                            } else {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                    ),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '$label: ',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black87,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: value,
                                                        style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                          })
                                          .toList(),

                                      // Yorumlar bölümü
                                      const Divider(),
                                      const Text(
                                        'Yorumlar:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      if (yorumlar[mekanAdi]!.isEmpty)
                                        const Text(
                                          'Henüz yorum bulunmamaktadır.',
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ...yorumlar[mekanAdi]!.map((yorum) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 4.0,
                                          ),
                                          child: Text(
                                            '- $yorum',
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      const SizedBox(height: 8),
                                      TextField(
                                        controller: _yorumController,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Yorumunuzu buraya yazın...',
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.send),
                                            onPressed: () {
                                              setState(() {
                                                if (_yorumController
                                                    .text
                                                    .isNotEmpty) {
                                                  yorumlar[mekanAdi]!.add(
                                                    _yorumController.text,
                                                  );
                                                  _yorumController.clear();
                                                }
                                              });
                                            },
                                          ),
                                          border: const OutlineInputBorder(),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 8,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
