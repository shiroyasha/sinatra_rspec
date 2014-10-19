class TodoApi < Sinatra::Base

  get "/" do
    $db.join("\n")
  end

  post "/" do
    return 400 unless params["todo"].present?

    $db << params["todo"]
    200
  end

end
