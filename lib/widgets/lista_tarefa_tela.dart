import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/tarefa_provider.dart';
import '../widgets/tarefa_item.dart';
import '../widgets/formulario_tarefa.dart';

class ListaTarefaTela extends ConsumerWidget{
  const ListaTarefaTela({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){

    final tarefas = ref.watch(tarefaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          if(tarefas.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () {
                showClearAllDialog(context, ref);
              },
            ),
        ],
      ),
      body: Column( // Comp 
        children: [
          const FormularioTarefa(),
          Expanded(
            child: tarefas.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Nenhuma tarefa na Lista',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder( //ListView
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      final tarefa = tarefas[index];
                      return TarefaItem(tarefa: tarefa);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void showClearAllDialog(BuildContext context, WidgetRef ref){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Limpar todas as tarefas'),
          content: const Text('Tem certeza que deseja remover todas as tarefas?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final notifier = ref.read(tarefaProvider.notifier);
                final tarefas = ref.read(tarefaProvider);
                for (var tarefa in tarefas) {
                  notifier.removerTarefa(tarefa.id);
                }
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Todas as tarefas foram removidas'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Remover todas'),
            ),
          ],
        );
      },
    );
  }
}