require 'spec_helper'


def generate_test_param(leaving=(rand(3)+1).hours.from_now.utc.to_s, returning=(rand(3)+5).hours.from_now.utc.to_s)
	missions = ["Chow", "TrX", "Ammo", "RR"]
	units = ["Alpha", "Bravo", "Charlie", "Delta", "Golf", "HHC"]
	{
	 name: missions.sample,
	 unit_serviced: units.sample,
	 step_off_at: leaving,
	 return_at: returning
	}
end

def create_mission_and_return_object_from_db(param)
  	Mission.create(param)
  	Mission.find_by(step_off_at: param[:step_off_at])
end



describe Mission do

	describe 'DB attributes' do

		it 'DB has a #name attribute' do
			param= generate_test_param
			m= create_mission_and_return_object_from_db(param)
	  	expect(m.name).to eq(param[:name])
		end

		it 'DB has a #unit_serviced attribute' do
			param= generate_test_param
			m= create_mission_and_return_object_from_db(param)
	  	expect(m.unit_serviced).to eq(param[:unit_serviced])
		end

		it 'DB has a #step_off_at attribute' do
			param= generate_test_param
			m= create_mission_and_return_object_from_db(param)
	  	expect(m.step_off_at).to eq(param[:step_off_at])
		end

		it 'DB has a #return_at attribute' do
			param= generate_test_param
			m= create_mission_and_return_object_from_db(param)
	  	expect(m.return_at).to eq(param[:return_at])
		end

		it "DB has a #initiated attribute which defaults false" do
			param= generate_test_param
			m= create_mission_and_return_object_from_db(param)
			expect(m.initiated).to eq(false)
		end

		it "DB has a #completed attribute which defaults false" do
			param= generate_test_param
			m= create_mission_and_return_object_from_db(param)
			expect(m.completed).to eq(false)
		end
	end



	describe 'custom validation' do

		it "#no_time_travel validation passes when leaving is before returning" do
			param= generate_test_param(1.hour.from_now, 3.hours.from_now)
			m= Mission.new(param)
			expect(m.save).to eq(true)
		end

		it "#no_time_travel validation fails when leaving is after returning" do
			param= generate_test_param(3.hour.from_now, 1.hours.from_now)
			m= Mission.new(param)
			expect(m.save).to eq(false)
		end

	end



	# describe '' do

	# end




end
