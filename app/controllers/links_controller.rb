class LinksController < ApplicationController
  def show
    @link = Link.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @link = Link.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @link = @topic.links.build(link_params)
    @link.user = current_user

    authorize @link

    redirect_to [current_user, @topic] if @link.save
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    authorize @link

    @link.assign_attributes(link_params)

    redirect_to [@link.topic, @link] if @link.save
  end

  def destroy
    @link = Link.find(params[:id])

    authorize @link

    redirect_to [current_user, @link.topic] if @link.destroy
  end


  private

  def link_params
    params.require(:link).permit(:url)
  end
end
