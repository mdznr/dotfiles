# Opens the next calendar event’s URL
function next_event
	# Use iCal Buddy to get Calendar events.
	# Only search the “Apple” calendar
	# Exclude all-day events
	# Only include upcoming events
	# Only show the next 1 event
	# Only output the “url” property of this event
	# Omit the names of the properties from the output. Since we’re only outputting the URL, including the property name in the output would be unnecessary. Removing this makes it easier to open with `open`.
	# By default, `icalBuddy` uses bullet points for each event. Set this to an empty string to omit that.
	# Only print the events occurring today
	# Pipe this into `open` to open the URL (in the default app, like Safari).
	icalBuddy --includeCals Apple --excludeAllDayEvents -includeOnlyEventsFromNowOn --limitItems 1 --includeEventProps url --noPropNames --bullet "" eventsToday | xargs open
end
