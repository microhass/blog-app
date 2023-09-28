class ApplicationController < ActionController::Base
#     Create a method called current_user in your ApplicationController to make current user data available to all controllers.
# It will return the first user from the database.
# Don't worry about proper authentication at this time. You will add it in the upcoming projects.
# Create forms to perform the following functions:
# Creates a Post on behalf of the current_user (use the method that you created in your ApplicationController).
# Create a comment on behalf of the current_user (use the method that you created in your ApplicationController).
# Allow Users to add likes to Posts.

    def current_user
        User.first
    end

    helper_method :current_user
end
