class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

   # You put the message-splitting and business
   # magic here.
    @user = User.find_by_email(params[:sender])

    # What happens to confirmation here?
    if @user.nil?
      @user = User.create!(email: params[:sender], password: "guest1234")
    end

    @topic = @user.topics.find_or_create_by(title: params[:subject])

    link_url_string = params["body-plain"]

    @topic.links.create!(url: link_url_string)

   # Assuming all went well.
   head 200
  end
end
