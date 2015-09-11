class User < ActiveRecord::Base
  enum role: [:basic,:plus,:premium,:admin]
  after_initialize :set_default_role, :if => :new_record?

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
