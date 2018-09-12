class Conversation < ApplicationRecord

    # Associations
    has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy
    belongs_to :author, class_name: 'User'
    belongs_to :receiver, class_name: 'User'


    # Validations
    validates :author, uniqueness: {scope: :receiver}

    # Scopes
    scope :participating, -> (user) do
        where("(conversations.author_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
      end
      scope :author, -> (user) do
        where("(conversations.author_id = ?)", user.id,)
      end
      scope :receiver, -> (user) do
        where("(conversations.receiver_id = ?)", user.id,)
      end

      scope :authorpresent, -> { where(:author_deleted => false) }
      scope :receiverpresent, -> { where(:receiver_deleted => false) }
      scope :newest, -> { order(created_at: :desc) }
      
      scope :between, -> (sender_id, receiver_id) do
        where(author_id: sender_id, receiver_id: receiver_id).or(where(author_id: receiver_id, receiver_id: sender_id)).limit(1)
      end
    #   Methods
    def recipient?(user)
      receiver == user
    end

    def author?(user)
      author == user
    end

      def participates?(user)
        author == user || receiver == user
      end

      def with(current_user)
        author == current_user ? receiver : author
      end
end
