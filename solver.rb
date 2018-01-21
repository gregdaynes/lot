class Solver
  def possible_sets(field)
    valid_sets = []
    cards = field.to_a
    cards.each_with_index do |card, i|
      cards_crosset = cards[i + 1..-1]
      cards_crosset.each_with_index do |card2, j|
        cards_crosset[j + 1..-1].each do |card3|
          valid_sets << [card, card2, card3] if valid_set?(card, card2, card3)
        end
      end
    end

    valid_sets.select { |s| s.class == Array && s.length == 3 }
  end

  private

  def all_same?(x, y, z)
    x == y && y == z
  end

  def all_different?(x, y, z)
    x != y && x != z && y != z
  end

  def valid_match?(x, y, z)
    all_same?(x, y, z) || all_different?(x, y, z)
  end

  def valid_set?(card1, card2, card3)
    valid_features = %i[count fill color shape].map do |feature|
      # TODO: reverse this interface
      valid_match?(feature_value(card1, feature),
                   feature_value(card2, feature),
                   feature_value(card3, feature))
    end

    # TODO: fix this
    return false if valid_features.uniq.count > 1
    return false if valid_features.uniq.first == false

    true
  end

  def feature_value(card, feature)
    card.method(feature).call
  end
end
