class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name
  validates_presence_of :email


  def name
  [first_name, last_name].compact.join(' ')
  end

  def skill
  [field].join
  end




end
