// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$statusAtom =
      Atom(name: 'HomeViewModelBase.status', context: context);

  @override
  StatusEnum get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(StatusEnum value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$getUserListAsyncAction =
      AsyncAction('HomeViewModelBase.getUserList', context: context);

  @override
  Future<void> getUserList(String token) {
    return _$getUserListAsyncAction.run(() => super.getUserList(token));
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
