part of TodoMVC;

class Todo extends ConceptEntity<Todo> {
  
  String _name;
  String etat;
  
  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = name;
    }
  }
  
  Todo newEntity() => new Todo();
  
  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    name: ${name}, \n '
           '    Etat: ${etat}\n'
           '  }';
  }
  
  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['name'] = name;
    entityMap['Etat'] = etat;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    name = entityMap['name'];
    etat = entityMap['etat'];
  }
  
  bool get onActive =>
      etat.contains('Active') ? true : false;
    
  bool get onCompleted =>
      etat.contains('Completed') ? true : false;
  
  int compareTo(Todo other) {
    return name.compareTo(other.name);
  }

}

class Todos extends ConceptEntities<Todo> {

  Todos newEntities() => new Todos();
  Todo newEntity() => new Todo();

}