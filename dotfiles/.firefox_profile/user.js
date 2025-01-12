// Some of this is ancient and may break things.

///////////////////////////////////////////////////////////////////////////////
// GENERAL
///////////////////////////////////////////////////////////////////////////////

// restore previous session on startup
user_pref("browser.startup.page", 3);

// disable warning on quitting multiple tabs when closing
user_pref("browser.sessionstore.warnOnQuit", false);

// disable checking if Firefox is the default browser
user_pref("browser.shell.checkDefaultBrowser", false);

// enable spell check
user_pref("layout.spellcheckDefault", 1);

// enable playback of DRM content
user_pref("media.eme.enabled", true);

// disable recommendation of addons
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

// disable recommendation of features
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// Get rid of Pocket
user_pref("extensions.pocket.enabled", false);

// Allow legacy chrome/userChrome.css stylesheet
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Remove annoying top site suggestions from the URL bar
user_pref("browser.urlbar.suggest.topsites", false);

// Stop Firefox following DE's reduced animation settings
// If not defined, the tab loading animation is replaced by an annoying
// hourglass.
user_pref("ui.prefersReducedMotion", 0);

// Stop Firefox waiting one frame for scrolling
user_pref("apz.frame_delay.enabled", false);

// Zoom fonts, not pages
user_pref("browser.zoom.full", true);
// Makes stuff look weird.

// Enable the compact tabs to be shown in UI customization
user_pref("browser.compactmode.show", true);

// Disable Firefox view
user_pref("browser.tabs.firefox-view", false);

///////////////////////////////////////////////////////////////////////////////
// PERFORMANCE
///////////////////////////////////////////////////////////////////////////////

// use recommended performance settings
user_pref("browser.preferences.defaultPerformanceSettings.enabled", true);

// Turn web render on
// user_pref("gfx.webrender.all", true);
// Note: buggy

///////////////////////////////////////////////////////////////////////////////
// SCROLLING
///////////////////////////////////////////////////////////////////////////////

// enable auto scroll
user_pref("general.autoScroll", true);

// enable smooth scroll
user_pref("general.smoothScroll", false);

// Smooth scroll on the arrows keys: off
user_pref("general.smoothScroll.lines", false);

// Smooth scroll on the mouse wheel: off
user_pref("general.smoothScroll.mouseWheel", false);

// Smooth scroll on the paging buttons: off
user_pref("general.smoothScroll.pages", false);

// Enable mouse wheel acceleration
//user_pref("mousewheel.acceleration.start", 1);

///////////////////////////////////////////////////////////////////////////////
// NEW TAB PAGE
///////////////////////////////////////////////////////////////////////////////

// display a blank page on start-up
user_pref("browser.startup.homepage", "about:blank");

// display a blank page in new tabs
user_pref("browser.newtabpage.enabled", false);

// disable web search on the new tab page
user_pref("browser.newtabpage.activity-stream.showSearch", false);

// disable top sites on the new tab page
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

// disable highlights on the new tab page
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);

// disable Pocket on the new tab page
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);

// disable downloads on the new tab page
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);

// disable bookmarks on the new tab page
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);

// disable visited pages on the new tab page
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);

// disable snippets on the new tab page
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// disable Pocket on the new tab page
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

///////////////////////////////////////////////////////////////////////////////
// SEARCH
///////////////////////////////////////////////////////////////////////////////

// set DuckDuckGo as the search engine
// user_pref("browser.urlbar.placeholderName", "DuckDuckGo");

// provide search suggestions
user_pref("browser.search.suggest.enabled", true);

// show search suggestions in the URL bar
user_pref("browser.urlbar.suggest.searches", true);

// hide extra search engines
user_pref("browser.search.hiddenOneOffs", "DuckDuckGo,Bing,Amazon.co.uk,Chambers (UK),DuckDuckGo,eBay,Twitter,Wikipedia (en)");

// disable auto-update search engines
user_pref("browser.search.update", false);

///////////////////////////////////////////////////////////////////////////////
// PRIVACY
///////////////////////////////////////////////////////////////////////////////

// don't offer to autofill credit cards
user_pref("extensions.formautofill.creditCards.enabled", false);

// always use private browsing
user_pref("browser.privatebrowsing.autostart", false);

// enable Cloudflare DNS over TLS
user_pref("network.trr.mode", 5);

// strict tracking protection
user_pref("browser.contentblocking.category", "strict");

// part of strict tracking protection
user_pref("privacy.trackingprotection.enabled", true);

// part of strict tracking protection
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);

// always send a do not track
user_pref("privacy.donottrackheader.enabled", true);

// don't ask to save logins and passwords
user_pref("signon.rememberSignons", false);

// use custom settings for history
user_pref("privacy.history.custom", true);

// don't remember browsing and download history
user_pref("places.history.enabled", false);

// don't remember search and form history
user_pref("browser.formfill.enable", false);

// clear history when Firefox closes
user_pref("privacy.sanitize.sanitizeOnShutdown", false);

// clear downloads on shutdown
user_pref("privacy.clearOnShutdown.downloads", true);

// don't clear history on shutdown such that session restore works
user_pref("privacy.clearOnShutdown.history", false);

// don't clear cookies when Firefox closes
user_pref("privacy.clearOnShutdown.cookies", false);

// clear the cache when Firefox closes
user_pref("privacy.clearOnShutdown.cache", true);

// don't send technical/interaction data to Mozilla
user_pref("datareporting.healthreport.uploadEnabled", false);

// opt out of Firefox studies
user_pref("app.shield.optoutstudies.enabled", false);

// stop Firefox making extension recommendations
user_pref("browser.discovery.enabled", false);

///////////////////////////////////////////////////////////////////////////////
// LAPTOP
///////////////////////////////////////////////////////////////////////////////

// UI scaling
// Doesn't work well if you have different DPI screens
//user_pref("layout.css.devPixelsPerPx", "-1.0");
