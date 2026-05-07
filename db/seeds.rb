
owner1 = Owner.create!(
  first_name: "Juan", last_name: "Perez",
  email: "juan@test.com", phone: "123", address: "Calle 1"
)

owner2 = Owner.create!(
  first_name: "Maria", last_name: "Lopez",
  email: "maria@test.com", phone: "456", address: "Calle 2"
)

owner3 = Owner.create!(
  first_name: "Pedro", last_name: "Gomez",
  email: "pedro@test.com", phone: "789", address: "Calle 3"
)

# Pets 
pet1 = owner1.pets.create!(
  name: "Firulais", species: "dog", breed: "Labrador",
  date_of_birth: "2020-01-01", weight: 25
)

pet2 = owner1.pets.create!(
  name: "Michi", species: "cat", breed: "Siames",
  date_of_birth: "2021-01-01", weight: 5
)

pet3 = owner2.pets.create!(
  name: "Bunny", species: "rabbit", breed: "Mini Lop",
  date_of_birth: "2022-01-01", weight: 2
)

pet4 = owner3.pets.create!(
  name: "Rocky", species: "dog", breed: "Bulldog",
  date_of_birth: "2019-01-01", weight: 20
)

pet5 = owner2.pets.create!(
  name: "Luna", species: "cat", breed: "Persa",
  date_of_birth: "2020-01-01", weight: 4
)

# Vets
vet1 = Vet.create!(
  first_name: "Ana", last_name: "Martinez",
  email: "ana@vet.com", phone: "111", specialization: "General"
)

vet2 = Vet.create!(
  first_name: "Luis", last_name: "Rojas",
  email: "luis@vet.com", phone: "222", specialization: "Surgery"
)

# Attach photos
pet1.photo.attach(
  io: File.open(Rails.root.join("db/seeds/pets/firulais.jpg")),
  filename: "firulais.jpg",
  content_type: "image/jpeg"
)

pet2.photo.attach(
  io: File.open(Rails.root.join("db/seeds/pets/michi.jpg")),
  filename: "michi.jpg",
  content_type: "image/jpeg"
)

pet3.photo.attach(
  io: File.open(Rails.root.join("db/seeds/pets/rocky.jpg")),
  filename: "rocky.jpg",
  content_type: "image/jpeg"
)

# Appointments
appt1 = Appointment.create!(pet: pet1, vet: vet1, date: Time.now, reason: "Checkup", status: :scheduled)
appt2 = Appointment.create!(pet: pet2, vet: vet1, date: Time.now, reason: "Vaccination", status: :completed)
appt3 = Appointment.create!(pet: pet3, vet: vet2, date: Time.now, reason: "Injury", status: :in_progress)
appt4 = Appointment.create!(pet: pet4, vet: vet2, date: Time.now, reason: "Surgery", status: :completed)
appt5 = Appointment.create!(pet: pet5, vet: vet1, date: Time.now, reason: "Skin issue", status: :cancelled)

# Treatments
Treatment.create!(appointment: appt2, name: "Vaccine", medication: "Rabies", dosage: "1 dose", notes: "OK", administered_at: Time.now)
Treatment.create!(appointment: appt3, name: "Pain Relief", medication: "Ibuprofen", dosage: "50mg", notes: "Monitor", administered_at: Time.now)
Treatment.create!(appointment: appt4, name: "Surgery", medication: "Anesthesia", dosage: "Standard", notes: "Done", administered_at: Time.now)
Treatment.create!(appointment: appt3, name: "Bandage", medication: "None", dosage: "-", notes: "Applied", administered_at: Time.now)
Treatment.create!(appointment: appt2, name: "Follow-up", medication: "None", dosage: "-", notes: "Check later", administered_at: Time.now)