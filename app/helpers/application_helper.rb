module ApplicationHelper

  def full_title page_title
    if page_title.empty?
      t "title_project"
    else
      page_title + " | " + t("title_project")
    end
  end
end
