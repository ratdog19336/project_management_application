user_list = {
    "Nick" => {
      :username => "nickratti",
      :password_digest => "delta7"
    }
  }

user_list.each do |username, user_hash|
  p = User.new
  p.username = username
  user_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

project_list = {
    "Port of St. Mary" => {
      :name => "Port of St. Mary",
      :user_id => 1
    }
  }

project_list.each do |name, project_hash|
  p = Project.new
  p.name = name
  project_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end


notes_list = {
    "Note 1" => {
      :name => "Note 1",
      :content => "This note is working!!",
      :project_id => 1
    }
  }

notes_list.each do |name, notes_hash|
  p = Note.new
  p.name = name
  notes_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end
