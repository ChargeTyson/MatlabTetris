function Block = createNextBlock(display, value)

%creates a block in the top right of the display depending on what value is
%given
Block = display;
Block(3:6, 12:16) = 2;

if(value == 1)
    %Straight Block Setup
    Block(5, 13:16) = 11;
    
elseif(value == 2)
    %T Block Setup
    Block(4, 13:15) = 11;
    Block(5, 14) = 11;
    
elseif(value == 3)
    %L Right Block Setup
    Block(4, 13:15) = 11;
    Block(5, 13) = 11;
    
elseif(value == 4)
    %L Left Block Setup
    Block(4, 13:15) = 11;
    Block(5, 15) = 11;  
elseif(value == 5)
    %Z Right Block Setup
    Block(4, 13:14) = 11;
    Block(5, 14:15) = 11;
    
elseif(value == 6)
    %Z left Block Setup
    Block(5, 13:14) = 11;
    Block(4, 14:15) = 11;
    
else
    %Square Block Setup
    Block(4, 13:14) = 11;
    Block(5, 13:14) = 11;
    
end