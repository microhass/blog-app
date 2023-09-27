class UpdateImageLinks < ActiveRecord::Migration[7.0]
  def change
    User.all.each do |user|
      user.update_attribute :photo, "https://source.unsplash.com/random/200x200?user=#{user.id}"
    end
  end
end
