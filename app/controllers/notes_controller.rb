# frozen_string_literal: true

# Notes controller
class NotesController < ApplicationController
  before_action :fetch_note, only: %i[show edit update destroy]

  def index
    @note = Note.new
    @notes = Note.order(created_at: :desc).all
    if params[:note]
      search_by = params[:note][:search]
      by_title = @notes.search_by_title(search_by)
      by_tag = @notes.search_by_tag(search_by)
      @notes = by_title.empty? ? by_tag : by_title
    end
  end

  def create
    note = tag_format note_params
    note[:tags] = params[:note][:tags].split(',')
    note = Note.create(note)
    if note.save
      flash[:success] = 'Note created Successfully.'
    else
      flash[:danger] = 'Failed to create Note.'
    end
    redirect_to note_path(note)
  end

  def show; end

  def edit; end

  def update
    note = tag_format note_params
    note = @note.update_attributes(note)
    if note
      flash[:success] = 'Note updated Successfully.'
    else
      flash[:danger] = 'Failed to update Note.'
    end
    redirect_to note_path(@note)
  end

  def destroy
    @note.destroy
    flash[:danger] = 'Note Deleted Successfuly'
    redirect_to root_path
  end

  def note_params
    params.require(:note).permit(:title, :body, :tags)
  end

  def fetch_note
    @note = Note.find(params[:id])
  end

  def tag_format(prms)
    prms[:tags] = params[:note][:tags].split(' ')
    prms
  end

  private :fetch_note, :note_params, :tag_format
end
