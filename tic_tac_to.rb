$win = ["xxx", "ooo"]
$turn_count = 0
$player_turn = []
x = "x"
o = "o"
$box = ["", "", "", "", "", "", "", "", ""]

def instructions
    puts "To begin the game , Type play(letter, placement)"
    puts "letter should be either 'x' or 'o'"
    puts "while placement should be the position of the letters in the box"
    puts "placement ranges from 1 - 9."
    puts "So, if i want to put the letter 'x' in the middle of the game..."
    puts "I'll type play(x, 5)"
    puts "this is what the game looks like;"
    puts ""
    puts " -----------------"
    puts "|  1  |  2  |  3  |"
    puts " -----------------"
    puts "|  4  |  5  |  6  |"
    puts " -----------------"
    puts "|  7  |  8  |  9  |"
    puts " -----------------"
    puts "I bet you know the rules of TicTacTo, don't ya?"
    puts "first player to get a straigt line crossed vertically, diagonally, or horizontally wins!"
    puts "Have Fun!"
end

def play(letter, placement)
    if letter == x || letter == 0 && [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(placement) == true
        if $turn_count == 0
            if letter == x
                $player_turn = [x, o, x, o, x, o, x, o, x]
            else
                $player_turn = [o, x, o, x, o, x, o, x, o]
            end
            $turn_count += 1
            $box[placement - 1] = letter
            check_for_win
        else
            if valid_play(letter, placement) == true
                $box[placement - 1] = letter
                check_for_win
            else
                $turn_count -= 1
                puts "Invalid Gameplay"
            end
        end
    else 
        puts "Invalid Move"
        puts "Use either 'x' or 'o' and 1 to 9 for placement"
    end
    display
end

def check_for_win
    if $win.include?($box[0] + $box[1] + $box[2])
        puts "Game Over! - Player #{$box[0]} wins."
        display
        reset
    elsif $win.include?($box[3] + $box[4] + $box[5])
        puts "Game Over! - Player #{$box[3]} wins."
        display
        reset
    elsif $win.include?($box[6] + $box[7] + $box[8])
        puts "Game Over! - Player #{$box[6]} wins."
        display
        reset
    elsif $win.include?($box[0] + $box[4] + $box[8])
        puts "Game Over! - Player #{$box[0]} wins."
        display
        reset
    elsif $win.include?($box[2] + $box[4] + $box[6])
        puts "Game Over! - Player #{$box[2]} wins."
        display
        reset
    elsif $win.include?($box[1] + $box[4] + $box[7])
        puts "Game Over! - Player #{$box[1]} wins."
        display
        reset
    elsif $win.include?($box[2] + $box[5] + $box[8])
        puts "Game Over! - Player #{$box[2]} wins."
        display
        reset
    elsif $win.include?($box[0] + $box[3] + $box[6])
        puts "Game Over! - Player #{$box[0]} wins."
        display
        reset
    else
        puts "It's a tie... Try again ;)"
        display
        reset
    end
end

def valid_play(letter, placement)
    $turn_count += 1
    if $box[placement - 1] == ""
        $place = "cool"
    else
        $place = "not cool"
    end
    if letter == $player_turn[$turn_count - 1]
        $turn = "cool"
    else
        $turn = "not cool"
    end
    if $place == "cool" && $turn == "cool"
        return true
    elsif $place == "cool" && $turn == "not cool"
        puts "It's not your turn!"
        return false
    elsif $place == "not cool" && $turn == "cool"
        puts "Box already occupied!"
        return false
    else
        puts "Chill man, wait for your turn"
    end
end

def display
    puts " -----------------"
    puts "|  #{box[0]}  |  #{box[1]}  |  #{box[2]}  |"
    puts " -----------------"
    puts "|  #{box[3]}  |  #{box[4]}  |  #{box[5]}  |"
    puts " -----------------"
    puts "|  #{box[6]}  |  #{box[7]}  |  #{box[8]}  |"
    puts " -----------------"
end

def reset
    $turn_count = 0
    $player_turn = []
    $box = ["", "", "", "", "", "", "", "", ""]
end