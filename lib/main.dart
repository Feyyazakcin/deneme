import 'package:flutter/material.dart';
import 'package:deneme/AnaSayfa.dart';
import 'package:deneme/IlDetaySayfasi.dart';
import 'package:deneme/Ayarlar.dart'; // Ayarları ekliyoruz

void main() {
  runApp(SehirTuruApp());
}

class SehirTuruApp extends StatefulWidget {
  @override
  _SehirTuruAppState createState() => _SehirTuruAppState();
}

class _SehirTuruAppState extends State<SehirTuruApp> {
  bool karanlikMod = false; // Karanlık mod durumu

  // Karanlık modu değiştiren fonksiyon
  void _karanlikModDegistir(bool deger) {
    setState(() {
      karanlikMod = deger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Şehir Turu',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
        brightness:
            karanlikMod
                ? Brightness.dark
                : Brightness.light, // Karanlık mod kontrolü
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => GirisEkrani(),
        '/anasayfa': (context) => AnaSayfa(),
        '/ayarlar':
            (context) => AyarlarSayfasi(
              karanlikMod: karanlikMod,
              onKaranlikModDegisti: _karanlikModDegistir,
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/ilDetay') {
          final String il = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => IlDetaySayfasi(il: il),
          );
        }
        return null;
      },
    );
  }
}

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  final TextEditingController _kullaniciAdiController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();

  // Basit doğrulama için örnek giriş bilgileri
  final String dogruKullaniciAdi = 'admin';
  final String dogruSifre = '1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_city, size: 100, color: Colors.teal),
              SizedBox(height: 20),
              Text(
                'Şehir Turu Uygulamasına Hoş Geldiniz',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextField(
                controller: _kullaniciAdiController,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _sifreController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  final kullanici = _kullaniciAdiController.text;
                  final sifre = _sifreController.text;

                  if (kullanici == dogruKullaniciAdi && sifre == dogruSifre) {
                    Navigator.pushNamed(context, '/anasayfa');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Kullanıcı adı veya şifre yanlış'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
                icon: Icon(Icons.login),
                label: Text('Giriş Yap'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.teal.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
