/// {@template todos_api}
/// The interface and models for an API providing access to todos.
/// {@endtemplate}
abstract class TodosApi {
  /// {@macro todos_api}
  const TodosApi();

  Stream<List<Todo>> getTodos()
}
