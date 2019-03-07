class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'index.json.jbuilder'
  end

  def show
    contact_id = params[:id]
    @contact = Contact.find_by(id:contact_id)
    render 'show.json.jbuilder'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name], 
      middle_name: params[:middle_name], 
      last_name: params[:last_name],
      email: params[:email], 
      phone_number: params[:phone_number]
      )
    @contact.save
    render 'show.json.jbuilder'
  end

  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id:contact_id)
    @contact.update(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
      )
    render 'show.json.jbuilder'
  end

end
