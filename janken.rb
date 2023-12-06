def janken
    choices = ["グー", "チョキ", "パー"]
    computer_choice = choices.sample

    puts "じゃんけん！"
    puts "1:ぐー, 2:チョキ 3:パー"
    player_choice = gets.chomp.to_i

    unless [1, 2, 3].include?(player_choice)
        puts "1,2,3のいずれかを選んでください"
        janken
    end

    puts "あなたの選択: #{choices[player_choice - 1]}"
    puts "相手の選択: #{computer_choice}"
    puts "----------------------------------"

    case (player_choice - 1) - choices.index(computer_choice)
    when -1, 2
        puts "あなたの勝ちです"
        puts "----------------------------------"
        direction_game_player
    when 0
        puts "あいこです"
        puts "----------------------------------"
        janken
    else
        puts "あなたの負けです"
        puts "----------------------------------"
        direction_game_computer
    end
    
end

def direction_game_player
    puts "あっち向いて"
    puts "ほいっ！ 1:上 2:右 3:下 4:左 (指を向ける方向を選択して下さい) "
    player_finger_direction = gets.chomp.to_i

    unless [1,2,3,4].include?(player_finger_direction)
        puts "1,2,3,4のいずれかを選択して下さい"
        direction_game_player
    end

    computer_face_direction = rand(1..4)

    if player_finger_direction == computer_face_direction
        puts "おめでとうございます。あなたの勝利です！！"
    else
        puts "残念！もう一度行きましょう！"
        puts "----------------------------------"
        janken
    end

end

def direction_game_computer
    puts "あっち向いて"
    puts "ほいっ！ 1:上 2:右 3:下 4:左 (顔を向ける方向を選択して下さい) "
    puts "----------------------------------"
    player_face_direction = gets.chomp.to_i

    unless [1,2,3,4].include?(player_face_direction)
        puts "1,2,3,4のいずれかを選択して下さい"
        puts "----------------------------------"
        direction_game_computer
    end

    computer_finger_direction = rand(1..4)

    if player_face_direction == computer_finger_direction
        puts "残念！あなたの敗北です。"
    else
        puts "セーフ！もう一度行きましょう！"
        puts "----------------------------------"
        janken
    end

end

puts "ゲームを開始します"
janken
