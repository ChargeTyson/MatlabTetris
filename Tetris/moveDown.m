function downMatrix = moveDown(display, blank, sprite)

%turns the current place of the block into blank sprites then shifts each
%of the old block sprites down one position
for(row = 20:-1:1)
    for(col = 10:-1:1)
       if(display(row, col) == sprite)
           display(row, col) = blank;
           display(row + 1, col) = sprite;
    end
    end
end
downMatrix = display;
end