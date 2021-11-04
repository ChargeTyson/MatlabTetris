function check = checkCanMoveRight2(display, piece)
check = true;
if(sum(piece(1:20, 21) == 11) > 0)
    check = false;
else
    for(row = 19:-1:1)
        for(col = 21:-1:13)
            if(display(row, col) == 4)
                val = piece(row, col - 1);
                check = check && (val == 1);
            end
        end
    end
end