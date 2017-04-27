class CreateAdminUser < ActiveRecord::Migration[5.0]
  def up
    u = User.new
    u.email = 'admin@admin.com'
    u.password = '123123123'
    u.password_confirmation = '123123123'
    u.save!
  end
end
