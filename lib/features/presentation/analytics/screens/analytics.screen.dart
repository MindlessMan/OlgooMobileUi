import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("آمار گیری"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AnalyticsCard(
            title: "آمار گیری دسته بندی ها",
            description: "وضعیت و تعداد سفارش‌های هر دسته بندی رو به صورت تفکیک شده مشاهده کن.",
            icon: Icons.pie_chart,
            iconBackgroundColor: Colors.blue,
          ),
          SizedBox(height: 16),
          AnalyticsCard(
            title: "آمار گیری محصولات",
            description: "آمار فروش و روندهای فروش هر محصول رو میتونی اینجا بررسی کنی.",
            icon: Icons.category,
            iconBackgroundColor: Colors.pink,
          ),
          SizedBox(height: 16),
          AnalyticsCard(
            title: "گزارش سفارشات",
            description: "تعداد سفارشات و درآمد حاصل از اون رو محاسبه کن.",
            icon: Icons.calendar_today,
            iconBackgroundColor: Colors.orange,
          ),
        ],
      ),
    
    );
  }
}

class AnalyticsCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconBackgroundColor;

  const AnalyticsCard({super.key, 
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // آیکون
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconBackgroundColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconBackgroundColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // توضیحات
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // فلش راست
            const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}