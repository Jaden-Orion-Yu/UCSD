%% demo and notes from Tuesday lecture

%% notes from hw1
% Make sure to use semicolons to keep command window clean

% Whether or not you separate answers/variables into different lines or
% keep them in the same line is solely based on space saving/convenience

% Single quotations marks signify CHARACTERS and double quotes signify
% STRINGS. Use the "class" command to check type of variable.

% ASCII character info found in week 0 notes. Upper letters before Lower. Letters
% have static integer offset of 32 in counting system. ASCII characters for
% numbers stored as char rather than single/double.

%------

clear all;
close all;
clc;
format long;

%% Variables
% first character must be a letter, following characters can be anything

%% ex.
var1 = 3 + 2 + 1
Var1 = 3 + 2 + 1
whos

% MATLAB is CASE SENSITIVE



%% Variable types: Integer
% integer: int8, int16, int32, int64
% unsigned integer: uint8, uint16, uint32, uint64

%% ex.
my_first_int = int8(16)
my_second_int = int16(32)
my_third_int = int32(64)
format compact;
whos

% 1 byte = 8 bits (see bytes and class from 'whos')
% 2 bytes = 16 bits
% 4 bytes = 32 bits
% Why use different intX?

%% ex. 
a = int8(16); b = int16(16); c = int32(16);
whos

% Application; If you needed to assign an ID to every student in class,
% what integer type do I assign to ID? Int8, 16, 32, etc., since each one
% will take a different amount of memory to store the same amount of
% information. 



%%  Int8
%       _ _ _ _ _ _ _ _ each space is a 0 or 1 (binary)
%       this means there can be up to 2^8, since there are 8 spaces and two
%       choices in each space ---> 256 different integers, within a given
%       range, such as [-128, 127]. Regular Ints use signed, Uint
%       (unsigned) uses [0, 255]. 

%% ex. range of int8
a1 = int8(-128)
b1 = int8(-129) % this goes to nearest number that fits in the range, but will not display the actual number
c1 = int8 (128) % same as b but in different direction

%% ex. how to identify minima and maxima of integer types
intmin('int8')
intmin('int16')
intmax('int16')

%% ex. unsigned integers
intmin('uint8')
intmin('uint16')
intmax('uint8')
intmax('uint8')

%% ex. 
a2 = int8(256) % truncates to valid range
b2 = uint8(256) % still truncates to valid range but moves it into higher positive values





%% Variable types: Real
% Real numbers = 

%% ex. single precision to store fractional number
a3 = single(1/3) % uses 4 bytes
b3 = double(1/3) % uses 8 bytes
whos

%% ex. maxima of real numbers
realmax('single') % shows maximum value of real number
c3 = single(3.5e38) % past real number max and returns infinity
realmax('double')
d3 = 1.8e308

% What happens when you dont assign a data type?

%% ex. Matlab defaults to most expensive type; double
a4 = 1/3 
b4 = double(1/3) % same level of precision as variable 'a'

%% ex. minima of real numbers
realmin('single')
realmin('double')





%% Variable Types: Complex
% complex number: a real part and imaginary part
% i and j are set to be sqrt(-1) by default

%% ex.
a5 = 3 + 4*i
b5 = 3 + 4j
whos

%% ex. naming variables is important
i = 10 % this fucks up complex numbers bigly
a6 = 3 + 4*i






%% Variable types: Character
% assigned via single quotation mark

%% ex. name
my_name = 'Thomas'
letter = 'A'
whos % 1x6 = 1 row, 6 columns
my_name % access whole name
my_name(1) % access first letter of name
my_name(4) % access 4th letter of name
my_name(end) % last letter
my_name(6) % last letter/6th letter





%% Character Encoding
% Matlab encodes characters in ASCII format

%% ex. 
'A' - 'a'
'A' > 'a'





%% Variable types: String
% assigned via double quotation marks
%
% generally stick to using char type as it saves data and has more
% useful features at this level

%% ex. name - difference between " and '
my_name = "Thomas" % treats entire name as single piece
my_old_name = 'Thomas' % treats name as array of characters
whos
my_name(2) % doesn't work because there is only a single piece in my_name
my_name(1) % this works properly
my_old_name(1)





%% Variable types: Logical
% true (1) or false (0)

%% ex. 
v1 = 3 > 2
whos % single byte as it will only ever be 0 or 1

%% ex. is a equal to b
a = 1/3; b = 2/6;
a == b

%% ex. assign true/false
a = true
b = false
c = logical(1)
d = logical(0)
e = logical(2)
f = logical(3) % logical(0) always false, logical(X) is true





%% Type Casting 
% changing type

%% ex. typecasting pi
a = pi
int8(a) % typecasting value of pi into int8, STORING PI AS AN INTEGER
single(a)

%% ex. typecasting char 
a = 'hello'
int64(a)
b = int64(a) % b is the int64 equivalent of 'hello'
char(b) % typecasting b back into a char





%% Relational Expressions
% Logical operators
% equal to ==
% not ~
% or ||
% and &&
% not equal to ~=
% greater than or equal to >=
% less than or equal to <=
% greater than >
% less than <
% exclusive or xor

%% MEMORIZE TRUE TABLE TITLED "LOGICAL OPERATORS" in OneNote
% fairly basic, consider minecraft redstone logic gates

%% ex. 
a = true
not a
3 ~= 2





%% Operational Precedence
% 1. parentheses
% 2. power
% 3. unary: negation, not
% 4. multiplication/division
% 5. addition and subtraction
% 6. relational: >, <, ==, ~=, etc.
% 7. and &&
% 8. or ||
% 9. assignment =

%% ex. 
a = true; b = false;
p1 = a || b && a && b % b && a = 0, then 0 && b = 0, then a || 0 = 1
p2 = ~(a || b) && a || b % a || b = 1, then ~1 = 0, then 0 && a = 0, then 0 || b = 0
