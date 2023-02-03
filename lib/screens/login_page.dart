import 'package:deliveryapplication/ReusableWidgets/textDivider.dart';
import 'package:deliveryapplication/controller/AuthController.dart';
import 'package:deliveryapplication/screens/signup_page.dart';
import 'package:deliveryapplication/utils/Styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                        'assets/img/loginimgg.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextDivider(txt: 'Sign in to your account'),
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
                        height: 15,
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
                  child: GestureDetector(
                    onTap: () {
                      AuthController.instance.login(emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.5,
                        decoration: const BoxDecoration(
                          color: Styles.bgColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: Styles.btnText,
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: Styles.textH2,
                        children: [
                          TextSpan(
                              text: ' SignUp',
                              style:
                                  Styles.textH2.copyWith(color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Signup()),
                                    ))
                        ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
