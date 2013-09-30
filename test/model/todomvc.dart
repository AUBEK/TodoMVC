import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:TodoMVC/todomvc.dart';

testProjects(Todos todos) {
  group("Testing Projects", () {
    setUp(() {
      var projectCount = 0;
      expect(todos.length, equals(projectCount));
       
      var education = new Todo();
      expect(education, isNotNull);      
      education.name = 'Education';
      education.etat='Completed';
      todos.add(education);      
      expect(todos.length, equals(++projectCount));

      var experiences = new Todo();
      expect(experiences, isNotNull);      
      experiences.name = 'Acquire the experience';
      experiences.etat='Active';
      todos.add(experiences);      
      expect(todos.length, equals(++projectCount));

      var enterprise = new Todo();
      expect(enterprise, isNotNull);      
      enterprise.name = 'Create enterprise';
      enterprise.etat='Active';
      todos.add(enterprise);      
      expect(todos.length, equals(++projectCount));
      
      //projects.display('Projects');
    });
    tearDown(() {
      todos.clear();
      expect(todos.isEmpty, isTrue);
    });
    /*test('Add Project', () {
      var todo = new Todo();
      expect(todo, isNotNull);
      todo.name = 'modelibra';
      todo.etat = 'Active';
      var added = todos.add(todo);
      expect(added, isTrue);
      todos.display('Add Project');
    });
    */
    test('Add Todo Education', () {
      var todoCount = todos.length;
      var todo = new Todo();
      expect(todo, isNotNull);
      todo.name = 'End Education';
      var added = todos.add(todo);
      expect(added, isTrue);
      todos.display('Add Todo End Education');
    });
    
    test('Add Todo Experience', () {
      var todoCount = todos.length;
      var todo = new Todo();
      expect(todo, isNotNull);
      todo.name = 'Experience';
      var added = todos.add(todo);
      expect(added, isTrue);
      todos.display('Add Todo Acquire the experience');
    });
    
    test('Add Todo Enterprise', () {
      var todoCount = todos.length;
      var todo = new Todo();
      expect(todo, isNotNull);
      todo.name = 'Enterprise';
      var added = todos.add(todo);
      expect(added, isTrue);
      todos.display('Add Todo Create enterprise');
    });
    test('Find Project by Name', () {
      var searchName = 'Education';
      var todo = todos.find(searchName);
      expect(todo, isNotNull);
      expect(todo.name, equals(searchName));
      todo.display('Find Project by Name');
    });
    /*test('Find Project by Etat', () {
      var searchName = 'Active';
      var todo = todos.find(searchName);
      expect(todo, isNotNull);
      expect(todo.etat, equals(searchName));
      todo.display('Find Project by Etat');
    });*/
    test('Select Todos by Function', () {
      var programmingProjects = todos.select((p) => p.onActive);
      expect(programmingProjects.isEmpty, isFalse);
      expect(programmingProjects.length, equals(2));
      programmingProjects.display('Select Todos by Function');
    });
    test('Select Todos by Function then Add', () {
      var programmingProjects = todos.select((p) => p.onCompleted);
      expect(programmingProjects.isEmpty, isFalse);

      var dartlingTesting = 'Make MBA Cursus';
      var programmingProject = new Todo();
      programmingProject.name = dartlingTesting;
      programmingProject.etat = 'Active';
      var added = programmingProjects.add(programmingProject);
      expect(added, isTrue);
      programmingProjects.display('Select Todos by Function then Add');

      var project = todos.find(dartlingTesting);
      expect(project, isNull);
      todos.display('Todos');
    });
    test('Select Todos by Function then Remove', () {
      var projectCount = todos.length;
      todos.display('Todos Before Remove');
      var programmingProjects = todos.select((p) => p.onCompleted);
      expect(programmingProjects.isEmpty, isFalse);

      var searchName = 'Education';
      var todo = programmingProjects.find(searchName);
      expect(todo, isNotNull);
      expect(todo.name, equals(searchName));
      var programmingProjectCount = programmingProjects.length;
      programmingProjects.remove(todo);
      expect(programmingProjects.length, equals(--programmingProjectCount));
      expect(todos.length, equals(projectCount));
    });
    test('Order Todos by Name', () {
      todos.orderByFunction((m,n) => m.compareTo(n));
      todos.display('Order Todos by Name');
    });
    test('New Todo', () {
      var projectCount = todos.length;
      var MBA = new Todo();
      expect(MBA, isNotNull);
      MBA.name = 'MBA';
      MBA.etat = 'Active';
      var added = todos.add(MBA);
      expect(added, isTrue);
      expect(todos.length, equals(++projectCount));
      todos.display('New Todo');
    });
    test('Copy Todos', () {
      Todos copiedProjects = todos.copy();
      expect(copiedProjects.isEmpty, isFalse);
      expect(copiedProjects.length, equals(todos.length));
      expect(copiedProjects, isNot(same(todos)));
      expect(copiedProjects, isNot(equals(todos)));
      copiedProjects.forEach((cp) =>
          expect(cp, isNot(same(todos.find(cp.name)))));
      copiedProjects.display('Copied Todos');
      //projects.display('Projects');
    });
    test('True for Every Todo', () {
      expect(todos.every((p) => p.code != null), isTrue);
      expect(todos.every((p) => p.name != null), isTrue);
    });
    test('From Todos to JSON', () {
      var json = todos.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Todos Model', () {
      List<Map<String, Object>> json = todos.toJson();
      todos.clear();
      expect(todos.isEmpty, isTrue);
      todos.fromJson(json);
      expect(todos.isEmpty, isFalse);
      todos.display('From JSON to Todos');
    });
  });
}

initDisplayModel() {
  ProjectModel projectModel = new ProjectModel();
  projectModel.init();
  projectModel.display();
}

testModel() {
  ProjectModel projectModel = new ProjectModel();
  Todos todos = projectModel.todos;
  testProjects(todos);
}

main() {
  //initDisplayModel();
  testModel();
}
