
import '../export_all.dart';

class TodoListNotifier extends StateNotifier<List<TodoModel>> {
  TodoListNotifier() : super([]);

  void listAdd(List<TodoModel> lst){
    // state = [];
    state = [...state,...lst];
  }

  void addTodo(TodoModel item) {
    state = [...state,item];
  }

  void deleteTodo(int index) {
    state = List.from(state)..removeAt(index);
  }

  void toggleTodoStatus(int index) {
    // state[index].isCheck = !state[index].isCheck!;
    state = List.from(state)
      ..[index] = TodoModel(
        title: state[index].title,
        desc: state[index].desc,
        isCheck: !state[index].isCheck!,
        iV: state[index].iV!,
        sId: state[index].sId,
        userId: state[index].userId
      );

      
  }

  void updateTodoItem(int index, TodoModel item){
    state =List.from(state)..[index] = item;
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<TodoModel>>(
  (ref) => TodoListNotifier(),
);