library(tidyverse)
require("httr")
require("jsonlite")
require("anytime")
require("plotly")
library(plotly)
library(htmlwidgets)

alan <- paste("https://aoe2.net/api/player/ratinghistory?game=aoe2de&leaderboard_id=4&steam_id=76561199207580572&count=1000")
alanhr <- GET(alan)
alanhr_text <- content(alanhr, "text")
alanhr_json <- fromJSON(alanhr_text, flatten = TRUE)
alandf <- as.data.frame(alanhr_json)
alandf <-cbind(alandf, player='alanthekat')

dicopato <- paste("https://aoe2.net/api/player/ratinghistory?game=aoe2de&leaderboard_id=4&steam_id=76561199195740571&count=1000")
dicopatohr <- GET(dicopato)
dicopatohr_text <- content(dicopatohr, "text")
dicopatohr_json <- fromJSON(dicopatohr_text, flatten = TRUE)
dicodf <- as.data.frame(dicopatohr_json)
dicodf <-cbind(dicodf, player='dicopato')

nano <- paste("https://aoe2.net/api/player/ratinghistory?game=aoe2de&leaderboard_id=4&steam_id=76561198191637438&count=1000")
nanohr <- GET(nano)
nanohr_text <- content(nanohr, "text")
nanohr_json <- fromJSON(nanohr_text, flatten = TRUE)
nanodf <- as.data.frame(nanohr_json)
nanodf <-cbind(nanodf, player='Nanox')

mono <- paste("https://aoe2.net/api/player/ratinghistory?game=aoe2de&leaderboard_id=4&steam_id=76561198163778606&count=1000")
monohr <- GET(mono)
monohr_text <- content(monohr, "text")
monohr_json <- fromJSON(monohr_text, flatten = TRUE)
monodf <- as.data.frame(monohr_json)
monodf <-cbind(monodf, player='Monillo')

kato <- paste("https://aoe2.net/api/player/ratinghistory?game=aoe2de&leaderboard_id=4&steam_id=76561198153797281&count=1000")
katohr <- GET(kato)
katohr_text <- content(katohr, "text")
katohr_json <- fromJSON(katohr_text, flatten = TRUE)
katodf <- as.data.frame(katohr_json)
katodf <-cbind(katodf, player='alanthekat')

parkopato <- paste("https://aoe2.net/api/player/ratinghistory?game=aoe2de&leaderboard_id=4&steam_id=76561198118459931&count=1000")
parkopatohr <- GET(parkopato)
parkopatohr_text <- content(parkopatohr, "text")
parkopatohr_json <- fromJSON(parkopatohr_text, flatten = TRUE)
parkodf <- as.data.frame(parkopatohr_json)
parkodf <-cbind(parkodf, player='dicopato')

monillo2 <-paste("https://aoe2.net/api/player/ratinghistory?game=aoe2de&leaderboard_id=4&steam_id=76561198163778606&start=1000&count=1000")
monillohr2 <- GET(monillo2)
monillohr_text2 <- content(monillohr2, "text")
monillohr_json2 <- fromJSON(monillohr_text2, flatten = TRUE)
monillodf2 <- as.data.frame(monillohr_json2)
monillodf2 <-cbind(monillodf2, player='Monillo')

nanox2 <- paste("https://aoe2.net/api/player/ratinghistory?game=aoe2de&leaderboard_id=4&steam_id=76561198191637438&start=1000&count=1000")
nanoxhr2 <- GET(nanox2)
nanoxhr_text2 <- content(nanoxhr2, "text")
nanoxhr_json2 <- fromJSON(nanoxhr_text2, flatten = TRUE)
nanoxdf2 <- as.data.frame(nanoxhr_json2)
nanoxdf2 <-cbind(nanoxdf2, player='Nanox')

todos <- rbind (alandf, dicodf, nanodf, monodf, parkodf, katodf, monillodf2, nanoxdf2)
todos <- mutate(todos, Date = anydate(timestamp))
todos <- select(todos, !timestamp)
todos <- arrange(todos, Date)

todos_n <- todos %>% filter(Date > '2022-07-14')
todos_o <- todos %>% filter(Date < '2022-07-14')

fig <- plot_ly(data = todos_n, x = ~Date, y = ~rating, color = ~player, mode = 'lines+markers')
saveWidget(fig, "Elo_Chart.html", selfcontained = F, libdir = "lib")

fig <- plot_ly(data = todos_o, x = ~Date, y = ~rating, color = ~player, mode = 'lines+markers')
saveWidget(fig, "Elo_Chart_old.html", selfcontained = F, libdir = "lib")

figQty <- plot_ly(todos, y = ~player, type = 'histogram')
saveWidget(figQty, "partidas_tipo.html", selfcontained = F, libdir = "lib")

civ_list <- data.frame (civ = c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39"),
                        civ_name = c("British","Franks","Goths","Teutons","Japanese","Chinese","Byzantine","Persians","Saracens","Turks","Vikings","Mongols","Celts","Spanish","Aztecs","Mayans","Huns","Koreans","Italians","Indians","Incas","Magyars","Slavs","Portuguese","Ethiopians","Malians","Berbers","Khmer","Malay","Burmese","Vietnamese","Bulgarians","Tatars","Cumans","Lithuanians","Burgundians","Sicilians","Poles","Bohemians")
)

alan <- paste("https://aoe2.net/api/player/matches?game=aoe2de&steam_id=76561199207580572&count=10")
alanhr <- GET(alan)
alanhr_text <- content(alanhr, "text")
alanhr_json <- fromJSON(alanhr_text, flatten = TRUE)
alandf <- as.data.frame(alanhr_json)
alandf <-cbind(alandf, player='alanthekat')

dicopato <- paste("https://aoe2.net/api/player/matches?game=aoe2de&steam_id=76561199195740571&count=10")
dicopatohr <- GET(dicopato)
dicopatohr_text <- content(dicopatohr, "text")
dicopatohr_json <- fromJSON(dicopatohr_text, flatten = TRUE)
dicodf <- as.data.frame(dicopatohr_json)
dicodf <-cbind(dicodf, player='dicopato')

nano <- paste("https://aoe2.net/api/player/matches?game=aoe2de&steam_id=76561198191637438&count=10")
nanohr <- GET(nano)
nanohr_text <- content(nanohr, "text")
nanohr_json <- fromJSON(nanohr_text, flatten = TRUE)
nanodf <- as.data.frame(nanohr_json)
nanodf <-cbind(nanodf, player='Nanox')

coso <- alandf$players
cosonuevo <- bind_rows(coso, .id = "column_label")
cosonuevoalan <- cosonuevo %>% filter(name == "Carpincho")
civsalan <- merge(cosonuevoalan,civ_list,by="civ" ,all = FALSE)
cosonuevodico <- cosonuevo %>% filter(name == "dicopatito")
civsdico <- merge(cosonuevodico,civ_list,by="civ" ,all = FALSE)
cosonuevonano <- cosonuevo %>% filter(name == "Nanox")
civsnano <- merge(cosonuevonano,civ_list,by="civ" ,all = FALSE)

fig <- plot_ly(civsalan, labels = ~civ_name, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               showlegend = FALSE)
fig <- fig %>% layout(xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
saveWidget(fig, "civs_alan.html", selfcontained = F, libdir = "lib")



fig <- plot_ly(civsnano, labels = ~civ_name, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               showlegend = FALSE)
fig <- fig %>% layout(xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

saveWidget(fig, "civs_nano.html", selfcontained = F, libdir = "lib")


fig <- plot_ly(civsdico, labels = ~civ_name, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               showlegend = FALSE)
fig <- fig %>% layout(xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

saveWidget(fig, "civs_dico.html", selfcontained = F, libdir = "lib")
