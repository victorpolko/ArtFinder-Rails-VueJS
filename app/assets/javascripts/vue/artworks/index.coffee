VuePaginator.template =
  '''
  <ul class="uk-pagination uk-flex-center">
      <li>
        <button class="uk-button uk-button-default uk-button-small uk-width-small" @click="fetchData(prev_page_url)" :disabled="!prev_page_url">
          <span class="uk-margin-small-right" uk-pagination-previous>
            <svg xmlns="http://www.w3.org/2000/svg" width="7" height="12" viewBox="0 0 7 12" ratio="1">
                <polyline fill="none" stroke="#000" stroke-width="1.2" points="6 1 1 6 6 11"></polyline>
            </svg>
          </span>
          Previous
        </button>
      </li>
      <li>
        <button class="uk-button uk-button-default uk-button-small uk-width-small" @click="fetchData(next_page_url)" :disabled="!next_page_url">
          Next
          <span class="uk-margin-small-left" uk-pagination-next>
            <svg xmlns="http://www.w3.org/2000/svg" width="7" height="12" viewBox="0 0 7 12" ratio="1">
                <polyline fill="none" stroke="#000" stroke-width="1.2" points="1 1 6 6 1 11"></polyline>
            </svg>
          </span>
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
