# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def full_detail
    @person = Person.find(params[:id])

    render turbo_stream: turbo_stream.replace(
      'person_details',
      partial: 'people/detail',
      locals: { person: @person }
    )
  end

  private

  def person_params
    params.require(:person).permit(:name, :age, :email)
  end
end
