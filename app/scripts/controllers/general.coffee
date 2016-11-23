'use strict'

class GeneralCtrl
    constructor: (note, _notes,toastr,$state,group)->
        vm = this
        id = $state.params.id
        vm.notes = _notes

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
    .controller 'GeneralCtrl', GeneralCtrl
    .config ($stateProvider)->
        $stateProvider
        .state 'forebass.dashboard.general',
            url: '/general'
            controller: 'GeneralCtrl as vm'
            templateUrl: 'views/general.html'
            resolve:
                _notes: (note)->
                    return note.getNotes()
