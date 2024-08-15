import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/core/style.dart';

class CustomTextField extends StatelessWidget {
final  Function()? onEditingComplete;
final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.controller,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 45,
      decoration: BoxDecoration(
        
          color: Colors.grey.withOpacity(.12),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller:controller ,
        onEditingComplete:onEditingComplete ,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
              hintStyle: StyleManager.textStyle18,
              hintText: StringManager.textFieldHintText,
              suffixIcon: Icon(FontAwesomeIcons.microphone,
                  size: 22, color: Colors.grey.withOpacity(.3)),
              prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
                  size: 22, color: Colors.grey.withOpacity(.3)),
              border: InputBorder.none)),
    );
  }
}
