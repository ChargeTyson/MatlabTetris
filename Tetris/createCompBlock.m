function [Block, position, value] = createCompBlock(blank_game)

val = randi(4);
if(val == 1)
    value = 2;
elseif(val == 2)
    value = 5;
elseif(val == 3)
    value = 6;
else
    value = 3;
end

position = 1;

Block = blank_game;

if(value == 1)
    %Straight Block Setup
    Block(1, 15:18) = 11;
    position = 2;
elseif(value == 2)
    %T Block Setup
    Block(1, 15:17) = 11;
    Block(2, 16) = 11;
elseif(value == 3)
    %L Right Block Setup
    Block(1, 15:17) = 11;
    Block(2, 15) = 11;
elseif(value == 4)
    %L Left Block Setup
    Block(1, 15:17) = 11;
    Block(2, 17) = 11;  
elseif(value == 5)
    %Z Right Block Setup
    Block(1, 15:16) = 11;
    Block(2, 16:17) = 11;
elseif(value == 6)
    %Z left Block Setup
    Block(2, 15:16) = 11;
    Block(1, 16:17) = 11;
else
    %Square Block Setup
    Block(1, 16:17) = 11;
    Block(2, 16:17) = 11;
end

