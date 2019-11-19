module PicturesHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "confirm" || action_name == "create"
      confirm_pictures_path
    elsif action_name == "edit"
      confirm_picture_path
    end
  end

  def confirm_new_or_edit
    unless @picture.id?
      pictures_path
    else
      picture_path
    end

  end

  def confirm_form_method
    @picture.id ? 'patch' : 'post'
    # if @blog.id.nil?
    #   puts "oooooooooooooooooooo"
    #   "patch"
    # else
    #   puts "nnnnnnnnnnnnnnnnn"
    #   "post"
    # end
  end
end
module PicturesHelper
end
