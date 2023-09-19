// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uts_asli/home_screen.dart';
import 'package:uts_asli/loginpake/signup.dart';
import 'package:uts_asli/loginpake/authentication.dart';
import 'package:provider/provider.dart';
import 'package:uts_asli/provider/theme.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Color.fromARGB(255, 226, 48, 48),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_6),
            color: Colors.white,
            onPressed: () {
              Provider.of<MyProvider>(context, listen: false).swapTheme();
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          const SizedBox(height: 80),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),),
              SizedBox(height: 50),
              Text(
                'Welcome! to FOODIE',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LoginForm(),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              SizedBox(width: 50),
              Text('Have no Account? ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text('Register Now!',
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 226, 48, 48),)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: border,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: !_obscureText,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
              suffixIcon: GestureDetector(
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6) {
                return 'Password to short';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 54,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              )),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
