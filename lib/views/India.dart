import 'dart:async';
import 'package:covtracker/custom_widgets/virus_loader.dart';
import 'package:covtracker/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  final _key = UniqueKey();
  bool _isLoadingPage=true;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: Text(
        'INDIA',
          style: TextStyle(color: Colors.white),
           ),
          leading: Icon(
            Icons.location_on,
            color: Colors.white,
          ),
        ),

      body:
          WebView(
          initialUrl: 'https://www.covid19india.org',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                },


      )
    );
  }
}






