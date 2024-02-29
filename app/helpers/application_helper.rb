module ApplicationHelper
    def path_for_competition(competition)
        if admin_signed_in?
            admin_competition_path(competition)
        elsif user_signed_in?
            user_competition_path(competition)
        elsif driver_signed_in?
            driver_competition_path(competition)
        else
            root_path
        end
    end
end
