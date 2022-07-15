# frozen_string_literal: true

class JokesController < ApplicationController
  def show
    Joke::Find.call(repository: Joke::Repository.new, position: postion, seed: seed)
      .on_success { |result| render('jokes/show', locals: { joke: result[:joke] }) }
      .on_failure(:not_available) { render('jokes/not_available') }
  end

  private

  def position = permitted_params[:position]

  def seed = permitted_params[:seed]

  def permitted_params
    params.permit(:position).merge({ seed: session_seed })
  end

  def session_seed
    session[:seed] ||= SecurityRandom.random_number
  end
end
