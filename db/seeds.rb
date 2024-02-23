# frozen_string_literal: true

person_data = JSON.parse(File.read('db/seeds/data.json'))

person_data.each do |person|
  email = person.dig('info', 'email')
  p = Person.find_or_create_by(email:)
  data = {
    title: person.dig('info', 'title'),
    name: person['name'],
    phone: person.dig('info', 'phone'),
    age: person.dig('info', 'age'),
    person_id: p.id
  }
  Detail.find_or_create_by(data)
end
