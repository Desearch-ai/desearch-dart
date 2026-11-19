// GENERATED CODE. DO NOT EDIT. Run dart run tool/generate.dart.
// Schema provenance: tool/openapi_source.json (SHA-256 verified before generation).
import 'client.dart';

/// HTTP operations from the pinned schema, excluding the SSE stream.
enum DesearchOperation {
  aiSearch(
    "POST",
    "/desearch/ai/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  aiXLinksSearch(
    "POST",
    "/desearch/ai/search/links/twitter",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  aiWebLinksSearch(
    "POST",
    "/desearch/ai/search/links/web",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  companyEnrich(
    "POST",
    "/desearch/companies/enrich",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  companySearch(
    "POST",
    "/desearch/companies/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  listCompanyTasks(
    "GET",
    "/desearch/companies/tasks",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getCompanyTask(
    "GET",
    "/desearch/companies/tasks/{task_id}",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  cancelCompanyTask(
    "POST",
    "/desearch/companies/tasks/{task_id}/cancel",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  exportCompanyResults(
    "GET",
    "/desearch/companies/tasks/{task_id}/export",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  pauseCompanyTask(
    "POST",
    "/desearch/companies/tasks/{task_id}/pause",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getCompanyResults(
    "GET",
    "/desearch/companies/tasks/{task_id}/results",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  resumeCompanyTask(
    "POST",
    "/desearch/companies/tasks/{task_id}/resume",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  facebookComments(
    "GET",
    "/desearch/facebook/comments/{post_id}",
    pathParameters: ["post_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  facebookHashtag(
    "GET",
    "/desearch/facebook/hashtag/{tag}",
    pathParameters: ["tag"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  facebookPostById(
    "GET",
    "/desearch/facebook/post/{id}",
    pathParameters: ["id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  facebookProfile(
    "GET",
    "/desearch/facebook/profile/{profile_id}",
    pathParameters: ["profile_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  facebookProfilePosts(
    "GET",
    "/desearch/facebook/profile/{profile_id}/posts",
    pathParameters: ["profile_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  facebookSearch(
    "POST",
    "/desearch/facebook/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  instagramComments(
    "GET",
    "/desearch/instagram/comments/{shortcode}",
    pathParameters: ["shortcode"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  instagramHashtag(
    "GET",
    "/desearch/instagram/hashtag/{tag}",
    pathParameters: ["tag"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  instagramMedia(
    "GET",
    "/desearch/instagram/media/{id}",
    pathParameters: ["id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  instagramProfile(
    "GET",
    "/desearch/instagram/profile/{username}",
    pathParameters: ["username"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  instagramProfilePosts(
    "GET",
    "/desearch/instagram/profile/{username}/posts",
    pathParameters: ["username"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  instagramSearch(
    "POST",
    "/desearch/instagram/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  listMonitors(
    "GET",
    "/desearch/monitors",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  createMonitor(
    "POST",
    "/desearch/monitors",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  estimateMonitor(
    "POST",
    "/desearch/monitors/estimate",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  deleteMonitor(
    "DELETE",
    "/desearch/monitors/{monitor_id}",
    pathParameters: ["monitor_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getMonitor(
    "GET",
    "/desearch/monitors/{monitor_id}",
    pathParameters: ["monitor_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  updateMonitor(
    "PATCH",
    "/desearch/monitors/{monitor_id}",
    pathParameters: ["monitor_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  listItems(
    "GET",
    "/desearch/monitors/{monitor_id}/items",
    pathParameters: ["monitor_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  listRuns(
    "GET",
    "/desearch/monitors/{monitor_id}/runs",
    pathParameters: ["monitor_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getRun(
    "GET",
    "/desearch/monitors/{monitor_id}/runs/{run_id}",
    pathParameters: ["monitor_id", "run_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  triggerMonitor(
    "POST",
    "/desearch/monitors/{monitor_id}/trigger",
    pathParameters: ["monitor_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  rotateSecret(
    "POST",
    "/desearch/monitors/{monitor_id}/webhook/rotate-secret",
    pathParameters: ["monitor_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  testWebhook(
    "POST",
    "/desearch/monitors/{monitor_id}/webhook/test",
    pathParameters: ["monitor_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  listPeopleProfiles(
    "GET",
    "/desearch/people/profiles",
    pathParameters: [],
    requiredQuery: ["platform"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  exportPeopleProfiles(
    "GET",
    "/desearch/people/profiles/export",
    pathParameters: [],
    requiredQuery: ["platform"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  facebookCreatorSearch(
    "POST",
    "/desearch/people/search/facebook",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  instagramCreatorSearch(
    "POST",
    "/desearch/people/search/instagram",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  linkedinProfileSearch(
    "POST",
    "/desearch/people/search/linkedin",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  tiktokCreatorSearch(
    "POST",
    "/desearch/people/search/tiktok",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  xProfileSearch(
    "POST",
    "/desearch/people/search/x",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  youtubeCreatorSearch(
    "POST",
    "/desearch/people/search/youtube",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  listPeopleTasks(
    "GET",
    "/desearch/people/tasks",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getPeopleTask(
    "GET",
    "/desearch/people/tasks/{task_id}",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  cancelPeopleTask(
    "POST",
    "/desearch/people/tasks/{task_id}/cancel",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  exportPeopleResults(
    "GET",
    "/desearch/people/tasks/{task_id}/export",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  pausePeopleTask(
    "POST",
    "/desearch/people/tasks/{task_id}/pause",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getPeopleResults(
    "GET",
    "/desearch/people/tasks/{task_id}/results",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  resumePeopleTask(
    "POST",
    "/desearch/people/tasks/{task_id}/resume",
    pathParameters: ["task_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  redditComments(
    "GET",
    "/desearch/reddit/comments/{post_id}",
    pathParameters: ["post_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  redditPost(
    "GET",
    "/desearch/reddit/post/{id}",
    pathParameters: ["id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  redditSearch(
    "POST",
    "/desearch/reddit/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  redditSubreddit(
    "GET",
    "/desearch/reddit/subreddit/{name}",
    pathParameters: ["name"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  redditSubredditPosts(
    "GET",
    "/desearch/reddit/subreddit/{name}/posts",
    pathParameters: ["name"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  socialCreator(
    "GET",
    "/desearch/social/creator",
    pathParameters: [],
    requiredQuery: ["url"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  socialPost(
    "GET",
    "/desearch/social/post",
    pathParameters: [],
    requiredQuery: ["url"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  threadsPost(
    "GET",
    "/desearch/threads/post/{id}",
    pathParameters: ["id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  threadsProfile(
    "GET",
    "/desearch/threads/profile/{username}",
    pathParameters: ["username"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  threadsProfilePosts(
    "GET",
    "/desearch/threads/profile/{username}/posts",
    pathParameters: ["username"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  threadsSearch(
    "POST",
    "/desearch/threads/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  threadsSearchUsers(
    "POST",
    "/desearch/threads/search/users",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  tiktokComments(
    "GET",
    "/desearch/tiktok/comments/{video_id}",
    pathParameters: ["video_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  tiktokHashtag(
    "GET",
    "/desearch/tiktok/hashtag/{tag}",
    pathParameters: ["tag"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  tiktokPostById(
    "GET",
    "/desearch/tiktok/post/{id}",
    pathParameters: ["id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  tiktokProfile(
    "GET",
    "/desearch/tiktok/profile/{username}",
    pathParameters: ["username"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  tiktokProfilePosts(
    "GET",
    "/desearch/tiktok/profile/{username}/posts",
    pathParameters: ["username"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  tiktokSearch(
    "POST",
    "/desearch/tiktok/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  tiktokTrending(
    "GET",
    "/desearch/tiktok/trending",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  youtubeChannel(
    "GET",
    "/desearch/youtube/channel/{handle}",
    pathParameters: ["handle"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  youtubeChannelVideos(
    "GET",
    "/desearch/youtube/channel/{handle}/videos",
    pathParameters: ["handle"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  youtubeComments(
    "GET",
    "/desearch/youtube/comments/{video_id}",
    pathParameters: ["video_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  youtubeSearch(
    "POST",
    "/desearch/youtube/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  youtubeTranscript(
    "GET",
    "/desearch/youtube/transcript/{video_id}",
    pathParameters: ["video_id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  youtubeVideo(
    "GET",
    "/desearch/youtube/video/{id}",
    pathParameters: ["id"],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getNetworkStats(
    "GET",
    "/network/stats",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: false,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getNetworkStatsHistory(
    "GET",
    "/network/stats/history",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: false,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  search(
    "POST",
    "/search",
    pathParameters: [],
    requiredQuery: [],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: true,
    bodyRequired: true,
    textResponse: false,
  ),
  xSearch(
    "GET",
    "/twitter",
    pathParameters: [],
    requiredQuery: ["query"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  xPostById(
    "GET",
    "/twitter/post",
    pathParameters: [],
    requiredQuery: ["id"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  xPostRetweeters(
    "GET",
    "/twitter/post/retweeters",
    pathParameters: [],
    requiredQuery: ["id"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  xPostsByUser(
    "GET",
    "/twitter/post/user",
    pathParameters: [],
    requiredQuery: ["user"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  xUserReplies(
    "GET",
    "/twitter/replies",
    pathParameters: [],
    requiredQuery: ["user"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  xPostReplies(
    "GET",
    "/twitter/replies/post",
    pathParameters: [],
    requiredQuery: ["post_id"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  getTrends(
    "GET",
    "/twitter/trends",
    pathParameters: [],
    requiredQuery: ["woeid"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  xPostsByUrls(
    "GET",
    "/twitter/urls",
    pathParameters: [],
    requiredQuery: ["urls"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  xUserPosts(
    "GET",
    "/twitter/user/posts",
    pathParameters: [],
    requiredQuery: ["username"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  webSearch(
    "GET",
    "/web",
    pathParameters: [],
    requiredQuery: ["query"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: false,
  ),
  webCrawl(
    "GET",
    "/web/crawl",
    pathParameters: [],
    requiredQuery: ["url"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: true,
  ),
  desearchCrawl(
    "GET",
    "/web/extract",
    pathParameters: [],
    requiredQuery: ["url"],
    commaSeparated: [],
    authenticated: true,
    acceptsBody: false,
    bodyRequired: false,
    textResponse: true,
  );

  const DesearchOperation(
    this.method,
    this.path, {
    required this.pathParameters,
    required this.requiredQuery,
    required this.commaSeparated,
    required this.authenticated,
    required this.acceptsBody,
    required this.bodyRequired,
    required this.textResponse,
  });
  final String method;
  final String path;
  final List<String> pathParameters;
  final List<String> requiredQuery;
  final List<String> commaSeparated;
  final bool authenticated;
  final bool acceptsBody;
  final bool bodyRequired;
  final bool textResponse;
}

/// Named endpoint wrappers sharing the same transport and error handling.
extension DesearchEndpoints on Desearch {
  /// POST /desearch/ai/search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> aiSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.aiSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/ai/search/links/twitter. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> aiXLinksSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.aiXLinksSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/ai/search/links/web. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> aiWebLinksSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.aiWebLinksSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/companies/enrich. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> companyEnrich({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.companyEnrich,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/companies/search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> companySearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.companySearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/companies/tasks. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> listCompanyTasks({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.listCompanyTasks,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/companies/tasks/{task_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getCompanyTask({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getCompanyTask,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/companies/tasks/{task_id}/cancel. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> cancelCompanyTask({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.cancelCompanyTask,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/companies/tasks/{task_id}/export. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> exportCompanyResults({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.exportCompanyResults,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/companies/tasks/{task_id}/pause. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> pauseCompanyTask({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.pauseCompanyTask,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/companies/tasks/{task_id}/results. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getCompanyResults({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getCompanyResults,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/companies/tasks/{task_id}/resume. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> resumeCompanyTask({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.resumeCompanyTask,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/facebook/comments/{post_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> facebookComments({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.facebookComments,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/facebook/hashtag/{tag}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> facebookHashtag({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.facebookHashtag,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/facebook/post/{id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> facebookPostById({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.facebookPostById,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/facebook/profile/{profile_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> facebookProfile({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.facebookProfile,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/facebook/profile/{profile_id}/posts. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> facebookProfilePosts({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.facebookProfilePosts,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/facebook/search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> facebookSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.facebookSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/instagram/comments/{shortcode}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> instagramComments({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.instagramComments,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/instagram/hashtag/{tag}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> instagramHashtag({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.instagramHashtag,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/instagram/media/{id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> instagramMedia({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.instagramMedia,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/instagram/profile/{username}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> instagramProfile({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.instagramProfile,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/instagram/profile/{username}/posts. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> instagramProfilePosts({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.instagramProfilePosts,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/instagram/search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> instagramSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.instagramSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/monitors. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> listMonitors({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.listMonitors,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/monitors. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> createMonitor({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.createMonitor,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/monitors/estimate. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> estimateMonitor({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.estimateMonitor,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// DELETE /desearch/monitors/{monitor_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> deleteMonitor({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.deleteMonitor,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/monitors/{monitor_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getMonitor({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getMonitor,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// PATCH /desearch/monitors/{monitor_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> updateMonitor({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.updateMonitor,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/monitors/{monitor_id}/items. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> listItems({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.listItems,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/monitors/{monitor_id}/runs. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> listRuns({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.listRuns,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/monitors/{monitor_id}/runs/{run_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getRun({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getRun,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/monitors/{monitor_id}/trigger. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> triggerMonitor({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.triggerMonitor,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/monitors/{monitor_id}/webhook/rotate-secret. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> rotateSecret({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.rotateSecret,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/monitors/{monitor_id}/webhook/test. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> testWebhook({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.testWebhook,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/people/profiles. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> listPeopleProfiles({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.listPeopleProfiles,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/people/profiles/export. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> exportPeopleProfiles({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.exportPeopleProfiles,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/search/facebook. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> facebookCreatorSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.facebookCreatorSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/search/instagram. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> instagramCreatorSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.instagramCreatorSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/search/linkedin. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> linkedinProfileSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.linkedinProfileSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/search/tiktok. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> tiktokCreatorSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.tiktokCreatorSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/search/x. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xProfileSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xProfileSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/search/youtube. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> youtubeCreatorSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.youtubeCreatorSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/people/tasks. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> listPeopleTasks({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.listPeopleTasks,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/people/tasks/{task_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getPeopleTask({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getPeopleTask,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/tasks/{task_id}/cancel. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> cancelPeopleTask({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.cancelPeopleTask,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/people/tasks/{task_id}/export. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> exportPeopleResults({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.exportPeopleResults,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/tasks/{task_id}/pause. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> pausePeopleTask({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.pausePeopleTask,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/people/tasks/{task_id}/results. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getPeopleResults({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getPeopleResults,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/people/tasks/{task_id}/resume. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> resumePeopleTask({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.resumePeopleTask,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/reddit/comments/{post_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> redditComments({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.redditComments,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/reddit/post/{id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> redditPost({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.redditPost,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/reddit/search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> redditSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.redditSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/reddit/subreddit/{name}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> redditSubreddit({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.redditSubreddit,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/reddit/subreddit/{name}/posts. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> redditSubredditPosts({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.redditSubredditPosts,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/social/creator. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> socialCreator({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.socialCreator,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/social/post. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> socialPost({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.socialPost,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/threads/post/{id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> threadsPost({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.threadsPost,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/threads/profile/{username}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> threadsProfile({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.threadsProfile,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/threads/profile/{username}/posts. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> threadsProfilePosts({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.threadsProfilePosts,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/threads/search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> threadsSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.threadsSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/threads/search/users. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> threadsSearchUsers({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.threadsSearchUsers,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/tiktok/comments/{video_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> tiktokComments({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.tiktokComments,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/tiktok/hashtag/{tag}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> tiktokHashtag({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.tiktokHashtag,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/tiktok/post/{id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> tiktokPostById({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.tiktokPostById,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/tiktok/profile/{username}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> tiktokProfile({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.tiktokProfile,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/tiktok/profile/{username}/posts. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> tiktokProfilePosts({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.tiktokProfilePosts,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/tiktok/search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> tiktokSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.tiktokSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/tiktok/trending. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> tiktokTrending({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.tiktokTrending,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/youtube/channel/{handle}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> youtubeChannel({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.youtubeChannel,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/youtube/channel/{handle}/videos. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> youtubeChannelVideos({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.youtubeChannelVideos,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/youtube/comments/{video_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> youtubeComments({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.youtubeComments,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /desearch/youtube/search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> youtubeSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.youtubeSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/youtube/transcript/{video_id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> youtubeTranscript({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.youtubeTranscript,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /desearch/youtube/video/{id}. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> youtubeVideo({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.youtubeVideo,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /network/stats. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getNetworkStats({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getNetworkStats,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /network/stats/history. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getNetworkStatsHistory({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getNetworkStatsHistory,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// POST /search. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> search({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.search,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter/post. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xPostById({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xPostById,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter/post/retweeters. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xPostRetweeters({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xPostRetweeters,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter/post/user. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xPostsByUser({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xPostsByUser,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter/replies. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xUserReplies({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xUserReplies,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter/replies/post. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xPostReplies({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xPostReplies,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter/trends. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> getTrends({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.getTrends,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter/urls. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xPostsByUrls({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xPostsByUrls,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /twitter/user/posts. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> xUserPosts({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.xUserPosts,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /web. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> webSearch({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.webSearch,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /web/crawl. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> webCrawl({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.webCrawl,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );

  /// GET /web/extract. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> desearchCrawl({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(
    DesearchOperation.desearchCrawl,
    pathParameters: pathParameters,
    query: query,
    body: body,
  );
}
