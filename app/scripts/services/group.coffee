'use strict'

class Group
    constructor: ($q,API,toastr,locker)->
        me = this
        url = 'groups'

        me.init = ()->
            return {
                id: null
                title: null
                description: null
            }

        me.getGroups = ()->
            userid = locker.get('user').id;
            return API.get 'user/'+userid+'/groups'
                .then( (res)->
                    return $q.resolve(res.data.rows[0].groups)
                )
                .catch( (err)->
                    return $q.reject err
                )
        me.get = (id)->
            return API.get url + '/' + id
                .then( (res)->
                    return $q.resolve(res.data.rows)
                )
                .catch( (err)->
                    return $q.reject err
                )

        me.getNotes = (id)->
            return API.get( url + '/' + id + '/notes')
            .then (res)->
                return $q.resolve res.data.rows.notes
            .catch (err)->
                toastr.error err, 'Error'
                return $q.reject err

        me.createGroup = (group)->
            return API.post url, group
            .then (res)->
                return $q.resolve res.data
            .catch (err)->
                toastr.error err, 'Error'
                return $q.reject err

        me.updateGroup = (group)->
            return API.put url + '/' + group.id, group
            .then (res)->
                return $q.resolve res.data
            .catch (err)->
                toastr.error err, 'Error'
                return $q.reject err

        me.deleteGroup = (id)->
            return API.delete url + '/' + id
            .then (res)->
                return $q.resolve res.data
            .catch (err)->
                toastr.error err, 'Error'
                return $q.reject err

angular.module 'forebassApp'
  .service 'group', Group
