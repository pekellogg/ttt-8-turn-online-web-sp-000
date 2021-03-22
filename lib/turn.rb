# display current state of board
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# prompt user for input
def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    user_input = input_to_index(user_input) # storing this in a variable corrected a type error without
    if valid_move?(board, user_input)
        move(board, user_input, player = "X")
        display_board(board)
    else
        turn(board)
    end
end

# did not use the method below because this inhibits turn(board) from knowing user_input
# # get input
# def get_input
#     user_input = gets.strip
#     input_to_index(user_input)
# end

# convert user_input from str to int
def input_to_index(user_input)
    user_input = user_input.to_i - 1
end

def valid_move?(board, user_input)
    if position_taken?(board, user_input) == false && user_input.between?(0, 8)
        true
    else
        false
    end
end

def move(board, user_input, player = "X")
    board[user_input] = player
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, user_input)
    if board[user_input] == "X" || board[user_input] == "O"
        true
    else board[user_input] == " " || "" || nil
        false
    end
end