# 文字をゆっくり表示
def yukkuri(moji)
    characters = moji.chars
        characters.each do |mo|
            print mo
            sleep 0.1
        end
    puts ""
    sleep 1
end

# 問題と回答のクラス
class Question
    attr_accessor :id, :question, :choices, :answer

    def initialize(id, question, answer)
        @id = id
        @question = question
        @choices = []
        @answer = answer
    end

    def add_choice(choice)
        @choices << choice
    end

    def check_answer(your_answer)
        if choices[your_answer.to_i - 1] == answer
            puts "正解です！"
            score = 1
            else
                puts "不正解です。正解は #{answer} です。"
                score = 0
        end
        score
    end

    def ask_question
        puts "------------------------------------"
        puts "【問題】#{@id}"
        puts "------------------------------------"
        puts ""
        yukkuri(@question)
            choices.each_with_index do |choice, index|
                puts "#{index + 1}. #{choice}"
                sleep 0.5
            end
        puts ""
    end
end

# クラスのインスタンス化
def create_question(id, question, answer, choices)
    question_instance = Question.new(id, question, answer)
    choices.each { |choice| question_instance.add_choice(choice) }
    question_instance
end

# タイトル
def title
# 問題と回答はここ
questions = [
    create_question(1, "青森県の県庁所在地は？", "青森市", ["春日部市", "山形市", "海老名市", "青森市"]),
    create_question(2, "JR山手線の駅の数は？", "30駅", ["30駅", "29駅", "28駅", "27駅"])
    create_question(3, "茨城県より大きな面積の都道府県は次のうちどこ？", "山口県", ["愛媛県", "山口県", "三重県", "愛知県"])
]
    puts "------------------------------------"
    puts ""
    puts "          クイズアプリ"
    puts ""
    puts "------------------------------------"
    sleep 1
    puts "エンターキーでクイズをはじめる"
    while gets.chomp != ""
        puts "クイズをはじめるにはエンターキーを押してください"
    end
    go_quiz(questions)
end

# クイズ
def go_quiz(questions)
    score = 0
    questions.each do |question|
        question.ask_question
        your_answer = gets.chomp.to_i
        score += question.check_answer(your_answer)
    end
    yukkuri("あなたのスコアは#{score}です！")
    sleep 1
    puts "エンターキーでクイズを終了します。"
        while gets.chomp!= ""
            puts "エンターキーでクイズを終了します。"
        end
        title
end

title
