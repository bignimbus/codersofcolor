class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :set_default_plan, :if => :new_record?
  # after_create :sign_up_for_mailing_list

  belongs_to :plan
  validates_associated :plan

  def set_default_role
    self.role ||= :user
  end

  def set_default_plan
    self.plan ||= Plan.last
  end

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
