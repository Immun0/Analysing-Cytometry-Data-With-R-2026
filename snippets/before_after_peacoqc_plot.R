class(Reordered_RENAMED_FLOWSET[1])
class(CLEANED_PEACOQC[1])

BEFORE <- autoplot(
  Reordered_RENAMED_FLOWSET[1],
  "Time_Time",
  "Sm149Di_CD34",
  bins = 256
)

AFTER <- autoplot(
  CLEANED_PEACOQC[1],
  "Time_Time",
  "Sm149Di_CD34",
  bins = 256
)

BEFORE
AFTER
