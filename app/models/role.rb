class Role < ApplicationRecord
  # == Schema Information
  #
  # Table name: roles
  #
  #  id                     :integer
  #  name                   :string
  #  resource_type          :string
  #  resource_id            :bigint
  #  created_at             :datetime
  #  updated_at             :datetime
  #

  # Associations
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  # Validations
  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  # Rolify gem scopes
  scopify
end
