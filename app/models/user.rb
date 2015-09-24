class User < ActiveRecord::Base
  enum role: [:basic,:plus,:premium,:admin]
  after_initialize :set_default_role, :if => :new_record?

  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

  def set_default_role
    self.role ||= :basic
  end

  belongs_to :dashboard

# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def sign_up_for_mailing_list
    MailingListSignupJob.perform_later(self)
  end

  def subscribe
    mailchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
    result = mailchimp.lists.subscribe({
      :id => Rails.application.secrets.mailchimp_list_id,
      :email => {:email => self.email},
      :double_optin => false,
      :update_existing => true,
      :send_welcome => true
      })
      Rails.logger.info("Subscribed #{self.email} to Mailchimp") if result
    end

  def name
  [first_name, last_name].compact.join(' ')
  end

end
