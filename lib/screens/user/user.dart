import 'package:flutter/material.dart';
import 'package:mixinspractice/screens/user/widgets/password_form_field.dart';
import 'package:mixinspractice/screens/user/widgets/username_form_field.dart';
import 'mixins/display_mixin.dart';
import 'mixins/validator_mixin.dart';

class User extends StatefulWidget with ValidatorMixin, DisplayMixin {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void createUser() {
    if (widget.validatePassword(
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text)) {
      widget.displayUser(username: userNameController.text);
      final snackBar = SnackBar(content: Text("Passwords match"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(content: Text("Passwords do not match"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Mixin Assignment"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                UsernameFormField(controller: userNameController),
                const SizedBox(
                  height: 6.0,
                ),
                PasswordFormField(
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 6.0,
                ),
                PasswordFormField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                ),
                const SizedBox(
                  height: 6.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    createUser();
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
