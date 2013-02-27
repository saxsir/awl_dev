class Support < ActiveRecord::Base
  attr_accessible :amount, :project_id, :reward_id, :user_id, :comment, :success
  belongs_to :project
  belongs_to :user
  belongs_to :reward

  def details
      client.details(self.token)
  end

  attr_reader :redirect_uri
  def setup!(return_url, cancel_url)
    response = client.setup(
      payment_request,
      return_url,
      cancel_url,
      pay_on_paypal: true
    )
    self.token = response.token
    self.save!
    @redirect_uri = response.redirect_uri
    self
  end

  def cancel!
    self.canceled = true
    self.save!
    self
  end

  def complete!(payer_id = nil)
    response = client.checkout!(self.token, payer_id, payment_request)
    self.payer_id = payer_id
    self.identifier = response.payment_info.first.transaction_id
    self.completed = true
    self.save!
    self
  end

  def unsubscribe!
    client.renew!(self.identifier, :Cancel)
    self.cancel!
  end

  private

  def client
    Paypal::Express::Request.new PAYPAL_CONFIG
  end

  def payment_request

     Paypal::Payment::Request.new(
     		:name => self.reward.title,
     		:description => self.reward.description,
     		:amount => self.amount,
     		:currency_code => :JPY
     	)
  end

end
