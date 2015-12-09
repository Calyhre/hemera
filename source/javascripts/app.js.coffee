#= require_tree ./vendor
#= require_tree ./components
#= require_tree .

smoothScroll.init()

fixedHeaderPosition = 400
fixedHeaderClass = 'shown'
fixedHeader = document.querySelector '.header--fixed'
isHeaderFixed = ->
  if window.scrollY > fixedHeaderPosition
    fixedHeader.classList.add fixedHeaderClass
  else
    fixedHeader.classList.remove fixedHeaderClass

window.addEventListener 'scroll', (e)->
  isHeaderFixed()

menuToggles = document.querySelectorAll('[data-toggle-menu]')
[].forEach.call menuToggles, (menuToggle)->
  menuToggle.addEventListener 'click', (e)->
    menus = document.querySelectorAll("[data-menu='#{menuToggle.dataset.toggleMenu}']")
    if menuToggle.classList.contains('shown')
      [].forEach.call menuToggles, (menuToggle)->
        menuToggle.classList.remove('shown')
      [].forEach.call menus, (menu)->
        menu.classList.remove('shown')
    else
      [].forEach.call menuToggles, (menuToggle)->
        menuToggle.classList.add('shown')
      [].forEach.call menus, (menu)->
        menu.classList.add('shown')
  , false

modalToggles = document.querySelectorAll('[data-toggle-modal]')
[].forEach.call modalToggles, (modalToggle)->
  modalToggle.addEventListener 'click', (e)->
    console.log modalToggle.dataset
    modal = document.querySelector("[data-modal='#{modalToggle.dataset.toggleModal}']")
    return unless modal
    if modal.classList.contains('shown')
      modal.classList.remove('shown')
    else
      modal.classList.add('shown')
      input = modal.querySelector('input')
      setTimeout ->
        input.focus()
      , 200
  , false

# form = document.querySelector('form')
# form.addEventListener 'submit', (e)->
#   e.preventDefault()
#
#   form.classList.add('pending')
#   form.querySelector("input[type='submit']").disabled = true
#
#   urlEncodedDataPairs = []
#   for field in form.elements
#     break if field.type is 'submit'
#     urlEncodedDataPairs.push "#{encodeURIComponent(field.name)}=#{encodeURIComponent(field.value)}"
#   urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+')
#
#   XHR = new XMLHttpRequest()
#
#   XHR.addEventListener 'readystatechange', (e)->
#     return unless XHR.readyState is 4
#     form.classList.add('done')
#
#   XHR.open 'POST', '//fwd.muxumuxu.com/forms/58e098ed-8708-4a25-8caf-b77025eec6ac'
#   XHR.setRequestHeader 'Content-Type', 'application/x-www-form-urlencoded'
#
#   XHR.send urlEncodedData
#
#   console.log urlEncodedData
#
#   false
