
require_relative 'albums'

class AlbumRepository

# selects all record
# no arguments
  def all 
    # executes the SQL query
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    
    result_set = DatabaseConnection.exec_params(sql, []) 

    albums =[]

    result_set.each do |records|
      album = Album.new
      album.id = records['id'].to_i
      album.title = records['title']
      album.release_year = records['release_year']

      albums << album
    end
    return albums
    #returns an array of album objects
  end

  def find(id)
    #Executes the SQL query
    #SELECT id, title, release year FROM albums WHERE id = $1;

     #returns a single album objects
     sql = 'SELECT id, title, release_year FROM albums WHERE id = $1;'
     params = [id]


     

     result_set = DatabaseConnection.exec_params(sql, params) 

     
     records = result_set[0]

      album = Album.new
      album.id = records['id'].to_i
      album.title = records['title']
      album.release_year = records['release_year']

    return album

  end


  def create(album)
    # executes the SQL query
    # INSERT INTO albums (title, release_year, artist_id) VALUES ('Country Mile', 2013, 5);

    #returns nothing
  end
  
  def update(album)
    #Executes the SQL query
    #UPDATE albums SET title = 'new title' 
    #returns nothing
  end
  
  def delete(album)
    # executes the SQL query
    # DELETE FROM albums WHERE id = 1
    #returns nothing 
  end
end
