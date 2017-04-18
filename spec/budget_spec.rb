require("spec_helper")

describe(Budget) do
  it{should have_many(:users)}
  it{should have_many(:restaurants)}
end
