function check = checkCanMoveDown(display, piece)
check = true;

%if the pice is all the way at the bottom set check to false
%(the piece can't move down)
if(sum(piece(20, 1:10) == 11) > 0)
    check = false;
    
%if there are grey blocks directly under any part of the piece
%check is set to false
else
    for(row = 20:-1:2)
        for(col = 10:-1:1)
            if(display(row, col) == 4)
                val = piece(row - 1, col);
                check = check && (val == 1);
            end
        end
    end
end
end

            