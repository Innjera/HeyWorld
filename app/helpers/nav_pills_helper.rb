module NavPillsHelper

  ACTION_LABEL_MAP = {
    show: 'in progress',
    coming: 'coming',
    finished: 'finished'
  }

  def tenders_nav_link(action)

    label = ACTION_LABEL_MAP[action]

    if action == :show
      url = seller_path
    elsif action == :coming
      url = coming_seller_path
    elsif action == :finished
      url = finished_seller_path
    end

    html_classes = %w(nav-link text-muted)
    html_classes << 'active' if action.to_s == action_name

    link_to label, url, class: html_classes.join(' ')

  end

end
