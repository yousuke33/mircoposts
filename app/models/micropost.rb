class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

  validates :content, presence: true, length: { maximum: 140 }

  belongs_to :motoneta_micropost,   foreign_key: 'retweet_id' # このMicropostがリツイートしている元ネタのMicropost
  has_many   :retweeted_microposts, foreign_key: 'retweet_id' # このMicropostをリツイートしているMicropost（複数）
  
end
