import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("meal"),
      ),
      body: GridView(
        padding: EdgeInsets.all(25.0),
        children: DUMMY_CATEGORIES
            .map(
              (catdata) =>
                  CategoryItem(catdata.id, catdata.title, catdata.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
