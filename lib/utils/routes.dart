import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:projeto_academia/view/home/home_page.dart';

Map<String, Widget Function(dynamic)> routes = {
  '/' : (context) => HomePage(key: UniqueKey()),
};