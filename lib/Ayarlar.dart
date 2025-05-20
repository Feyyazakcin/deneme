import 'package:flutter/material.dart';

class AyarlarSayfasi extends StatelessWidget {
  final bool karanlikMod;
  final Function(bool) onKaranlikModDegisti;

  AyarlarSayfasi({
    required this.karanlikMod,
    required this.onKaranlikModDegisti,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: Text('Karanlık Mod'),
            value: karanlikMod,
            onChanged: (bool value) {
              onKaranlikModDegisti(
                value,
              ); // Karanlık mod değişikliği için callback
            },
            secondary: Icon(Icons.brightness_6, color: Colors.teal),
          ),
          Divider(), // Bölücü çizgi
          ListTile(
            title: Text('Hakkında'),
            leading: Icon(Icons.info_outline, color: Colors.teal),
            onTap: () {
              // Hakkında bilgisi açılabilir
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Hakkında'),
                    content: Text('Şehir Turu Uygulaması\nV1.0.0\n2025'),
                    actions: [
                      TextButton(
                        child: Text('Tamam'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(), // Bölücü çizgi
          ListTile(
            title: Text('Çıkış Yap'),
            leading: Icon(Icons.exit_to_app, color: Colors.teal),
            onTap: () {
              // Çıkış yapma işlevi, örneğin giriş ekranına yönlendirme yapılabilir
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
