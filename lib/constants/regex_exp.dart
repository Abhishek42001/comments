class RegexExp {
  RegexExp._();
  static final RegexExp _instance = RegexExp._();
  factory RegexExp() => _instance;

  RegExp email = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
}
