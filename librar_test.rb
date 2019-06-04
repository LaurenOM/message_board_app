describe FileSystem do
    it 'can add items to storage' do
      # Arrange
      file_system = FileSystem.new
      file = File.new
  
      # Act
      file_system.store(file)
  
      #Assert
      expect(file_system.storage).to include(file)
    end
  end

  