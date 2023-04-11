import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prima_riverpod/config/config.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/todo.dart';
import 'providers.dart';

final TodosStateNotifierProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

final filteredGuestProvider = Provider<List<Todo>>((ref) {
  final selectedFilter = ref.watch(todoFilterProvider);
  final todoList = ref.watch(TodosStateNotifierProvider);
  switch (selectedFilter) {
    case TodoFilter.all:
      return todoList;
    case TodoFilter.completed:
      return todoList.where((element) => element.done).toList();

    case TodoFilter.pending:
      return todoList.where((element) => !element.done).toList();
  }
});

const _uuid = Uuid();

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ]);

  void addTodo() {
    state = [
      ...state,
      Todo(
          id: _uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null)
    ];
  }

  void ToggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id != id) return todo;
      if (todo.done) return todo.copyWith(completedAt: null);
      return todo.copyWith(completedAt: DateTime.now());
    }).toList();
  }
}
