% Define facts for greetings and responses
response("hello", "Hi there!").
response("how are you", "I'm doing well, thank you!").
response("bye", "Goodbye!").
response(_, "I'm not sure how to respond to that.").

% Define a rule to check if a string contains a keyword
containsKeyword(Input, Keyword) :-
    sub_string(case_insensitive, Input, Keyword).

% Define a rule to get the response based on user input
getResponse(Input, Response) :-
    response(Keyword, Response),
    containsKeyword(Input, Keyword).

% Define a rule to handle the conversation
conversation :-
    writeln('Simple Chatbot: Hello! Type "bye" to exit.'),
    conversation_loop.

conversation_loop :-
    write('You: '),
    read_line_to_codes(user_input, Input),
    atom_codes(AtomInput, Input),
    (
        AtomInput = "bye" ->
            writeln('Simple Chatbot: Goodbye! Have a great day!')
        ;
            getResponse(AtomInput, Response),
            writeln('Simple Chatbot: '),
            writeln(Response),
            conversation_loop
    ).

% Entry point of the program
:- initialization(main).

main :-
    conversation,
    halt.
