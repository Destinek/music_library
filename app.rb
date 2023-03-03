#In collaboration with Leah Massey( Github @leah-massey)

require_relative 'lib/database_connection'
require_relative 'lib/albums_repository'

DatabaseConnection.connect('music_library_test')

album_repo = AlbumRepository.new

album_repo.all.each do |record|
    p record
end
