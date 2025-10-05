import 'package:flutter/material.dart';
import 'detailsScreen.dart';
import 'favoritesScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Pepper Chicken',
      'image': 'assets/images/pepperChicken.jpg',
      'ingredients': [
        '500g chicken',
        '2 tsp black pepper',
        '1 tbsp oil',
        'Salt to taste',
        'Garlic and ginger paste'
      ],
      'instructions': [
        'Marinate chicken with salt, pepper, and paste.',
        'Heat oil in a pan and cook chicken until golden brown.',
        'Add spices and simmer for 10 minutes.',
        'Serve hot.'
      ],
    },
    {
      'name': 'Mutton Biryani',
      'image': 'assets/images/muttonBiryani.jpg',
      'ingredients': [
        '500g mutton',
        '2 cups basmati rice',
        '1 tbsp biryani masala',
        'Onion, garlic, ginger',
        'Yogurt'
      ],
      'instructions': [
        'Marinate mutton with yogurt and spices.',
        'Cook rice separately until 70% done.',
        'Layer rice and mutton in a pot.',
        'Cook on low heat for 30 minutes.',
        'Serve with raita.'
      ],
    },
    {
      'name': 'Broccoli Stir Fry',
      'image': 'assets/images/broccoliStirFry.jpg',
      'ingredients': [
        '1 head broccoli',
        '2 tbsp soy sauce',
        '1 tbsp olive oil',
        '2 cloves garlic'
      ],
      'instructions': [
        'Heat oil in a pan and sauté garlic.',
        'Add broccoli and stir fry for 5-6 minutes.',
        'Add soy sauce and cook for 2 more minutes.',
        'Serve immediately.'
      ],
    },
    {
      'name': 'Steamed Salmon',
      'image': 'assets/images/steamedSalmon.jpg',
      'ingredients': [
        '2 salmon fillets',
        '1 lemon',
        'Salt and pepper',
        'Herbs (dill or parsley)'
      ],
      'instructions': [
        'Season salmon with salt, pepper, and herbs.',
        'Place in steamer and steam for 10-12 minutes.',
        'Squeeze lemon over salmon and serve.'
      ],
    },
    {
      'name': 'Mashed Potato',
      'image': 'assets/images/mashedPotatoes.jpg',
      'ingredients': [
        '4 large potatoes',
        '2 tbsp butter',
        '1/4 cup milk',
        'Salt and pepper'
      ],
      'instructions': [
        'Boil potatoes until soft.',
        'Mash potatoes and add butter and milk.',
        'Season with salt and pepper.',
        'Serve warm.'
      ],
    },
    {
      'name': 'Salad',
      'image': 'assets/images/salad.jpg',
      'ingredients': [
        'Lettuce',
        'Tomatoes',
        'Cucumbers',
        'Olive oil and lemon juice'
      ],
      'instructions': [
        'Wash and chop vegetables.',
        'Mix in a bowl.',
        'Add olive oil and lemon juice as dressing.',
        'Serve fresh.'
      ],
    },
    {
      'name': 'Tiramisu',
      'image': 'assets/images/tiramisu.jpg',
      'ingredients': [
        'Ladyfingers',
        'Mascarpone cheese',
        'Coffee',
        'Cocoa powder',
        'Sugar'
      ],
      'instructions': [
        'Dip ladyfingers in coffee.',
        'Layer with mascarpone mixture.',
        'Repeat layers and top with cocoa powder.',
        'Chill for 2-3 hours before serving.'
      ],
    },
    {
      'name': 'Baklava',
      'image': 'assets/images/baklava.jpg',
      'ingredients': [
        'Filo dough',
        'Chopped nuts',
        'Honey',
        'Butter'
      ],
      'instructions': [
        'Layer filo sheets and brush with butter.',
        'Sprinkle chopped nuts between layers.',
        'Bake until golden brown.',
        'Drizzle honey on top and cool before serving.'
      ],
    },
    {
      'name': 'Brownies',
      'image': 'assets/images/brownies.jpg',
      'ingredients': [
        '200g dark chocolate',
        '150g butter',
        '150g sugar',
        '3 eggs',
        '100g flour'
      ],
      'instructions': [
        'Melt chocolate and butter together.',
        'Whisk in sugar and eggs.',
        'Fold in flour gently.',
        'Bake at 180°C for 20-25 minutes.',
        'Cool and cut into squares.'
      ],
    },
  ];

  final Map<String, bool> favoriteMap = {};

  @override
  void initState() {
    super.initState();
    for (var recipe in recipes) {
      favoriteMap[recipe['name']] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pastelPurple = Color(0xFFB39DDB);
    final pastelBackground = Color(0xFFEDE7F6);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ilaan's Recipe Book"),
        backgroundColor: pastelPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  color: pastelBackground,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        recipe['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      recipe['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(
                      favoriteMap[recipe['name']]!
                          ? Icons.favorite
                          : Icons.arrow_forward_ios,
                      color: favoriteMap[recipe['name']]! ? Colors.red : pastelPurple,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            recipeName: recipe['name'],
                            imagePath: recipe['image'],
                            ingredients: recipe['ingredients'],
                            instructions: recipe['instructions'],
                            pastelColor: pastelPurple,
                            isFavorite: favoriteMap[recipe['name']]!,
                            onFavoriteChanged: (value) {
                              setState(() {
                                favoriteMap[recipe['name']] = value;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(
                      recipes: recipes,
                      favoriteMap: favoriteMap,
                    ),
                  ),
                ).then((_) {
                  setState(() {});
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: pastelPurple,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('View Favorites'),
            ),
          ),
        ],
      ),
    );
  }
}
