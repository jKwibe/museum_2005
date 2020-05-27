
class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons =[]
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end
  def patrons_by_exhibit_interest
    exhibit_hash = {}
    @exhibits.each do |exhibit|
     exhibit_hash[exhibit] = patrons.select{|patron| patron.interests.include?(exhibit.name)}
    end
    exhibit_hash
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.select do |patron|
      patron.spending_money <= exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    contestants = ticket_lottery_contestants(exhibit)
    if contestants.size > 0
      contestants.sample
    else
      nil
    end
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)
    if winner
      return "#{winner.name} has won the #{exhibit.name} lottery"
    end
    "No winner for this lottery"
  end
end
