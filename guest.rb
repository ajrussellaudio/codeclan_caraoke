# Should have:
# - name √
# - money √
# - favourite song

class Guest

  attr_reader :name
  attr_accessor :cash

  def initialize(name, money)
    @name = name
    @cash = money
  end

end
