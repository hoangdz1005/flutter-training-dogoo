import 'package:account_project/model/res/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool checkLogin = true;

  void handleLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    String enteredEmail = emailController.text;
    String enteredPassword = passwordController.text;

    if (savedEmail != null && savedPassword != null) {
      if (enteredEmail == savedEmail && enteredPassword == savedPassword) {
        setState(() {
          checkLogin = true;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginSuccessPage(),
                settings: RouteSettings(arguments: savedEmail)));
        emailController.clear();
        passwordController.clear();
      } else {
        setState(() {
          checkLogin = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          AppStrings.loginTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(size: 80),
                  Text(
                    AppStrings.logoText,
                    style: TextStyle(fontSize: 40, color: Color(0xFF787878)),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 15),
                  child: TextField(
                      controller: emailController,
                      // onChanged: () {},
                      autofocus: false,
                      decoration: const InputDecoration(
                        labelText: AppStrings.emailLabel,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                      controller: passwordController,
                      // onChanged: () {},
                      autofocus: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: AppStrings.passwordLabel,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      )),
                ),
                if (!checkLogin)
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      AppStrings.notifyLoginFailed,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Text(
                  AppStrings.forgotPassword,
                  style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    handleLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New User?",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ));
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool checkPasswordMatch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          AppStrings.registerTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(size: 80),
                  Text(
                    AppStrings.logoText,
                    style: TextStyle(fontSize: 40, color: Color(0xFF787878)),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 15),
                  child: TextField(
                      controller: emailController,
                      // onChanged: () {},
                      autofocus: false,
                      decoration: const InputDecoration(
                        labelText: AppStrings.emailLabel,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      // onChanged: () {},
                      autofocus: false,
                      decoration: const InputDecoration(
                        labelText: AppStrings.passwordLabel,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: TextField(
                      controller: rePasswordController,
                      obscureText: true,
                      // onChanged: () {},
                      autofocus: false,
                      decoration: const InputDecoration(
                        labelText: AppStrings.rePasswordLabel,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      )),
                ),
                if (!checkPasswordMatch)
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      AppStrings.notifyRegisterFailed,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  )
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Text(
                "Term & Policy",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String email = emailController.text;
                    String password = passwordController.text;
                    String rePassword = rePasswordController.text;
                    if (rePassword.compareTo(password) != 0) {
                      setState(() {
                        checkPasswordMatch = false;
                      });
                      return;
                    } else {
                      setState(() {
                        checkPasswordMatch = true;
                      });
                      prefs.setString("email", email);
                      prefs.setString("password", password);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text('Create Account'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.textFormRegister,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String savedEmail =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          AppStrings.loginSuccessTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(size: 80),
                  Text(
                    AppStrings.logoText,
                    style: TextStyle(fontSize: 40, color: Color(0xFF787878)),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black38,
                          width: 2.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(10.0), // Độ cong của góc biên
                      ),
                      alignment: Alignment.center,
                      width: 350,
                      height: 50,
                      child: const Text(
                        AppStrings.textSuccess,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black38,
                          width: 2.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(10.0), // Độ cong của góc biên
                      ),
                      alignment: Alignment.center,
                      width: 350,
                      height: 50,
                      child: Text(
                        "$savedEmail",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back Home', style: TextStyle(fontSize: 15, color: Colors.white),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
