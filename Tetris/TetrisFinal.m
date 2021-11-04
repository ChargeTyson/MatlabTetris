clc
clear
close all

framerate = 30;
tetrisBoard = simpleGameEngine('retro_grid.png', 16, 16, 5);

%creates one player board
board = 2 * ones(20, 21);
board(1:20, 11:21) = 4;
board(3:6, 12:16) = 2;
blank_game = ones(20, 21);

%changeTime makes the speed increase when the player is "soft dropping"
%block
changeTime = 0;

%levelTime increases speed as the game progresses
levelTime = 0;

%game timer
tic

%player score
score = 0;

%an array to check if each block has been used once before repeating a
%block
blocksUsed = [0];

%number of lines cleared
lines = 0;

%creates the first block of the game
newBlock = randi(7);

%one player mode
while topOut(board)
    %currentBlock is the current block being used in the tetris board
    %this sets it to be the newBlock that was displayed in the top right
    currentBlock = newBlock;
    [tBlock, position] = createBlock(blank_game, newBlock);
    
    %creates the next block that will be used as long as
    %it hasn't been used before
    newBlock = randi(7);
    while(sum(newBlock == blocksUsed) > 0)
        newBlock = randi(7);
    end
    
    %creates the next block displayed in the top right corner
    %then updates display
    temp = createNextBlock(board, newBlock);
    board = temp;
    drawScene(tetrisBoard, board, tBlock);
    
    %goes until the block can't go down anymore
    while checkCanMoveDown(board, tBlock)
        if(toc > 1 - changeTime - levelTime)
            
            %timer for block to go down every second
            tic
            
            %moves the block down then updates scene
            temp = moveDown(tBlock, 1, 11);
            tBlock = temp;
            drawScene(tetrisBoard, board, tBlock)
        end
        drawScene(tetrisBoard, board, tBlock);
        %checks for button press
        key_down = guidata(tetrisBoard.my_figure);
        
        %if right, moves block right
        if(length(key_down) == 10)
            if(key_down == 'rightarrow' & checkCanMoveRight(board, tBlock))
                temp = moveRight(tBlock, 1, 11);
                tBlock = temp;
                drawScene(tetrisBoard, board, tBlock);
            end
            
        %if left, moves block left
        elseif(length(key_down) == 9)
            if(key_down == 'leftarrow' & checkCanMoveLeft(board, tBlock))
                temp = moveLeft(tBlock, 1, 11);
                tBlock = temp;
                drawScene(tetrisBoard, board, tBlock);
                
                %if down, drops block faster
            elseif(key_down == 'downarrow')
                changeTime = 0.9;
            end
            
            %if up, rotate block
        elseif(length(key_down) == 7)
            if(key_down == 'uparrow' & checkCanRotate(board, tBlock, currentBlock, position))
                [temp, position] = rotateBlock(tBlock, currentBlock, position);
                tBlock = temp;
                drawScene(tetrisBoard, board, tBlock);
            end
        else
            %resets change time if down is not being pressed
            changeTime = 0;
        end
        
        %framerate counter
        pause(1/framerate);
    end
    
    %clears blocksUsed if all the blocks have been used once
    blocksUsed(length(blocksUsed) + 1) = newBlock;
    if(length(blocksUsed) == 8)
        blocksUsed = [0];
    end
    
    %converts the block dropped to grey and updates board
    temp = convertToGrey(board, tBlock);
    board = temp;
    drawScene(tetrisBoard, board);
    
    %framerate counter
    pause(1/60);
    
    %clears line
    [temp, tempNum, tempVal] = clearLine(board);
    
    %counts how many lines were cleared
    lines = lines + tempVal;
    
    %increases speed based on the ammount of lines cleard
    levelTime = lines * 0.1;
    
    %updates score and prints it
    score = score + tempNum
    
    %creates board with cleared line
    board = temp;
    drawScene(tetrisBoard, board);
    
    %framerate counter
    pause(1/60);
end
