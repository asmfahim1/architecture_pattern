// features/dashboard/ui/dashboard_page.dart
import 'package:architecture_pattern/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  DashboardCard(
                    title: 'Products',
                    icon: Icons.shopping_cart,
                    color: Colors.blue,
                    onTap: () => Navigator.pushNamed(context, '/products'),
                  ),
                  DashboardCard(
                    title: 'Orders',
                    icon: Icons.list_alt,
                    color: Colors.green,
                    onTap: () {},
                  ),
                  DashboardCard(
                    title: 'Analytics',
                    icon: Icons.analytics,
                    color: Colors.orange,
                    onTap: () {},
                  ),
                  DashboardCard(
                    title: 'Settings',
                    icon: Icons.settings,
                    color: Colors.purple,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
