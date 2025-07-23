class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]

  def index
    # TODO: show all for authenticated users.
    @entries = Entry.published.order(published_at: :desc)
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry, notice: "Entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: "Entry was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy!
    redirect_to entries_path, notice: "Entry was successfully destroyed.", status: :see_other
  end

  private
    def set_entry
      @entry = Entry.published.find(params.expect(:id))
    end

    def entry_params
      params.expect(entry: [ :title, :draft, :published_at, :body_markdown, :body_html ])
    end
end
