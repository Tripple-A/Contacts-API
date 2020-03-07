# frozen_string_literal: true

module Api

  class ContactsController < ApplicationController
    def index
      @contacts = Contact.order(:FirstName)
      render json: { status: 'SUCCESS', message: 'Loaded Contacts', data: @contacts }, status: :ok
    end

    def create
      contact = Contact.new(contact_params)

      if contact.save
        render json: { status: 'SUCCESS', message: 'Saved Contact', data: contact }, status: :ok
      else
        render json: { status: 'ERROR', message: 'Contact not saved', data: contact.errors }, status: :unprocessable_entry
      end
    end

    def show
      contact = Contact.find(params[:id])
      render json: { status: 'SUCCESS', message: 'Loaded Contact', data: contact }, status: :ok
    end

    def update
      contact = Contact.find(params[:id])

      if contact.update_attributes(contact_params)
        render json: { status: 'SUCCESS', message: 'Updated Contact', data: contact }, status: :ok
      else
        render json: { status: 'ERROR', message: 'Contact not updated', data: contact.errors }, status: :unprocessable_entry
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
end
