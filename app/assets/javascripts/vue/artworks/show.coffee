new Vue
  el: '#artwork'
  data: ->
    artwork: {}

  created: ->
    @fetchData()

  methods:
    fetchData: ->
      $.ajax
        url: "#{ location.pathname }.json"
        method: 'GET'
        success: (res) =>
          @artwork = res

    togglePublished: ->
      $.ajax
        url: "#{ location.pathname }/toggle_published.json"
        method: 'PUT'
        success: (res) =>
          @artwork.published = res.published
          UIkit.notification
            message: "#{ @artwork.title } was #{ if @artwork.published then 'published' else 'unpublished' }"
            pos: 'top-right'
            status: if @artwork.published then 'success' else 'warning'
            timeout: 2000
