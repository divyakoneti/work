#way to accessing reuire attributs
json.id @catagory.id
json.name @catagory.name



json.extract! @catagory,:created_at
json.edit_url edit_catagory_url(@catagory) 
json.books @catagory.books,:id,:book_title
 #json.books @catagory.books do |json,book|
 #json.partial! book
 #end  