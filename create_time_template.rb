# This builds a complete github-board template from component templates
class TemplateString
  def initialize
    @master_template = []
    7.times do
      @master_template << []
    end
  end

  def add_template(template)
    7.times do |i|
      @master_template[i] << '2' unless @master_template.empty?
      @master_template[i] = @master_template[i] + template[i]
    end
  end

  def to_s
    to_return = ''
    7.times do |i|
      to_return = to_return + @master_template[i].join + "\n"
    end
    to_return.strip
  end
end

def parse_template(filename)
  File.readlines(filename).map(&:strip).map { |e| e.split('') }
end

string_to_filename = Hash.new { |_, k| raise "Unknown string: #{k}" }
string_to_filename['0'] = './templates/zero.tpl'
string_to_filename['1'] = './templates/one.tpl'
string_to_filename['2'] = './templates/two.tpl'
string_to_filename['3'] = './templates/three.tpl'
string_to_filename['4'] = './templates/four.tpl'
string_to_filename['5'] = './templates/five.tpl'
string_to_filename['6'] = './templates/six.tpl'
string_to_filename['7'] = './templates/seven.tpl'
string_to_filename['8'] = './templates/eight.tpl'
string_to_filename['9'] = './templates/nine.tpl'
string_to_filename['A'] = './templates/a.tpl'
string_to_filename['P'] = './templates/p.tpl'
string_to_filename['M'] = './templates/m.tpl'
string_to_filename['B'] = './templates/blank.tpl'
string_to_filename[':'] = './templates/colon.tpl'
string_to_filename['C'] = './templates/c.tpl'
string_to_filename['S'] = './templates/five.tpl' # muahaha
string_to_filename['T'] = './templates/t.tpl'
string_to_filename[' '] = './templates/single_blank_column.tpl'

time = `date "+%H:%M"`.strip
hour, minute = time.split(':')
hour = hour.to_i
meridian = hour < 12 ? 'AM' : 'PM'
hour -= 12 if hour > 12
hour += 12 if hour == 0
hour = hour.to_s.rjust(2, 'B') # b for blank space
timestring = "#{hour}:#{minute}#{meridian} CT "
mytemplate = TemplateString.new

timestring.chars.each do |c|
  char_template = parse_template(string_to_filename[c])
  mytemplate.add_template(char_template)
end

puts mytemplate.to_s
