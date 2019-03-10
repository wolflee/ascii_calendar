require "ascii_calendar/version"
require 'date'

module AsciiCalendar
  class Error < StandardError; end

  class << self
    def generate(year: Date.today.year, month: Date.today.month, slots: 1, show_title: true)
      first_day_of_the_month = Date.civil(year, month, 1)
      last_day_of_the_month = Date.civil(year, month, -1)
      text = ''
      text << "#{first_day_of_the_month.strftime('%B %Y')}\n\n" if show_title
      text << "| #{DateTime::ABBR_DAYNAMES.rotate.join(' | ')} |\n"
      text << "|-----+-----+-----+-----+-----+-----+-----|\n"
      text << '|     ' * (first_day_of_the_month.wday - 1)
      last_day_of_the_month.day.times.each do |d|
        text << ((d + 1 < 10) ? "|   #{d + 1} " : "|  #{d + 1} ")
        if Date.civil(year, month, d+1).wday == 0
          text << "|\n"
          text << "|     |     |     |     |     |     |     |\n" * slots
        end
      end
      if last_day_of_the_month.wday != 0
        text << '|     ' * (7 - last_day_of_the_month.wday)
        text << "|\n"
        text << "|     |     |     |     |     |     |     |\n" * slots
      end
      text
    end
  end
end
