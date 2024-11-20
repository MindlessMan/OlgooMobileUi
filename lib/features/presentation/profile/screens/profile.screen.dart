import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olgoo_mobile/features/presentation/profile/bloc/company.bloc.dart';
import 'package:olgoo_mobile/features/presentation/profile/bloc/company.status.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CompanyBloc>(context).add(FetchCompany());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "مدیریت سیستم",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<CompanyBloc, CompanyState>(
              builder: (context, state) {
                if (state.status is FetchedCompanyStatus) {
                  var data = (state.status as FetchedCompanyStatus).data;
                  return UserInfoCard(
                    userName: translator(data.title),
                    subscriptionStatus: translator(data.status),
                    daysRemaining: 83,
                  );
                } else if (state.status is LoadingCompanyStatus) {
                  return UserInfoCard(
                    userName: translator("Not Registered !"),
                    subscriptionStatus: "انتظار",
                    daysRemaining: 0,
                  );
                } else {
                  return const UserInfoCard(
                    userName: "خطا",
                    subscriptionStatus: "خطا",
                    daysRemaining: 0,
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            ManagementOption(
              icon: Icons.shopping_bag,
              title: "مدیریت محصولات",
              onTap: () {},
            ),
            ManagementOption(
              icon: Icons.label,
              title: "مدیریت دسته بندی ها",
              onTap: () {},
            ),
            ManagementOption(
              icon: Icons.person,
              title: "کاربران سیستم",
              onTap: () {
                // Navigate to Users
              },
            ),
          ],
        ),
      ),
    );
  }

  translator(String txt) {
    switch (txt) {
      case "active":
        return "فعال";
      case "Not Registered !":
        return "غیر فعال";
      default:
        return "اشتراک";
    }
  }
}

class UserInfoCard extends StatelessWidget {
  final String userName;
  final String subscriptionStatus;
  final int daysRemaining;

  const UserInfoCard({
    super.key,
    required this.userName,
    required this.subscriptionStatus,
    required this.daysRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            child: Icon(Icons.person, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(subscriptionStatus),
                    const SizedBox(width: 8),
                    const Icon(Icons.circle, size: 8, color: Colors.green),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "$daysRemaining روز مانده",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class ManagementOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ManagementOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.green),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
