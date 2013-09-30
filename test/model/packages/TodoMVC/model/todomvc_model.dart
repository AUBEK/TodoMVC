part of TodoMVC;

class ProjectModel extends ConceptModel {
  
  static final String todo = 'todo';

  Map<String, ConceptEntities> newEntries() {
    var todos = new Todos();
    var map = new Map<String, ConceptEntities>();
    map[todo] = todos;
    return map;
  }
  
  Todos get todos => getEntry(todo);
 
  init() {
    
    var education = new Todo();
    education.name = 'Education';
    education.etat='Completed';
    todos.add(education);

    var experiences = new Todo();
    experiences.name = 'Acquire the experience';
    experiences.etat='Active';
    todos.add(experiences);
    
    var enterprise = new Todo();
    enterprise.name = 'Create enterprise';
    enterprise.etat='Active';
    todos.add(enterprise);
    
  }
  
  display() {
    print('TodoMVC Model');
    print('=============');
    todos.display('Todos');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }
}