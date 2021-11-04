function matr = convertToGrey(display, piece)
matr = display;
%takes the current piece, checks what position it's at
%then converts it to grey block sprite
for(row = 20:-1:1)
    for(col = 10:-1:1)
        if(piece(row, col) == 11)
            matr(row, col) = 4;
        end
    end
end
end