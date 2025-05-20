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
      'Tarihi Yerler': ['Tokat Kalesi', 'fkjheufheuı'],
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
    'Yozgat': {
      'Müzeler': ['Yozgat Müzesi'],
      'Tiyatro Salonları': ['Yozgat Belediyesi Kültür Merkezi'],
      'Restoranlar': ['Yozgat Mutfağı'],
      'Tarihi Yerler': ['Basilica Therma (Sarıkaya Roma Hamamı)'],
    },
    'Kocaeli': {
      'Müzeler': ['Kocaeli Arkeoloji ve Etnografya Müzesi'],
      'Tiyatro Salonları': ['Kocaeli Şehir Tiyatrosu'],
      'Restoranlar': ['İzmit Mutfağı'],
      'Tarihi Yerler': ['Saat Kulesi', 'Eskihisar Kalesi'],
    },
  };

  final Map<String, String> mekanDetaylari = {
    // Erzurum
    'Erzurum Kalesi':
        'Erzurum Kalesi, Roma dönemine kadar uzanan köklü bir geçmişe sahiptir.',
    'Erzurum Arkeoloji Müzesi':
        'Bu müzede Erzurum ve çevresine ait birçok arkeolojik eser sergilenmektedir.',
    'Erzurum Cağ Kebabı':
        'Meşhur Erzurum yemeği olan cağ kebabı, yatay şişlerde servis edilir.',
    'Erzurum Devlet Tiyatrosu':
        'Şehirde kültürel etkinliklerin düzenlendiği önemli bir sahnedir.',

    // Adana
    'Adana Arkeoloji Müzesi':
        'Adana Arkeoloji Müzesi, bölgenin antik çağlardan gelen tarihi eserlerini barındırır.',
    'Adana Devlet Tiyatrosu':
        'Adana Devlet Tiyatrosu, şehre kültürel katkılarda bulunan önemli bir sahnedir.',
    'Adana Kebabı':
        'Dünyaca ünlü Adana kebabı, baharatlı ve kuzu etinden yapılır.',
    'Taşköprü': 'Adana\'nın simgelerinden biri olan tarihi taş köprüdür.',

    // Ankara
    'Anadolu Medeniyetleri Müzesi':
        'Ankara’nın en önemli müzelerinden biri olan Anadolu Medeniyetleri Müzesi, pek çok tarihsel eseri sergiler.',
    'Atatürk Müzesi':
        'Mustafa Kemal Atatürk’ün anılarını ve kişisel eşyalarını barındıran önemli bir müzedir.',
    'Ankara Devlet Tiyatrosu':
        'Ankara Devlet Tiyatrosu, başkentteki en prestijli tiyatro salonlarından biridir.',
    'Anıtkabir':
        'Türkiye Cumhuriyeti\'nin kurucusu Mustafa Kemal Atatürk’ün anıt mezarıdır.',

    // Antalya
    'Antalya Müzesi':
        'Antalya Müzesi, bölgedeki arkeolojik kazılardan çıkarılan eserlerin sergilendiği önemli bir müzedir.',
    'Saklıkent Kanyonu Müzesi':
        'Saklıkent Kanyonu, aynı adı taşıyan müzesiyle doğa ve tarih severlerin ilgisini çeker.',
    'Antalya Devlet Tiyatrosu':
        'Antalya Devlet Tiyatrosu, Antalya’daki kültürel etkinliklerin merkezi olan bir sahnedir.',
    'Aspendos':
        'Roma dönemine ait en iyi korunmuş antik tiyatrolardan biridir.',

    // İstanbul
    'Topkapı Sarayı':
        'Osmanlı padişahlarının yaşadığı ve devleti yönettiği saraydır.',
    'İstanbul Arkeoloji Müzesi':
        'Türkiye\'nin en büyük ve en önemli müzelerinden biridir.',
    'Galata Kulesi':
        'İstanbul\'un en eski ve en güzel manzarasına sahip kulelerinden biridir.',
    'Ayasofya':
        'Ayasofya, İstanbul\'un simgesi haline gelmiş tarihi bir yapıdır.',

    // İzmir
    'Efes Antik Kenti':
        'Dünyaca ünlü antik kent, Artemis Tapınağı ve Celsus Kütüphanesi ile bilinir.',
    'İzmir Arkeoloji Müzesi':
        'Antik Yunan ve Roma dönemine ait eserlerin sergilendiği önemli bir müzedir.',
    'Kordon Lokantası':
        'Deniz kenarında, Ege mutfağının en lezzetli örneklerini sunar.',

    // Zonguldak
    'Filyos Antik Kenti': 'Zonguldak’taki önemli antik kentlerden biridir.',
    'Zonguldak Tiyatro Salonu':
        'Zonguldak’taki kültürel etkinliklerin yapıldığı tiyatro salonudur.',
    'Zonguldak Koyu': 'Zonguldak’ın tarihi ve doğal güzelliklerinden biridir.',

    // Trabzon
    'Trabzon Ayasofya Müzesi':
        'Trabzon’daki en eski yapıtlar arasında yer alır.',
    'Uzungöl': 'Trabzon’un en bilinen doğal güzelliklerinden biridir.',
    'Sümela Manastırı':
        'Sümela Manastırı, Trabzon’un en önemli tarihi yapılarından biridir.',

    // Bursa
    'Bursa Ulu Camii':
        'Bursa’nın en eski camilerinden biri olup Osmanlı mimarisinin önemli örneklerindendir.',
    'Bursa Teleferik':
        'Bursa’daki Uludağ’a çıkan teleferik, şehre muazzam bir manzara sunar.',
    'Koza Han':
        'Osmanlı dönemine ait tarihi bir çarşıdır ve ipek üretimi ile ünlüdür.',

    // Diyarbakır
    'Diyarbakır Sur':
        'Diyarbakır’ın tarihi surları, şehrin geçmişine ışık tutmaktadır.',
    'Diyarbakır Arkeoloji Müzesi':
        'Diyarbakır’ın bölgesel tarihine ait önemli eserler sergilenmektedir.',
    'Hasan Paşa Hanı': 'Diyarbakır’ın önemli tarihi yapılarından biridir.',

    // Mardin
    'Mardin Kalesi':
        'Mardin Kalesi, şehre hakim bir tepede yer alan tarihi bir kaleydi.',
    'Mardin Evleri': 'Mardin’in taş evleri, şehre özgü mimari örneklerdir.',
    'Deyrulzafaran Manastırı':
        'Mardin’deki en eski manastırlardan biridir ve önemli bir dini merkezdir.',

    // Konya
    'Mevlana Müzesi':
        'Mevlana Celaleddin Rumi’nin türbesi olan bu müze, Konya’nın en önemli turistik yerlerinden biridir.',
    'Konya Tropikal Kelebek Bahçesi':
        'Konya’daki en ilginç doğal alanlardan biridir.',
    'Alaaddin Tepesi':
        'Konya’nın merkezine hakim olan bu tepe, şehri izlemek için popüler bir yerdir.',

    // Kayseri
    'Kayseri Kalesi': 'Kayseri Kalesi, şehri koruyan tarihi bir kaledir.',
    'Erciyes Dağı':
        'Kayseri’deki en yüksek dağ olan Erciyes, kayak ve doğa sporları için popüler bir bölgedir.',
    'Gevher Nesibe Tıp Müzesi':
        'Gevher Nesibe Tıp Müzesi, Selçuklu döneminin önemli bir tıp müzesidir.',

    // Van
    'Van Gölü':
        'Van Gölü, Türkiye’nin en büyük gölüdür ve çevresi doğal güzelliklerle doludur.',
    'Akdamar Adası':
        'Van Gölü’nde yer alan bu ada, Akdamar Kilisesi ile ünlüdür.',
    'Van Kalesi': 'Van Kalesi, tarihi bir kale olup gölün etrafında yer alır.',

    // Tekirdağ
    'Tekirdağ Arkeoloji Müzesi':
        'Tekirdağ Arkeoloji Müzesi, bölgenin tarihini anlatan önemli eserleri sergiler.',
    'Rakoczi Müzesi':
        'Macar prensi II. Rakoczi’nin yaşamını anlatan bir müzedir.',
    'Tekirdağ Sahili':
        'Tekirdağ’ın sahil hattı, deniz ve doğa severler için popüler bir alandır.',

    // Çanakkale
    'Çanakkale Şehitler Abidesi':
        'Çanakkale’deki en büyük anıt ve şehitliklerden biridir.',
    'Troy Antik Kenti':
        'Troy, dünyanın en eski ve en ünlü antik kentlerinden biridir.',
    'Çanakkale Deniz Müzesi':
        'Çanakkale’deki denizcilik tarihini anlatan önemli bir müzedir.',

    // Aydın
    'Aydın Arkeoloji Müzesi':
        'Aydın’daki antik yerleşimlere ait birçok tarihi eser burada sergilenmektedir.',
    'Milet Antik Kenti':
        'Aydın il sınırlarında bulunan antik kent, tarihi zenginliği ile ünlüdür.',
    'Kuşadası':
        'Aydın’ın sahil ilçesi olan Kuşadası, plajları ve tatil beldeleriyle ünlüdür.',

    // Samsun
    'Atakum Sahili': 'Samsun’daki en popüler plajlardan biridir.',
    'Samsun Arkeoloji Müzesi':
        'Samsun ve çevresindeki kazılardan çıkarılan arkeolojik eserler burada sergilenmektedir.',
    'Amisos Tepesi':
        'Samsun’da, Antik Amisos Kenti’nin kalıntıları bu tepede yer almaktadır.',

    // Çorum
    'Hattuşaş':
        'Çorum il sınırlarında bulunan ve Hititler’in başkenti olan antik kenttir.',
    'Çorum Arkeoloji Müzesi':
        'Çorum’a ait antik çağlara ait önemli eserler burada sergilenmektedir.',

    // Erzincan
    'Erzincan Evleri':
        'Erzincan’ın geleneksel taş yapıları, şehrin tarihi dokusunu yansıtır.',
    'Erzincan Arkeoloji Müzesi':
        'Erzincan’a ait tarihsel eserler burada sergilenmektedir.',

    // Eskişehir
    'Odunpazarı Evleri':
        'Eskişehir’in tarihi evleri, şehre özgü mimarisiyle ünlüdür.',
    'Eskişehir Arkeoloji Müzesi':
        'Bölgedeki kazılardan çıkarılan önemli tarihi eserler burada sergilenmektedir.',
    'Porsuk Çayı':
        'Eskişehir’in merkezinden geçen ve etrafında yürüyüş alanları bulunan çaydır.',

    // Balıkesir
    'Kaz Dağları':
        'Balıkesir’in en ünlü doğal zenginliklerinden biri olan Kaz Dağları, doğa severler için popüler bir yerdir.',
    'Balıkesir Arkeoloji Müzesi':
        'Balıkesir ve çevresindeki tarihi eserlerin sergilendiği önemli bir müzedir.',

    // Kocaeli
    'Gebze Osman Hamdi Bey Müzesi':
        'Osman Hamdi Bey’in önemli sanat eserlerini içeren bir müzedir.',
    'Kocaeli Arkeoloji Müzesi':
        'Kocaeli’nin tarihi ve arkeolojik zenginliklerini sergileyen bir müzedir.',
    // Hakkari
    'Cilo Dağı':
        'Cilo Dağı, Hakkari il sınırlarında yer alan ve dağcılar için popüler bir tırmanış rotasıdır.',
    'Yüksekova':
        'Yüksekova, Hakkari’nin önemli ilçelerinden biri olup doğa güzellikleriyle ünlüdür.',
    'Hakkari Müzesi':
        'Hakkari ilinin kültürünü ve tarihini anlatan eserlerin sergilendiği bir müzedir.',

    // Kars
    'Ani Antik Kenti':
        'Kars’a bağlı Ani Antik Kenti, Orta Çağ’dan kalma önemli bir yerleşim alanıdır ve UNESCO Dünya Mirası Listesi’nde yer alır.',
    'Kars Kalesi':
        'Kars’ın simgelerinden biri olan bu kale, şehre hakim bir tepede yer alır.',
    'Sarıkamış Kayak Merkezi':
        'Sarıkamış Kayak Merkezi, Kars’a bağlı bir bölge olup kış sporları için popülerdir.',
    'Kars Müzesi':
        'Kars Müzesi, şehrin tarihi ve kültürüne dair zengin bir koleksiyona sahiptir.',
    // [Diğer şehirlerin devamı burada yer alacak...]
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

  // Mekan bilgisi gösterme fonksiyonu
  void _mekanDetayiGoster(BuildContext context, String item) {
    final bilgi = mekanDetaylari[item];
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(item),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(bilgi ?? 'Bu yer hakkında bilgi bulunamadı.'),
                if (bilgi == null)
                  TextButton(
                    child: Text('Google’da Ara'),
                    onPressed: () async {
                      final url = Uri.parse(
                        'https://www.google.com/search?q=$item',
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Kapat'),
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
                                      onTap:
                                          () =>
                                              _mekanDetayiGoster(context, item),
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
