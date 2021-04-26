import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeTopBarnan extends StatelessWidget {
  Color _color=Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[

          IconButton(
            icon: Icon(Icons.arrow_back_ios,size:35,),
            hoverColor: Colors.orange,
            onPressed: (){},
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _color
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    )
                ),
              ),
              onTap: (){
                _color=Colors.transparent;
                _color=Colors.lightBlueAccent;
              },
            )
          ),
          IconButton(
            icon: Icon(Icons.more_horiz,size: 35,),
            onPressed: (){},
          ),

        ],
      ),
    );
  }
}
