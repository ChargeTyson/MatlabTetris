function [colNum, position] = findIdealSpotRand(blockNum)

if(blockNum == 1)
    position = randi(2);
    if(position == 1)
        colNum = randi(10) + 11;
    else
        colNum = randi(10) + 8;
    end
elseif(blockNum == 2)
    position = randi(4);
    if(position == 1 || position == 3)
        colNum = randi(10) + 9;
    else
        colNum = randi(10) + 10;
    end
elseif(blockNum == 3)
    position = randi(4);
    if(position == 1 || position == 3)
        colNum = randi(10) + 9;
    else
        colNum = randi(10) + 10;
    end
elseif(blockNum == 4)
    position = randi(4);
    if(position == 1 || position == 3)
        colNum = randi(10) + 9;
    else
        colNum = randi(10) + 10;
    end
elseif(blockNum == 5)
    position = randi(2);
    if(position == 1)
        colNum = randi(10) + 9;
    else
        colNum = randi(10) + 10;
    end
elseif(blockNum == 6)
    position = randi(2);
    if(position == 1)
        colNum = randi(10) + 9;
    else
        colNum = randi(10) + 10;
    end
elseif(blockNum == 7)
    position = 1;
    colNum = randi(10) + 10;
end