import 'package:flutter/material.dart';
import 'package:food_heart/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  const MealDetailScreen({super.key});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedItem = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingrediants'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).hintColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedItem.ingredients[index]),
                  ),
                ),
                itemCount: selectedItem.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedItem.steps[index]),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectedItem.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(
          Icons.delete,
        ),
      ),
    );
  }
}

// Below is the another way to implement the same thing using SliverAppBar and CustomScrollView widget in flutter which is more efficient and better way to implement the same thing.


// import 'package:flutter/material.dart';
// import 'package:food_heart/dummy_data.dart';

// class MealDetailScreen extends StatelessWidget {
//   static const routeName = '/meal_detail';
//   const MealDetailScreen({super.key});

//   Widget buildSectionTitle(BuildContext context, String text) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         text,
//         style: Theme.of(context).textTheme.displayLarge,
//       ),
//     );
//   }

//   Widget buildContainer(Widget child) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(
//           color: Colors.grey,
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.all(10),
//       height: 200,
//       width: 300,
//       child: child,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mealId = ModalRoute.of(context)?.settings.arguments as String;
//     final selectedItem = DUMMY_MEALS.firstWhere(
//       (meal) => meal.id == mealId,
//     );

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(selectedItem.title),
//       // ),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             //pinned: true,
//             backgroundColor: Colors.black,
//             expandedHeight: 300,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Container(
//                 width: 300,
//                 color: Colors.black54,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 5,
//                   horizontal: 30,
//                 ),
//                 child: Text(selectedItem.title),
//               ),
//               //centerTitle: true,
//               background: Image.network(
//                 selectedItem.imageUrl,
//                 fit: BoxFit.cover,
//                 width: double.maxFinite,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             // child: Container(
//             //   height: 300,
//             //   width: double.infinity,
//             //   child: Image.network(
//             //     selectedItem.imageUrl,
//             //     fit: BoxFit.cover,
//             //   ),
//             // ),

//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   buildSectionTitle(context, 'Ingrediants'),
//                   buildContainer(
//                     ListView.builder(
//                       itemBuilder: (ctx, index) => Card(
//                         color: Theme.of(context).hintColor,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 5,
//                             horizontal: 10,
//                           ),
//                           child: Text(selectedItem.ingredients[index]),
//                         ),
//                       ),
//                       itemCount: selectedItem.ingredients.length,
//                     ),
//                   ),
//                   buildSectionTitle(context, 'Steps'),
//                   buildContainer(
//                     ListView.builder(
//                       itemBuilder: (ctx, index) => Column(
//                         children: [
//                           ListTile(
//                             leading: CircleAvatar(
//                               child: Text('# ${index + 1}'),
//                             ),
//                             title: Text(selectedItem.steps[index]),
//                           ),
//                           const Divider(),
//                         ],
//                       ),
//                       itemCount: selectedItem.steps.length,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
