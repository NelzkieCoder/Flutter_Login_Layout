import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController userControler = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String name;
  void eraseText() {
    setState(() {
      userControler.clear();
      passwordController.clear();
    });
  }

  void welcomeUser() {
    setState(() {
      if(userControler.text.isNotEmpty && passwordController.text.isNotEmpty){
        name = userControler.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LogIn"),
          backgroundColor: Colors.green.shade400,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                "images/login.svg",
                width: 100.0,
                height: 100.0,
                color: Colors.green.shade300,
              ),
              Expanded(
                // for form
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: TextField(
                        controller: userControler,
                        decoration: InputDecoration(
                            hintText: "Username", icon: Icon(Icons.person)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Password", icon: Icon(Icons.lock)),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.5),
                    ),
                    Container(
                        // buttons
                        // decoration: BoxDecoration(color: Colors.green),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10.0, right: 20.0),
                              child: RaisedButton(
                                onPressed: () => welcomeUser(),
                                color: Colors.deepPurple,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14.5),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: RaisedButton(
                                onPressed: () => eraseText(),
                                color: Colors.deepPurple,
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14.5),
                                ),
                              ),
                            )
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 70.0),),
                        Container(
                          child: Text("Welcome, "),
                        ),
                        Container(
                          child: Text("$name"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
