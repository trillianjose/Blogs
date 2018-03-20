class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs

  validates :first_name, :last_name, :age, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
