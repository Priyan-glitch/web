library = {
  "978-0143127741" => { title: "The Alchemist", author: "Paulo Coelho", copies: 5 },
  "978-0062315007" => { title: "Sapiens", author: "Yuval Noah Harari", copies: 3 },
  "978-0451524935" => { title: "1984", author: "George Orwell", copies: 4 }
}

loop do
  puts "\n===== LIBRARY MENU ====="
  puts "1. Add Book"
  puts "2. Update Copies"
  puts "3. Remove Book"
  puts "4. Search Book"
  puts "5. List All Books"
  puts "6. Exit"

  print "Choose option: "
  choice = gets.chomp.to_i

  case choice

  when 1
    print "Enter title: "
    title = gets.chomp
    print "Enter author: "
    author = gets.chomp
    print "Enter ISBN: "
    isbn = gets.chomp
    print "Enter copies: "
    copies = gets.chomp.to_i

    library[isbn] = { title: title, author: author, copies: copies }
    puts "Book added!"

  when 2
    print "Enter ISBN to update: "
    isbn = gets.chomp

    if library[isbn]
      print "Enter new number of copies: "
      library[isbn][:copies] = gets.chomp.to_i
      puts "Copies updated!"
    else
      puts "Book not found."
    end

  when 3
    print "Enter ISBN to remove: "
    isbn = gets.chomp

    if library.delete(isbn)
      puts "Book removed!"
    else
      puts "Book not found."
    end

  when 4
    print "Enter ISBN to search: "
    isbn = gets.chomp

    if library[isbn]
      book = library[isbn]
      puts "Title: #{book[:title]}"
      puts "Author: #{book[:author]}"
      puts "Copies: #{book[:copies]}"
    else
      puts "Book not found."
    end

  when 5
    puts "\nLibrary Catalog:"
    library.each do |isbn, book|
      puts "#{isbn} | #{book[:title]} | #{book[:author]} | Copies: #{book[:copies]}"
    end

  when 6
    break

  else
    puts "Invalid option."
  end
end