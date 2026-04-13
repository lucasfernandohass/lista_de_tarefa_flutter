import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/model/tarefa.dart';
import '/provider/tarefa_provider.dart';

class TarefaItem extends ConsumerWidget{
  final Tarefa tarefa;

  const TarefaItem({
    super.key,
    required this.tarefa,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Dismissible(
      key: Key(tarefa.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart, //mov
      onDismissed: (direction) {
        ref.read(tarefaProvider.notifier).removerTarefa(tarefa.id);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${tarefa.titulo} Removido/a da Lista'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: CheckboxListTile(
          value: tarefa.concluida,
          onChanged: (_) {
            ref.read(tarefaProvider.notifier).alternarConcluida(tarefa.id);
          },
          title: Text(
            tarefa.titulo,
            style: TextStyle(
              decoration: tarefa.concluida
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: tarefa.concluida ? Colors.grey : Colors.black,
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading, // checkbox
          secondary: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              ref.read(tarefaProvider.notifier).removerTarefa(tarefa.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${tarefa.titulo} Removido/a da Lista'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}