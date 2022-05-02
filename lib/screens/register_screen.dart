import 'package:sample_app/utils/authentication.dart';
import 'package:sample_app/utils/routes.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var size, height, width;
  var paddingRatio = 0.05;

  final GlobalKey _formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Builder(builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
              vertical: 32, horizontal: width * paddingRatio),
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const Text(
                    "Sample App",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          hintText: "eg. Juma Ally",
                          label: Text("Full Name"),
                          border: OutlineInputBorder())),
                  const SizedBox(
                    height: 16,
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

                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          label: Text("Password"),
                          hintText: "********",
                          suffix: InkWell(
                            child: Icon(Icons.remove_red_eye_outlined),
                          ),
                          prefixIcon: Icon(Icons.vpn_key_outlined),
                          border: OutlineInputBorder())),
// button
                  const SizedBox(
                    height: 16,
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.3), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            shadowColor: Colors.transparent,
                            //make color or elevated button transparent
                          ),
                          onPressed: () {
                            AuthenticationHelper()
                                .signUp(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) => {
                                      if (value == null)
                                        {
                                          Navigator.pushNamed(
                                              context, loginRoute)
                                          // print("value")
                                        }
                                      else
                                        {
                                          // print(value)
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              value,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ))
                                        }
                                    });
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 18,
                              bottom: 18,
                            ),
                            child: Text("Register"),
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text.rich(
                      TextSpan(text: "Already Registered? ", children: [
                        TextSpan(
                            text: " Login Now",
                            style: TextStyle(color: Colors.purple))
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        );
      }),
    );
  }
}
