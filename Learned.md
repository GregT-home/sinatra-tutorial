### Cookies
* Cookies are set from the response `response.set_cookie 'name' 'value'`
* Cookies are deleted from the response: `response.delete_cookie` 'name'
* Cookies are, by default, set into the path of the route; you override this by `response.set_cookie 'name', value: 'value', path: '/path/for/cookie/processing'
* Cookies can be read from the `request.cookies` hash. It is unclear to me how to read the cookies for another path. `configure { set :cookie_options, path: '/target/path'` ??
* changing the verb from `get` to `delete` ensures that the deleted cookies have the same path in which they were created.
