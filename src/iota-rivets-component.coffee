define (require) ->
  $ = require("jquery")
  rivets = require("rivets")
  Component = require("iota-component")

  class RivetsComponent extends Component
    # Initializes the component with the given model
    constructor: (@data) ->
      @_rootElement = null
      @rivetsModels = {data: @data}
      @rivetsFormatters = {}
      
    getRootElement: ->
      # Parse root element from template if not already done
      if not @_rootElement?
        @createRootElement()
        
      @_rootElement
      
    createRootElement: ->
      @_rootElement = $(@getTemplate())[0]
      # Make Rivets establish a binding between the element and the model.
      @rivetsView = rivets.bind(@_rootElement, @rivetsModels, @rivetsFormatters)
    
    # Returns the HTML template for the Rivets view. Supposed to be overwritten.
    getTemplate: ->