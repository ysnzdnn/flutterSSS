import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(225, 246, 238, 247),
      body: Center(
        child: Column(
          children: [
            Container(
              height: height * .25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/loginpagebg.jpg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Merhabayınız",
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " \n Lütfen Kullanıcı Girişi Yapınız... ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    customSizedBox(),
                    customEmail(),
                    customSizedBox(),
                    customPassword(),
                    customSizedBox(),
                    Container(
                      child: Center(
                        child: TextButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try {
                                  final userResult = await firebaseAuth
                                      .signInWithEmailAndPassword(
                                          email: email, password: password);
                                  Navigator.pushReplacementNamed(
                                      context, "/homepage");
                                  print(userResult.user!.email);
                                } catch (e) {
                                  print(e.toString());
                                }
                              } else {}
                            },
                            child: Text("Giriş Yap",
                                style: TextStyle(
                                  color: Colors.blue,
                                ))),
                      ),
                    ),
                    customSizedBox(),
                    Container(
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Şifremi Unuttum",
                            style: TextStyle(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                    customSizedBox(),
                    Container(
                      child: Center(
                        child: TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/signup"),
                            child: Text("Hesap Oluştur",
                                style: TextStyle(color: Colors.purpleAccent))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField customEmail() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Email Adresini Eksiksiz Griniz.";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: customInputDecoration("Email Adresi"),
    );
  }

  TextFormField customPassword() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "Şifreyi Eksiksiz Giriniz.";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: customInputDecoration("Şifre"),
    );
  }

  Widget customSizedBox() => SizedBox(
        height: 20,
      );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)));
  }
}
