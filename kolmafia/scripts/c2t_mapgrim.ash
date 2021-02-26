//c2t mapgrim
//c2t

//evenly acquires distention pills and dog hair pills using maps to grimace prime


void main() {
	item it = $item[Map to Safety Shelter Grimace Prime];
	while (my_adventures() > 1 && available_amount(it) > 0) {
		if (have_effect($effect[Transpondent]) == 0 && available_amount($item[transporter transponder]) > 0)
			use(1,$item[transporter transponder]);
		if (have_effect($effect[Transpondent]) == 0)
			abort(`Unable to get the Transpondent effect. Still have {available_amount(it)} {available_amount(it) != 1?it.plural:it}.`);

		if (get_property('choiceAdventure536').to_int() == 1 && available_amount($item[synthetic dog hair pill]) <= available_amount($item[distention pill]))
			set_property('choiceAdventure536','2');
		else if (get_property('choiceAdventure536').to_int() == 2 && available_amount($item[synthetic dog hair pill]) > available_amount($item[distention pill]))
			set_property('choiceAdventure536','1');

		use(1,it);
	}
	if (available_amount(it) == 0)
		print(`Finished using all {it.plural}.`,'blue');
	else if (my_adventures() <= 1)
		print(`Ran out of adventures to use {it.plural}. {available_amount(it)} remain.`,"blue");
	else //aborting to make sure failure is least acknowledged before end-of-day stuff is run
		abort(`Something broke using {it.plural}.`);
}

