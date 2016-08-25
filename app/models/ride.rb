class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  # write associations here

  def take_ride

    if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
      new_tickets=self.user.tickets -= self.attraction.tickets
      new_nausea=self.user.nausea += self.attraction.nausea_rating
      new_happiness=self.user.happiness += self.attraction.happiness_rating
      self.user.update(tickets:new_tickets, nausea: new_nausea, happiness:new_happiness)
    else
      if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
        "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      elsif self.user.tickets < self.attraction.tickets
        "Sorry. You do not have enough tickets the #{self.attraction.name}."
      elsif self.user.height < self.attraction.min_height
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      end
    end
  end
end
