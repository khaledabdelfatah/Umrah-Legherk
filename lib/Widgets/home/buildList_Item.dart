import 'package:flutter/material.dart';

buildListItem(
    {String foodName,
    rating,
    ImageProvider imgPath,
    var date,
    Function showRequestDetails}) {
  return SingleChildScrollView(
    child: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.orange,
                    )),
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.orange,
                  onPressed: showRequestDetails,
                  hoverColor: Colors.deepOrangeAccent,

                  // Icons.add_circle_outline,
                  // color: Colors.orange,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                    width: 210.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(foodName,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    date,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFF68D7F)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(right: 10.0)),
                          SingleChildScrollView(
                            child: Container(
                                height: 75.0,
                                width: 75.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFFFFE3DF)),
                                child: Center(
                                  child: Container(
                                    height: 570 / 5.5,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 0.0,
                                            color: Colors.black26,
                                            offset: Offset(1.0, 10.0),
                                            blurRadius: 20.0),
                                      ],
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: new Container(
                                        width: 120.0,
                                        height: 190.0,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: imgPath,
                                          ),
                                        )),
                                  ),
                                )),
                          ),
                          SizedBox(width: 20.0),
                        ])),
              ),
            ],
          ),
        )),
  );
}
