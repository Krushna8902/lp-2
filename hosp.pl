:- dynamic(patient/4).  % Define dynamic predicate for patient records.

disease(influenza, [fever, cough, fatigue, body_acne, headache]).
disease(common_cold, [cough, fatigue, body_acne, headache]).
disease(gastroenteritis, [vomiting, diarrhea, nausea]).

treatment(influenza, 'rest, stay hydrated and take pain relievers').
treatment(influenza, 'rest, drink plenty of fluid and drink cold medication').
treatment(gastroenteritis, 'stay hydrated by drinking pure fluid and avoid dairy products').

diagnose_patient(Name, Age, Gender) :-
    write('Symptoms (comma-separated): '), nl,
    read(Symptoms),
    assertz(patient(Name, Age, Gender, Symptoms)),
    diagnose(Name).

diagnose(Name) :-
    patient(Name, _, _, Symptoms),
    disease(Disease, DiseaseSymptoms),
    subset(DiseaseSymptoms, Symptoms),
    nl, write('Diagnosis for: '), write(Name), write(':'), nl,
    write('Possible disease: '), write(Disease), nl,
    write('Treatment recommendation: '), treatment(Disease, Treatment), write(Treatment), nl.

subset([], _).
subset([H | T], L) :-
    member(H, L),
    subset(T, L).

start :-
    write('Please provide information:'), nl,
    write('Name: '),
    read(Name),
    write('Age: '),
    read(Age),
    write('Gender: '),
    read(Gender),
    diagnose_patient(Name, Age, Gender).

