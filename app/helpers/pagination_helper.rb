module PaginationHelper
  def last_page_number(collection)
    total_items = collection.total_count
    items_per_page = collection.limit_value
    (total_items.to_f / items_per_page).ceil
  end
end
