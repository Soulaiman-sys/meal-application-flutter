import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/meal_item.dart';
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
            return MealItem(
              id: categoryMeals[index].id,
              Imgurl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
        },
        itemCount: categoryMeals.length ,
      ),
    );
  }
}
