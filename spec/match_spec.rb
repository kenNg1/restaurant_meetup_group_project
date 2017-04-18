require("spec_helper")

describe(Match) do
  it{should belong_to(:restaurant)}
  it{should belong_to(:user1)}
  it{should belong_to(:user2)}
end
