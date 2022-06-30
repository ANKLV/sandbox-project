# frozen_string_literal: true

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role, :first_name, :last_name
  #
  # or
  #
  actions :all
  preserve_default_filters!
  remove_filter :reset_password_token, :reset_password_sent_at, :remember_created_at

  index do
    selectable_column
    column :id
    column :email
    column :role
    column :first_name
    column :last_name
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :role
      row :first_name
      row :last_name
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :encrypted_password, label: "Password"
      f.input :role
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end

  permit_params do
    permitted = %i[email encrypted_password role first_name last_name]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
