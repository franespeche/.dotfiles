/*
 * deeply deletes object keys given a callback
 */

import _ from 'lodash'
const removeBy = (obj, callback) => {
    if (!obj) return obj
    for (const [key, value] of Object.entries(obj)) {
      if(callback(key, value)) {
        delete obj[key]
        continue
      }
      if (_.isObject(value)) {
        removeBy(obj[key], callback)
      }
    }
    return obj
  }

/*
 * usage:
 *
 * const o = { a: 1, c: {b: 2} }
 * removeBy(o, (k, v) => k === 'b' || _.isUndefined(v))
 */
