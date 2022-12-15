import 'package:flutter/material.dart';
import 'package:limak/screens/pending_tasks_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              padding: EdgeInsets.fromLTRB(0, 1, 0, 15),
              alignment: Alignment.center,
              child: Image.asset(
                'images/Resim1.png',
                height: 130,
                width: 150,
                color: Colors.white,
              ),
            ), //Unilever Logo
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
              alignment: Alignment.center,
              child: Image.asset(
                'images/shield.jpg',
                height: 100,
                width: 100,
              ),
            ),
          ), //Shield Logo
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20), //dış nesneler
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      onSaved: (String? value) {},
                    ),
                    TextFormField(
                      obscureText: passenable,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      height: 30,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PendingTasks()));
                          print('Giriş butonuna tıklanıldı');
                        },
                        child: Text('Giriş'),
                      ),
                    ), //Giriş Butonu
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      onPressed: () {
                        print('Şifremi Unuttum Butonuna Tıklanıldı');
                      },
                      child: Text('Şifremi Unuttum'),
                    ), //Şifremi Unuttum.
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 1, 30, 20),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    Text('English');
                  });
                  print('Dil Değiştirme Butonuna Tıklanıldı');
                },
                child: Text('Türkçe'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
