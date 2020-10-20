import 'package:loja/models/pessoa.model.dart';
import 'package:loja/repositories/pessoa.repository.dart';
import 'package:mobx/mobx.dart';
part 'pessoa.controller.g.dart';

class PessoaController = _PessoaController with _$PessoaController;

abstract class _PessoaController with Store {
  @observable
  bool showSearch = false;

  @observable
  ObservableList<PessoaModel> pessoas = new ObservableList<PessoaModel>();

  @action
  toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  search(String term) async {
    final reporitory = new PessoaRepository();
    pessoas = new ObservableList<PessoaModel>();
    var data = await reporitory.search(term);
    pessoas.addAll(data);
  }
}
