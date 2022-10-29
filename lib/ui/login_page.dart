import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String username = 'rose';
  String password = '1234';
  String notify = 'Silakan Login';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  void loginProccess() {
    if (_formKey.currentState!.validate()) {
      if (usernameInput.text == username && passwordInput.text == password) {
        setState(() {
          Navigator.pushReplacementNamed(context, RestaurantList.routeName);
        });
      } else {
        setState(() {
          notify = "Username atau password salah";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Localie Restaurant',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              notify,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Kolom username
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                        controller: usernameInput,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Isi username-mu!";
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            label: Text(
                              'Username',
                              style: TextStyle(fontSize: 18),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            prefixIcon:
                                Icon(Icons.person, color: Colors.black))),
                  ),

                  // Kolom password
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordInput,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Isi password-mu!";
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        label: Text(
                          'Password',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => loginProccess(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 50, right: 50),
                      child: Text(
                        'Masuk',
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
