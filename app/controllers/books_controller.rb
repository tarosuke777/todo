class BooksController < ApplicationController
    protect_from_forgery except: [:destroy]
    before_action :set_book, only: [:show, :destory]
    around_action :action_logger, only:[:destroy]
    #before_action do
    #    redirect_to access_denied_path if params[:token].blank?
    #end

    def show
            # pattern1
            #render :show
            # pattern2
        respond_to do |format|
            #format.html {render :show}
            #format.json { render json: @book }
            format.html
            format.json
        end
    end

    def destroy
        @book.destroy
        respond_to do |format|
            format.html {redirect_to "/"}
            format.json {head :no_content}
        end
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def action_logger
        logger.info "around-before"
        yield
        logger.info "around-after"
    end
end
