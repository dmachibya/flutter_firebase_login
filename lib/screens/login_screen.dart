import 'package:sample_app/utils/authentication.dart';
import 'package:sample_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var size, height, width;
  var paddingRatio = 0.05;

  final GlobalKey _formKey = GlobalKey();

  String buttonText = "Login";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 32, horizontal: width * paddingRatio),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sample App",
                  
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Sign In",
                  
                ),
                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: "eg. email@example.com",
                        label: Text("Email"),
                       
                        border: OutlineInputBorder())),
                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        label: Text("Password"),
                        hintText: "********",
                       
                        border: OutlineInputBorder())),
// button
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    // print("press");
                    setState(() => {buttonText = "loading..."});
                    AuthenticationHelper()
                        .signIn(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((value) => {
                              if (value == null)
                                {
                                  // print(value)
                                  Navigator.pushNamed(context, homeRoute)
                                }
                              else
                                {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      value,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ))
                                }
                            });
                    setState(() => {buttonText = "loading..."});
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.3), //shadow for button
                              blurRadius: 5) //blur radius of shadow
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, registerRoute);
                  },
                  child: const Text.rich(
                    TextSpan(text: "Not Registered? ", children: [
                      TextSpan(
                          text: " Register Now",
                          style: TextStyle(color: Colors.purple))
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
