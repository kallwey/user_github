enum StatusEnum {
  none,
  loading,
  error,
  success,
}

extension StatusEnumExt on StatusEnum {
  static dynamic _value;
  get value => _value;
  set value(v) => _value = v;
}
