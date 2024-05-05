employee(john, marketing).
employee(lisa, sales).
employee(mike, marketing).

addEmployee(Name, Department) :-
   
    assertz(employee(Name, Department)),
    writeln('Employee added successfully.').

displayAllEmployees :-
    forall(employee(Name, Dept),
           format('~w is in ~w .', [Name, Dept])).

evaluationSystem :-
    writeln('Employee Performance System'),
    writeln('1. Add Employee'),
    writeln('2. Display All Employees'),
    writeln('3. Exit'),
    read(Choice),
    performAction(Choice).

performAction(1) :-
    write('Enter employee name: '), read(Name),
    write('Enter department: '), read(Department),
    addEmployee(Name, Department),
    evaluationSystem.
performAction(2) :-
    displayAllEmployees, evaluationSystem.
performAction(3) :- writeln('Exiting the system.').

:- initialization(evaluationSystem).
