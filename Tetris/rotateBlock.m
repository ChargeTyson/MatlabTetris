function [matr, pos] = rotateBlock(piece, blockNum, position)

matr = piece;

%First, which block is being rotated is checked, then based on it's
%current position it is rotated to the next position

%rotating long block
if(blockNum == 1)
    
    %finds the "pivot point" and rotates the block around it to position 2
    %and clears the old locations of the block to blank sprites
    if(position == 1)
        foundPivot = true;
        row = 0;
        while(foundPivot)
            row = row + 1;
            for(col = 1:10)
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
            
    %finds the "pivot point" and rotates the block around it to position 1
    %and clears the old locations of the block to blank sprites
    else
        foundPivot = true;
        col = 0;
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
    col = 0;
    
    %finds where the block is on the board and sets the "pivot point" as
    %the middle of the block
    while(found & col < 10)
        col = col + 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowTempPivot = row;
                colTempPivot = col;
                found = false;
            end
        end
    end
    
    %rotates the block to position 2 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    if(position == 1)
        matr(rowTempPivot, colTempPivot + 2) = 1;
        matr(rowTempPivot - 1, colTempPivot + 1) = 11;
        pos = 2;
        
    %rotates the block to position 3 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    elseif(position == 2)
        matr(rowTempPivot + 1, colTempPivot + 1) = 1;
        matr(rowTempPivot, colTempPivot + 2) = 11;
        pos = 3;
        
    %rotates the block to position 4 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    elseif(position == 3)
        matr(rowTempPivot, colTempPivot) = 1;
        matr(rowTempPivot + 1, colTempPivot + 1) = 11;
        pos = 4;
        
    %rotates the block to position 1 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    else
        matr(rowTempPivot - 2, colTempPivot) = 1;
        matr(rowTempPivot - 1, colTempPivot - 1) = 11;
        pos = 1;
    end
    
    
    %rotating L Right Block
elseif(blockNum == 3)
    found = true;
    col = 0;
        
    %finds where the block is on the board and sets the "pivot point" as
    %the middle of the block
    while(found & col < 10)
        col = col + 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowPivot = row;
                colPivot = col;
                found = false;
            end
        end
    end
            
    %rotates the block to position 2 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    if(position == 1)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot - 1, colPivot) = 1;
        matr(rowPivot - 1, colPivot + 2) = 1;
        matr(rowPivot, colPivot + 1) = 11;
        matr(rowPivot - 2, colPivot) = 11;
        matr(rowPivot - 2, colPivot + 1) = 11;
        pos = 2;
                
    %rotates the block to position 3 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    elseif(position == 2)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 1) = 1;
        matr(rowPivot + 2, colPivot + 1) = 1;
        matr(rowPivot + 1, colPivot) = 11;
        matr(rowPivot, colPivot + 2) = 11;
        matr(rowPivot + 1, colPivot + 2) = 11;
        pos = 3;
                
    %rotates the block to position 4 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    elseif(position == 3)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 2) = 1;
        matr(rowPivot - 1, colPivot + 2) = 1;
        matr(rowPivot - 1, colPivot + 1) = 11;
        matr(rowPivot + 1, colPivot + 1) = 11;
        matr(rowPivot + 1, colPivot + 2) = 11;
        pos = 4;
                
    %rotates the block to position 1 around the pivot point and sets the
    %old locations of block sprites to blank sprites
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
    col = 0;
        
    %finds where the block is on the board and sets the "pivot point" as
    %the middle of the block
    while(found & col < 10)
        col = col + 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowPivot = row;
                colPivot = col;
                found = false;
            end
        end
    end
                    
    %rotates the block to position 2 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    if(position == 1)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 2) = 1;
        matr(rowPivot + 1, colPivot + 2) = 1;
        matr(rowPivot - 1, colPivot + 1) = 11;
        matr(rowPivot + 1, colPivot) = 11;
        matr(rowPivot + 1, colPivot + 1) = 11;
        pos = 2;
                        
    %rotates the block to position 3 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    elseif(position == 2)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot, colPivot + 1) = 1;
        matr(rowPivot - 2, colPivot + 1) = 1;
        matr(rowPivot - 1, colPivot) = 11;
        matr(rowPivot - 1, colPivot + 2) = 11;
        matr(rowPivot - 2, colPivot) = 11;
        pos = 3;
                        
    %rotates the block to position 4 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    elseif(position == 3)
        matr(rowPivot, colPivot) = 1;
        matr(rowPivot - 1, colPivot) = 1;
        matr(rowPivot, colPivot + 2) = 1;
        matr(rowPivot + 1, colPivot + 1) = 11;
        matr(rowPivot - 1, colPivot + 1) = 11;
        matr(rowPivot - 1, colPivot + 2) = 11;
        pos = 4;
                        
    %rotates the block to position 1 around the pivot point and sets the
    %old locations of block sprites to blank sprites
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
    col = 0;
        
    %finds where the block is on the board and sets the "pivot point" as
    %the middle of the block
    while(found & col < 10)
        col = col + 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowTempPivot = row;
                colTempPivot = col;
                found = false;
            end
        end
    end
                    
    %rotates the block to position 2 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    if(position == 1)
        matr(rowTempPivot + 1, colTempPivot + 1) = 1;
        matr(rowTempPivot + 1, colTempPivot + 2) = 1;
        matr(rowTempPivot - 1, colTempPivot + 1) = 11;
        matr(rowTempPivot + 1, colTempPivot) = 11;
        pos = 2;
                        
    %rotates the block to position 1 around the pivot point and sets the
    %old locations of block sprites to blank sprites
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
    col = 11;
        
    %finds where the block is on the board and sets the "pivot point" as
    %the middle of the block
    while(found & col > 1)
        col = col - 1;
        for(row = 1:20)
            if(piece(row, col) == 11)
                rowTempPivot = row;
                colTempPivot = col;
                found = false;
            end
        end
    end
                    
    %rotates the block to position 2 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    if(position == 1)
        matr(rowTempPivot, colTempPivot) = 1;
        matr(rowTempPivot + 1, colTempPivot - 2) = 1;
        matr(rowTempPivot, colTempPivot - 2) = 11;
        matr(rowTempPivot - 1, colTempPivot - 2) = 11;
        pos = 2;
                        
    %rotates the block to position 1 around the pivot point and sets the
    %old locations of block sprites to blank sprites
    else
        matr(rowTempPivot - 1, colTempPivot - 1) = 1;
        matr(rowTempPivot - 2, colTempPivot - 1) = 1;
        matr(rowTempPivot, colTempPivot - 1) = 11;
        matr(rowTempPivot - 1, colTempPivot + 1) = 11;
        pos = 1;
    end
    
%If the block is square, it can't rotate
else
    pos = 1;
end
        
        