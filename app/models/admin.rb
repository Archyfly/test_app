class Admin < User

  validates :name, presence: true
  validates :email, presence: true

end