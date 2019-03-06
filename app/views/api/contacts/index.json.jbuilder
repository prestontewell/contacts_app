json.array! @contacts.each do |contact|
  json.partial! "contact.json.jbuilder", inside_contact: contact
end