#!/bin/bash

# Before continuing this script, let's ask the user what episode
# they wish to download

echo "Enter the season you wish to download episode from (ex: 01, 02, etc...)"
read season
echo
echo "Enter the episode you wish to download from desired season (ex: 01, 02, etc..)."
read episodenumber
echo
echo
echo "You have chosen Season $season Episode $episodenumber. Press enter to continue."
read enter
echo
echo
# Now we take the user input and cat the season list containing
# the episode. Also, a destination needs to be set.
EPISODE_LIST="../episodes.list.d/season$season.list"
DWNDIR="../download"

mkdir -p $DWNDIR

# Rather than download all episodes within the list file, 
# let's pick out the episode we want from the list.

# Due to pattern changes between seasons 1-4,
# an if statement will be needed to reflect those patterns 
# so the right episode is picked from the list.

if [ $season == '01' ]
# In season 1, there are no leading zeros, so we'll remove them before searching
# for the episode in the list.
then
    episodenumber=$(echo $episodenumber|sed 's/^0*//') # Remove leading zero
    EPISODE=$(sed -n "/\<ep$episodenumber\>/p" $EPISODE_LIST) 

elif [[ $season == '02' || $season == '03' ]]
then
    EPISODE=$(sed -n  "/$seasonx$episodenumber/p" $EPISODE_LIST) 

else
    EPISODE=$(sed -n "/$season$episodenumber/p" $EPISODE_LIST) 

fi

# Once we have the episode chosen, now we can download it using wget. Yay!
wget -c --no-check-certificate --directory-prefix=$DWNDIR $EPISODE

#find $EPISODE_LISTS -type f | read -r EPLIST

#do
#	wget -c --directory-prefix=$DWNDIR --input-file=$EPLIST
#done
