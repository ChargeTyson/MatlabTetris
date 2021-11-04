function [colNum, position] = findIdealSpot(display, blockNum)

%4 Block
if(blockNum == 1)
    if(sum(display(20, 12:21) == 2) == 10)
        position = 2;
        colNum = 12;
    else
        row = 21;
        check = true;
        while(row > 1 && check)
            row = row - 1;
            for(col = 20:-1:15)
                val = display(row, col-3:col);
                if(sum(val == 2) == 4)
                    position = 2;
                    colNum = col - 3;
                    check = false;
                end
            end
        end
    end
    
%T Block
elseif(blockNum == 2)
    %case 1: first block placed bottom left corner
    if(sum(display(20, 12:21) == 2) == 10)
        position = 3;
        colNum = 1;
    else
        row = 21;
        check = true;
        while(row > 3 && check)
            row = row - 1;
            %case 2: facing down inserted into single block space
            for(col = 20:-1:12)
                if(display(row, col) == 2 & (sum(display(row-1, col-1:col+1) == 2) == 3) & ((display(row, col-1) + display(row, col+1))==8))
                    position = 1;
                    colNum = col-1;
                    check = false;
                end
            end
            %case 3: facing up on a flat surface
            if(check == true)
                for(col = 20:-1:12)
                    if((sum(display(row, col-2:col) == 2) == 3) & (sum(display(row - 1, col-2:col) == 2) == 3))
                        position = 3;
                        colNum = col-2;
                        check = false;
                    end
                end
            end
            %case 4: facing right
            if(check == true)
                for(col = 19:-1:12)
                    if((sum(display(row-2:row, col) == 2) == 3) & (display(row - 1, col+1) == 2) & (display(row, col+1) == 4))
                        position = 4;
                        colNum = col;
                        check = false;
                        if(row < 20)
                            if(display(row+1, col) == 2)
                                check = true;
                            end
                        end
                    end
                end
            end
            %case 5: facing left
            if(check == true)
                for(col = 20:-1:13)
                    if((sum(display(row-2:row, col) == 2) == 3) & (display(row - 1, col-1) == 2) & (display(row, col-1) == 4))
                        position = 2;
                        colNum = col-1;
                        check = false;
                        if(row < 20)
                            if(display(row+1, col) == 2)
                                check = true;
                            end
                        end
                    end
                end
            end
        end
    end
        
%L Right Block
elseif(blockNum == 3)
    %case 1: first block placed bottom left corner
    if(sum(display(20, 12:21) == 2) == 10)
        position = 3;
        colNum = 1;
    else
        row = 21;
        check = true;
        while(row > 3 && check)
            row = row - 1;
            %case 2: L inserting into gap
            if(check == true)
                for(col = 19:-1:12)
                    if((sum(display(row:row-2, col+1) == 2) == 3) & (sum(display(row-2, col) == 2)) & (sum(display(row:row-1, col) == 4) == 2))
                        position = 2;
                        colNum = col;
                        check = false;
                    end
                end
            end
            %case 3: L block layed flat down
            if(check == true)
                for(col = 18:-1:12)
                    if((sum(display(row-1, col:col+2) == 2) == 3) & (sum(display(row, col) == 2)) & (sum(display(row, col+1:col+2) == 4) == 2))
                        position = 1;
                        colNum = col;
                        check = false;
                    end
                end
            end
            %case 4: L block layed flat up
            if(check == true)
                for(col = 18:-1:12)
                    if((sum(display(row, col:col+2) == 2) == 3) & (sum(display(row-1, col+2) == 2)) & (sum(display(row-1, col:col+1) == 2) == 2))
                        position = 3;
                        colNum = col;
                        check = false;
                    end
                end
            end
            %case 5: L block Layed L wise
            if(check == true)
                for(col = 19:-1:12)
                    if((sum(display(row:row-2, col) == 2) == 3) & (sum(display(row:row-2, col+1) == 2) == 3))
                        position = 4;
                        colNum = col;
                        check = false;
                    end
                end
            end
        end
    end

    
    
%L Left Block
elseif(blockNum == 4)
    position = randi(4);
    if(position == 1 || position == 3)
        colNum = randi(10) + 9;
    end
    
%Z Right Block
elseif(blockNum == 5)
    %case 1: first block placed bottom left corner
    if(sum(display(20, 12:21) == 2) == 10)
        position = 1;
        colNum = 1;
    else
        row = 21;
        check = true;
        while(row > 3 && check)
            row = row - 1;
            %case 2: Z block layed flat
            for(col = 18:-1:12)
                if((sum(display(row-1, col:col+1) == 2) == 2) & (sum(display(row, col+1:col+2) == 2) == 2) & (display(row, col) == 4))
                    position = 1;
                    colNum = col;
                    check = false;
                end
            end
            %case 3: facing up
            if(check == true)
                for(col = 19:-1:12)
                    if((sum(display(row-2:row-1, col+1) == 2) == 2) & (sum(display(row-1:row, col) == 2) == 2) & (display(row, col+1) == 4))
                        position = 2;
                        colNum = col;
                        check = false;
                    end
                end
            end
        end
    end
    
%Z Left Block
elseif(blockNum == 6)
    %case 1: first block placed bottom left corner
    if(sum(display(20, 12:21) == 2) == 10)
        position = 1;
        colNum = 1;
    else
        row = 21;
        check = true;
        while(row > 3 && check)
            row = row - 1;
            %case 2: Z block layed flat
            for(col = 18:-1:12)
                if((sum(display(row-1, col+1:col+2) == 2) == 2) & (sum(display(row, col:col+1) == 2) == 2) & (display(row, col+2) == 4))
                    position = 1;
                    colNum = col;
                    check = false;
                end
            end
            %case 3: facing up
            if(check == true)
                for(col = 19:-1:12)
                    if((sum(display(row-2:row-1, col) == 2) == 2) & (sum(display(row-1:row, col+1) == 2) == 2) & (display(row, col) == 4))
                        position = 2;
                        colNum = col;
                        check = false;
                    end
                end
            end
        end
    end
    
%Square Block
elseif(blockNum == 7)
    position = 1;
    colNum = randi(10) + 10;
end