import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connect_himal/res/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  final TextEditingController? controller;
  final bool? disabled;
  final String? hint;
  final String? initialValue;
  final String? label;
  final bool required;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final Color? fillColor;
  final String? errorText;
  final List<TextInputFormatter>? formatters;
  final FocusNode? focusNode;
  final Widget? prefixIcon, suffixIcon;
  final bool takeCheckSpace;
  final void Function(String)? onFieldSubmitted;
  final BorderRadius? borderRadius;
  const CustomTextFormField(
      {this.takeCheckSpace = false,
      this.prefixIcon,
      this.fillColor,
      this.focusNode,
      this.suffixIcon,
      this.validator,
      this.disabled = false,
      this.onChanged,
      this.required = false,
      this.hint,
      this.onFieldSubmitted,
      this.borderRadius,
      this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maxLines = 1,
      this.controller,
      this.initialValue,
      this.errorText,
      this.formatters,
      super.key,
      this.onTap});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? errorText;
  bool interacted = false;
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    errorText = widget.errorText;
    obscureText = widget.obscureText;
    if (widget.initialValue != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(widget.initialValue!);
      });
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    // final border = OutlineInputBorder(
    //   borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
    //   borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.label!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (widget.required)
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        TextFormField(
          onTap:widget.onTap,
          inputFormatters: widget.formatters,
          focusNode: widget.focusNode,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: obscureText,
          enabled: !widget.disabled!,
          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
            fillColor: widget.fillColor ??
                (Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]
                    : Colors.white),
            filled: true,
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
            ),
            suffixIcon: widget.maxLines == 1
                ? widget.obscureText
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      )
                    : (widget.suffixIcon != null || widget.takeCheckSpace)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.suffixIcon != null) widget.suffixIcon!,
                              if (widget.suffixIcon != null)
                                const SizedBox(width: 8),
                              if (interacted && errorText == null)
                                const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                            ],
                          )
                        : (interacted && errorText == null)
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : null
                : null,
            errorStyle: const TextStyle(height: 0, fontSize: 0),
          ),
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            if (widget.validator != null) {
              setState(() {
                errorText = widget.validator!(value);
                interacted = true;
              });
            }
            widget.onChanged?.call(value);
          },
        ),
        if (errorText != null)
          Column(
            children: [
              const SizedBox(height: 8.0),
              Text(
                errorText ?? "",
                style: TextStyle(color: errorColor),
              ),
            ],
          ),
      ],
    );
  }
}
