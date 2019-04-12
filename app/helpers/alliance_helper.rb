module AllianceHelper
    # info page helper to determine user name for jumbotron
    def user_name
        if user_signed_in?
            current_user.name
        else
            "użytkowniku"
        end
    end

end
