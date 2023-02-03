import 'package:deliveryapplication/ReusableWidgets/textDivider.dart';
import 'package:deliveryapplication/controller/AuthController.dart';
import 'package:deliveryapplication/screens/login_page.dart';
import 'package:deliveryapplication/utils/Styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/img/signup.png',
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.25,
                    ),
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/img/profile1.png'),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TextDivider(txt: 'Create new account'),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                            color: Colors.white.withOpacity(0.2))
                      ]),
                      child: TextField(
                        controller: emailController,
                        // obscureText: true,

                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.email, color: Styles.orange),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Enter your email',
                          focusColor: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                            color: Colors.white.withOpacity(0.2))
                      ]),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Styles.orange,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Enter your password',
                          focusColor: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.5,
                    decoration: const BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          AuthController.instance.register(
                              emailController.text.trim(),
                              passwordController.text.trim());
                        },
                        child: Text(
                          'Sign Up',
                          style: Styles.btnText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Already have an account?',
                      style: Styles.textH2,
                      children: [
                        TextSpan(
                            text: ' Login',
                            style: Styles.textH2.copyWith(color: Colors.black),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  ))
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
