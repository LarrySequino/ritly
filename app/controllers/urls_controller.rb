class UrlsController < ApplicationController

    def index
        @url = Url.new
    end

    def create
        if @url = Url.create(url_params)
            redirect_to "/#{@url.hash_code}/preview"
        else
            render :new
        end
    end

    def redirectors
        hash = params[:code]
        url = Url.find_by hash_code: hash
        
        redirect_to url.link
    end

    def preview
        hash = params[:code]
        
        @url = Url.find_by hash_code: hash

        @embed = Embedder.parse(@url.link)
    end
end

    def new
        @url = Url.new
    end



    private

    def url_params
        params.require(:url).permit(
            :link)
    end