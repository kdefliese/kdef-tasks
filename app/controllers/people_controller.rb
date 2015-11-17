class PeopleController < ApplicationController
  before_filter :last_page

  def index
    @people = Person.all
  end

  def show
    id = params[:id]
    @person = Person.find(id)
  end

  def showtasks
    id = params[:id]
    @person = Person.find(id)
    @tasks = Person.find(id).tasks
  end

  def new
    @person = Person.new
  end

  def create
    Person.create(person_params[:person])
    redirect_to "/people"
  end

  def edit
    id = params[:id]
    @person = Person.find(id)
  end

  def update
    id = params[:id]
    @person = Person.find(id)
    @person.update(
      name: person_params[:person][:name]
      )
    redirect_to "/people"
  end

  private

  def person_params
    params.permit(person:[:id, :name])
  end

  def last_page
    session[:last_page] = request.env['HTTP_REFERER']
  end
end
