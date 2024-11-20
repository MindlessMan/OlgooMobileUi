import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olgoo_mobile/config/asset/icons_path.dart';
import 'package:olgoo_mobile/config/extensions/gap_space_extension.dart';
import 'package:olgoo_mobile/core/widgets/primary_button.dart';
import 'package:olgoo_mobile/core/widgets/primary_textbox.dart';

class ProductRegistrationPage extends StatefulWidget {
  const ProductRegistrationPage({super.key});

  @override
  State<ProductRegistrationPage> createState() =>
      _ProductRegistrationPageState();
}

class _ProductRegistrationPageState extends State<ProductRegistrationPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      //! app bar
      appBar: AppBar(
        title: const Text('ثبت محصول جدید'),
        leading: IconButton(
          icon: SvgPicture.asset(IconPath.back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(IconPath.help),
            onPressed: () {},
          ),
        ],
      ),
      //
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryTextBox(
                  controller: titleController,
                  iconPath: IconPath.product,
                  title: "نام محصول",
                  hint: "مثلا پیراهن پسرانه"),
              PrimaryTextBox(
                controller: priceController,
                iconPath: IconPath.money,
                title: "قیمت",
                hint: "تومان",
                isNumbricKeyboard: true,
              ),
              8.0.verticalSpace,
              _buildGroupSelection(),
              8.0.verticalSpace,
              _buildProductTypeSelection(),
              24.0.verticalSpace,
              // Text('سایز بندی', style: Theme.of(context).textTheme.titleMedium),
              // const SizedBox(height: 8),
              // _buildSizeSelection(),
              _buildSizeContainer(),
              PrimaryButton(
                  isPrimaryColor: true,
                  action: () {},
                  child: Text(
                    "ثبت محصول",
                    style: Theme.of(context).textTheme.labelLarge,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupSelection() {
    List colors = [Colors.amber, Colors.red, Colors.green, Colors.blue];
    List childs = ["مجلسی", "اداری", "مدارسی", "شخصی"];
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(14),
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "دسته بندی محصول",
            style: TextStyle(
                fontFamily: "dana",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  //width: 90,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  //height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.surfaceBright)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      4.0.horizontalSpace,
                      Text(
                        childs[index],
                      ),
                      10.0.horizontalSpace,
                    ],
                  )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductTypeSelection() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(right: 8,top: 14),
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10)),
      //width: MediaQuery.of(context).size.width * ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "نوع محصول",
            style: TextStyle(
                fontFamily: "dana",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TypeChip(
                  context: context,
                  title: "بالا تنه",
                ),
                TypeChip(
                  context: context,
                  title: "پایین تنه",
                ),
                TypeChip(
                  context: context,
                  title: "جانبی",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! header ------------------
          Text(
            "انتخاب سایز",
            style: TextStyle(
                fontFamily: "dana",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const Divider(),
          //! list----------------------
          DynamicGrid()
        ],
      ),
    );
  }
}

class TypeChip extends StatelessWidget {
  const TypeChip({
    super.key,
    required this.context,
    required this.title,
  });

  final BuildContext context;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      margin: const EdgeInsets.only(top: 20),
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      //height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: Theme.of(context).colorScheme.surfaceBright)),
      child: Center(
          child: Text(
        title,
      )),
    );
  }
}

class DynamicGrid extends StatelessWidget {
  final List<String> items = ['1', '2', '3', '4', '5', '6', '7', '8', 'Custom'];

  DynamicGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0, // فاصله افقی بین مربع‌ها
      runSpacing: 10.0, // فاصله عمودی بین مربع‌ها
      children: items.map((item) {
        return SizedBox(
          width: 70, // عرض هر مربع
          height: 70, // ارتفاع هر مربع
          child: ElevatedButton(
            onPressed: () {
              print("object");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // رنگ پس‌زمینه
            ),
            child: Text(
              item,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }).toList()
        ..add(SizedBox(
          child: GestureDetector(
            onTap: () {
              // عملکرد دکمه "سایز جدید"
            },
            child: SizedBox(
              width: 70,
              height: 70,
              child: DottedBorder(
                color: Theme.of(context).colorScheme.secondary, // رنگ حاشیه
                dashPattern: const [6, 3],
                borderType: BorderType.RRect,
                radius: const Radius.circular(8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconPath.add),
                      Text(
                        'سایز جدید',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontFamily: "dana",
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
    );
  }
}
