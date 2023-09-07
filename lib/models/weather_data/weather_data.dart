/// latitude : 37.0
/// longitude : 27.3125
/// generationtime_ms : 0.9139776229858398
/// utc_offset_seconds : 10800
/// timezone : "Europe/Istanbul"
/// timezone_abbreviation : "+03"
/// elevation : 0.0
/// current_weather : {"temperature":30.9,"windspeed":5.19,"winddirection":310,"weathercode":0,"is_day":1,"time":"2023-09-07T16:00"}
/// hourly_units : {"time":"iso8601","temperature_2m":"°C","weathercode":"wmo code"}
/// hourly : {"time":["2023-09-07T00:00","2023-09-07T01:00","2023-09-07T02:00","2023-09-07T03:00","2023-09-07T04:00","2023-09-07T05:00","2023-09-07T06:00","2023-09-07T07:00","2023-09-07T08:00","2023-09-07T09:00","2023-09-07T10:00","2023-09-07T11:00","2023-09-07T12:00","2023-09-07T13:00","2023-09-07T14:00","2023-09-07T15:00","2023-09-07T16:00","2023-09-07T17:00","2023-09-07T18:00","2023-09-07T19:00","2023-09-07T20:00","2023-09-07T21:00","2023-09-07T22:00","2023-09-07T23:00","2023-09-08T00:00","2023-09-08T01:00","2023-09-08T02:00","2023-09-08T03:00","2023-09-08T04:00","2023-09-08T05:00","2023-09-08T06:00","2023-09-08T07:00","2023-09-08T08:00","2023-09-08T09:00","2023-09-08T10:00","2023-09-08T11:00","2023-09-08T12:00","2023-09-08T13:00","2023-09-08T14:00","2023-09-08T15:00","2023-09-08T16:00","2023-09-08T17:00","2023-09-08T18:00","2023-09-08T19:00","2023-09-08T20:00","2023-09-08T21:00","2023-09-08T22:00","2023-09-08T23:00","2023-09-09T00:00","2023-09-09T01:00","2023-09-09T02:00","2023-09-09T03:00","2023-09-09T04:00","2023-09-09T05:00","2023-09-09T06:00","2023-09-09T07:00","2023-09-09T08:00","2023-09-09T09:00","2023-09-09T10:00","2023-09-09T11:00","2023-09-09T12:00","2023-09-09T13:00","2023-09-09T14:00","2023-09-09T15:00","2023-09-09T16:00","2023-09-09T17:00","2023-09-09T18:00","2023-09-09T19:00","2023-09-09T20:00","2023-09-09T21:00","2023-09-09T22:00","2023-09-09T23:00"],"temperature_2m":[25.1,24.9,24.6,24.3,24.1,23.8,23.3,23.2,24.8,26.9,28.0,29.5,29.9,30.1,30.8,31.0,30.9,30.1,29.6,28.5,27.7,27.3,27.1,26.6,26.4,26.3,25.8,25.2,24.9,24.7,24.5,24.3,25.0,27.0,28.7,30.1,31.2,31.6,31.2,31.0,30.9,30.5,29.7,28.8,28.0,27.5,27.2,26.6,26.0,25.4,25.0,24.8,24.7,24.9,25.1,25.2,26.3,27.5,28.3,29.0,29.2,29.6,29.7,29.7,29.6,29.1,28.5,27.8,27.2,27.0,27.0,26.8],"weathercode":[0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,2,2,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,0,1,0,0,0,0,1,0,0,1,1,1,2,1,1,0,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0]}
/// daily_units : {"time":"iso8601","weathercode":"wmo code","temperature_2m_max":"°C","temperature_2m_min":"°C"}
/// daily : {"time":["2023-09-07","2023-09-08","2023-09-09"],"weathercode":[2,2,2],"temperature_2m_max":[31.0,31.6,29.7],"temperature_2m_min":[23.2,24.3,24.7]}

class WeatherData {
  WeatherData({
      double latitude, 
      double longitude, 
      double generationtimeMs, 
      int utcOffsetSeconds, 
      String timezone, 
      String timezoneAbbreviation, 
      double elevation, 
      CurrentWeather currentWeather, 
      HourlyUnits hourlyUnits, 
      Hourly hourly, 
      DailyUnits dailyUnits, 
      Daily daily,}){
    _latitude = latitude;
    _longitude = longitude;
    _generationtimeMs = generationtimeMs;
    _utcOffsetSeconds = utcOffsetSeconds;
    _timezone = timezone;
    _timezoneAbbreviation = timezoneAbbreviation;
    _elevation = elevation;
    _currentWeather = currentWeather;
    _hourlyUnits = hourlyUnits;
    _hourly = hourly;
    _dailyUnits = dailyUnits;
    _daily = daily;
}

  WeatherData.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _generationtimeMs = json['generationtime_ms'];
    _utcOffsetSeconds = json['utc_offset_seconds'];
    _timezone = json['timezone'];
    _timezoneAbbreviation = json['timezone_abbreviation'];
    _elevation = json['elevation'];
    _currentWeather = json['current_weather'] != null ? CurrentWeather.fromJson(json['current_weather']) : null;
    _hourlyUnits = json['hourly_units'] != null ? HourlyUnits.fromJson(json['hourly_units']) : null;
    _hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
    _dailyUnits = json['daily_units'] != null ? DailyUnits.fromJson(json['daily_units']) : null;
    _daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
  }
  double _latitude;
  double _longitude;
  double _generationtimeMs;
  int _utcOffsetSeconds;
  String _timezone;
  String _timezoneAbbreviation;
  double _elevation;
  CurrentWeather _currentWeather;
  HourlyUnits _hourlyUnits;
  Hourly _hourly;
  DailyUnits _dailyUnits;
  Daily _daily;
WeatherData copyWith({  double latitude,
  double longitude,
  double generationtimeMs,
  int utcOffsetSeconds,
  String timezone,
  String timezoneAbbreviation,
  double elevation,
  CurrentWeather currentWeather,
  HourlyUnits hourlyUnits,
  Hourly hourly,
  DailyUnits dailyUnits,
  Daily daily,
}) => WeatherData(  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  generationtimeMs: generationtimeMs ?? _generationtimeMs,
  utcOffsetSeconds: utcOffsetSeconds ?? _utcOffsetSeconds,
  timezone: timezone ?? _timezone,
  timezoneAbbreviation: timezoneAbbreviation ?? _timezoneAbbreviation,
  elevation: elevation ?? _elevation,
  currentWeather: currentWeather ?? _currentWeather,
  hourlyUnits: hourlyUnits ?? _hourlyUnits,
  hourly: hourly ?? _hourly,
  dailyUnits: dailyUnits ?? _dailyUnits,
  daily: daily ?? _daily,
);
  double get latitude => _latitude;
  double get longitude => _longitude;
  double get generationtimeMs => _generationtimeMs;
  int get utcOffsetSeconds => _utcOffsetSeconds;
  String get timezone => _timezone;
  String get timezoneAbbreviation => _timezoneAbbreviation;
  double get elevation => _elevation;
  CurrentWeather get currentWeather => _currentWeather;
  HourlyUnits get hourlyUnits => _hourlyUnits;
  Hourly get hourly => _hourly;
  DailyUnits get dailyUnits => _dailyUnits;
  Daily get daily => _daily;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['generationtime_ms'] = _generationtimeMs;
    map['utc_offset_seconds'] = _utcOffsetSeconds;
    map['timezone'] = _timezone;
    map['timezone_abbreviation'] = _timezoneAbbreviation;
    map['elevation'] = _elevation;
    if (_currentWeather != null) {
      map['current_weather'] = _currentWeather.toJson();
    }
    if (_hourlyUnits != null) {
      map['hourly_units'] = _hourlyUnits.toJson();
    }
    if (_hourly != null) {
      map['hourly'] = _hourly.toJson();
    }
    if (_dailyUnits != null) {
      map['daily_units'] = _dailyUnits.toJson();
    }
    if (_daily != null) {
      map['daily'] = _daily.toJson();
    }
    return map;
  }

}

/// time : ["2023-09-07","2023-09-08","2023-09-09"]
/// weathercode : [2,2,2]
/// temperature_2m_max : [31.0,31.6,29.7]
/// temperature_2m_min : [23.2,24.3,24.7]

class Daily {
  Daily({
      List<String> time, 
      List<int> weathercode, 
      List<double> temperature2mMax, 
      List<double> temperature2mMin,}){
    _time = time;
    _weathercode = weathercode;
    _temperature2mMax = temperature2mMax;
    _temperature2mMin = temperature2mMin;
}

  Daily.fromJson(dynamic json) {
    _time = json['time'] != null ? json['time'].cast<String>() : [];
    _weathercode = json['weathercode'] != null ? json['weathercode'].cast<int>() : [];
    _temperature2mMax = json['temperature_2m_max'] != null ? json['temperature_2m_max'].cast<double>() : [];
    _temperature2mMin = json['temperature_2m_min'] != null ? json['temperature_2m_min'].cast<double>() : [];
  }
  List<String> _time;
  List<int> _weathercode;
  List<double> _temperature2mMax;
  List<double> _temperature2mMin;
Daily copyWith({  List<String> time,
  List<int> weathercode,
  List<double> temperature2mMax,
  List<double> temperature2mMin,
}) => Daily(  time: time ?? _time,
  weathercode: weathercode ?? _weathercode,
  temperature2mMax: temperature2mMax ?? _temperature2mMax,
  temperature2mMin: temperature2mMin ?? _temperature2mMin,
);
  List<String> get time => _time;
  List<int> get weathercode => _weathercode;
  List<double> get temperature2mMax => _temperature2mMax;
  List<double> get temperature2mMin => _temperature2mMin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['weathercode'] = _weathercode;
    map['temperature_2m_max'] = _temperature2mMax;
    map['temperature_2m_min'] = _temperature2mMin;
    return map;
  }

}

/// time : "iso8601"
/// weathercode : "wmo code"
/// temperature_2m_max : "°C"
/// temperature_2m_min : "°C"

class DailyUnits {
  DailyUnits({
      String time, 
      String weathercode, 
      String temperature2mMax, 
      String temperature2mMin,}){
    _time = time;
    _weathercode = weathercode;
    _temperature2mMax = temperature2mMax;
    _temperature2mMin = temperature2mMin;
}

  DailyUnits.fromJson(dynamic json) {
    _time = json['time'];
    _weathercode = json['weathercode'];
    _temperature2mMax = json['temperature_2m_max'];
    _temperature2mMin = json['temperature_2m_min'];
  }
  String _time;
  String _weathercode;
  String _temperature2mMax;
  String _temperature2mMin;
DailyUnits copyWith({  String time,
  String weathercode,
  String temperature2mMax,
  String temperature2mMin,
}) => DailyUnits(  time: time ?? _time,
  weathercode: weathercode ?? _weathercode,
  temperature2mMax: temperature2mMax ?? _temperature2mMax,
  temperature2mMin: temperature2mMin ?? _temperature2mMin,
);
  String get time => _time;
  String get weathercode => _weathercode;
  String get temperature2mMax => _temperature2mMax;
  String get temperature2mMin => _temperature2mMin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['weathercode'] = _weathercode;
    map['temperature_2m_max'] = _temperature2mMax;
    map['temperature_2m_min'] = _temperature2mMin;
    return map;
  }

}

/// time : ["2023-09-07T00:00","2023-09-07T01:00","2023-09-07T02:00","2023-09-07T03:00","2023-09-07T04:00","2023-09-07T05:00","2023-09-07T06:00","2023-09-07T07:00","2023-09-07T08:00","2023-09-07T09:00","2023-09-07T10:00","2023-09-07T11:00","2023-09-07T12:00","2023-09-07T13:00","2023-09-07T14:00","2023-09-07T15:00","2023-09-07T16:00","2023-09-07T17:00","2023-09-07T18:00","2023-09-07T19:00","2023-09-07T20:00","2023-09-07T21:00","2023-09-07T22:00","2023-09-07T23:00","2023-09-08T00:00","2023-09-08T01:00","2023-09-08T02:00","2023-09-08T03:00","2023-09-08T04:00","2023-09-08T05:00","2023-09-08T06:00","2023-09-08T07:00","2023-09-08T08:00","2023-09-08T09:00","2023-09-08T10:00","2023-09-08T11:00","2023-09-08T12:00","2023-09-08T13:00","2023-09-08T14:00","2023-09-08T15:00","2023-09-08T16:00","2023-09-08T17:00","2023-09-08T18:00","2023-09-08T19:00","2023-09-08T20:00","2023-09-08T21:00","2023-09-08T22:00","2023-09-08T23:00","2023-09-09T00:00","2023-09-09T01:00","2023-09-09T02:00","2023-09-09T03:00","2023-09-09T04:00","2023-09-09T05:00","2023-09-09T06:00","2023-09-09T07:00","2023-09-09T08:00","2023-09-09T09:00","2023-09-09T10:00","2023-09-09T11:00","2023-09-09T12:00","2023-09-09T13:00","2023-09-09T14:00","2023-09-09T15:00","2023-09-09T16:00","2023-09-09T17:00","2023-09-09T18:00","2023-09-09T19:00","2023-09-09T20:00","2023-09-09T21:00","2023-09-09T22:00","2023-09-09T23:00"]
/// temperature_2m : [25.1,24.9,24.6,24.3,24.1,23.8,23.3,23.2,24.8,26.9,28.0,29.5,29.9,30.1,30.8,31.0,30.9,30.1,29.6,28.5,27.7,27.3,27.1,26.6,26.4,26.3,25.8,25.2,24.9,24.7,24.5,24.3,25.0,27.0,28.7,30.1,31.2,31.6,31.2,31.0,30.9,30.5,29.7,28.8,28.0,27.5,27.2,26.6,26.0,25.4,25.0,24.8,24.7,24.9,25.1,25.2,26.3,27.5,28.3,29.0,29.2,29.6,29.7,29.7,29.6,29.1,28.5,27.8,27.2,27.0,27.0,26.8]
/// weathercode : [0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,2,2,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,0,1,0,0,0,0,1,0,0,1,1,1,2,1,1,0,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0]

class Hourly {
  Hourly({
      List<String> time, 
      List<double> temperature2m, 
      List<int> weathercode,}){
    _time = time;
    _temperature2m = temperature2m;
    _weathercode = weathercode;
}

  Hourly.fromJson(dynamic json) {
    _time = json['time'] != null ? json['time'].cast<String>() : [];
    _temperature2m = json['temperature_2m'] != null ? json['temperature_2m'].cast<double>() : [];
    _weathercode = json['weathercode'] != null ? json['weathercode'].cast<int>() : [];
  }
  List<String> _time;
  List<double> _temperature2m;
  List<int> _weathercode;
Hourly copyWith({  List<String> time,
  List<double> temperature2m,
  List<int> weathercode,
}) => Hourly(  time: time ?? _time,
  temperature2m: temperature2m ?? _temperature2m,
  weathercode: weathercode ?? _weathercode,
);
  List<String> get time => _time;
  List<double> get temperature2m => _temperature2m;
  List<int> get weathercode => _weathercode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['temperature_2m'] = _temperature2m;
    map['weathercode'] = _weathercode;
    return map;
  }

}

/// time : "iso8601"
/// temperature_2m : "°C"
/// weathercode : "wmo code"

class HourlyUnits {
  HourlyUnits({
      String time, 
      String temperature2m, 
      String weathercode,}){
    _time = time;
    _temperature2m = temperature2m;
    _weathercode = weathercode;
}

  HourlyUnits.fromJson(dynamic json) {
    _time = json['time'];
    _temperature2m = json['temperature_2m'];
    _weathercode = json['weathercode'];
  }
  String _time;
  String _temperature2m;
  String _weathercode;
HourlyUnits copyWith({  String time,
  String temperature2m,
  String weathercode,
}) => HourlyUnits(  time: time ?? _time,
  temperature2m: temperature2m ?? _temperature2m,
  weathercode: weathercode ?? _weathercode,
);
  String get time => _time;
  String get temperature2m => _temperature2m;
  String get weathercode => _weathercode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['temperature_2m'] = _temperature2m;
    map['weathercode'] = _weathercode;
    return map;
  }

}

/// temperature : 30.9
/// windspeed : 5.19
/// winddirection : 310
/// weathercode : 0
/// is_day : 1
/// time : "2023-09-07T16:00"

class CurrentWeather {
  CurrentWeather({
      double temperature, 
      double windspeed, 
      int winddirection, 
      int weathercode, 
      int isDay, 
      String time,}){
    _temperature = temperature;
    _windspeed = windspeed;
    _winddirection = winddirection;
    _weathercode = weathercode;
    _isDay = isDay;
    _time = time;
}

  CurrentWeather.fromJson(dynamic json) {
    _temperature = json['temperature'];
    _windspeed = json['windspeed'];
    _winddirection = json['winddirection'];
    _weathercode = json['weathercode'];
    _isDay = json['is_day'];
    _time = json['time'];
  }
  double _temperature;
  double _windspeed;
  int _winddirection;
  int _weathercode;
  int _isDay;
  String _time;
CurrentWeather copyWith({  double temperature,
  double windspeed,
  int winddirection,
  int weathercode,
  int isDay,
  String time,
}) => CurrentWeather(  temperature: temperature ?? _temperature,
  windspeed: windspeed ?? _windspeed,
  winddirection: winddirection ?? _winddirection,
  weathercode: weathercode ?? _weathercode,
  isDay: isDay ?? _isDay,
  time: time ?? _time,
);
  double get temperature => _temperature;
  double get windspeed => _windspeed;
  int get winddirection => _winddirection;
  int get weathercode => _weathercode;
  int get isDay => _isDay;
  String get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temperature'] = _temperature;
    map['windspeed'] = _windspeed;
    map['winddirection'] = _winddirection;
    map['weathercode'] = _weathercode;
    map['is_day'] = _isDay;
    map['time'] = _time;
    return map;
  }

}