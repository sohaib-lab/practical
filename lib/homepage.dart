import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'app_screen/drink_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("SOHAIB"),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: res != null
              ? ListView.builder(
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              var drink = drinks[index];
              return ListTile(
                leading: Hero(
                    tag: drink["idDrink"],
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(drink[
                        "strDrinkThumb"] ??
                            "https://medium.com/flutter-community/dart-null-safety-migration-cheat-sheet-df687955ec13"))),
                title: Text(
                  "${drink["strDrink"]}",
                  style: TextgiStyle(color: Colors.white, fontSize: 20.0,fontFamily: 'Raleway',fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "${drink["idDrink"]}",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DrinkDetail(drink: drink),
                      ));
                },
              );
            },
          )
              : CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}