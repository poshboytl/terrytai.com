do ->
  noop = ->
  methods = ['assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
    'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
      'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
      'timeStamp', 'trace', 'warn']

  console = (window.console or= {})

  for i in [0..methods.length]
      method = methods[i]
      console[method] or= noop

  true

window.location_pathname = ->
  location.pathname.replace(/index.\w+$/, '')

setupEvent = ->
  mixpanel?.track_links(".nav-collapse[role=navigation] a", "click nav link", {
    referrer: document.referrer
  });

$ ->
  setupEvent()
  $("article.single").find('a').each (idx, elem) ->
    $(elem).attr("target", "_blank")

  $(".aside img").on "click", (e) ->
    e.preventDefault()
    $(this).parent(".aside").toggleClass("stretch")

  $(document).on "scroll", (e) ->
    top = $(window).scrollTop()
    ele = $('.announcement')
    if top > 0
      ele.addClass('sticky')
    else
      ele.removeClass('sticky')
