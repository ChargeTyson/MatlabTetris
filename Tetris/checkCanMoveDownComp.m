function check = checkCanMoveDownComp(display, piece)

check = true;
if(sum(piece(20, 11:21) == 11) > 0)
    check = false;
else
    for(row = 20:-1:2)
        for(col = 21:-1:11)
            if(display(row, col) == 4)
                val = piece(row - 1, col);
                check = check && (val == 1);
            end
        end
    end
end
end

       