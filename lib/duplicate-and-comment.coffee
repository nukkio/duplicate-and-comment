module.exports =
  activate: ->
    atom.workspaceView.command 'duplicate-and-comment:duplicateAndComment', => @duplicateAndComment()

  duplicateAndComment: ->
    @editor = atom.workspace.getActiveEditor()
    if (@editor)
        @buff = atom.workspace.getActiveEditor().getSelection().getBufferRange()
        @line0=@buff.start.row
        @line1=@buff.end.row
        @mov=@line1-@line0
        atom.workspace.getActiveEditor().getSelection().setBufferRange([[@line0, 1],[@line1, 1]])
        @editor.duplicateLines()
        atom.workspace.getActiveEditor().getSelection().setBufferRange([[@line0, 1],[@line1, 1]])
        @editor.toggleLineCommentsInSelection()
        @editor.moveCursorDown(@mov)
