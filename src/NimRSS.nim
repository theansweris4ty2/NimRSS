import std/[os, httpclient, uri], rss, terminal


proc main =
  let client = newHttpClient()
  defer:
      client.close()
  
     
  for line in lines("feeds.config"): 
    
    var res = initUri()
    parseUri(line, res)
    let feed = getRSS(line)
    stdout.styledWriteLine(fgGreen, "FEED:", feed.title)
    echo "\n \n"
    for  index, item in feed.items:
      if index < 10:
        stdout.styledWriteLine(fgRed, item.title)
        echo "\n"
        stdout.styledWriteline(item.description)
        echo "\n"
        var link = item.link
        stdout.styledWriteline(fgBlue, item.link)
        echo "\n"
  
main()