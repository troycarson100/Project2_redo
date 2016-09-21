class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def score
    self.votes.where({sentiment: 1}).count - self.votes.where({sentiment: -1}).count
  end

end
