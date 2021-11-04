function [matr, score, lines] = clearLine(display)
matr = display;
linesWereCleared = false;
first = true;
lines = 0;

%goes trough every line and clears the lines that are full
for(row = 20:-1:1)
    val = sum(matr(row, 1:10));
    
    %checks if line is full
    if(val == 40)
        
        %adds 1 to the amount of lines cleared
        lines = lines + 1;
        
        %makes that line black
        matr(row, 1:10) = 2;
        linesWereCleared = true;
        
        %records the position of the first line cleared
        if(first)
            gap = row;
            first = false;
        end
    end
end

%moves down all the other lines if lines were cleared
if(linesWereCleared)

%checks every row starting with the first line cleared
for(row = gap:-1:1)
    
    %moves down each line to where the "gap" is
    if(sum((matr(row, 1:10) == 4) > 0))
        matr(gap, 1:10) = matr(row, 1:10);
        matr(row, 1:10) = 2;
        gap = gap - 1;
    end
end
end

%updates score
score = 1000 * lines * lines;
end