require 'spec_helper'


def generate_mission_test_param(leaving=(rand(3)+1).hours.from_now.utc.to_s, returning=(rand(3)+5).hours.from_now.utc.to_s)
	missions = ["Chow", "TrX", "Ammo", "RR"]
	units = ["Alpha", "Bravo", "Charlie", "Delta", "Golf", "HHC"]
	{
	 name: missions.sample,
	 unit_serviced: units.sample,
	 step_off_at: leaving,
	 return_at: returning
	}
end




describe Dispatch do

	describe 'DB attributes' do
		it 'DB has a #truck_id attribute' do

		end

		it 'DB has a #mission_id attribute' do

		end

		it 'DB has an #out_wire attribute' do

		end

		it 'DB has a #safe_return attribute' do

		end

		it 'DB has a #miles_at_return attribute' do

		end

		it 'DB has a #miles_at_dispatch attribute' do

		end

		it 'DB has a #gallons_used attribute' do

		end

		it 'DB has an #oil_used attribute' do

		end
	end


	describe 'validation #truck_not_double_booked' do
		it 'saves when given good params' do

		end

		it 'doesnt save when given bad params' do

		end
	end







end
