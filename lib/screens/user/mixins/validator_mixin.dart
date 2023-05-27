mixin ValidatorMixin {
  bool validatePassword(
      {required String password, required String confirmPassword}) {
    return password == confirmPassword;
  }
}
