function place = leftPlaceOfBlock(piece)

found = true;
col = 11;

while(col < 21 && found)
    col = col + 1;
    if(sum(piece(1:20, col) == 11) > 0)
        place = col;
        found = false;
    end
end
end
    