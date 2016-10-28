class MembershipsController < ApplicationController
  def create
    @user = User.find_by(session[:id])
    @room = Room.find_by(params[:id])
    @membership = Membership.new({user_id: @user.id, room_id: @room.id})

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @user, notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end
end
