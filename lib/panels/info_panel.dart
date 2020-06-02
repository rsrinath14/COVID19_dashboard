import 'package:covid_19/pages/faq.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../datasource.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: <Widget>[
          SizedBox(height:30),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>FAQpage()));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: primaryBlack,
              margin: EdgeInsets.symmetric(vertical:5,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[             
                  Text(
                    'FAQS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              )

            ),
          ),
          GestureDetector(
            onTap:(){
              launch('https://covid19responsefund.org/en/');
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: primaryBlack,
              margin: EdgeInsets.symmetric(vertical:5,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'DONATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              )

            ),
          ),
          GestureDetector(
            onTap:(){
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            } ,
            child: Container(
              padding: EdgeInsets.all(10),
              color: primaryBlack,
              margin: EdgeInsets.symmetric(vertical:5,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'MYTH BUSTERS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              )

            ),
          ),

        ],
      )
    );
  }
}