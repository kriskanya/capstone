require 'rails_helper'

RSpec.describe Course, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :url }
  it { should validate_presence_of :description }
  it { should validate_presence_of :level }
  it { should validate_presence_of :date }
  it { should validate_presence_of :instructor }
  it { should validate_presence_of :institution }

end
