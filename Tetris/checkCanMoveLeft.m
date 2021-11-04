function check = checkCanMoveLeft(display, piece)
check = true;

%checks if piece is all the way on the left side
%if it is, sets check to false (the piece can't move left)
if(sum(piece(1:20, 1) == 11) > 0)
    check = false;
    
%checks if there are any grey blocks to the left of the piece
%if there are, sets check to false
else
    for(row = 20:-1:1)
        for(col = 9:-1:1)
            if(display(row, col) == 4)
                val = piece(row, col + 1);
                check = check && (val == 1);
            end
        end
    end
end