class ProfilesController < ApplicationController

    def new
        @profile=Profile.new
    end

    def create
        @profile=Profile.new(profile_params)

        if @profile.save
            #awesome stuff
        else
            flash[:alert]='Profile not saved. Try again.'
            render new
        end
    end

    def show
        @profile=Profile.find(profile_params[:id])
    end

    def edit
        @profile=Profile.find(profile_params[:id])
    end

    def update
        @profile=Profile.find(profile_params[:id])

        if @profile.update(profile_params)
            #awesome stuff
        else
            flash[:alert]="Program was not able to update."
            render edit
        end
    end



    private

    def profile_params
        params.require(:profile).permit(:user_id,:full_name,:city,:age,:school,:favorite_dessert,:profile_picture_link)
    end



end
