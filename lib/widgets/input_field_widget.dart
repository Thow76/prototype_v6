import 'package:flutter/material.dart';
import '../utils/input_decoration_template.dart';

class DynamicInputWidget extends StatelessWidget {
  const DynamicInputWidget(
      {required this.controller,
      required this.obscureText,
      required this.focusNode,
      required this.toggleObscureText,
      required this.validator,
      required this.prefIcon,
      required this.labelText,
      required this.textInputAction,
      required this.isNonPasswordField,
      Key? key})
      : super(key: key);

  // bool to check if the text field is for password or not
  final bool isNonPasswordField;
  // Controller for the text field
  final TextEditingController controller;
  // Functio to toggle Text obscuractio on the password text field
  final VoidCallback? toggleObscureText;
  // to obscure text or not bool
  final bool obscureText;
  // FocusNode for input
  final FocusNode focusNode;
  // Validator function
  final String? Function(String?)? validator;
  // Prefix icon for input form
  final Icon prefIcon;
  // label for input form
  final String labelText;
  // The keyword action to display
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: textInputDecorationLight.copyWith(
        label: Text(labelText),
        prefixIcon: prefIcon,
        suffixIcon: IconButton(
          onPressed: toggleObscureText,
          // If is non-password filed like email the suffix icon will be null
          icon: isNonPasswordField
              ? const Icon(null)
              : obscureText
                  ? const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: Colors.white,
                    ),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      focusNode: focusNode,
      textInputAction: textInputAction,
      obscureText: obscureText,
      validator: validator,
      // onSaved: passwordVlidator,
    );
  }
}
