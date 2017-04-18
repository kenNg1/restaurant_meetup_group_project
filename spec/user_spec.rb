require("spec_helper")

describe(User) do
  it{should belong_to(:cuisine)}
  it{should belong_to(:district)}
  it{should belong_to(:budget)}
end
