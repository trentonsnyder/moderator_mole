class BroadcastsController < ApplicationController
  def show
    @event = Event.find_by!(broadcast_token: params[:token])
  end

  def mailer
    # TODO send email in job
    BroadcastMailer.with(broadcast: params[:broadcast], email: params[:email]).link_email.deliver
    respond_to do |format|
      format.js {}
    end
  end
end
