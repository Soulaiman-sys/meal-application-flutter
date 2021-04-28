import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
class CategoryMealsScreen extends StatefulWidget {
  static const RouteName='category_meals';
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {


  @override
  Widget build(BuildContext context) {

    var routeArg=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final categoryId=routeArg['id'];
    final categoryTitle=routeArg['title'];
    final categoryMeals=DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder:(ctx,index){
            return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length ,
      ),
    );
  }
}
