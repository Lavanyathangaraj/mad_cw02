import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String recipeName;
  final String imagePath;
  final List<String> ingredients;
  final List<String> instructions;
  final Color pastelColor;

  const DetailsScreen({
    super.key,
    required this.recipeName,
    required this.imagePath,
    required this.ingredients,
    required this.instructions,
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
                'Ingredients',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: pastelColor,
                ),
              ),
              const SizedBox(height: 8),
              ...ingredients.map((item) => Text('- $item', style: const TextStyle(fontSize: 18))),
              const SizedBox(height: 16),
              Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: pastelColor,
                ),
              ),
              const SizedBox(height: 8),
              ...instructions.asMap().entries.map((entry) =>
                  Text('${entry.key + 1}. ${entry.value}', style: const TextStyle(fontSize: 18))),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
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
