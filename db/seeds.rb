categories = Category.create!([{ name: 'Hjem og familie' }, { name: 'Ernæring 2' }, { name: 'Helse 1' }, { name: 'Terapeuter' }, { name: 'Lov og orden' }, { name: 'Utdanning' }, { name: 'Trening' }, { name: 'Økonomi' }])
sub_categories1 = SubCategory.create!([{ name: 'Skole helsestasjon', category_id: 1 }, { name: 'Ppt', category_id: 1 }, { name: 'Barnevem', category_id: 1 }, { name: 'Abup-bup', category_id: 1 }, { name: 'Dps-psykolog', category_id: 1 }, { name: 'Lærer', category_id: 1 }, { name: 'Førskolelærer', category_id: 1 }, { name: 'Spes ped', category_id: 1 }, { name: 'Familieterapeut', category_id: 1 }, { name: 'Ruskonsulent', category_id: 1 }, { name: 'Sosionom', category_id: 1 }, { name: 'Vernepleier', category_id: 1 }])
sub_categories2 = SubCategory.create!([{ name: 'Mat', category_id: 2 }, { name: 'Kokk', category_id: 2 }, { name: 'Ernæringsterapeut', category_id: 2 }, { name: 'Ernæringsterapi', category_id: 2 }, { name: 'Vekt og vektreduksjon', category_id: 2 }, { name: 'Helsekost', category_id: 2 }, { name: 'Kostveileder', category_id: 2 }, { name: 'Urterphytoterapi', category_id: 2 }])
sub_categories3 = SubCategory.create!([{ name: 'Lege', category_id: 3 }, { name: 'Treningssenter', category_id: 3 }, { name: 'Pt', category_id: 3 }, { name: 'Tannlege', category_id: 3 }, { name: 'Helsesøster', category_id: 3 }, { name: 'Sykepleier', category_id: 3 }, { name: 'Psykolog', category_id: 3 }, { name: 'Fysioterapi', category_id: 3 }, { name: 'Sexolog', category_id: 3 }, { name: 'Akupunktur', category_id: 3 }, { name: 'Ruskonsulent', category_id: 3 }, { name: 'Sosionom', category_id: 3}])

tutors = Tutor.create!([{first_name: 'Jonas', last_name: 'Preisler', email: 'jonas.preisler@gmail.com', password: 'testtest', password_confirmation: 'testtest', admin: true, job_title: 'CEO'}])
account = Account.create!([{first_name: 'Jonas', last_name: 'Preisler', email: 'account@gmail.com', password: 'testtest', password_confirmation: 'testtest'}])

active_hours = ActiveHour.create!([{tutor_id: 1, start: '2019-03-29 01:00:00 UTC', end: '2019-03-29 05:00:00 UTC'}, {tutor_id: 1, start: '2019-03-30 13:00:00 UTC', end: '2019-03-30 14:30:00 UTC'}, {tutor_id: 1, start: '2019-03-30 16:00:00 UTC', end: '2019-03-30 18:00:00 UTC'}])

Tutor.create!([{first_name: 'Bjørn', last_name: 'Karlsen', email: 'bjørn@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'CEO'},
							 {first_name: 'Jan', last_name: 'Eriksen', email: 'jan@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'Mindfullness coach'},
							 {first_name: 'Olav', last_name: 'Pettersen', email: 'olav@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'CEO'},
							 {first_name: 'Per', last_name: 'Andersen', email: 'per@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'CEO'},
							 {first_name: 'Leif', last_name: 'Olsen', email: 'leif@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'CEO'},
							 {first_name: 'Tore', last_name: 'Nilsen', email: 'tore@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'Terapeut'},
							 {first_name: 'Tuva', last_name: 'Hansen', email: 'tuva@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'CEO'}, 
							 {first_name: 'Marie', last_name: 'Karlsen', email: 'maria@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'Celebrity'},
							 {first_name: 'Victoria', last_name: 'Eriksen', email: 'victoria@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'CEO'},
							 {first_name: 'Sofia', last_name: 'Pettersen', email: 'sofia@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'Boss'},
							 {first_name: 'Olivia', last_name: 'Andersen', email: 'olivia@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'CEO'},
							 {first_name: 'Ella', last_name: 'Olsen', email: 'ella@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'Rådgiver'},
							 {first_name: 'Emma', last_name: 'Nilsen', email: 'emma@gmail.com', password: 'testtest', password_confirmation: 'testtest', job_title: 'CEO'},
							 ])

TutorsCategory.create!([{tutor_id: 1, category_id: 1, sub_category_id: 3 },
													{tutor_id: 2, category_id: 1, sub_category_id: 1 },
													{tutor_id: 3, category_id: 1, sub_category_id: 2 },
													{tutor_id: 4, category_id: 2, sub_category_id: 3 },
													{tutor_id: 5, category_id: 3, sub_category_id: 4 },
													{tutor_id: 6, category_id: 4, sub_category_id: 5 },
													{tutor_id: 7, category_id: 5, sub_category_id: 6 },
													{tutor_id: 8, category_id: 4, sub_category_id: 7 },
													{tutor_id: 9, category_id: 3, sub_category_id: 8 },
													{tutor_id: 10, category_id: 2, sub_category_id: 9 },
													{tutor_id: 11, category_id: 1, sub_category_id: 10 },
													{tutor_id: 12, category_id: 2, sub_category_id: 9 },
													{tutor_id: 13, category_id: 3, sub_category_id: 8 },
													{tutor_id: 14, category_id: 3, sub_category_id: 7 },
													{tutor_id: 11, category_id: 3, sub_category_id: 6 },
													{tutor_id: 6, category_id: 4, sub_category_id: 5 },
													{tutor_id: 7, category_id: 8, sub_category_id: 4 }
												])

#sub_categories4 = SubCategory.create([{ name: '', category_id: 4 }, { name: '', category_id: 4 }, { name: '', category_id: 4 }, { name: '', category_id: 4 }, { name: '', category_id: 4 }, { name: '', category_id: 4 }, { name: '', category_id: 4 }, { name: '', category_id: 4 }])
#sub_categories5 = SubCategory.create([{ name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }, { name: '', category_id: 5 }])
#sub_categories6 = SubCategory.create([{ name: '', category_id: 6 }, { name: '', category_id: 6 }, { name: '', category_id: 6 }, { name: '', category_id: 6 }, { name: '', category_id: 6 }])
#sub_categories7 = SubCategory.create([{ name: '', category_id: 7 }, { name: '', category_id: 7 }, { name: '', category_id: 7 }, { name: '', category_id: 7 }, { name: '', category_id: 7 }])
#sub_categories8 = SubCategory.create([{ name: '', category_id: 8 }, { name: '', category_id: 8 }, { name: '', category_id: 8 }])
#sub_categories9 = SubCategory.create([{ name: '', category_id: 9 }, { name: '', category_id: 9 }, { name: '', category_id: 9 }, { name: '', category_id: 9 }, { name: '', category_id: 9 }, { name: '', category_id: 9 }, { name: '', category_id: 9 }])
#sub_categories10 = SubCategory.create([{ name: '', category_id: 10 }, { name: '', category_id: 10 }, { name: '', category_id: 10 }, { name: '', category_id: 10 }])
#sub_categories11 = SubCategory.create([{ name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }, { name: '', category_id: 11 }])
#sub_categories12 = SubCategory.create([{ name: '', category_id: 12 }, { name: '', category_id: 12 }, { name: '', category_id: 12 }])

#admins = Tutor.create!([{first_name: 'Jones', last_name: 'Presley', email: 'jonas.preisler@gmail.com', password: 'testtest', password_confirmation: 'testtest', admin: true}, {first_name: 'Roy', last_name: 'Soraa', email: 'roysacer@live.no', password: 'testtest', password_confirmation: 'testtest', admin: true}])