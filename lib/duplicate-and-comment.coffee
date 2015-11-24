{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'duplicate-and-comment:duplicateAndComment': => @duplicateAndComment()

  deactivate: ->
    @subscriptions.dispose()

  duplicateAndComment: ->
    if editor = atom.workspace.getActiveTextEditor()
        @editor=atom.workspace.getActiveTextEditor()
        @editor.selectLinesContainingCursors()
        @editor.duplicateLines()
        @editor.toggleLineCommentsInSelection()
        @editor.moveLineUp()
        @cur=@editor.cursors[0]
        @cur.moveDown()
        @cur.moveLeft()

