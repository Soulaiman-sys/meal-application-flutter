import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/secreens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String Imgurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.Imgurl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get ComText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get AffText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  void SelectItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.RouteNm,
      arguments: {
        'id': id,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectItem(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(Imgurl,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: 300,
                      child: Text(title,
                          style: TextStyle(fontSize: 26, color: Colors.white)),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text("$ComText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text("$AffText"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
