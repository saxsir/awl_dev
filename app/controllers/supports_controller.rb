class SupportsController < ApplicationController

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

    #paypalに渡すpostパラメータを作成


    respond_to do |format|
      if @support.save
      	#うまく行ってたらparent(プロジェクトページ)にnoticeつきで飛ばす
      	#postからpostへリダイレクトは出来ない。よってボタン増やしたのでここでは何も行わない
      	#format.html { redirect_to @support, notice: 'Support is Okay' }
        #format.json { render json: @support, status: :created, location: @support }
      else
        #format.html { render action: "new" }
        #format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

end
