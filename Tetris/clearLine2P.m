function [matr, lines] = clearLine2P(display)
matr = display;
linesWereCleared = false;
first = true;
lines = 0;
for(row = 20:-1:1)
    val = sum(matr(row, 12:21));
    if(val == 40)
        lines = lines + 1;
        matr(row, 12:21) = 2;
        linesWereCleared = true;
        if(first)
            gap = row;
            first = false;
        end
    end
end
if(linesWereCleared)
for(row = gap:-1:1)
    if(sum((matr(row, 12:21) == 4) > 0))
        matr(gap, 12:21) = matr(row, 12:21);
        matr(row, 12:21) = 2;
        gap = gap - 1;
    end
end
end
end