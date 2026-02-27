(function () {
  var bibCache = null;

  function parseBibEntries(text) {
    var entries = {};
    var lines = text.split("\n");
    var current = null;
    var depth = 0;
    var buffer = [];

    for (var i = 0; i < lines.length; i++) {
      var line = lines[i];
      if (!current) {
        var match = line.match(/^@\w+\{(.+?),/);
        if (match) {
          current = match[1].trim();
          depth = 0;
          buffer = [line];
          for (var j = 0; j < line.length; j++) {
            if (line[j] === "{") depth++;
            if (line[j] === "}") depth--;
          }
          if (depth <= 0) {
            entries[current] = buffer.join("\n");
            current = null;
          }
        }
      } else {
        buffer.push(line);
        for (var j = 0; j < line.length; j++) {
          if (line[j] === "{") depth++;
          if (line[j] === "}") depth--;
        }
        if (depth <= 0) {
          entries[current] = buffer.join("\n");
          current = null;
        }
      }
    }
    return entries;
  }

  function fetchBib() {
    if (bibCache) return Promise.resolve(bibCache);
    var bibUrl = location.origin + "/_bibliography/references.bib";
    return fetch(bibUrl).then(function (res) {
      if (!res.ok) throw new Error("Failed to fetch references.bib");
      return res.text();
    }).then(function (text) {
      bibCache = parseBibEntries(text);
      return bibCache;
    });
  }

  function showTip(anchor, message, duration) {
    var tip = document.createElement("span");
    tip.className = "bib-tooltip";
    tip.textContent = message;
    anchor.appendChild(tip);
    requestAnimationFrame(function () {
      tip.style.opacity = "1";
    });
    setTimeout(function () {
      tip.style.opacity = "0";
      setTimeout(function () {
        tip.remove();
      }, 200);
    }, duration);
  }

  document.addEventListener("click", function (e) {
    var link = e.target.closest('a[href^="#bib:"]');
    if (!link) return;

    e.preventDefault();
    var key = link.getAttribute("href").replace("#bib:", "");

    fetchBib().then(function (entries) {
      var entry = entries[key];
      if (!entry) {
        showTip(link, "Not found", 2000);
        return;
      }
      return navigator.clipboard.writeText(entry).then(function () {
        showTip(link, "Copied!", 1500);
      });
    }).catch(function () {
      showTip(link, "Error", 2000);
    });
  });
})();
