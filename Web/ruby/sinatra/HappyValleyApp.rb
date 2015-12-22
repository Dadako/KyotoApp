require 'sinatra'
require 'json'

get '/' do
	'Hello world!'	
end

get '/hello/:name' do
	"Hello #{params[:name]}!"
end

def retQuestionAsJson(type)
	
	answers = Array.new

	case type
		when "color"
			answers = ["Red", "Blue", "Yellow", "Green"]
		when "number"
			answers = ["One", "Two", "Three", "Four"]
		when "object"
			answers = ["Car", "Flower", "Ball", "Bicycle"]
		else
			["unknown question type"]
	end

	h = Hash.new
	h['type'] = type
	h['allAnswers'] = answers
	h['requiredAnswer'] = answers.sample
	h['timestamp'] = Time.now
	h['correct'] = false
	
	return h.to_json
end

def retTestJson

	h = Hash.new
	h['one'] = 1
	h['two'] = 2

	h.to_json
end

get '/question/:type' do
	retQuestionAsJson(params[:type])
end

get '/hashtest' do
	retTestJson
end