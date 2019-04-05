class Streamer < ApplicationRecord
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
