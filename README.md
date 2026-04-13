# lista_de_tarefa_flutter

## Descrição

Aplicativo para gerenciamento de tarefas diárias (To-do-List), que permite organizar as atividades com as funcionalidades de: 
- Adicionar Tarefas; 
- Listar Tarefas; 
- Marcar como Concluída;
- Remover Tarefa;
- Remover Todas as Tarefas.

## Explicação gestão de estado

O Projeto segue a seguinte arquitetura:

```text
    lib/
├── main.dart                       # app
├── model/                   
│   └── tarefa_model.dart           # Classe Tarefa 
├── provider/                
│   └── tarefa_provider.dart        # Gerenciamento de estado com Riverpod
├── widgets/                        
    ├── tarefa_item.dart            # Widget de item individual
    └── formulario_tarefa.dart      # Widget de formulário de adição
    └── lista_tarefa_tela.dart      # Tela principal da lista
```
 - O gerenciamento de estado foi implementado utilizando **Riverpod** com **StateNotifierProvider**

 - Além da implementação de um provider para gereciar as instâncias da lista.


## Instruções para Execução

- Possuir Dart e Flutter
- Comando `flutter pub get` no terminal para instalar todas as depêndencias.
- Executar o `main.dart` ou `flutter run` no terminal.

## Imagem do Sistema

<div align="center">
    <img src="./img/ListaDeTarefas.png" alt="Imagem da Lista de Tarefas" width="25%">
</div>