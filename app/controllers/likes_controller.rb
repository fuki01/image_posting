class LikesController < ApplicationController
    def show
        likes = Likes.where(user_id: current_user.id).order(created_at: :desc).pluck(:context_id)
        @likes = Context.find(likes)
    end
    def create
        @context = Context.find(params[:context_id])
        if @context.user_id != current_user.id
          @like = Like.create(user_id: current_user.id, context_id: @context.id)
        end
      end
    def destroy
        @context = Context.find(params[:context_id])
        @like = Like.find_by(user_id: current_user.id, context_id: @context.id)
        @like.destroy
    end
end
