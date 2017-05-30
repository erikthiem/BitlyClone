class UrlsController < ApplicationController

    before_action :authenticate_user!, :except => [:go]

    def index
        @urls = current_user.urls.reverse
    end

    def new
        @url = Url.new :target => "http://"
    end

    def create
        @url = Url.new url_params
        @url.user_id = current_user.id
        if @url.save
            redirect_to "/"
        else
            render :new
        end
    end

    def go

        @url = Url.find_by_shortcode(params[:shortcode])
        if @url
            @url.incrementClicks
            redirect_to @url.target
        else
            redirect_to not_found_path
        end
    end

    private

    def url_params
        params.require(:url).permit(:target, :user_id)
    end
end
