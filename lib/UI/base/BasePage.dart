import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pando_app/Utils/GlobalDetails.dart';



abstract class BasePage<T extends StatefulWidget> extends State<T> {
  BuildContext getContext();

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  // }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void handleException(exception) {
    print(exception);
    showFullScreenLoader(false);
    if (exception is SocketException) {
      print(exception.toString());
    } else {
      print(exception.toString());
    }
  }

  void showFullScreenLoader(bool show) {
    print('Pando Visible -> ${show} - ${getContext()}');
    if (show) {
      showDialog(
          context: context,
          builder: (_) => Material(
            type: MaterialType.transparency,
            child:
//                Image(image: new AssetImage("assets/images/loader.gif"))
            Center(
                child: SpinKitCircle(
                  size: 50.0,
                  color: Colors.green,
                )),
          ));
    }else{
      Navigator.of(context).pop();
    }
  }
}
