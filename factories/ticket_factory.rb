Factories.define :ticket do |ticket|
  ticket.title "A ticket"
  ticket.description "A ticket, nothing more"
  ticket.user { |u| u.association(:user) }
  ticket.project { |p| p.associaton(:project) }
end