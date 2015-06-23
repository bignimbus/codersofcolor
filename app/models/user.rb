class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #avatar settings
  # has_attached_file :avatar, :styles => { :medium => "174x174>", :thumb => "100x100>" }, :default_url => "/images/original/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage/
  # validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

  # def name
  # [first_name, last_name].compact.join(' ')
  # end
  #
  # def skill
  # [field].join
  # end



end
