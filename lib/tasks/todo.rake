namespace :todo do
  desc "deletes items that hit 7 day expiration"
  task delete_items: :environment do
    Item.delete_expired
  end

end
