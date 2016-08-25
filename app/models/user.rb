class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  validates :password, presence: true
  validates :name, uniquness: true

  def mood
    if self.nausea > self.happiness
      'sad'
    else
      'happy'
    end
  end

end
