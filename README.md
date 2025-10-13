# MALer Lab Website

## 1. Where to Edit the Website content
### 1.1. Update Members
> _data/members-info/some-member-info.yml

Student's role is separated by department. (Optional)
```yml
- name_en: Maler
  name_ko: 말러
  role: MALer Lab
  website:
    Blog: https://malerlab.github.io
  image: members/maler_profile.jpg
  interests:
    - Symbolic Music Generation
    - Music Information Retrieval
```
This will be displayed as: [card] [image]
```
Maler 말러 | [Blog]
MALer Lab

FIELDS OF RESEARCH
(Symbolic Music Generation) (Music Information Retrieval)
```

### 1.2. Update Publications
> _pages/publications.md

### 1.3. Update News
> _pages/news.md

<br/>

## 2. How to Deploy
> Just push to the main branch.

<br/>

## 3. How to Run in Local
### 3.1. Install Ruby First
```
gem install bundler jekyll
bundle install
```
- This command will install all the dependencies in the Gemfile.

### 3.2. Run!
```
jekyll serve
```

