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

    #ここでバリデーションしたい

    #とりあえずfalseにする。paypalからリダイレクトがあればtrueにする
    @support.success = false


    respond_to do |format|
      if @support.save
      	#うまく行ってたらparent(プロジェクトページ)にnoticeつきで飛ばす

            #paypalにつないでみる

        request = Paypal::Express::Request.new(
          :username   => "sell.m_1357901090_biz_api1.gmail.com",
          :password   => "1357901106",
          :signature  => "A2uwP5aMmgJLzo97zypBw4mQqMXJAVvhjYtc2kWbpVYJR3L9R.BbjYoS"
        )
        payment_request = Paypal::Payment::Request.new(
          :currency_code => :JPY, # if nil, PayPal use USD as default
          :amount        => "5000",
          :description   => "reward_description"
        )
        response = request.setup(
          payment_request,
          "http://localhost:3000",#payment成功時のコールバック
          "http://localhost:3000"#キャンセル時のコールバック
          )#成功時とキャンセル時のそれぞれで、tokenとpayerIDを取得できる。s
        redirect_to response.redirect_uri

       	#成功時とエラー時にそれぞれnoticeを送るようにしたい。つうかバリデーション
      else
        #format.html { render action: "new" }
        #format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end


  def paypal_api_error(e)
    redirect_to root_url, error: e.response.details.collect(&:long_message).join('<br />')
  end
end
