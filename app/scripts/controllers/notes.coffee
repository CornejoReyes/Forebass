'use strict'

class NotesCtrl
    constructor: (note,toastr,$state,group)->
        vm = this
        id = $state.params.id
        vm.notes = []

        notes = ()->
            note.getNotes()
            .then( (res)->
                vm.notes=res
            )
        vm.deleteNote = (id)->
            note.deleteNote id
            .then (res)->
                notes()
                toastr.success res.msg, 'Éxito'

        vm.getNotes = (id)->
            group.getNotes id
            .then (res)->
                vm.notes = res

        if id then vm.getNotes id

angular.module 'forebassApp'
    .controller 'NotesCtrl', NotesCtrl
    .config ($stateProvider)->
        $stateProvider
        .state 'forebass.dashboard.groupsnotes',
            url: '/groups/{id}'
            controller: 'NotesCtrl as vm'
            templateUrl: 'views/general.html'
