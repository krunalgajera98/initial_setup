import 'package:flutter/material.dart';
import 'package:initial_setup/Utils/AppColor/app_color.dart';
import 'package:initial_setup/Utils/AppHelper/text_theme.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  final double? height;
  final double? width;
  final String hint;
  List<String> dropDownList;
  String selectedValue;
  ValueChanged? onChanged;
  Widget? leading;

  CustomDropDown({
    this.height,
    this.width,
    this.leading,
    required this.hint,
    required this.selectedValue,
    required this.onChanged,
    required this.dropDownList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 55,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: AppColor.backGroundColor,
        border: Border.all(
          width: 1.0,
          color: Colors.white.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Row(
          children: [
            leading ?? const SizedBox(),
            SizedBox(width: leading != null ? 10 : 0),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconDisabledColor: Colors.grey,
                  hint: Text(
                    hint,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: MyStyle.light12,
                  ),
                  selectedItemBuilder: (_) {
                    return dropDownList
                        .map(
                          (e) => Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                              style: MyStyle.light12,
                            ),
                          ),
                        )
                        .toList();
                  },
                  style: MyStyle.light12,
                  isExpanded: true,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  items: dropDownList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                        style: MyStyle.light12.copyWith(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  value: selectedValue == '' ? null : selectedValue,
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
