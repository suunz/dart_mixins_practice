import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  const PasswordFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        obscureText: isHidden,
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'Password',
          labelText: widget.labelText ?? 'Password',
          suffixIcon: IconButton(
            icon: isHidden
                ? const Icon(
                    Icons.visibility_off_outlined,
                    size: 24,
                  )
                : const Icon(
                    Icons.visibility_outlined,
                    size: 24,
                  ),
            onPressed: togglePasswordVisibility,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        validator: (String? value) {},
        autofillHints: const [AutofillHints.password],
        onEditingComplete: () => TextInput.finishAutofillContext(),
      );

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}

// class PasswordFormField extends StatefulWidget {
//   final TextEditingController controller;
//   final String? hintText;
//   final String? labelText;

//   const PasswordFormField({
//     Key? key,
//     required this.controller,
//     this.hintText,
//     this.labelText,
//   }) : super(key: key);

//   @override
//   PasswordFormFieldState createState() => PasswordFormFieldState();
// }

// class _PasswordFormFieldState extends State<PasswordFormField> {
//   bool isHidden = true;

//   @override
//   Widget build(BuildContext context) => TextFormField(
//     controller: widget.controller,
//     obscureText: isHidden,
//     decoration: InputDecoration(
//       hintText: widget.hintText ?? 'Password',
//       labelText: widget.labelText ?? 'Password',
//       suffixIcon: IconButton(
//         icon: isHidden
//             ? const Icon(
//           Icons.visibility_off_outlined,
//           size: 24,
//         )
//             : const Icon(
//           Icons.visibility_outlined,
//           size: 24,
//         ),
//         onPressed: togglePasswordVisibility,
//       ),
//     ),
//     keyboardType: TextInputType.visiblePassword,
//     validator: (String? value) {

//     },
//     autofillHints: const [AutofillHints.password],
//     onEditingComplete: () => TextInput.finishAutofillContext(),
//   );

//   void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
// }