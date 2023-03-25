require './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.chars.slice(0, 10).join
  end
end
