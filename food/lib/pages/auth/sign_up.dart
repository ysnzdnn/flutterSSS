import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    signUpButton(),
                    customSizedBox(),
                    backToLoginPage(),
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
      style: TextStyle(color: Colors.white),
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
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Şifre"),
    );
  }

  Center signUpButton() {
    return Center(
        child: TextButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
        } else {}
        try {
          var userResult = await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password);
          print(userResult.user!.uid);

          formKey.currentState!.reset();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Kullanıcı Kaydedildi,, Başlangıç Sayfasına Yönelndiriliyorsunuz"),
          ));
          Navigator.pushReplacementNamed(context, "/loginpage");
        } catch (e) {
          print(e.toString());
        }
      },
      child: Text(
        "Hesap Olustur",
      ),
    ));
  }

  Center backToLoginPage() {
    return Center(
        child: TextButton(
      onPressed: () => Navigator.pushNamed(context, "/loginpage"),
      child: Text(
        "Giriş Sayfasına Geri Dön",
      ),
    ));
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
