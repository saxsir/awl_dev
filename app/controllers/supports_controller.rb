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
    support = Support.create! params[:support]

    #ここでバリデーション

    support.setup!(
      success_supports_url,
      cancel_supports_url
    )
    #logger.info "support.redirect_uri : #{support.redirect_uri}"
    redirect_to support.redirect_uri
  end

  #support成功時にコールバックされる
  def success
    support = Support.find_by_token! params[:token]
    support.complete!(params[:PayerID])
    flash[:notice] = 'Paypal Transaction Completed'
    redirect_to project_url(support.project_id)
  end

  #cansel時
  def cancel
    support = Support.find_by_token! params[:token]
    support.cancel!
    flash[:error] = 'Paypal Request Canceled'
    redirect_to project_url(support.project_id)
  end


    private

    def handle_callback
      support = Support.find_by_token! params[:token]
      @redirect_uri = yield support
      if support.popup?
        render :close_flow, layout: false
      else
        redirect_to @redirect_uri
      end
    end

  def paypal_api_error(e)
    redirect_to root_url, error: e.response.details.collect(&:long_message).join('<br />')
  end
end
