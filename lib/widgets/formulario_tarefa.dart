import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/tarefa_provider.dart';

class FormularioTarefa extends ConsumerStatefulWidget {
  const FormularioTarefa({super.key});

  @override
  ConsumerState<FormularioTarefa> createState() => FormularioTarefaState();
}

class FormularioTarefaState extends ConsumerState<FormularioTarefa>{
  final TextEditingController controller = TextEditingController();

  void adicionarTarefa(){
    if(controller.text.trim().isEmpty) return;
    
    ref.read(tarefaProvider.notifier).adicionarTarefa(controller.text);
    controller.clear();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tarefa adicionada com sucesso!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Digite uma nova tarefa...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onSubmitted: (_) => adicionarTarefa(),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: adicionarTarefa,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}