clc
clear
close all

framerate = 30;
card_scene1 = simpleGameEngine('retro_grid.png', 16, 16, 5);

%creates one player board
board = 2 * ones(20, 21);
board(1:20, 11:21) = 4;
board(3:6, 12:16) = 2;
blank_game = ones(20, 21);

%creates two player board
board2P = 2 * ones(20, 21);
board2P(1:20, 11) = 4;
% board2P(8:20, 12) = 4;
% board2P(8:20, 14:21) = 4;


start = 38 * ones(20, 21);
%T
start(3, 2:4) = 11;
start(4:7, 3) = 11;
start(4, 4) = 59;
start(5:7, 4) = 52;
start(8, 4) = 55;
start(8, 3) = 56;
%E
start(3:7, 5) = 36;
start(3, 6:7) = 36;
start(5, 6:7) = 36;
start(7, 6:7) = 36;
start(4, 6) = 59;
start(4, 7:8) = 51;
start(6, 6) = 59;
start(6, 7) = 51;
start(5, 8) = 58;
start(6, 8) = 55;
start(8, 6:7) = 51;
start(7, 8) = 58;
start(8, 8) = 55;
start(8, 5) = 56;
%T (Orange)
start(3, 8:10) = 34;
start(4:7, 9) = 34;
start(4, 10) = 59;
start(5:7, 10) = 52;
start(8, 10) = 55;
start(8, 9) = 56;
%R
start(3:7, 11) = 37;
start(3, 12:13) = 37;
start(4, 13) = 37;
start(5, 12) = 37;
start(6, 13) = 37;
start(7, 13) = 37;
start(4, 12) = 59;
start(5, 13) = 59;
start(6, 12) = 59;
start(7, 12) = 52;
start(8, 12) = 55;
start(8, 11) = 56;
start(8, 13) = 56;
start(8, 14:19) = 51;
start(6, 14) = 58;
start(5, 14) = 55;
start(4, 14) = 52;
%I
start(3, 14:16) = 35;
start(4:6, 15) = 35;
start(7, 14:16) = 35;
start(4, 16) = 59;
start(5:6, 16) = 52;
%S
start(3, 17:19) = 33;
start(5, 17:19) = 33;
start(7, 17:19) = 33;
start(4, 17) = 33;
start(6, 19) = 33;
start(4, 18) = 59;
start(4, 19) = 51;

startChar = blank_game;
startChar(10, 3) = 21;
startChar(10, 4) = 22;
startChar(10, 5) = 23;
startChar(10, 6) = 24;

drawScene(card_scene1, start, startChar);


%these are for starting/testing the different gamemodes
%set play1 to 1 and the rest to 0 to play single player
%set play2 to 1 and the rest to 0 to play against AI (not fully working)
%set play3 to 1 and the rest to 0 to play PVP (not fully working)
play1 = 1;
play2 = 0;
play3 = 0;


changeTime = 0;
levelTime = 0;
tic
score = 0;
a = [0];
lines = 0;
block = randi(7);
nextBlock = createNextBlock(blank_game, block);

%one player mode
while topOut(board) && play1
    oldBlock = block;
    [tBlock, position] = createBlock(blank_game, block);
    block = randi(7);
    while(sum(block == a) > 0)
        block = randi(7);
    end
    temp = createNextBlock(board, block);
    board = temp;
    drawScene(card_scene1, board, tBlock);
    %goes until the block can't go down anymore
    while checkCanMoveDown(board, tBlock)
        if(toc > 1 - changeTime - levelTime)
            %timer for block to go down every second
            tic
            temp = moveDown(tBlock, 1, 11);
            tBlock = temp;
            drawScene(card_scene1, board, tBlock)
        end
        drawScene(card_scene1, board, tBlock);
        %checks for button press
        key_down = guidata(card_scene1.my_figure);
        %if right, moves block right
        if(length(key_down) == 10)
            if(key_down == 'rightarrow' & checkCanMoveRight(board, tBlock))
                temp = moveRight(tBlock, 1, 11);
                tBlock = temp;
                drawScene(card_scene1, board, tBlock);
            end
        %if left, moves block left
        elseif(length(key_down) == 9)
            if(key_down == 'leftarrow' & checkCanMoveLeft(board, tBlock))
                temp = moveLeft(tBlock, 1, 11);
                tBlock = temp;
                drawScene(card_scene1, board, tBlock);
                %if down, drops block faster
            elseif(key_down == 'downarrow')
                changeTime = 0.9;
            end
            %if up, rotate block
        elseif(length(key_down) == 7)
            if(key_down == 'uparrow' & checkCanRotate(board, tBlock, oldBlock, position))
                [temp, position] = rotateBlock(tBlock, oldBlock, position);
                tBlock = temp;
                drawScene(card_scene1, board, tBlock);
            end
        else
            changeTime = 0;
        end
        %framerate counter
        pause(1/framerate);
    end
    a(length(a) + 1) = block;
    if(length(a) == 8)
        a = [0];
    end
    temp = convertToGrey(board, tBlock);
    board = temp;
    drawScene(card_scene1, board);
    %framerate counter
    pause(1/60);
    [temp, tempNum, tempVal] = clearLine(board);
    lines = lines + tempVal;
    levelTime = lines * 0.2;
    score = score + tempNum
    board = temp;
    drawScene(card_scene1, board);
    %framerate counter
    pause(1/60);
end


%playe vs computer mode
position = 0;
[cBlock, cPosition, cBlockNum] = createCompBlock(blank_game);
[idealSpot, idealPosition] = findIdealSpot(board2P, cBlockNum);
blockNum = randi(7);
[cBlock, position] = createBlock(cBlock, blockNum);
start1P = tic;
start2P = tic;
movementTimer = tic;
lines1P = 0;
lines2P = 0;
changeTime = 0;
changeTimeComp = 0;
while play2
    %computer Player
    if(toc(start2P) > 1 - changeTimeComp)
        start2P = tic;
        if(checkCanMoveDownComp(board2P, cBlock))
            cBlock = moveDownComp(cBlock, 1, 11);
            drawScene(card_scene1, board2P, cBlock);
        else
            [board2P, cBlock] = convertToGreyComp(board2P, cBlock);
            [board2P, lines2P] = clearLine2P(board2P);
            [cBlock, cPosition, cBlockNum] = createCompBlock(cBlock);
            [idealSpot, idealPosition] = findIdealSpot(board2P, cBlockNum);
            drawScene(card_scene1, board2P, cBlock);
        end
    end
    %player player
    if(toc(start1P) > 1 - changeTime)
        start1P = tic;
        if(checkCanMoveDown(board2P, cBlock))
            cBlock = moveDown(cBlock, 1, 11);
            drawScene(card_scene1, board2P, cBlock);
        else
            [board2P, cBlock] = convertToGrey2P(board2P, cBlock);
            blockNum = randi(7);
            [cBlock, position] = createBlock(cBlock, blockNum);
            [board2P, lines1P] = clearLine(board2P);
            drawScene(card_scene1, board2P, cBlock);
        end
    end
    
    if(toc(movementTimer) > .05)
        movementTimer = tic;
        place = leftPlaceOfBlock(cBlock);
        changeTimeComp = 0;
        if(cPosition ~= idealPosition && checkCanRotate2(board2P, cBlock, cBlockNum, cPosition))
            [cBlock, cPosition] = rotateBlock2(cBlock, cBlockNum, cPosition);
        elseif(idealSpot - place > 0 && checkCanMoveRight2(board2P, cBlock))
            cBlock = moveRight2(cBlock, 1, 11);
        elseif(idealSpot - place < 0 && checkCanMoveLeft2(board2P, cBlock))
            cBlock = moveLeft2(cBlock, 1, 11);
        else
            changeTimeComp = 1;
        end
    end
    
    drawScene(card_scene1, board2P, cBlock);
    %checks for button press
    key_down = guidata(card_scene1.my_figure);
        %if right, moves block right
        if(length(key_down) == 10)
            if(key_down == 'rightarrow' & checkCanMoveRight(board2P, cBlock))
                temp = moveRight(cBlock, 1, 11);
                cBlock = temp;
                drawScene(card_scene1, board2P, cBlock);
            end
        %if left, moves block left
        elseif(length(key_down) == 9)
            if(key_down == 'leftarrow' & checkCanMoveLeft(board2P, cBlock))
                temp = moveLeft(cBlock, 1, 11);
                cBlock = temp;
                drawScene(card_scene1, board2P, cBlock);
            elseif(key_down == 'downarrow')
                changeTime = 1;
            end
        elseif(length(key_down) == 7)
            if(key_down == 'uparrow' & checkCanRotate(board2P, cBlock, blockNum, position))
                [temp, position] = rotateBlock(cBlock, blockNum, position);
                cBlock = temp;
                drawScene(card_scene1, board2P, cBlock);
            end
        else
            changeTime = 0;
    end
    %framerate counter
    pause(1/framerate);
end



%player vs player
position = 1;
[cBlock, position2P, blockNum2P] = createCompBlock(blank_game);
blockNum = randi(7);
[cBlock, position] = createBlock(cBlock, blockNum);
start1P = tic;
start2P = tic;
lines1P = 0;
while play3
    if(toc(start1P) > 0.3)
        start1P = tic;
        if(checkCanMoveDown(board2P, cBlock))
            cBlock = moveDown(cBlock, 1, 11);
            drawScene(card_scene1, board2P, cBlock);
        else
            [board2P, cBlock] = convertToGrey2P(board2P, cBlock);
            blockNum = randi(7);
            [cBlock, position] = createBlock(cBlock, blockNum);
            [board2P, lines1P] = clearLine(board2P);
            drawScene(card_scene1, board2P, cBlock);
        end
    end
    if(toc(start2P) > 0.5)
        start2P = tic;
        if(checkCanMoveDownComp(board2P, cBlock))
            cBlock = moveDownComp(cBlock, 1, 11);
            drawScene(card_scene1, board2P, cBlock);
        else
            [board2P, cBlock] = convertToGreyComp(board2P, cBlock);
            [cBlock, position2P, blockNum2P] = createCompBlock(cBlock);
            [board2P, lines2P] = clearLine2P(board2P);
            drawScene(card_scene1, board2P, cBlock);
        end
    end
    drawScene(card_scene1, board2P, cBlock);
    %checks for button press
    key_down = guidata(card_scene1.my_figure)
    %if right, moves block right
    if(length(key_down) == 10)
        if(key_down == 'rightarrow' & checkCanMoveRight(board2P, cBlock))
            temp = moveRight(cBlock, 1, 11);
            cBlock = temp;
            drawScene(card_scene1, board2P, cBlock);
        end
     %if left, moves block left
     elseif(length(key_down) == 9)
        if(key_down == 'leftarrow' & checkCanMoveLeft(board2P, cBlock))
            temp = moveLeft(cBlock, 1, 11);
            cBlock = temp;
            drawScene(card_scene1, board2P, cBlock);
        elseif(key_down == 'downarrow')
            changeTime = 0.9;
        end
    elseif(length(key_down) == 7)
        if(key_down == 'uparrow' & checkCanRotate(board2P, cBlock, blockNum, position))
            [temp, position] = rotateBlock(cBlock, blockNum, position);
            cBlock = temp;
            drawScene(card_scene1, board2P, cBlock);
         end
    else
        changeTime = 0;
    end
    
    
    %checks for button press
    key_down2 = guidata(card_scene1.my_figure)
    %if right, moves block right
    if(length(key_down2) == 1)
        if(key_down2 == 'd' & checkCanMoveRight2(board2P, cBlock))
            temp = moveRight2(cBlock, 1, 11);
            cBlock = temp;
            drawScene(card_scene1, board2P, cBlock);
        elseif(key_down2 == 'a' & checkCanMoveLeft2(board2P, cBlock))
            temp = moveLeft2(cBlock, 1, 11);
            cBlock = temp;
            drawScene(card_scene1, board2P, cBlock);
        elseif(key_down2 == 'w' & checkCanRotate2(board2P, cBlock, blockNum2P, position2P))
            [temp, position2P] = rotateBlock2(cBlock, blockNum2P, position2P);
            cBlock = temp;
            drawScene(card_scene1, board2P, cBlock);
        elseif(key_down2 == 's')
            changeTime = 0.9;
        end
    else
        changeTime = 0;
    end
    %framerate counter
    pause(1/framerate);
end
