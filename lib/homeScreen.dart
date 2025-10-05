import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> recipes = [
    'Pepper Chicken',
    'Mutton Biryani',
    'Broccoli Stir Fry',
    'Steamed Salmon',
    'Mashed Potato',
    'Salad',
    'Tiramisu',
    'Baklava',
    'Brownies',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Recipes'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.purple[100],
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Taste of Ilaan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.restaurant_menu, color: Colors.purple),
                    title: Text(recipes[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selected: ${recipes[index]}')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
