class Tarefa {
  final String id;
  final String titulo;
  final bool concluida;

  Tarefa({
    required this.id,
    required this.titulo,
    this.concluida = false,
  });

  Tarefa copyWith({
    String? id,
    String? titulo,
    bool? concluida,
  }){
    return Tarefa(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      concluida: concluida ?? this.concluida,
    );
  }
}