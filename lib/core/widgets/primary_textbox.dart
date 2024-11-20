import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../config/theme/color_pallet.dart';

class PrimaryTextBox extends StatefulWidget {
  const PrimaryTextBox({
    super.key,
    required this.controller,
    this.isObsecure = false,
    required this.iconPath,
    required this.title,
    required this.hint,
    this.isNumbricKeyboard = false,
  });
  final TextEditingController? controller;
  final bool isObsecure;
  final String iconPath;
  final bool? isNumbricKeyboard;
  final String title;
  final String hint;

  @override
  State<PrimaryTextBox> createState() => _PrimaryTextBoxState();
}

class _PrimaryTextBoxState extends State<PrimaryTextBox> {
  bool isFocusedIcon = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 42, top: 8),
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.titleSmall,
              )),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8, right: 0, top: 2),
          margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
          width: MediaQuery.of(context).size.width * 0.79,
          height: 48,
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.surface),
          child: Align(
              alignment: Alignment.center,
              child: TextField(
                
                keyboardType: (widget.isNumbricKeyboard == true || widget.isObsecure == true)
                    ? TextInputType.number
                    : TextInputType.text,
                style: TextStyle(
                    fontFamily: "dana",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.surfaceBright),
                obscureText: widget.isObsecure,
                
                controller: widget.controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorPallet.lightColorScheme.surfaceBright,
                        width: 1.0), // Custom border
                    borderRadius: BorderRadius.circular(
                        10.0), // Optional: round the border
                  ),
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: ColorPallet.lightColorScheme.primary,
                        width: 1), // Focused border style
                  ),
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      fontFamily: "dana",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.surfaceBright),
                  prefixIcon: SvgPicture.asset(
                    widget.iconPath,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.surfaceBright,
                        BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
                  
                  border: InputBorder.none,
                ),
              )),
        ),
      ],
    );
  }
}
