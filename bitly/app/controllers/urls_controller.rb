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
            redirect_to urls_path
        end
    end

    def go
        @url = Url.find_by_shortcode(params[:shortcode])
        redirect_to (if @url then @url.target else not_found_path end)
    end

    private

    def url_params
        params.require(:url).permit(:target)
    end
end
