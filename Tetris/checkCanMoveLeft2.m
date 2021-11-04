function check = checkCanMoveLeft2(display, piece)
check = true;
if(sum(piece(1:20, 12) == 11) > 0)
    check = false;
else
    for(row = 20:-1:1)
        for(col = 20:-1:12)
            if(display(row, col) == 4)
                val = piece(row, col + 1);
                check = check && (val == 1);
            end
        end
    end
end