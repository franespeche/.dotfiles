from datetime import datetime
import time
import os

now = datetime.now()

state = open('.state', 'r')

if state.read() == 'running':
    state.close()

    # read track and calculate diff
    track = open('.track', 'r')
    startTime = datetime.strptime(track.read(), '%Y-%m-%d %H:%M:%S.%f')
    endTime = now
    diff = endTime - startTime
    print(diff)

    # append to history
    history = open('.history', 'a')
    history.write('%s\n' % diff)
    history.close()
    track.close()

    # change state
    state = open('.state', 'w')
    state.write('off')
    state.close()

    print('ended :)')
else:
    state.close()

    # create new tracking file with starting time
    track = open('.track', 'w')
    track.write('%s' % now)
    track.close()

    # change state
    state = open('.state', 'w')
    state.write('running')
    state.close()

    print('started :)')


track.close()
