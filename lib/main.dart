import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       supportedLocales: const [
    Locale('en', 'US'), 
    Locale('th', 'TH'),
  ],
      
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "List of Account",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
                buildAccountCard(
                  imageUrl: "https://cdn-icons-png.flaticon.com/512/3561/3561424.png",
                  title: "General List",
                  description: "You have 15 things to do",
                  onPressed: () {
                    showConfirmationDialog(
                      context: context,
                      title: "Confirmation",
                      content: "Are you sure you want to make the purchase?",
                    );
                  },
                ),
                const SizedBox(height: 20),
                buildAccountCard(
                  imageUrl: "https://cdn-icons-png.flaticon.com/512/1139/1139982.png",
                  title: "General List",
                  description: "You have 15 things to do",
                  onPressed: () {
                    showConfirmationDialog(
                      context: context,
                      title: "Confirmation",
                      content: "Are you sure you want to make the purchase?",
                    );
                  },
                ),
                const SizedBox(height: 20),
                buildAccountCard(
                  imageUrl: "https://cdn-icons-png.flaticon.com/512/2072/2072130.png",
                  title: "Go To List",
                  description: "You have 8 places to go",
                  onPressed: () {
                    showConfirmationDialog(
                      context: context,
                      title: "Confirmation",
                      content: "Are you sure you want to go?",
                    );
                  },
                ),
                const SizedBox(height: 20),
                buildAccountCard(
                  imageUrl: "https://cdn-icons-png.flaticon.com/512/1041/1041914.png",
                  title: "Shopping List",
                  description: "You have 5 items to buy",
                  onPressed: () {
                    showConfirmationDialog(
                      context: context,
                      title: "Confirmation",
                      content: "Are you sure you want to buy these items?",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAccountCard({
    required String imageUrl,
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        width: 800,
        height: 100,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 253, 253, 253),
              Color.fromARGB(255, 253, 253, 253),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    const SizedBox(height: 8),
                    Text(description),
                    ElevatedButton(
                      onPressed: onPressed,
                      child: const Text("View"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Confirm"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
