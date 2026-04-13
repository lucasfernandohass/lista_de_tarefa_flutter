import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/model/tarefa.dart';

final tarefaProvider = StateNotifierProvider<TarefaNotifier, List<Tarefa>>((ref){
  return TarefaNotifier();
});

class TarefaNotifier extends StateNotifier<List<Tarefa>>{
  TarefaNotifier() : super([]);

  void adicionarTarefa(String titulo){
    
    if(titulo.trim().isEmpty) return;
    
    final novaTarefa = Tarefa(
      id: DateTime.now().toString(),
      titulo: titulo,
    );
    state = [...state, novaTarefa];
  }

  void alternarConcluida(String id){
    state = state.map((tarefa){
      if(tarefa.id == id){
        return tarefa.copyWith(concluida: !tarefa.concluida);
      }
      return tarefa;
    }).toList();
  }

  void removerTarefa(String id){
    state = state.where((tarefa) => tarefa.id != id).toList();
  }
}