class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (keywords)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon_result = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    # binding.pry
    puts Pokemon.new(id: pokemon_result[0], name:pokemon_result[1], type:pokemon_result[2], hp: pokemon_result[3], db: db)

  end


  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? where id = ?", num, self.id)
  end

end
