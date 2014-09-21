json.array!(@htmlpages) do |htmlpage|
  json.extract! htmlpage, :id, :library, :css, :js, :html
  json.url htmlpage_url(htmlpage, format: :json)
end
