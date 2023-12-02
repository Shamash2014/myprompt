class Api::V1::PromptsController < ApplicationController
  def index
    @propmpts = Prompt.search(params[:q])
    render json: @propmpts
  end
end
