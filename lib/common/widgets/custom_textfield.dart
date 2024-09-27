import 'package:appbar/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFormFiel extends StatefulWidget {
  const CustomFormFiel({
    required this.textEditingController,
    super.key,
    this.keyboardType,
    this.textInputAction,
    this.isTextarea = false,
    this.label,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.isObscure,
    this.isDisabled,
    this.validator,
  });
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixWidget, suffixWidget;
  final String? hintText, label;
  final bool isTextarea;
  final bool? isObscure, isDisabled;
  final String? Function(String?)? validator;

  @override
  State<CustomFormFiel> createState() => _CustomFormFielsState();
}

class _CustomFormFielsState extends State<CustomFormFiel> {
  String inputValue = '';

  void clearTextField() {
    setState(() {
      widget.textEditingController.text = '';
      inputValue = '';
    });
  }

  @override
  void dispose() {
    widget.textEditingController.text = '';
    inputValue = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                '${widget.label}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            : const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          onChanged: (value) {
            setState(() {
              inputValue = value;
            });
          },
          readOnly: widget.isDisabled ?? false,
          validator: widget.validator,
          maxLines: widget.isTextarea ? null : 1,
          minLines: widget.isTextarea ? 2 : 1,
          controller: widget.textEditingController,
          obscureText: widget.isObscure ?? false,
          cursorColor: Colors.black,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          keyboardType: widget.keyboardType ?? TextInputType.multiline,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.grey, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.black, width: 0.5),
              ),
              hintText: widget.hintText,
              prefixIcon: widget.prefixWidget,
              suffixIcon: widget.suffixWidget,
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryGrey,
                  fontSize: 14)),
        ),
      ],
    );
  }
}
