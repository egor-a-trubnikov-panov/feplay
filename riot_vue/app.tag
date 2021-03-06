<app>
  <nav id="sidenavs">
    <h2>Examples</h2>
    <ul>
      <li each={ opts.examples }>
        <a class={ current: link == window.location.hash } href={ link }>{ title }</a>
      </li>
    </ul>
    <p><a href="https://github.com/txchen/feplay/tree/gh-pages/riot_vue" target="_blank">Source Code</a></p>
    <p>RiotJs Ver: { riotver }</p>
    <p><a href="http://vuejs.org/examples" target="_blank">Vuejs versions</a></p>
  </nav>
  <div id="example"></div>

  <script>
  var self = this
  self.riotver = riot.version
  self.mountedTag = null
  self.loadedTags = {}

  this.on('mount', function(){
    riot.route.exec(function(example) {
      console.log('initial route is ' + example)
      self.loadExample(example || 'markdown')
    })
  })

  loadExample(example) {
    console.log('loadExample ' + example)
    if (self.mountedTag) {
      self.mountedTag.unmount()
    }
    if (!self.loadedTags[example]) {
      riot.compile('tags/' + example + '.html', function() {
        console.log(example + ' compiled')
        self.loadedTags[example] = true
        self.mountedTag = riot.mount('div#example', example)[0]
      })
    } else {
      self.mountedTag = riot.mount('div#example', example)[0]
    }
  }

  riot.route(function(example) {
    self.loadExample(example)
    self.update()
  })
  </script>
</app>
