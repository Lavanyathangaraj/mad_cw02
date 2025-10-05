import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String recipeName;
  final String recipeDetails;
  final String imagePath;
  final Color pastelColor;

  const DetailsScreen({
    super.key,
    required this.recipeName,
    required this.recipeDetails,
    required this.imagePath,
    required this.pastelColor,
  });

  @override
  Widget build(BuildContext context) {
    final pastelBackground = Color(0xFFF3E5F5);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeName),
        backgroundColor: pastelColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: pastelBackground,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                recipeName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: pastelColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                recipeDetails,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pastelColor,
                  ),
                  child: const Text('Back to Recipes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
