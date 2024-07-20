USE `Proj_3`;

-- problem one
Select tweets.retweet_count, tweets.text_body, TwitterUser.screen_name,
TwitterUser.category, TwitterUser.sub_category from tweets join TwitterUser on
TwitterUser.screen_name = tweets.posting_user where tweets.year_posted = 2016
order by tweets.retweet_count desc limit 10;

-- problem two
Select count(distinct TwitterUser.state), group_concat(distinct TwitterUser.state ), hashtag_used.tag_name
from hashtag_used join tweets on hashtag_used.tweet_id = tweets.tweet_id  Join TwitterUser on 
tweets.posting_user = TwitterUser.screen_name  where tweets.year_posted = 2016 and not 
(TwitterUser.state = 'na') Group by
hashtag_used.tag_name order by count(distinct TwitterUser.state) desc Limit 10;

-- problem three
Select TwitterUser.screen_name, TwitterUser.state from TwitterUser Join tweet_mentions on
TwitterUser.screen_name = tweet_mentions.screen_name Join hashtag_used on tweet_mentions.tweet_id =
hashtag_used.tweet_id join hashtags on hashtag_used.tag_name = hashtags.tag_name where
hashtags.tag_name = 'iowacaucus' or hashtags.tag_name = 'iacaucus' group by
TwitterUser.screen_name order by TwitterUser.followers desc;

-- problem four
(Select TwitterUser.screen_name, TwitterUser.sub_category, TwitterUser.followers from TwitterUser
where TwitterUser.sub_category = 'GOP' Order by TwitterUser.followers desc limit 5 
)union all( 
Select TwitterUser.screen_name, TwitterUser.sub_category, TwitterUser.followers from TwitterUser
where TwitterUser.sub_category = 'Democrat' Order by TwitterUser.followers desc limit 5);

-- problem five
Select hashtag_used.tag_name, count(tweets.tweet_id) from hashtag_used join tweets on hashtag_used.tweet_id = tweets.tweet_id join hashtags on
hashtag_used.tag_name = hashtags.tag_name 
join TwitterUser on tweets.posting_user = TwitterUser.screen_name
where TwitterUser.state = 'Iowa' and tweets.year_posted = 2016 and tweets.month_posted = 1
group by hashtags.tag_name order by count(tweets.tweet_id) desc;

-- problem six 
Select tweets.text_body, hashtag_used.tag_name as hashtag, TwitterUser.screen_name, TwitterUser.category
from hashtag_used join hashtags on hashtag_used.tag_name = hashtags.tag_name
join tweets on tweets.tweet_id = hashtag_used.tweet_id 
join TwitterUser on tweets.posting_user = TwitterUser.screen_name
where hashtags.tag_name = 'Iowa' and (TwitterUser.sub_category = 'GOP' or 
TwitterUser.sub_category = 'Democrat')
and tweets.year_posted = 2016 and tweets.month_posted = 2;

-- problem seven
Select twitteruser.screen_name, count(tweets.tweet_id),
group_concat(url_used.url) 
from tweets join twitteruser on tweets.posting_user = twitteruser.screen_name
join url_used on url_used.tweet_id = tweets.tweet_id
Where twitteruser.sub_category = 'GOP' and tweets.month_posted = 1 and tweets.year_posted = 2016
group by twitteruser.screen_name
order by count(tweets.tweet_id) Desc;

-- problem eight 
Select tweet_mentions.screen_name, TwitterUser.followers, Count(distinct tweets.posting_user) 
from TwitterUser
join tweet_mentions on tweet_mentions.screen_name = TwitterUser.screen_name
join tweets on tweet_mentions.tweet_id = tweets.tweet_id
group by tweet_mentions.screen_name
order bY count(distinct tweets.posting_user) desc limit 10;

-- problem nine
Select url_used.url, count(tweets.tweet_id) from tweets join url_used on
url_used.tweet_id = tweets.tweet_id join TwitterUser on tweets.posting_user = TwitterUser.screen_name
where TwitterUser.sub_category = 'GOP' and (tweets.month_posted = 1 or tweets.month_posted
= 2 or tweets.month_posted = 3) and tweets.year_posted = 2016
group by url_used.url order by count(tweets.tweet_id) desc limit 10;

