class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      # ResetCaloriesJob.set(wait_until: Date.midnight).perform_later(@user)
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def add_food_item
    set_user
    if @user.remaining_calories >=  params[:food_item_calories]
      new_remaining_calories = @user.remaining_calories - params[:food_item_calories]
      if @user.update(remaining_calories: new_remaining_calories)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: @user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :daily_calories, :remaining_calories, :food_item_calories)
    end
end
