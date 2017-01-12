require 'rails_helper'

# use shoulda-matchers gem to test associations and  validations

RSpec.describe Song, type: :model do
  describe 'associations' do
    # it { should belong_to(:album) } if we had an album model
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    # song = Song.new(name: nil)
    # expect(song.valid?.to be_false
  end

  # test my class methods & instance methods down here
  # describe '.my_class_method' do ... end
  # describe '#my_instance_method' do ... end
end
