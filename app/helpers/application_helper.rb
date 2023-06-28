module ApplicationHelper
#Подключение навигации для Pagy
  include Pagy::Frontend
# helper для вывода в заголовок динамичного названия стараницы/местонахождения
# Для запуска helpera нужно добавить на соотвтствующей странице provide с аргументом page_title
  
  def full_title(page_title = '')
    page_title.present? ? "TWS | #{page_title}" : "TWS"
  end

  def show_navbar(current_page = '')
    render partial: 'shared/navbar', locals: {current_page: current_page}
  end
  
  def nav_to(title, url, options = {})
    title == options[:current_page] ? appoint_colour = "text-white" : appoint_colour = "text-white-50"
    
    options[:class] += ' ' + appoint_colour
    link_to title, url, options
    
  end
  
  # helper для формирования коллекции тем
  def subject_list
    Subject.order(:body).map { |subject| [subject.body, subject.id] }
  end
  
end
