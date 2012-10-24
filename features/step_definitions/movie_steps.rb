# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    new_movie = Movie.create(movie)
  end
#  flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  flunk "Unimplemented"
end

Then /I should see movies titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    if page.respond_to? :should
      page.should have_content(title)
    else
      assert page.has_content?(title)
    end
  end
end

Then /I should not see movies titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    if page.respond_to? :should
      page.should have_no_content(title)
    else
      assert page.has_no_content?(title)
    end
  end
end


# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(', ').each do |rating|
    box = find("#ratings_#{rating}")
    if uncheck
      box.set(false)
    else
      box.set(true)
    end
  end
end

When /^I click the "([^"]+)" button/ do |element|
  page.find("##{element}").click
end
