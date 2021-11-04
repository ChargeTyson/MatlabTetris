function [Block, position]  = createBlock(blank_game, value)
 
%default position
position = 1;

%creates block at the starting position of the display depending on what
%value is given
if(value == 1)
    %Straight Block Setup
    Block = blank_game;
    Block(1, 4:7) = 11;
    position = 2;
    
elseif(value == 2)
    %T Block Setup
    Block = blank_game;
    Block(1, 4:6) = 11;
    Block(2, 5) = 11;
    
elseif(value == 3)
    %L Right Block Setup
    Block = blank_game;
    Block(1, 4:6) = 11;
    Block(2, 4) = 11;
    
elseif(value == 4)
    %L Left Block Setup
    Block = blank_game;
    Block(1, 4:6) = 11;
    Block(2, 6) = 11;  
    
elseif(value == 5)
    %Z Right Block Setup
    Block = blank_game;
    Block(1, 4:5) = 11;
    Block(2, 5:6) = 11;
    
elseif(value == 6)
    %Z left Block Setup
    Block = blank_game;
    Block(2, 4:5) = 11;
    Block(1, 5:6) = 11;
    
else
    %Square Block Setup
    Block = blank_game;
    Block(1, 5:6) = 11;
    Block(2, 5:6) = 11;
    
end


