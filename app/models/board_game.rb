class BoardGame < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { message: "This board game already exists in our records!" }
  validates :publisher, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 50 }
end
