class APIUrls{
  static String geoCOdingApi(String location,String apiKey) =>
       "http://api.openweathermap.org/geo/1.0/direct?q=$location&limit=5&appid={$apiKey}";
}