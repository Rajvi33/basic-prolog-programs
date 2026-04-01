% File 3 : fullWords.pl

% converting digits to words
% Prints a non-negative integer as hyphen-separated digit words.
% ------------------------------------

full_words(N) :-
    integer(N), N >= 0,
    number_codes(N, Cs),     % convert number to list of character codes
    print_words(Cs),
    nl.

% Print each digit as a word with hyphens between
print_words([C]) :-          % last digit (no hyphen)
    code_to_word(C, W),
    write(W).
print_words([C|Rest]) :-     % more digits to go
    code_to_word(C, W),
    write(W), write('-'),
    print_words(Rest).

% Convert digit code to word
code_to_word(0'0, zero).
code_to_word(0'1, one).
code_to_word(0'2, two).
code_to_word(0'3, three).
code_to_word(0'4, four).
code_to_word(0'5, five).
code_to_word(0'6, six).
code_to_word(0'7, seven).
code_to_word(0'8, eight).
code_to_word(0'9, nine).
