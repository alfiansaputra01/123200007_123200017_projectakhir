import 'package:flutter/material.dart';
import 'MenuDetailProfile.dart';
import 'LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> profiles = [
    {
      'name': 'Alfian Saputra',
      'nim': '123200007',
      'image': 'images/1651600014143.jpg',
      'detail': 'Halo! Perkenalkan saya Alfian Saputra dengan Nim 123200007. Saya memiliki hoby menyanyi'
          'dan juga memiliki cita cita sebagai FrontEnd Develeoper. Saya lahir di Raha pada tanggal 1 juni 2002.'
    },
    {
      'name': 'Abdilah Mustamin',
      'nim': '123200017',
      'image': 'images/abdillah.jpg',
      'detail' : 'Halo! Perkenalkan saya Abdillah Mustamin dengan Nim 123200017. Saya memiliki hoby Badminton'
          'dan juga memiliki cita cita sebagai FrontEnd Develeoper. Saya lahir di Bungkoloko pada tanggal 22 september 2002.'
    },
  ];

  int selectedProfileIndex = 0;

  void _logout() async {
    // Simpan status login ke false atau hapus data user yang sedang login
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigasi ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(title: 'Login')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(profiles[selectedProfileIndex]['image']),
              ),
              SizedBox(height: 16),
              Text(
                "Nama : ${profiles[selectedProfileIndex]['name']}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Text(
                "NIM : ${profiles[selectedProfileIndex]['nim']}",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProfilePage(
                        profile: profiles[selectedProfileIndex],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Lihat Detail",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _logout,
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Pilih Profil:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  profiles.length,
                      (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedProfileIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedProfileIndex == index
                            ? Colors.blue[900]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: selectedProfileIndex == index
                              ? Colors.white
                              : Colors.blue[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
