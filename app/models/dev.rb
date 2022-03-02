class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
       dev_freebies_array = self.freebies.pluck(:item_name).map{|free| free.downcase}
       dev_freebies_array.include?(item_name.downcase)
    end

    def give_away(dev, freebie)
        if self.id == freebie.dev_id
            Freebie.update(freebie.id, dev_id: dev.id)
        else
            "Not yours to give away!"
        end
    end
end
