import './pages/countrypage.dart';
import './datasource.dart';
import './panels/info_panel.dart';
import './panels/most_effected_country.dart';
import './panels/world_wide_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://disease.sh/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://disease.sh/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }


  @override

  void initState(){
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Dashboard',),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                Datasource.quote,
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Worldwide',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                      
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        'Regional',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData==null?CircularProgressIndicator():WorldWidepanel(worldData: worldData,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Most Effected',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold                    
                ),
              ),
            ),
            
            SizedBox(height:10,),
            countryData==null?Container():MostAffectedPanel(countryData: countryData,),

            InfoPanel(),
            SizedBox(width:10),




          ],
        )
      ),
    );
  }
}