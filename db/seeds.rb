10.times do 
    Contact.create({
        FirstName: Faker::Name.first_name,
        LastName: Faker::Name.last_name,
        PhoneNumber: Faker::Number.number(digits:5),
        email: Faker::Internet.unique.email
    })
end