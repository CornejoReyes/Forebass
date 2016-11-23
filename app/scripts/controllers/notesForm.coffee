'use strict'

class NotesFormCtrl
    constructor: (note,toastr,$state,locker,group)->
        vm = this
        id = $state.params.id
        vm.note = note.init()
        vm.note.user_id = locker.get( 'user' ).id
        vm.title = $state.current.data.title


        vm.clean = ()->
            vm.note = note.init()

        vm.getNote = (id)->
            note.get id
            .then (res)->
                vm.note = res

        vm.createNote = (newNote)->
            note.createNote newNote
            .then (res)->
                vm.clean()
                toastr.success res.msg, 'Éxito'

        vm.updateNote = (newNote)->
            note.updateNote newNote
            .then (res)->
                toastr.success res.msg, "Éxito"

        groups = ()->
            group.getGroups()
            .then (res)->
                console.log res
                vm.groups = res

        groups()

        if id then vm.getNote id
angular.module 'forebassApp'
    .controller 'NotesFormCtrl', NotesFormCtrl
    .config ($stateProvider)->
        $stateProvider
        .state 'forebass.dashboard.notenew',
            url:'/note/new'
            templateUrl: 'views/note.form.html'
            controller: 'NotesFormCtrl as vm'
            data:
                title: 'Nueva Nota'

        .state 'forebass.dashboard.noteedit',
            url:'/note/{id}'
            templateUrl: 'views/note.form.html'
            controller: 'NotesFormCtrl as vm'
            data:
                title: 'Editar Nota'
