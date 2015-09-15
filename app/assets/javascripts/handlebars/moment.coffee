Handlebars.registerHelper 'dateFormat', (context, block) ->
  if window.moment
    f = block.hash.format || "MMM Do, YYYY"
    return moment(Date(context)).format(f)
  else
    return context