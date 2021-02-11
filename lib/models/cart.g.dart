// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cart on _Cart, Store {
  final _$_CartActionController = ActionController(name: '_Cart');

  @override
  void update({String id, int itemCount}) {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.update');
    try {
      return super.update(id: id, itemCount: itemCount);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.clear');
    try {
      return super.clear();
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
