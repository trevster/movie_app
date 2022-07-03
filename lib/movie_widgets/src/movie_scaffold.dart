import 'package:flutter/material.dart';

class MovieScaffold extends Scaffold {

  final PreferredSizeWidget? appBar;
  final Widget? body;

  const MovieScaffold({Key? key, this.body, this.appBar}) : super(key: key, body: body, appBar: appBar);
}
