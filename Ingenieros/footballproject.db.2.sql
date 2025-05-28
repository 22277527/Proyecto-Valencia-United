CREATE TABLE stadium (
    stadium_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    capacity INT
);

CREATE TABLE Weather (
    match_id INT,
    weather_id INT,
    temperature DECIMAL(5,2),
    conditions VARCHAR(50),
    humidity DECIMAL(3,2),
    precipitation VARCHAR(20),
    wind_speed_in_km_h DECIMAL(4,2),
    PRIMARY KEY (match_id, weather_id),
    FOREIGN KEY (match_id) REFERENCES Match_Table(match_id) ON DELETE CASCADE
);

CREATE TABLE Match_Table (
    match_id INT PRIMARY KEY,
    stadium_id INT,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    result VARCHAR(20),
    total_time INT,
    FOREIGN KEY (stadium_id) REFERENCES stadium(stadium_id) ON DELETE CASCADE,
    FOREIGN KEY (home_team_id) REFERENCES Team(team_id) ON DELETE CASCADE,
    FOREIGN KEY (away_team_id) REFERENCES Team(team_id) ON DELETE CASCADE,
    attendance INT,
);

CREATE TABLE Team (
    team_id INT PRIMARY KEY,
    coach_id INT,
    name VARCHAR(50),
    league VARCHAR(50),
    FOREIGN KEY (coach_id) REFERENCES Coach(coach_id) ON DELETE CASCADE
);

CREATE TABLE Coach (
    coach_id INT PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE,
    nationality VARCHAR(50),
    role VARCHAR(50)
);

CREATE TABLE Player (
    player_id INT PRIMARY KEY,
    name VARCHAR(100),
    birthdate DATE,
    nationality VARCHAR(50),
    position VARCHAR(50),
    market_value DECIMAL(10,2),
    current_team_id INT,
    instagram_followers INT,
    engagement_rate DECIMAL(3,2),
    media_mentions INT,
    FOREIGN KEY (current_team_id) REFERENCES Team(team_id) ON DELETE CASCADE
);

CREATE TABLE Player_Stats (
    stat_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    goals INT,
    assists INT,
    yellow_cards INT,
    red_cards INT,
    minutes_played INT,
    distance_covered_in_meters INT,
    sprints INT,
    pass_completion_rate INT,
    tackles INT,
    interceptions INT,
    dribbles INT,
    shots_on_target INT,
    FOREIGN KEY (match_id) REFERENCES Match_Table(match_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES Player(player_id) ON DELETE CASCADE
);

CREATE TABLE Formation (
    formation_id INT PRIMARY KEY,
    coach_id INT,
    type VARCHAR(50),
    FOREIGN KEY (coach_id) REFERENCES Coach(coach_id) ON DELETE CASCADE
);

CREATE TABLE Fan (
    fan_id INT PRIMARY KEY,
    loyalty_points INT
);

CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY,
    fan_id INT,
    match_id INT,
    seat_number VARCHAR(50),
    price DECIMAL(8,2),
    purchase_date DATE,
    FOREIGN KEY (fan_id) REFERENCES Fan(fan_id) ON DELETE CASCADE,
    FOREIGN KEY (match_id) REFERENCES Match_Table(match_id) ON DELETE CASCADE
);




