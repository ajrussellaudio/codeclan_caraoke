# Should have:
# - name
# - money
# - favourite song

class Guest

  attr_reader :name, :cash

  def initialize(name, money)
    @name = name
    @cash = money
  end

end
