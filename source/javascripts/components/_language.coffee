whitelistLanguage = (lang)->
  switch lang
    when 'en' then 'en'
    when 'fr' then 'fr'
    else 'en'

changeLanguage = (lang)->
  urlLanguage = window.location.pathname.substring(1, 3)
  Cookies.set('lang', lang, { expires: 7 })
  return if lang is urlLanguage
  console.log lang, urlLanguage, lang is urlLanguage
  window.location = "/#{lang}/"

userSelectLanguage = (lang)->
  lang = whitelistLanguage(lang)
  Cookies.set('user-selected-lang', true, { expires: 7 })
  changeLanguage(lang)
window.userSelectLanguage = userSelectLanguage

checkLanguage = ()->
  return if Cookies.get('user-selected-lang')
  userLanguage = Cookies.get('lang') || (window.navigator.userLanguage || window.navigator.language).substring(0, 2)
  lang = whitelistLanguage(userLanguage)
  changeLanguage(lang)

checkLanguage()
