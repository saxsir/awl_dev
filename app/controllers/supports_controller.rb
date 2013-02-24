class SupportsController < ApplicationController
  rescue_from Paypal::Exception::APIError, with: :paypal_api_error

	# new
  def new
    @support = Support.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @support }
    end
  end

   # POST /supports
  # POST /supports.json
  def create
    @support = Support.new(params[:support])

    #ここでバリデーション


    if @support.save

      request = Paypal::Express::Request.new PAYPAL_CONFIG

      payment_request = Paypal::Payment::Request.new(
        :currency_code => :USD, # if nil, PayPal use USD as default
        :amount        => @support.amount,
        :description   => @support.reward.description
      )
      response = request.setup(
        payment_request,
        root_url,#payment成功時のコールバック
        root_url#キャンセル時のコールバック
        )#成功時とキャンセル時のそれぞれで、tokenとpayerIDを取得できる。s
      redirect_to response.redirect_uri
    else

    end
  end


  def paypal_api_error(e)
    redirect_to root_url, error: e.response.details.collect(&:long_message).join('<br />')
  end
end
