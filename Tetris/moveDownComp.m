function downMatrix = moveDownComp(display, blank, sprite)

for(row = 20:-1:1)
    for(col = 21:-1:11)
       if(display(row, col) == sprite)
           display(row, col) = blank;
           display(row + 1, col) = sprite;
    end
    end
end
downMatrix = display;
end