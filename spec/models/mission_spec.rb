require 'spec_helper'


# These are failing, error is "Can't cast Enumerator to string"

describe Mission do

	missions = ["Chow", "TrX", "Ammo", "RR"]
	units = ["Alpha", "Bravo", "Charlie", "Delta", "Golf", "HHC"]

	it 'should save/return the name(ie type) of the mission' do
		param={name: missions.sample,
						unit_serviced: units.sample,
						step_off_at: (rand(3)+1).hours.from_now,
						return_at: (rand(3)+5).hours.from_now }

  	Mission.create(param)

  	m = Mission.find_by(step_off_at: param[:step_off_at])

  	expect(m.name).to eq(param[:name])
	end

	it 'should save/return the name of the unit the mission is for' do
		param={name: missions.sample,
						unit_serviced: units.sample,
						step_off_at: (rand(3)+1).hours.from_now,
						return_at: (rand(3)+5).hours.from_now }

  	Mission.create(param)

  	m = Mission.find_by(step_off_at: param[:step_off_at])

  	expect(m.unit_serviced).to eq(param[:unit_serviced])
	end

	it 'should save/return the planned start time of the mission' do
		param={name: missions.sample,
						unit_serviced: units.sample,
						step_off_at: (rand(3)+1).hours.from_now,
						return_at: (rand(3)+5).hours.from_now }

  	Mission.create(param)

  	m = Mission.find_by(return_at: param[:return_at])

  	expect(m.step_off_at).to eq(param[:step_off_at])
	end

	it 'should save/return the planned return time of the mission' do
		going = (rand(3)+1).hours.from_now
		coming = (rand(3)+5).hours.from_now

		param={ "mission" => {name: missions.sample,
											unit_serviced: units.sample,
											step_off_time: going.strftime("%H:%M"),
											step_off_date: going.strftime("%Y-%m-%d"),
											return_date: coming.strftime("%Y-%m-%d"),
											return_time: coming.strftime("%H:%M")}}

  	Mission.create_new(param)

  	m = Mission.find_by(step_off_at: param["mission"][:step_off_at])

  	expect(m.return_at).to eq(param["mission"][:return_at])
	end

	it "should default #initiated to 'false' when instantiated" do
		param={name: missions.sample,
						unit_serviced: units.sample,
						step_off_at: (rand(3)+1).hours.from_now,
						return_at: (rand(3)+5).hours.from_now }

		Mission.create(param)

		m = Mission.find_by(step_off_at: param[:step_off_at])

		expect(m.initiated).to eq(false)
	end

	it "should default #completed to 'false' when instantiated" do
		param={name: missions.sample,
						unit_serviced: units.sample,
						step_off_at: (rand(3)+1).hours.from_now,
						return_at: (rand(3)+5).hours.from_now }

		Mission.create(param)

		m = Mission.find_by(step_off_at: param[:step_off_at])

		expect(m.completed).to eq(false)
	end

end
