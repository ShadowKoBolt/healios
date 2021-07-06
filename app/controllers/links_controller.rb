# frozen_string_literal: true

# Controller for handling user link CRUD
class LinksController < ApplicationController
  before_action :authenticate_user!, except: :visit
  before_action :set_link, only: %i[show edit update destroy]

  def visit
    @link = Link.find_by_short!(params[:id])
    @link.visit_count += 1
    @link.save!
    redirect_to @link.long
  end

  def show; end

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def edit; end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    @link.destroy
    redirect_to links_url
  end

  private

  def set_link
    @link = current_user.links.find_by_id!(params[:id])
  end

  def link_params
    params.require(:link).permit(:long)
  end
end
