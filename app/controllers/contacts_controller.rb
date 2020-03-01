# frozen_string_literal: true


  class ContactsController < ApplicationController
    def index
      contacts = Contact.order('created_at DESC')
      render json: { status: 'SUCCESS', message: 'Loaded Contacts', data: contacts }, status: :ok
    end

    def show 
        contact = Contact.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded Contact', data: contact }, status: :ok
    end

    def create 
        contact = Contact.new(contact_params)

        if contact.save
            render json: { status: 'SUCCESS', message: 'Saved Contact', data: contact }, status: :ok
        else 
            render json: { status: 'ERROR', message: 'Contact not saved', data: contact.errors }, status: :unprocessable_entry
        end
    end

    def destroy 
        contact = Contact.find(params[:id])
        contact.destroy
        render json: { status: 'SUCCESS', message: 'Contact deleted', data: contact }, status: :ok
    end


    private 
    def contact_params 
        params.permit(:FirstName, :LastName, :PhoneNumber, :email)
    end
  end

