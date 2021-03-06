class ContextsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :category]

  def index
    @contexts = Context.all.order(created_at: "DESC").search(params[:search]).page(params[:page]).per(5)
  end

  def show
    @context = Context.find(params[:id])
    @comments = @context.comments
    @comment = current_user.comments.new unless current_user.nil?
  end

  def new
    @context = Context.new
  end

  def create
    @context = current_user.context.new(context_params)
    if @context.save
      redirect_to root_path, alert: "登録しました。"
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
      redirect_to root_path, alert: "編集しました。"
    else
      redirect_to edit_context_path, alert: "編集ができませんでした。"
    end
  end

  def destroy
    @context = Context.find(params[:id])
    if @context.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def category
    @contexts = Context.select(:category).distinct.page(params[:page]).per(50)
    @categorys = Context.all.category(params[:category])
  end

  def follow
    @contexts = Context.where(user_id: [*current_user.following_ids]).page(params[:page]).per(5)
  end
  
  private
  def context_params
    params.permit(:body, :context_img, :category)
  end
end
