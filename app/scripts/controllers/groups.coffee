'use strict'

class GroupsCtrl
    constructor: ($state,group, _groups, toastr, locker)->
        vm = this
        id = $state.params.id
        vm.title = $state.current.data.title
        vm.groups = _groups


        groups = ()->
            group.getGroups()
            .then (res)->
                vm.groups = res

        vm.deleteGroup = (id)->
            group.deleteGroup id
            .then (res)->
                toastr.success res.msg, 'Éxito'
                groups()

        vm.reload = groups

angular.module 'forebassApp'
    .controller 'GroupsCtrl', GroupsCtrl
    .config ($stateProvider)->
        $stateProvider
        .state 'forebass.dashboard.groups',
            url: '/groups'
            controller: 'GroupsCtrl as vm'
            templateUrl: 'views/groups.html'
            resolve:
                _groups: (group)->
                    return group.getGroups()
