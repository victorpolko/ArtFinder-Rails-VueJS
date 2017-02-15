VuePaginator.template =
  '''
  <ul class="uk-pagination uk-flex-center">
      <li>
        <button class="uk-button uk-button-default uk-button-small uk-width-small" @click="fetchData(prev_page_url)" :disabled="!prev_page_url">
          <span class="uk-margin-small-right" uk-pagination-previous></span>
          Previous
        </button>
      </li>
      <li>
        <button class="uk-button uk-button-default uk-button-small uk-width-small" @click="fetchData(next_page_url)" :disabled="!next_page_url">
          Next
          <span class="uk-margin-small-left" uk-pagination-next></span>
        </button>
      </li>
  </ul>
  '''

new Vue
  el: '#artworks-list'
  data: ->
    searchString: ''
    tabIndex: 0
    artworks: []
    searching: false
    resource_url: '/artworks.json'

  components:
    VPaginator: VuePaginator

  created: ->
    @lastUsedTab = @tabIndex

  methods:
    paginate: (data) ->
      @artworks = JSON.parse(data)

    isTab: (index) ->
      @tabIndex is index

    setTab: (index) ->
      @tabIndex = index
      @lastUsedTab = index
      UIkit.notification.closeAll()

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
          UIkit.notification
            message: "#{ artwork.title } was #{ if artwork.published then 'published' else 'unpublished' }"
            pos: 'bottom-right'
            status: if artwork.published then 'success' else 'warning'
            timeout: 2000
