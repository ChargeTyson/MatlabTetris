function check = canRotate(display, piece, blockNum, position)

check = true;
if(blockNum == 1)
    if(position == 1)
        val1 = sum(piece(1:20, 1) == 11);
        val2 = sum(piece(1:20, 9:10) == 11);
        if(val1 > 0 || val2 > 0)
            check = false;
        else
            found = true;
            row = 0;
            while(found)
                row = row + 1;
                for(col = 1:10)
                    if(piece(row, col) == 11)
                        rowPivot = row + 1;
                        colPivot = col;
                        found = true;
                    end
                end
            end
            if(display(rowPivot, colPivot-1) == 4 || display(rowPivot, colPivot+1) == 4 || display(rowPivot, colPivot+2) == 4)
                check = false;
            end
        end
    else
        val1 = sum(piece(19:20, 1:10) == 11);
        if(val1 > 0)
            check = false;
        else
            found = true;
            col = 0;
            while(found)
                col = col + 1;
                for(row = 1:20)
                    if(piece(row, col) == 11)
                        rowPivot = row + 1;
                        colPivot = col;
                    end
                end
            end
            if(display(rowPivot, colPivot-1) == 4 || display(rowPivot, colPivot+1) == 4 || display(rowPivot, colPivot+2) == 4)
                check = false;
            end
        end
    end
end
        