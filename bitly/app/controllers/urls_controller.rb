class UrlsController < ApplicationController
    def index
        @urls = Url.all.reverse
    end

    def new
        @url = Url.new
    end

    def create
        @url = Url.new url_params
        if @url.save
            redirect_to "/"
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
        params.require(:url).permit(:target)
    end
end
