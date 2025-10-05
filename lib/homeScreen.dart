import 'package:flutter/material.dart';
import 'detailsScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {
      'name': 'Pepper Chicken',
      'details': 'A spicy chicken dish made with black pepper and aromatic spices.',
      'image': 'assets/images/pepperChicken.jpg'
    },
    {
      'name': 'Mutton Biryani',
      'details': 'A flavorful rice dish with marinated mutton and spices.',
      'image': 'assets/images/muttonBiryani.jpg'
    },
    {
      'name': 'Broccoli Stir Fry',
      'details': 'Quick stir fry with broccoli, garlic, and soy sauce.',
      'image': 'assets/images/broccoliStirFry.jpg'
    },
    {
      'name': 'Steamed Salmon',
      'details': 'Fresh salmon steamed with lemon and herbs.',
      'image': 'assets/images/steamedSalmon.jpg'
    },
    {
      'name': 'Mashed Potato',
      'details': 'Creamy mashed potatoes with butter and cream.',
      'image': 'assets/images/mashedPotatoes.jpg'
    },
    {
      'name': 'Salad',
      'details': 'Fresh garden salad with lettuce, tomatoes, and dressing.',
      'image': 'assets/images/salad.jpg'
    },
    {
      'name': 'Tiramisu',
      'details': 'Classic Italian dessert with coffee-soaked ladyfingers and mascarpone.',
      'image': 'assets/images/tiramisu.jpg'
    },
    {
      'name': 'Baklava',
      'details': 'Sweet pastry made of layers of filo dough, nuts, and honey.',
      'image': 'assets/images/baklava.jpg'
    },
    {
      'name': 'Brownies',
      'details': 'Rich chocolate brownies with a fudgy center.',
      'image': 'assets/images/brownies.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final pastelPurple = Color(0xFFB39DDB);
    final pastelBackground = Color(0xFFEDE7F6);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Taste of Ilaan'),
        backgroundColor: pastelPurple,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Card(
            color: pastelBackground,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  recipes[index]['image']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                recipes[index]['name']!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: pastelPurple),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      recipeName: recipes[index]['name']!,
                      recipeDetails: recipes[index]['details']!,
                      imagePath: recipes[index]['image']!,
                      pastelColor: pastelPurple,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
