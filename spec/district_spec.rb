require("spec_helper")

describe(District) do
  it{should have_many(:users)}
  it{should have_many(:restaurants)}
end
