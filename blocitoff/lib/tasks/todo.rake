namespace :todo do
  desc "deletes items that hit 7 day expiration"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
