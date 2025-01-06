import 'package:curd/controller/provider.dart';
import 'package:curd/utils/utils.dart';
import 'package:curd/view/bottomNavigation.dart';
import 'package:curd/view/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  Constants.loginPageText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Constants.loginpageTextcolor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Email"),
                Consumer<AuthController>(
                  builder:(context, value, child) =>  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      TextField(
                        controller: value.emailController,
                      ),
                      Text("password"),
                      TextField(
                        controller: value.passwordController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<AuthController>(context,listen: false).loginUser(context);
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Constants.mainColor,
                      ),
                      child: Center(
                        child: Text("Login",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Constants.CommontextColor
                        ),),
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
                  child: Consumer<AuthController>(
                    builder:(context, value, child) =>  GestureDetector(
                      onTap: () {
                         value.googleLogin().then((_){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomBar()));
                         });
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have an account ? "),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                    }, child: Text("SignUp",style: TextStyle(

                      color: Constants.mainColor,
                    ),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
