# == Schema Information
#
# Table name: abouts
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  assignment  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  content     :text
#

class About < ApplicationRecord

  scope :main, -> { where(:assignment => 'MAIN') }
  scope :column_one, -> { where(:assignment => 'COLUMN_ONE')}
  scope :column_two, -> { where(:assignment => 'COLUMN_TWO') }

  def assignment_enum
    # Do not select any value, or add any blank field. RailsAdmin will do it for you.
    ['MAIN', 'COLUMN_ONE', 'COLUMN_TWO']
    # alternatively
    # { green: 0, white: 1 }
    # [ %w(Green 0), %w(White 1)]
  end



end
