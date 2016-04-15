#json.extract! @book,:book_title
#json.edit_url edit_book_url(@book)
json.book @book.catagory,:id,:name
json.catagory do |json|
  json.(@book.catagory,:id ,:name)
  json.url catagory_url(@book.catagory)
end  