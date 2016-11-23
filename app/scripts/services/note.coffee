'use strict'

class Note
    constructor: ($q,API,toastr,locker)->
        me = this
        url = 'notes'

        me.init = ()->
            return {
                id: null
                title: null
                description: null
            }

        me.getNotes = ()->
            userid = locker.get('user').id;
            return API.get 'user/'+userid+'/notes'
                .then( (res)->
                    return $q.resolve(res.data.rows[0].notes)
                )
                .catch( (err)->
                    return $q.reject err
                )
        me.get = (id)->
            return API.get 'notes/' + id
                .then( (res)->
                    return $q.resolve(res.data.rows)
                )
                .catch( (err)->
                    return $q.reject err
                )

        me.createNote = (note)->
            return API.post url, note
            .then (res)->
                return $q.resolve res.data
            .catch (err)->
                toastr.error err, 'Error'
                return $q.reject err

        me.updateNote = (note)->
            return API.put url + '/' + note.id, note
            .then (res)->
                return $q.resolve res.data
            .catch (err)->
                toastr.error err, 'Error'
                return $q.reject err

        me.deleteNote = (id)->
            return API.delete url + '/' + id
            .then (res)->
                return $q.resolve res.data
            .catch (err)->
                toastr.error err, 'Error'
                return $q.reject err

angular.module 'forebassApp'
  .service 'note', Note
