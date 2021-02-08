class ContextsController < ApplicationController
    before_action :authenticate_user!

  def index
    @contexts = Context.all.search(params[:search])
  end

  def show
    @context = Context.find(params[:id])
  end

  def new
    @context = Context.new
  end

  def create
    @context = current_user.context.new(context_params)
    if @context.save
      redirect_to contexts_path, alert: "登録しました。"
    else
      redirect_to new_context_path, alert: "登録できませんでした。"
    end
  end

  def edit
    @context = Context.find(params[:id])
  end

  def update
    @context = current_user.context.find(params[:id])
    if @context.update(context_params)
      redirect_to contexts_path, alert: "編集しました。"
    else
      redirect_to edit_context_path, alert: "編集ができませんでした。"
    end
  end

  def destroy
    @context = Context.find(params[:id])
    if @context.destroy
      redirect_to contexts_path
    else
      redirect_to contexts_path
    end
  end

  def category
    @contexts = Context.select(:category).distinct
    @categorys = Context.all.category(params[:category])
  end
  
  private
  def context_params
    params.permit(:body, :context_img, :category)
  end
end
