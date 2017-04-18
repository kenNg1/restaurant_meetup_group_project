require("spec_helper")

describe(Cuisine) do
  it{should have_many(:users)}
  it{should have_many(:restaurants)}
end
