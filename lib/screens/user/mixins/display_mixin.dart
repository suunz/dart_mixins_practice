import 'dart:developer';

mixin DisplayMixin {
  void displayUser({required String username}) {
    log("Display Mixin in action");
    log("User name is $username");
  }
}
