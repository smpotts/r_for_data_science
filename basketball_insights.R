### Basketball Insights ###

# salary
myplot(Salary)
myplot(Salary/ Games)
myplot(Salary / FieldGoals)

# in game metrics
myplot(MinutesPlayed)
myplot(Points)

# in game metrics normalized
# looking at it per game normalizes data because it's accounting for injuries
myplot(FieldGoals/ Games)
myplot(FieldGoals/ FieldGoalAttempts) # basically player accuracy
myplot(FieldGoalAttempts/ Games)
myplot(Points/ Games)

# interesting observations
myplot(MinutesPlayed/ Games)
myplot(Games)

# time is valuable
myplot(FieldGoals/ MinutesPlayed)

# player style
myplot(Points/ FieldGoals)
