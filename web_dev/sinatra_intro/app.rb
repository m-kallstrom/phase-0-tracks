# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

get '/contact' do
  "880-2105 JAPAN <br> Miyazaki-ken, Miyazaki-shi<br> Otsukadai Nishi 2-1-3<br> Toshikikou Jutaku 2-903<br>"
end

get '/great_job' do
  name = params[:name]
  if name
    "Good job, #{name}!"
  else
    "Good job!"
  end
end

get '/:number_1/plus/:number_2' do
  result = params[:number_1].to_i + params[:number_2].to_i
  result.to_s
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

#RESEARCH!

#Is Sinatra the only web app library in Ruby? What are some others?

#I see a lot of results for Rails, but they call it a framework. But then some pages also call Sinatra a framework? Changing my google search term to 'Sinatra alternative' gave the following additional ones: Cuba, Padrino, and Lotus


#Are SQLite and the sqlite3 gem your only options for using a database with Sinatra? What are some others?

#ActiveRecord, Datamapper, full calorie SQL


#What is meant by the term web stack?

#A web stack refers to all the different pieces you need to get your website up and running. At the minimum you need an operating system, a programming language, a database, and a web server. One of the frequently used combinations is "LAMP", which stands for: Linux, Apache, MySQL, PHP.