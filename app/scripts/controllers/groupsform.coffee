'use strict'

class GroupsFormCtrl
    constructor: ($state,locker,toastr,group)->
        vm = this
        id = $state.params.id
        vm.title = $state.current.data.title
        vm.group = group.init()
        vm.group.user_id = locker.get( 'user' ).id

        vm.getGroup = (id)->
            group.get id
            .then (res)->
                vm.group = res
            .catch (err)->
                $state.go 'forebass.dashboard.groupnew'

        if id then vm.getGroup id

        clean = ()->
            vm.group = group.init()

        vm.createGroup = (newGroup)->
            group.createGroup newGroup
            .then (res)->
                clean()
                toastr.success res.msg, 'Éxito'
        vm.updateGroup = (newGroup)->
            group.updateGroup newGroup
            .then (res)->
                toastr.success res.msg, "Éxito"

angular.module 'forebassApp'
    .controller 'GroupsFormCtrl', GroupsFormCtrl
    .config ($stateProvider)->
        $stateProvider
        .state 'forebass.dashboard.groupedit',
            url: '/group/{id}'
            controller: 'GroupsFormCtrl as vm'
            templateUrl: 'views/group.form.html'
            data:
                title: 'Editar Grupo'
        .state 'forebass.dashboard.groupnew',
            url: '/group/new'
            controller: 'GroupsFormCtrl as vm'
            templateUrl: 'views/group.form.html'
            data:
                title: 'Nuevo Grupo'
