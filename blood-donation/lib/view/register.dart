import 'package:curd/controller/provider.dart';
import 'package:curd/services/authServices.dart';
import 'package:curd/view/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create an account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF490008),
                ),
              ),
              Consumer<AuthController>(
                builder: (context, value, child) => Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    TextField(
                      controller: value.nameController,
                    ),
                    Text("Email"),
                    TextField(
                      controller: value.emailController,
                    ),
                    Text("Password"),
                    TextField(
                      controller: value.passwordController,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<AuthController>(context, listen: false)
                        .emailRegister()
                        .then((_) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BottomBar()));
                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFE8315B),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or'),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Authservices authservices = Authservices();
                    authservices.nativeGoogleSignIn();
                  },
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Card(
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/googleimg.png',
                            width: 40,
                          ),
                          Text("sign with google"),
                        ],
                      )),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already have an account ? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "login",
                        style: TextStyle(
                          color: const Color(0xFFE8315B),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
