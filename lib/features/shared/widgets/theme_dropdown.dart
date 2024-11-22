import 'package:app_gym/features/shared/bloc/dropdown_open/dropdown_open_cubit.dart';
import 'package:app_gym/features/shared/domain/entity/dropdown_entity.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeDropdownConfig {
  const ThemeDropdownConfig({
    this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.hintTextStyle,
    this.valueAlignment = Alignment.center,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonColor,
    this.buttonElevation,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.borderColor,
    this.selectedAlignment = Alignment.center,
    this.darkMode = false,
    this.arrowColor,
    this.textSelectedColor,
    this.backgroundSelectedColor,
    this.shouldFormatDateBlock = false,
  });
  final String? hint;
  final String? value;
  final List<DropdownEntity> dropdownItems;
  final ValueChanged<DropdownEntity> onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final Alignment? selectedAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final Color? buttonColor;
  final int? buttonElevation;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final Color? borderColor;
  final Color? arrowColor;
  final Color? textSelectedColor;
  final Color? backgroundSelectedColor;
  final bool darkMode;
  final TextStyle? hintTextStyle;
  final bool shouldFormatDateBlock;
}

class ThemeDropdown extends StatelessWidget {
  const ThemeDropdown({required this.config, super.key});
  final ThemeDropdownConfig config;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DropdownOpenCubit(),
      child: ThemeDropdownView(config: config),
    );
  }
}

class ThemeDropdownView extends StatelessWidget {
  final ThemeDropdownConfig config;

  const ThemeDropdownView({
    required this.config,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = config.dropdownItems.isNotEmpty;
    final dropdownItems = List.from(config.dropdownItems);
    final openCubit = context.read<DropdownOpenCubit>();
    final textTheme = TextStyle(color: Colors.black, fontSize: 13.sp);

    if (dropdownItems.isEmpty) {
      dropdownItems.add(DropdownEntity.unavailable);
    }

    return BlocBuilder<DropdownOpenCubit, bool>(builder: (context, stateOpen) {
      return Theme(
        data: Theme.of(context).copyWith(
            focusColor: Colors.black.withOpacity(0.1),
            highlightColor: Colors.grey),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            onMenuStateChange: openCubit.changeOpen,
            isExpanded: true,
            hint: Container(
              alignment: Alignment.center,
              child: Text(config.hint ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textTheme),
            ),
            value: config.value,
            style: textTheme,

            items: dropdownItems.map((item) {
              return DropdownMenuItem<String>(
                value: item.id,
                child: Container(
                  padding: config.itemPadding ??
                      EdgeInsets.only(left: 14.w, right: 14.w),
                  width: double.infinity,
                  alignment: config.valueAlignment ?? Alignment.centerLeft,
                  color: item.id == config.value
                      ? config.backgroundSelectedColor
                      : null,
                  child: Text(
                    item.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: textTheme.copyWith(
                        color: item.id == config.value
                            ? config.textSelectedColor
                            : Colors.blue),
                  ),
                ),
              );
            }).toList(), // Convert Iterable to List
            onChanged: isActive
                ? (id) => config
                    .onChanged(dropdownItems.firstWhere((e) => e.id == id))
                : null,

            selectedItemBuilder: (ctx) => dropdownItems
                .map((e) => Container(
                      alignment: config.selectedAlignment,
                      color: isActive ? null : Colors.white,
                      child: Text(
                        e.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: textTheme.copyWith(
                            fontSize: 14.sp, color: Colors.blue),
                      ),
                    ))
                .toList(), // Convert Iterable to List
            iconStyleData: IconStyleData(
              icon: isActive
                  ? (stateOpen
                      ? Icon(Icons.arrow_drop_up,
                          color: config.arrowColor ?? Colors.black)
                      : Icon(Icons.arrow_drop_down,
                          color: config.arrowColor ?? Colors.black))
                  : const SizedBox(),
              iconSize: config.iconSize ?? 12,
              iconEnabledColor:
                  isActive ? config.iconDisabledColor : Colors.grey,
              iconDisabledColor:
                  isActive ? config.iconDisabledColor : Colors.grey,
            ),
            buttonStyleData: ButtonStyleData(
              height: config.buttonHeight ?? 42.h,
              width: config.buttonWidth ?? 288.w,
              padding: config.buttonPadding ??
                  const EdgeInsets.only(left: 14, right: 14),
              decoration: config.buttonDecoration ??
                  BoxDecoration(
                      borderRadius: stateOpen
                          ? BorderRadius.only(
                              topLeft: Radius.circular(5.r),
                              topRight: Radius.circular(5.r))
                          : BorderRadius.circular(5.r),
                      border: Border.all(
                        color: config.borderColor ?? Colors.transparent,
                      ),
                      color: isActive
                          ? (config.buttonColor ?? Colors.white)
                          : Colors.grey),
              elevation: config.buttonElevation,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: config.itemHeight ?? 42.h,
              padding: EdgeInsets.zero,
            ),
            dropdownStyleData: DropdownStyleData(
                maxHeight: config.dropdownHeight ?? 212.h,
                width: config.dropdownWidth ?? 288.w,
                padding: config.dropdownPadding,
                decoration: config.dropdownDecoration ??
                    BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      border: Border.all(
                        color: config.borderColor ?? Colors.transparent,
                      ),
                    ),
                elevation: config.dropdownElevation ?? 8,
                offset: const Offset(0, 1),
                isOverButton: false,
                scrollbarTheme: ScrollbarThemeData(
                    radius: config.scrollbarRadius ?? Radius.circular(12.r),
                    thickness: config.scrollbarThickness != null
                        ? WidgetStatePropertyAll<double>(
                            config.scrollbarThickness!)
                        : null,
                    thumbVisibility: config.scrollbarAlwaysShow != null
                        ? WidgetStatePropertyAll<bool>(
                            config.scrollbarAlwaysShow!)
                        : null)),
          ),
        ),
      );
    });
  }
}
