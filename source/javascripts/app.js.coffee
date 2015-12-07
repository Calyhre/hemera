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
