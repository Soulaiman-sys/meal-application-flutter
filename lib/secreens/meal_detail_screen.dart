import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static String RouteNm = 'meal-detail';
  Widget builsSectionTitle(String titl,BuildContext ctx)
  {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(titl, style: Theme
            .of(ctx)
            .textTheme
            .title,),
      );
  }
  @override
  Widget build(BuildContext context) {
    var MealId = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final SelectMeal = DUMMY_MEALS.firstWhere((meal) =>
    meal.id == MealId['id'].toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(SelectMeal.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(SelectMeal.imageUrl, fit: BoxFit.cover,),
          ),
          builsSectionTitle("Ingredients",context),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            //margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 170, //200,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx,index)=> Card(
                color: Theme.of(ctx).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Text(SelectMeal.ingredients[index]),
                ),
              ),
              itemCount: SelectMeal.ingredients.length,

            ),
          ),
          builsSectionTitle("Steps",context), // I stop the cours in  part 9 minute : 13:00
        ],
      ),
    );
  }
}
