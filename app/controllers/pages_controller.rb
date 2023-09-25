# frozen_string_literal: true
class PagesController < ApplicationController
  def index
    @characters = Character.all
  end
end
