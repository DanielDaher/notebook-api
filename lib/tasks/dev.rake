namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando tipos de contatos..."

    kinds = %w(Amigo Comercial Conhecido) # são três tipos: Amigo, Comercial e Conhecido

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos Contato cadastrados com sucesso!"

    puts "Cadastrando os contatos..."

    contacts = [] # Store the created contacts

    10.times do |i|
      contact = Contact.new( # Use Contact.new to create the object in memory
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 35.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
      contact.save! # Save the contact to the database
      puts "Contact ID: #{contact.id}"
      contacts << contact # Add the saved contact to the array
    end

    puts "Number of Contacts after creation: #{Contact.count}" # Check count

    puts "Contatos cadastrados com sucesso!"

    puts "Cadastrando telefones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(
          contact_id: contact.id,
          number: Faker::PhoneNumber.cell_phone
        )
        contact.phones << phone
        contact.save!
      end
    end

    puts "Telefones cadastrados com sucesso"

  end
end
