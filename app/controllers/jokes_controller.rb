# frozen_string_literal: true

class JokesController < ApplicationController
  def show
    Joke::Find.call(repository: Joke::Repository, seed: seed, position: position)
      .on_success { |result| render('jokes/show', locals: { joke: result[:joke] }) }
      .on_failure(:no_joke) { render('jokes/standby') }
  end

  private

  def seed = permitted_params[:seed]

  def position = permitted_params[:position]

  def permitted_params
    params.permit(:position).with_defaults(seed: session_seed)
  end

  def session_seed
    session[:seed] ||= SecureRandom.random_number
  end
end
