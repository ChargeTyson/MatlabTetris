clc
clear
name = input('Enter Your Name: ', 's' );
fprintf('Hi %s! Welcome to ENGR 1181!\n', name)

x = input('Enter a value for x: \n');
y = input('Enter a value for y: \n');

if(x == y)
    fprintf('x and y are equal\n')
elseif (x > y)
    fprintf('x is greater than y\n')
elseif (x < y)
    fprintf('x is less than y\n')
end
    