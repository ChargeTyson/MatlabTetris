function rightMatrix = moveRight2(display, blank, sprite)

for(col = 21:-1:12)
    for(row = 20:-1:1)
        val = display(row, col);
        if(val == sprite)
            display(row, col + 1) = sprite;
            display(row, col) = blank;
        end
    end
end
rightMatrix = display;
end