#= require vendor/smooth-scroll
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
