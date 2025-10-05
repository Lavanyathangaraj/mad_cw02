import 'package:flutter/material.dart';
import 'detailsScreen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;
  final Map<String, bool> favoriteMap;

  const FavoritesScreen({
    super.key,
    required this.recipes,
    required this.favoriteMap,
  });

  @override
  Widget build(BuildContext context) {
    final pastelPurple = Color(0xFFB39DDB);
    final pastelBackground = Color(0xFFEDE7F6);

    final favoriteRecipes =
        recipes.where((recipe) => favoriteMap[recipe['name']] == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
        backgroundColor: pastelPurple,
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text('No favorite recipes yet!'))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
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
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
                            isFavorite: true,
                            onFavoriteChanged: (value) {
                              favoriteMap[recipe['name']] = value;
                              Navigator.pop(context);
                            },
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
