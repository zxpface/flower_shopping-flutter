import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
class WebListBox extends StatefulWidget {
  @override
  _WebListBoxState createState() => _WebListBoxState();
}

class _WebListBoxState extends State<WebListBox> {
  ScrollPhysics physics;
  bool isUp = false;
  ScrollController srollController;
  double screenHeight;

  @override
  void initState() {
    super.initState();
    physics = ScrollPhysics();
    srollController = ScrollController();
  }


  @override
  void dispose() {
    super.dispose();
    srollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Listener(
      onPointerMove: (e){
        isUp = e.delta.dy < 0;
        print("moved");
      },
      onPointerUp: (e){
        print("isUp : " + isUp.toString());
        if(isUp){
          if(srollController.position.pixels == srollController.position.maxScrollExtent){
            setState(() {
              physics = NeverScrollableScrollPhysics();
            });
          }
        }
      },
      child: ListView(
        controller: srollController,
        physics: physics,
        children: <Widget>[
          SizedBox(height: screenHeight),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  height: screenHeight,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: InAppWebView(
                    // onWebViewCreated: (ctl){
                    //   ctl.injectScriptCode("""
                    //     console.log("test");
                    //     console.log(document.body)
                    //     document.body.onscroll = function(e){console.log(document.body.onscroll));
                    //     console.log(document.body.onscroll)
                    //   """);
                    // },
                    onConsoleMessage: (InAppWebViewController ctl, ConsoleMessage consoleMessage){
                      print("message  xxxxxx = ");
                      print(consoleMessage.message);
                    },
                    onScrollChanged: (controller, int x, int y){
                      print("yyy "+ y.toString());
                      if(y == 0){
                        setState(() {
                          physics = ScrollPhysics();
                        });
                      }
                    },
                    initialUrl: "https://flutter.io/",
                  ))
            ],
          )
        ],
      ),
    );
  }
}
