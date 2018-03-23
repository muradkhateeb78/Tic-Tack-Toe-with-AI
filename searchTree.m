function [bestBoard,value] = searchTree(board,turn,myTurn)
gameState = getBoardState(board,turn);
if gameState == 10 || gameState==0
    if gameState == 0
        value = 0;
    elseif turn==myTurn
        value = 10;
    else
        value = -10;
    end
    bestBoard = board;
    return;
end
children = generateChildren(board,turn);
noOfChildren = size(children,3);
values = zeros(1,noOfChildren);
for i=1:noOfChildren
    tempBoard = children(:,:,i);
    tempTurn = changeTurn(turn);
    [bestBoard,value] = searchTree(tempBoard,tempTurn,myTurn);
    values(i) = value;
end
max_value = 0;
if turn == myTurn
    max_value = max(values);
else
    max_value = min(values);
end
max_indeces = find(values == max_value);
max_index = max_indeces(1);
value = max_value;
bestBoard = children(:,:,max_index);
    