% Define responses for different questions as a dynamic predicate
:- dynamic response/2.

% Initialize responses
response("hi", ["hello", "hey there!"]).
response("check my room", ["OK, wait for 2 min. Your room is at xyz location.", "Sure, let me check."]).
response("room", ["Let me check. Room xyz is at your location.", "Checking now."]).
response("ok", ["Do you need more help?", "Alright, let me know if you need anything else."]).
response("bye", ["Have a good day, sir!", "Goodbye!"]).

chat :-
    write("Bot: Yes, how can I help you today? "),
    read_line_to_codes(user_input, Input),
    atom_codes(AtomInput, Input),
    atom_string(AtomInput, StringInput),
    process_input(StringInput).


process_input("quit") :- % Check for "quit" input
    writeln("Bot: Goodbye!"),
    !. % Terminate the chat loop

    
process_input(Input):-
    response(Input, Responses),
    !,
    random_member(Response, Responses), % Select a random response from the list
    write("Bot: "),
    writeln(Response),
    chat.
    
process_input(_) :-
    writeln("Bot: I'm sorry, I don't understand."),
    chat.

:- initialization(chat).
