import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:projeto_academia/view/create/create_page.dart';
import 'package:projeto_academia/view/home/home_init.dart';
import 'package:projeto_academia/view/home/home_page.dart';
import 'package:projeto_academia/view/read/read_page.dart';

Map<String, Widget Function(dynamic)> routes = {
  '/' : (context) => HomeInit(key: UniqueKey()),
  '/create' : (context) => CreatePage(key: UniqueKey()),
  '/read' : (context) => ReadPage(key: UniqueKey()),
};
