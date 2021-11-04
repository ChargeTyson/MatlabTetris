function [matr, pieceBack] = convertToGreyComp(display, piece)
matr = display;
pieceBack = piece;
for(row = 20:-1:1)
    for(col = 21:-1:11)
        if(piece(row, col) == 11)
            matr(row, col) = 4;
            pieceBack(row, col) = 1;
        end
    end
end
end