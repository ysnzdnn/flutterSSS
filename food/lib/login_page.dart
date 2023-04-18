import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  customSizedBox(),
                  TextField(
                      decoration: customInputDecoration(
                          "Kullanıcı adı ve e-mail adresi")),
                          customSizedBox(),
                  TextField(decoration: customInputDecoration("Parola")),
                  customSizedBox(),
                   Container(
                    child: Center(
                      child: TextButton(onPressed: (){}, child: Text("Giriş Yap",style:TextStyle(
                        color: Colors.blue,
                      ))),
                    ),
                  ),
                  customSizedBox(),
                  Container(
                    child: Center(child: TextButton(onPressed: (){}, child: Text("Şifremi Unuttum", style:TextStyle(
                      color:Colors.purple
                    ),
                    ),
                    ),
                    ),
                  ),
                  
                 
                  customSizedBox(),
                  Container(
                    child: Center(
                      child: TextButton(onPressed: (){}, child: Text("Hesap Oluştur",
                      style: TextStyle(
                        color: Color.fromARGB(255, 194, 147, 6)
                      ))
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
