function rightMatrix = moveLeft2(display, blank, sprite)

for(col = 12:21)
    for(row = 20:-1:1)
        val = display(row, col);
        if(val == sprite)
            display(row, col - 1) = sprite;
            display(row, col) = blank;
        end
    end
end
rightMatrix = display;
end