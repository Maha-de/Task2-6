import 'package:flutter/material.dart';
import 'package:task_3/pages/homepage.pages.dart';
import 'package:task_3/pages/login.pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late TextEditingController userName;
  late TextEditingController password;
  late TextEditingController email;

  late GlobalKey<FormState> formKey;
  bool obSecureText = true;

  void toggleObSecure() {
    obSecureText = !obSecureText;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    userName = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/background.png"),
                    fit: BoxFit.cover)
            )),
            Padding(
            padding: const EdgeInsets.fromLTRB(80, 20, 10, 20),
            child: Container(
            height: 250, width: 250,
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/logo3.png",),)
            ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 160, 10, 20),
              child: Center(
                child: ListView(
                  children: [
                    SizedBox(height: 50,),
                    Center(
                        child: Text("Register", style: TextStyle(fontSize: 20, color: Colors.white,
                            fontWeight: FontWeight.bold),)),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: userName,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red),
                        prefixIcon: Icon(Icons.person_outline, color: Colors.white),
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),                  ),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                          labelText: "Email Address",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      ),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                          suffixIcon: InkWell(onTap: () => toggleObSecure(),
                            child: Icon(color: Colors.white,
                                obSecureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))                  ),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'password is required';
                          }
                          if (value.length < 6) {
                            return 'password too short';
                          }
                          return null;
                        }
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 50, 40, 20),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginPage()));
                        password.clear();
                        email.clear();
                      }, child: Text("Register", style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(primary: Colors.deepOrange,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 80, 40, 10),
                      child: Row(children: [
                        Text("Already registered? ", style: TextStyle(color: Colors.white,),
                          textAlign: TextAlign.center,),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          password.clear();
                          email.clear();
                        },
                            child: Text("Sign in", style: TextStyle(color: Colors.deepOrange)))
                      ],),
                    )
                  ],
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
