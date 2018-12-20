module ListingsHelper

  def localdate(listing)
    local_time(listing.created_at, '%b %d, %Y')
  end
end
