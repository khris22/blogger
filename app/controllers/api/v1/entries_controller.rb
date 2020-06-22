class Api::V1::EntriesController < ApplicationController

    before_action :set_entry, only: [:show, :update, :destroy]


    def index
        # binding.pry
        if logged_in?
            entries = current_user.entries
            render json: EntrySerializer.new(entries)
        else
            render json: {
                error: "You must be logged in to see blog entries"
              }
        end
    end

    def show
        render json: @entry
    end

    def create
        # byebug
        @entry = current_user.entries.build(entry_params)
    
        if @entry.save
          render json:  EntrySerializer.new(@entry), status: :created
        else
          error_resp = {
            error: @entry.errors.full_messages.to_sentence
          }
          render json: error_resp, status: :unprocessable_entity
        end
    end

    def update
        # byebug
        if @entry.update(entry_params)
            render json:  EntrySerializer.new(@entry), status: :ok
          else
            error_resp = {
              error: @error.errors.full_messages.to_sentence
            }
            render json: error_resp, status: :unprocessable_entity
        end
    end

    def destroy
    end

    private

    def set_entry
        @entry = Entry.find(params[:id])
    end

    def entry_params
        params.require(:entry).permit(:title, :notes)
        # params.require(:entry).permit(:title, :notes, :user_id)
        # :user_id - when you want to pass it without using current_user.build
    end

end
