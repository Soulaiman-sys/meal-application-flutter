import 'package:flutter/material.dart';
import 'package:mealapp/secreens/categories_screen.dart';
import 'package:mealapp/secreens/category_meals_screen.dart';
import 'package:mealapp/secreens/meal_detail_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.pinkAccent,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1.0),
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1.0),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1.0),
              ),
              title: TextStyle(fontSize: 18)//fontfamily??
          )),
      //home: MyHomePage(),
      home: CategoriesScreen(),
      routes: {
        CategoryMealsScreen.RouteName: (context)=> CategoryMealsScreen(),
        MealDetailScreen.RouteNm:(context)=>MealDetailScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal app"),
      ),
      body: null,
    );
  }
}
