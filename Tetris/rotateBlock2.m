function [matr, pos] = rotateBlock2(piece, blockNum, position)

matr = piece;



%rotating long block
if(blockNum == 1)
    if(position == 1)
        foundPivot = true;
        row = 0;
        while(foundPivot)
            row = row + 1;
            for(col = 12:21)
                if(matr(row, col) == 11)
                    rowPivot = row + 1;
                    colPivot = col;
                    foundPivot = false;
                end
            end
        end
        matr((rowPivot - 1):(rowPivot + 2), colPivot) = 1;
        matr(rowPivot, (colPivot - 1):(colPivot + 2)) = 11;
        pos = 2;
    else
        foundPivot = true;
        col = 11;
        while(foundPivot)
            col = col + 1;
            for(row = 1:20)
                if(matr(row, col) == 11)
                    rowPivot = row;
                    colPivot = col + 1;
                    foundPivot = false;
                end
            end
        end
        matr(rowPivot, (colPivot - 1):(colPivot + 2)) = 1;
        matr((rowPivot - 1):(rowPivot + 2), colPivot) = 11;
        pos = 1;
    end
    
    
%rotating T Block
elseif(blockNum == 2)
    found = true;
    col = 11;
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
        matr(rowTempPivot, colTempPivot + 2) = 1;
        matr(rowTempPivot - 1, colTempPivot + 1) = 11;
        pos = 2;
    elseif(position == 2)
        matr(rowTempPivot + 1, colTempPivot + 1) = 1;
        matr(rowTempPivot, colTempPivot + 2) = 11;
        pos = 3;
    elseif(position == 3)
        matr(rowTempPivot, colTempPivot) = 1;
        matr(rowTempPivot + 1, colTempPivot + 1) = 11;
        pos = 4;
    else
        matr(rowTempPivot - 2, colTempPivot) = 1;
        matr(rowTempPivot - 1, colTempPivot - 1) = 11;
        pos = 1;
    end
    
    
    %rotating L Right Block
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
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot - 1, colPivot) = 1;
        matr(rowPivot - 1, colPivot + 2) = 1;
        matr(rowPivot, colPivot + 1) = 11;
        matr(rowPivot - 2, colPivot) = 11;
        matr(rowPivot - 2, colPivot + 1) = 11;
        pos = 2;
    elseif(position == 2)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 1) = 1;
        matr(rowPivot + 2, colPivot + 1) = 1;
        matr(rowPivot + 1, colPivot) = 11;
        matr(rowPivot, colPivot + 2) = 11;
        matr(rowPivot + 1, colPivot + 2) = 11;
        pos = 3;
    elseif(position == 3)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 2) = 1;
        matr(rowPivot - 1, colPivot + 2) = 1;
        matr(rowPivot - 1, colPivot + 1) = 11;
        matr(rowPivot + 1, colPivot + 1) = 11;
        matr(rowPivot + 1, colPivot + 2) = 11;
        pos = 4;
    else
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 1) = 1;
        matr(rowPivot - 2, colPivot) = 1;
        matr(rowPivot, colPivot - 1) = 11;
        matr(rowPivot - 1, colPivot - 1) = 11;
        matr(rowPivot - 1, colPivot + 1) = 11;
        pos = 1;
    end
    
    
    %rotating L Left Block
elseif(blockNum == 4)
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
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 2) = 1;
        matr(rowPivot + 1, colPivot + 2) = 1;
        matr(rowPivot - 1, colPivot + 1) = 11;
        matr(rowPivot + 1, colPivot) = 11;
        matr(rowPivot + 1, colPivot + 1) = 11;
        pos = 2;
    elseif(position == 2)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 1) = 1;
        matr(rowPivot - 2, colPivot + 1) = 1;
        matr(rowPivot - 1, colPivot) = 11;
        matr(rowPivot - 1, colPivot + 2) = 11;
        matr(rowPivot - 2, colPivot) = 11;
        pos = 3;
    elseif(position == 3)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot - 1, colPivot) = 1;
        matr(rowPivot, colPivot + 2) = 1;
        matr(rowPivot + 1, colPivot + 1) = 11;
        matr(rowPivot - 1, colPivot + 1) = 11;
        matr(rowPivot - 1, colPivot + 2) = 11;
        pos = 4;
    else
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot - 2, colPivot + 1) = 1;
        matr(rowPivot - 2, colPivot) = 1;
        matr(rowPivot, colPivot + 1) = 11;
        matr(rowPivot - 1, colPivot - 1) = 11;
        matr(rowPivot - 1, colPivot + 1) = 11;
        pos = 1;
    end
        
    
    
    
    
%rotating Z Right Block
elseif(blockNum == 5)
    found = true;
    col = 11;
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
        matr(rowTempPivot + 1, colTempPivot + 1) = 1;
        matr(rowTempPivot + 1, colTempPivot + 2) = 1;
        matr(rowTempPivot - 1, colTempPivot + 1) = 11;
        matr(rowTempPivot + 1, colTempPivot) = 11;
        pos = 2;
    else
        matr(rowTempPivot, colTempPivot) = 1;
        matr(rowTempPivot - 2, colTempPivot + 1) = 1;
        matr(rowTempPivot, colTempPivot + 1) = 11;
        matr(rowTempPivot, colTempPivot + 2) = 11;
        pos = 1;
    end
    
    
    
%rotating Z Left Block
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
        matr(rowTempPivot, colTempPivot) = 1;
        matr(rowTempPivot + 1, colTempPivot - 2) = 1;
        matr(rowTempPivot, colTempPivot - 2) = 11;
        matr(rowTempPivot - 1, colTempPivot - 2) = 11;
        pos = 2;
    else
        matr(rowTempPivot - 1, colTempPivot - 1) = 1;
        matr(rowTempPivot - 2, colTempPivot - 1) = 1;
        matr(rowTempPivot, colTempPivot - 1) = 11;
        matr(rowTempPivot - 1, colTempPivot + 1) = 11;
        pos = 1;
    end
    
    
    
else
    pos = 1;
end