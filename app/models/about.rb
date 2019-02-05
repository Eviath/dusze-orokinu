class About < ApplicationRecord

  def assignment_enum
    # Do not select any value, or add any blank field. RailsAdmin will do it for you.
    ['MAIN', 'COLUMN_ONE', 'COLUMN_TWO']
    # alternatively
    # { green: 0, white: 1 }
    # [ %w(Green 0), %w(White 1)]
  end



end
