import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pando_app/UI/Order/orderPage.dart';
import 'package:pando_app/UI/base/BasePage.dart';
import 'package:pando_app/Utils/GlobalDetails.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'loginInteractor.dart';
import 'loginPresenterImpl.dart';


FirebaseMessaging firebaseMessaging;

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BasePage<LoginPage> implements LoginView {
  LoginPresenterImpl presenter;
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final TextEditingController email_field = new TextEditingController();
  final TextEditingController password_field = new TextEditingController();
  bool validate_email = false, validate_password = false;
  FocusNode email_focus = new FocusNode();
  FocusNode password_focus = new FocusNode();

  LoginPageState();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  Future<void> initState() {
    super.initState();

    presenter = LoginPresenterImpl();
    presenter.attachView(this);

    callApi();
    //GlobalDetails.getInstance().globalDoctorRegisterRequest = null;
  }
  callApi() async {

  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      key: key,
      body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: getScreenHeight(100),
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF00648D),
                        const Color(0xFF002338),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      //stops: [0.0, 0.2],
                      tileMode: TileMode.clamp),
                ),
                //color: Colors.white,
                child: Stack(
                  children:[
                    Image.asset('assets/images/splash_pattern_new.png'),
                    Container(

                      child: Column(
                        children: <Widget>[
                          Container(
                            height: getScreenHeight(50),
                            width: getScreenWidth(100),
                            child: Container(
                              //margin: EdgeInsets.all(15),
                              width: getScreenWidth(100),
                                height: getScreenHeight(50),
                                padding: EdgeInsets.only(left: getScreenWidth(20), right: getScreenWidth(20)),
                                child: SvgPicture.asset(
                                  'assets/images/logo.svg',
                                  fit: BoxFit.fitWidth,
                                  color: Colors.green,
                                )),
                          ),
                          Container(
                            height: getScreenHeight(40),
                            width: getScreenWidth(100),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: email_field,
                                    focusNode: email_focus,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    onSubmitted: (String value) {
                                      FocusScope.of(context).requestFocus(password_focus);
                                    },
                                    decoration: InputDecoration(
                                      //border: OutlineInputBorder(),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(color: Colors.white),
                                      hintText: 'Email',
                                      errorText: validate_email ? 'Value Can\'t Be Empty' : null,
                                      hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.white),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.white
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: password_field,
                                    focusNode: password_focus,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      errorText: validate_password ? 'Value Can\'t Be Empty' : null,
                                      labelText: 'Password',
                                      labelStyle: TextStyle(color: Colors.white),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.white),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.white
                                        ),
                                      ),
                                    ),

                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: getScreenWidth(80),
                            child: RaisedButton(
                              onPressed: (){
                                //Submit Login Credential

                                setState(() {

                                  email_field.text.isNotEmpty ? validate_email = true : validate_email = false;
                                  password_field.text.isNotEmpty ? validate_password = true : validate_password = false;

                                  if ( validate_email && validate_password ) {
                                    presenter.login("pandodevelopment1@gmail.com", "test@1234");
                                    validate_email = false;
                                    validate_password = false;
                                  }

                                });

                              },
                              color: Color(0xFF00C7CD),
                              child: Text('Sign In', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }


  @override
  BuildContext getContext() {
    return context;
  }

  @override
  Future<void> updateData(token) async {
    // TODO: implement updateData
    GlobalDetails.getInstance().auth = token;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OrderPage(),
    ));
  }


  getScreenWidth(per){
    return MediaQuery.of(context).size.width*(per/100);
  }

  getScreenHeight(per){
    return MediaQuery.of(context).size.height*(per/100);
  }
}
