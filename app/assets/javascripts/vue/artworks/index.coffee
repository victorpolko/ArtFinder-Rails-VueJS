new Vue
  el: '#artworks-list'
  data: ->
    searchString: ''
    tabIndex: 0
    artworks: []

  created: ->
    @fetchData()

  methods:
    fetchData: ->
      $.ajax
        url: '/artworks.json'
        method: 'GET'
        success: (res) =>
          @artworks = res

    isTab: (index) ->
      @tabIndex is index

    setTab: (index) ->
      @tabIndex = index
      @lastUsedTab = index

    publishedArtworks: ->
      @artworks.filter (art) -> art.published

    unpublishedArtworks: ->
      @artworks.filter (art) -> !art.published

    togglePublished: (artwork) ->
      $.ajax
        url: "/artworks/#{ artwork.id }/toggle_published.json"
        method: 'PUT'
        success: (res) =>
          artwork.published = res.published
          @findArt(false)

    findArt: (switchToTab) ->
      search = @escapeRegExp @searchString.trim().toLowerCase()
      @setTab(@lastUsedTab) if switchToTab

      if search.length
        @setTab(2) if switchToTab
        @filteredArtworks = @artworks.filter (art) =>
          [
            art.title,
            art.artist,
            art.mediums,
            art.year + ''
          ].some((elem) -> elem.toLowerCase().match(search))

    escapeRegExp: (str) ->
      str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")
