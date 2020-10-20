// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PessoaController on _PessoaController, Store {
  final _$showSearchAtom = Atom(name: '_PessoaController.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  final _$pessoasAtom = Atom(name: '_PessoaController.pessoas');

  @override
  ObservableList<PessoaModel> get pessoas {
    _$pessoasAtom.reportRead();
    return super.pessoas;
  }

  @override
  set pessoas(ObservableList<PessoaModel> value) {
    _$pessoasAtom.reportWrite(value, super.pessoas, () {
      super.pessoas = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_PessoaController.search');

  @override
  Future search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$_PessoaControllerActionController =
      ActionController(name: '_PessoaController');

  @override
  dynamic toggleSearch() {
    final _$actionInfo = _$_PessoaControllerActionController.startAction(
        name: '_PessoaController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_PessoaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearch: ${showSearch},
pessoas: ${pessoas}
    ''';
  }
}
