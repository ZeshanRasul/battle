class Game
  attr_reader :player_1, :player_2, :current_turn, :opponent

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
    @opponent = player_2
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turns
    if @current_turn == player_1
      @current_turn = player_2
      @opponent = player_1
    elsif
      @current_turn = player_1
      @opponent = player_2
    end
  end
end
