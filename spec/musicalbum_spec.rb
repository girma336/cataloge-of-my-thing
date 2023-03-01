require 'rspec'
require_relative '../classes/musicalbum'
require_relative '../utils/music_genre'
require_relative '../classes/genre'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    subject { MusicAlbum.new('2020/02/02') }
    context 'Check is it an instance of MusicAlbum' do
      it 'return true if is instance' do
        expect(subject).to be_an_instance_of MusicAlbum
      end
    end
    context 'Check angument of the class' do
      it 'return argument error' do
        expect { MusicAlbum.new('2020/02/02', 90, 8475) }.to raise_exception ArgumentError
      end
    end
  end
end

RSpec.describe AlbumGenre do
  before do
    allow(File).to receive(:directory?).and_return(true)
    allow(File).to receive(:file?).and_return(true)
    allow(File).to receive(:exist?).and_return(true)
    allow(File).to receive(:read).and_return('[]')
    allow(File).to receive(:write)
    allow(FileUtils).to receive(:touch)
    allow(FileUtils).to receive(:mkdir_p)
  end
  describe '#initialize' do
    subject { AlbumGenre.new }
    context 'Check the instance of new object' do
      it 'return true if it is an instance' do
        expect(subject).to be_an_instance_of AlbumGenre
      end
    end

    context 'Load existing musicAlbum' do
      it 'Return true if array is empty' do
        expect(subject.albums).to eq([])
      end
    end

    context 'Load existing musicAlbum' do
      it 'Return true if array is empty' do
        expect(subject.genre).to eq([])
      end
    end
  end

  describe '#add_music_albume' do
    subject { AlbumGenre.new }
    context 'Added new object to musicalbum' do
      it 'check count is it 1' do
        expect { subject.list_all_genre }.to output("No list of gener\n \n").to_stdout
      end
    end

    context 'Added new object to musicalbum' do
      it 'check count is it 1' do
        expect { subject.list_all_album }.to output("No List of Album in the list \n \n").to_stdout
      end
    end

    context 'Added new object to musicalbum' do
      it 'check count is it 1' do
        subject.genre = [{ 'name' => 'Berhanu' }, { 'name' => 'Girma' }]
        expect { subject.list_all_genre }.to output("0) Genre Name: Berhanu\n1) Genre Name: Girma\n \n").to_stdout
      end
    end

    context 'Added new object to musicalbum' do
      it 'check count is it 1' do
        subject.albums = [{ 'publish_date' => '2020/12/20' }, { 'publish_date' => '2023/03/01', 'on_spotify' => true }]
        expect { subject.list_all_album }.to \
          output("0) Publish date: 2020/12/20, Is this Spotify? No
1) Publish date: 2023/03/01, Is this Spotify? Yes\n \n").to_stdout
      end
    end
  end
end
