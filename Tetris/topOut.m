function check = topOut(display)
check = true;

%if there is a block any of the middle two columns of the top two rows,
%check is set to false and the game is over
if(display(1, 5) == 4 || display(1, 6) == 4 || display(2, 5) == 4 || display(2, 6) == 4)
    check = false;
end
end