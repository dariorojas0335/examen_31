import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

  // A list of image URLs that you can easily change.
  final List<String> imageUrls = const [
    'assets/images/proy_1.jpg',
    'assets/images/proy_2.jpg',
    'assets/images/proy_3.jpg',
    'assets/images/proy_4.PNG',
    'assets/images/proy_5.jpg',
    'assets/images/proy_6.jpg',
    'assets/images/proy_7.PNG',
    'assets/images/proy_8.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGO'),
        leading: const Icon(Icons.menu),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: Container(height: 30, color: Colors.grey[300])),
                const SizedBox(width: 10),
                Container(width: 40, height: 30, color: Colors.grey[400]),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (index == 0) { // Solo para la primera imagen
                    context.go('/detalle');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          context.go('/');
        }
        if (index == 3) {
          context.go('/lista');
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}