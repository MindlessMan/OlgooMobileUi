import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.notifications_none, color: Colors.grey),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoSection(),
            SizedBox(height: 16),
            SubscriptionStatus(),
            SizedBox(height: 16),
            OrderManagement(),
            SizedBox(height: 16),
            QuickActions(),
          ],
        ),
      ),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            'فاطمه نیک خواه',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            'مدیر',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SubscriptionStatus extends StatelessWidget {
  const SubscriptionStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Row(
        children: [
          CircularProgressIndicator(
            value: 0.83,
            color: Colors.green,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مجموعه‌ی اعتماد',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'اشتراک فعال',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          Spacer(),
          Text(
            '83 روز مانده',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class OrderManagement extends StatelessWidget {
  const OrderManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                '3290 سفارش ثبت شده',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.edit_note, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('مدیریت سفارش‌ها'),
          ),
        ],
      ),
    );
  }
}

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        QuickActionItem(icon: Icons.pie_chart, label: 'آمارگیری'),
        QuickActionItem(icon: Icons.category, label: 'دسته‌بندی‌ها'),
        QuickActionItem(icon: Icons.inventory, label: 'محصولات'),
      ],
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickActionItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.grey[600], size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'داشبورد',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'سفارش‌ها',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          label: 'آمارگیری',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'مدیریت',
        ),
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}
