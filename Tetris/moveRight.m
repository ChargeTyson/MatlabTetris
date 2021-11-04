function rightMatrix = moveRight(display, blank, sprite)

%turns the current place of the block into blank sprites then shifts each
%of the old block sprites Right one position
for(col = 10:-1:1)
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