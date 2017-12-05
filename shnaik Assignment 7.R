install.packages('tm')
install.packages('SnowballC')
install.packages('wordcloud')
install.packages('readtext')
library(SnowballC)
library(wordcloud)
library(readtext)
library(tm)
Resume <- file.choose()
Resume<-readtext(Resume)
Resumetext<- Resume$text

str(Resumetext)
summary(Resumetext)

ResumeCorpus<- Corpus(VectorSource(Resume$text))#pointing to our doc
ResumeCorpus <- tm_map(ResumeCorpus, PlainTextDocument)
ResumeCorpus <- tm_map(ResumeCorpus, removeWords, stopwords('english'))
ResumeCorpus<-tm_map(ResumeCorpus, content_transformer(tolower))
ResumeCorpus<- tm_map(ResumeCorpus,stripWhitespace)
ResumeCorpus <- tm_map(ResumeCorpus, removeWords, c("come","thing","eye","said"))

ResumeCorpus<- tm_map(ResumeCorpus, stemDocument)

wordcloud::wordcloud(ResumeCorpus, max.words = 100, random.order = FALSE, random.color = TRUE)
wordcloud::wordcloud(ResumeCorpus, max.words = 150, random.order = FALSE,colors = "blue")
