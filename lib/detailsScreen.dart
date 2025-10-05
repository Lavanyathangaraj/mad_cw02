import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
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
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false; // Track favorite state

  @override
  Widget build(BuildContext context) {
    final pastelBackground = Color(0xFFF3E5F5);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipeName),
        backgroundColor: widget.pastelColor,
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
                  widget.imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.recipeName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: widget.pastelColor,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isFavorite
                                ? '${widget.recipeName} added to favorites'
                                : '${widget.recipeName} removed from favorites',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: widget.pastelColor,
                ),
              ),
              const SizedBox(height: 8),
              ...widget.ingredients
                  .map((item) => Text('- $item', style: const TextStyle(fontSize: 18))),
              const SizedBox(height: 16),
              Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: widget.pastelColor,
                ),
              ),
              const SizedBox(height: 8),
              ...widget.instructions.asMap().entries.map((entry) => Text(
                    '${entry.key + 1}. ${entry.value}',
                    style: const TextStyle(fontSize: 18),
                  )),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.pastelColor,
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
