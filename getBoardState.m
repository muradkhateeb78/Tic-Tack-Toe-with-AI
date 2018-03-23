function state = getBoardState(board,turn)
state = 5;
if isWin(board,turn)
    state = 10;
elseif isDraw(board)
    state = 0;
end
    