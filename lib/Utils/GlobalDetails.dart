import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalDetails {
  static GlobalDetails instance;

  String uuid;

  static GlobalDetails getInstance() {
    if (instance == null) {
      instance = GlobalDetails();
    }
    return instance;
  }

  FirebaseMessaging firebaseMessaging;
  String auth;

  static void reset() {
    instance = null;
    print('globaldetails resetted');
  }
}


