require 'albums_repository'
require 'albums'
repo = AlbumRepository.new

RSpec.describe AlbumRepository do

    def reset_albums_table
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test', password: 'a' })
        connection.exec(seed_sql)
      end

      describe AlbumRepository do
        before(:each) do 
          reset_albums_table
        end
       end 

    context "get all albums" do
        it "returns an id of 1 when first item selected" do
            
            albums = repo.all
            expect(albums.first.id).to eq 1
        end 

        it "retruns the title of the selected albums object" do 
          albums = repo.all
          expect(albums[0].title).to eq 'Chandaleir'
        end
    end

    context "find one album" do
        it "return a single album" do
            album = repo.find(1)
            expect(album.title).to eq 'Chandaleir'
            expect(album.release_year).to eq '2022'
        end
    end
        
     

    



end 

#albums = repo.all
#albums[0].id # => 1 
#albums[0].title #=> Chandeleir
#albums[0].release_year #=> 2022

#albums[1].id # => 2
#albums[1].title # => Skute BOBO
#albums[1].release_year #=> 2020

# repo = AlbumRepository.new

# album = repo.find(1)

# album.id # =>  1
# album.title # =>  'David'
# album.release_year # =>  'April 2022'



