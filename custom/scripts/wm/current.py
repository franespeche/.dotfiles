from datetime import datetime
now = datetime.now()

# read track and calculate diff
track = open('.track', 'r')
startTime = datetime.strptime(track.read(), '%Y-%m-%d %H:%M:%S.%f')
endTime = now
diff = endTime - startTime
track.close()

print(diff)

