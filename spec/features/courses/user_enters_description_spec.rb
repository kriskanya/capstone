# # As a user
# # When I enter a long description
# # Only 300 characters should be displayed in the view, with an ellipsis if it's longer
#
# feature "User enters a description" do
#   background do
#     @user = Fabricate(:user)
#     login_as @user
#   end
#
#   scenario "Happy path - The description is longer than 300 characters", :js => true do
#     @course = Fabricate(:course, user_id: @user.id, description: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?[33] At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repella end of the lorum ipsum")
#     visit '/'
#     expect(page).to have_content("Sed ut perspiciatis")
#     expect(page).to have_content("...")
#     expect(page).to have_content("(Expand)")
#     click_on "(Expand)"
#     expect(page).to have_content("end of the lorum ipsum")
#   end
#
#   scenario "Happy path - The description is shorter than 300 characters" do
#     @course = Fabricate(:course, user_id: @user.id, description: "Short description")
#   end
# end
