issue(1, 'Computer is not turning on').
issue(2, 'Computer is running slow').

solution(1, 'Check power cable and connections.').
solution(1, 'Make sure power outlet is working.').
solution(1, 'Try a different power cable or adapter.').

solution(2, 'Close unnecessary programs and applications.').
solution(2, 'Run antivirus scan to check for malware.').
solution(2, 'Upgrade RAM for better performance.').

helpdesk_help(Issue) :-
    issue(IssueID, IssueDesc),
    format('Possible solutions for the issue: ~w~n', [IssueDesc]),
    forall(solution(IssueID, Sol), format('- ~w~n', [Sol])),
    nl, write('Do you need further assistance? (yes/no)'), nl,
    read_line_to_string(user_input, Input),
    (Input == 'yes' -> start_helpdesk; Input == 'no' -> write('Thank you for using the Help Desk System. Goodbye!'); writeln('Invalid input. Please enter "yes" or "no".'), start_helpdesk).

start_helpdesk :-
    write('Welcome to the Help Desk System. Please enter your computer issue: '), nl,
    read_line_to_string(user_input, Issue),
    helpdesk_help(Issue).

:- initialization(start_helpdesk).

