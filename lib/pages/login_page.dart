import 'package:flutter/material.dart';
import 'package:shopping_catalog/utils/myroutes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _globalKey = GlobalKey<FormState>();

  moveToHomePage(BuildContext context) async {
    if (_globalKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoutes);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/hello.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome $name',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter username',
                          labelText: 'username',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'username should not be empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          labelText: 'password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password should not be empty';
                          } else if (value.length < 6) {
                            return 'password must not be less than 6';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 6),
                        child: InkWell(
                          onTap: () => moveToHomePage(context),
                          child: AnimatedContainer(
                            height: 50,
                            width: changeButton ? 50 : 160,
                            alignment: Alignment.center,
                            duration: Duration(seconds: 1),
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                      //   onPressed: () {
                      //     print("login");
                      //     Navigator.pushNamed(context, Myroutes.homeRoutes);
                      //   },
                      //   child: Text(
                      //     'Login',
                      //     style: TextStyle(
                      //       fontSize: 18,
                      //       fontFamily: GoogleFonts.lato().fontFamily,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
