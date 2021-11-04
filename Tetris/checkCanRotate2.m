function check = checkCanRotate2(display, piece, blockNum, position)

check = true;
%Checks what type of black it is: 1 is long block
if(blockNum == 1)
    %checks what position the block is in
    if(position == 1)
        val1 = sum(piece(1:20, 12) == 11);
        val2 = sum(piece(1:20, 21) == 11) + sum(piece(1:20, 20) == 11);
        %if the block is in column 1, 19, or 20 the block can't rotate
        if(val1 > 0 | val2 > 0)
            check = false;
        %finds the positions to which the block would rotate
        else
            found = true;
            row = 0;
            while(found & row < 20)
                row = row + 1;
                for(col = 12:21)
                    if(piece(row, col) == 11)
                        rowPivot = row + 1;
                        colPivot = col;
                        found = false;
                    end
                end
            end
            %checks if the position of the new rotation has any grey blocks
            if(display(rowPivot, colPivot-1) == 4 || display(rowPivot, colPivot+1) == 4 || display(rowPivot, colPivot+2) == 4)
                check = false;
            end
        end
    %Same as before but checking from position 2 to 1
    else
        val1 = sum(piece(20, 12:21) == 11) + sum(piece(19, 12:21) == 11);
        val2 = sum(piece(1, 12:21) == 11);
        if(val1 > 0 || val2 > 0)
            check = false;
        else
            found = true;
            col = 12;
            while(found & col < 21)
                col = col + 1;
                for(row = 1:20)
                    if(piece(row, col) == 11)
                        rowPivot = row;
                        colPivot = col + 1;
                        found = false;
                    end
                end
            end
            if(display(rowPivot, colPivot-1) == 4 || display(rowPivot, colPivot+1) == 4 || display(rowPivot, colPivot+2) == 4)
                check = false;
            end
        end
    end
    
    
    %T Bock
elseif(blockNum == 2)
    found = true;
    col = 12;
    while(found & col < 21)
        col = col + 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowTempPivot = row;
                colTempPivot = col;
                found = false;
            end
        end
    end
    if(position == 1)
        val = sum(piece(1, 12:21) == 11);
        if(val > 0)
            check = false;
        else
            if(display(rowTempPivot - 1, colTempPivot + 1) == 4)
                check = false;
            end
        end
    elseif(position == 2)
        val = sum(piece(1:20, 21) == 11);
        if(val > 0)
            check = false;
        else
            if(display(rowTempPivot, colTempPivot + 2) == 4)
                check = false;
            end
        end
    elseif(position == 3)
        val = sum(piece(20, 12:21) == 11);
        if(val > 0)
            check = false;
        else
            if(display(rowTempPivot + 1, colTempPivot + 1) == 4)
                check = false;
            end
        end
    elseif(position == 2)
        val = sum(piece(1:20, 12) == 11);
        if(val > 0)
            check = false;
        else
            if(display(rowTempPivot - 1, colTempPivot - 1) == 4)
                check = false;
            end
        end
    end
    
    
    %L Block Right
elseif(blockNum == 3)
    found = true;
    col = 11;
    while(found & col < 21)
        col = col + 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowPivot = row;
                colPivot = col;
                found = false;
            end
        end
    end
    if(position == 1)
        val = (sum(piece(1, 12:21) == 11));
        if(val > 0)
            check = false;
        elseif(display(rowPivot - 2, colPivot) == 4 || display(rowPivot - 2, colPivot + 1) == 4 || display(rowPivot, colPivot + 1) == 4)
            check = false;
        end
    elseif(position == 2)
        val = (sum(piece(1:20, 21) == 11));
        if(val > 0)
            check = false;
        elseif(display(rowPivot, colPivot + 2) == 4 || display(rowPivot + 1, colPivot) == 4 || display(rowPivot + 1, colPivot + 2) == 4)
            check = false;
        end
    elseif(position == 3)
        val = (sum(piece(20, 12:21) == 11));
        if(val > 0)
            check = false;
        elseif(display(rowPivot - 1, colPivot + 1) == 4 || display(rowPivot + 1, colPivot + 1) == 4 || display(rowPivot + 1, colPivot + 2) == 4)
            check = false;
        end
    else
        val = (sum(piece(1:20, 12) == 11));
        if(val > 0)
            check = false;
        elseif(display(rowPivot, colPivot - 1) == 4 || display(rowPivot - 1, colPivot - 1) == 4 || display(rowPivot - 1, colPivot + 1) == 4)
            check = false;
        end
    end
    
    
    %L Block Left
elseif(blockNum == 4)
    found = true;
    col = 12;
    while(found & col < 21)
        col = col + 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowPivot = row;
                colPivot = col;
                found = false;
            end
        end
    end
    if(position == 1)
        val = (sum(piece(1, 12:21) == 11));
        if(val > 0)
            check = false;
        elseif(display(rowPivot - 1, colPivot + 1) == 4 || display(rowPivot + 1, colPivot) == 4 || display(rowPivot + 1, colPivot + 1) == 4)
            check = false;
        end
    elseif(position == 2)
        val = (sum(piece(1:20, 21) == 11));
        if(val > 0)
            check = false;
        elseif(display(rowPivot - 1, colPivot) == 4 || display(rowPivot - 2, colPivot) == 4 || display(rowPivot - 1, colPivot + 2) == 4)
            check = false;
        end
    elseif(position == 3)
        val = (sum(piece(20, 12:21) == 11));
        if(val > 0)
            check = false;
        elseif(display(rowPivot - 1, colPivot + 1) == 4 || display(rowPivot - 1, colPivot + 2) == 4 || display(rowPivot + 1, colPivot + 1) == 4)
            check = false;
        end
    else
        val = (sum(piece(1:20, 12) == 11));
        if(val > 0)
            check = false;
        elseif(display(rowPivot, colPivot + 1) == 4 || display(rowPivot - 1, colPivot + 1) == 4 || display(rowPivot - 1, colPivot - 1) == 4)
            check = false;
        end
    end
    
    
    
    
%Z Block Right 
elseif(blockNum == 5)
    found = true;
    col = 12;
    while(found & col < 21)
        col = col + 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowTempPivot = row;
                colTempPivot = col;
                found = false;
            end
        end
    end
    if(position == 1)
        if(sum(piece(1, 12:21) == 11) > 0)
            check = false;
        else
            rowPivot = rowTempPivot;
            colPivot = colTempPivot + 1;
            if(display(rowPivot - 1, colPivot) == 4 || display(rowPivot + 1, colPivot - 1) == 4)
                check = false;
            end
        end
    else
        val = sum(piece(1:20, 21) == 11);
        if(val > 0)
            check = false;
        else
            rowPivot = rowTempPivot - 1;
            colPivot = colTempPivot + 1;
            if(display(rowPivot + 1, colPivot) == 4 || display(rowPivot + 1, colPivot + 1) == 4)
                check = false;
            end
        end
    end
    
    
    
    %Z Block Left
elseif(blockNum == 6)
    found = true;
    col = 22;
    while(found & col > 12)
        col = col - 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowTempPivot = row;
                colTempPivot = col;
                found = false;
            end
        end
    end
    if(position == 1)
        if(sum(piece(1, 12:21) == 11) > 0)
            check = false;
        else
            rowPivot = rowTempPivot;
            colPivot = colTempPivot - 1;
            if(display(rowPivot - 1, colPivot) == 4 || display(rowPivot + 1, colPivot + 1) == 4)
                check = false;
            end
        end
    else
        val = sum(piece(1:20, 21) == 11);
        if(val > 0)
            check = false;
        else
            rowPivot = rowTempPivot - 1;
            colPivot = colTempPivot - 1;
            if(display(rowPivot + 1, colPivot) == 4 || display(rowPivot, colPivot + 2) == 4)
                check = false;
            end
        end
    end
end
     