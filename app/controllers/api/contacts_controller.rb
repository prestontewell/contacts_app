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
    if @contact.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprcessible_entity
    end
  end

  def update
    contact_id = params[:id]
    @contact = Contact.find_by(id:contact_id)
    @contact.update(
      first_name: params[:first_name] || @contact.first_name,
      middle_name: params[:middle_name] || @contact.middle_name,
      last_name: params[:last_name] || @contact.last_name,
      email: params[:email] || @contact.email,
      phone_number: params[:phone_number] || @contact.phone_number
      )
    @contact.save
    render 'show.json.jbuilder'
  end

  def destroy
    contact_id = params[:id]
    @contact = Contact.find_by(id:contact_id)
    @contact.destroy
    render 'destroy.json.jbuilder'
  end

end
