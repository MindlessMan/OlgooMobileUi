import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("مدیریت سفارش ها"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            // جستجو و دکمه سفارش جدید
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "جستجو",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      // افزودن سفارش جدید
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("سفارش جدید"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // انتخاب دسته‌بندی و تب‌ها
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // انتخاب دسته‌بندی
                    },
                    icon: const Icon(Icons.location_on),
                    label: const Text("انتخاب دسته بندی"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.green,
                    isScrollable: true,
                    tabs: [
                      Tab(text: "تحویلی"),
                      Tab(text: "آماده"),
                      Tab(text: "جاری"),
                      Tab(text: "انتخاب دسته بندی"),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            // تعداد سفارش‌ها
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "۴۹ مورد یافت شد",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // سفارشات امروز
                        },
                        icon: const Icon(Icons.calendar_today),
                        label: const Text("سفارشات امروز"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          elevation: 0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          // فیلتر
                        },
                        icon: const Icon(Icons.filter_list),
                        label: const Text("فیلتر"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // لیست سفارش‌ها
            Expanded(
              child: ListView.builder(
                itemCount: 4, // تعداد سفارش‌ها
                itemBuilder: (context, index) {
                  return OrderCard(
                    title: "هاشم بگ زاده",
                    date: "10/11/1402",
                    details: "4 محصول دیگر هم دارد",
                    totalPrice: "۴۹۰,۰۰۰ تومان",
                    status: "سفارش آماده نشده",
                  );
                },
              ),
            ),
          ],
        ),
       
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String title;
  final String date;
  final String details;
  final String totalPrice;
  final String status;

  const OrderCard({super.key, 
    required this.title,
    required this.date,
    required this.details,
    required this.totalPrice,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(details, style: const TextStyle(color: Colors.blue)),
                Text("مبلغ پرداختی: $totalPrice",
                    style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.error, color: Colors.red, size: 16),
                const SizedBox(width: 8),
                Text(
                  status,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}