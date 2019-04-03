categories = Category.create!([{ name: 'Terapeuter' }, { name: 'Lov og orden' }, { name: 'Utdanning' }, { name: 'Trening' }, { name: 'Økonomi' }])

TutorsCategory.create!([
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