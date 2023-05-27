import 'package:flutter/material.dart';

class UsernameFormField extends StatefulWidget {
  const UsernameFormField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  State<UsernameFormField> createState() => _UsernameFormFieldState();
}

class _UsernameFormFieldState extends State<UsernameFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
        hintText: 'Full name',
        labelText: 'Full name',
      ),
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
      validator: (String? value) {
        // if (value == null || value.isEmpty) {
        //   return 'Invalid full name.';
        // }
        // return null;
      },
    );
  }
}
