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

### 1.4. Add Projects
> _projects/[slug].md

```yml
---
title: Example Project Description
summary: This is a summary of the project. Project thumbnail is 1200x630
featured: true
priority: 3
updated_at: 2025-10-15
thumbnail: /assets/images/projects/example-project/six-dragons-fly-again.png
tags: [audio, ml, korean-traditional]
# members: [Dasaem Jeong, Dongmin Kim, Hannah Park, Sihun Lee]
---
```
- `priority`: Lower number = higher priority (appears first)
- `featured`: true/false (whether to feature on projects page)
- `thumbnail`: Recommended size 1200x630

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


## 4. Custom Markdown Image Syntax (site-wide)

This site supports an extended Markdown image syntax that is automatically transformed into a semantic `<figure>` with `<img>` and `<figcaption>` during build. Use a pipe-delimited attribute list in the alt section to control alignment, size, caption, and more.

### 4.1. Basic Usage
```
![Caption text | align=center | width=60%](/path/to/image.jpg)
```

### 4.2. Attributes
- `align`: `left` | `center` | `right`
  - Controls both image placement and caption alignment.
- `width`, `height`: any CSS unit (e.g., `60%`, `400px`). Applied to the `<img>` style.
- `caption="..."`: Overrides the caption. If omitted, the text before the first `|` is used as the caption.
- `alt="..."`: Overrides the `alt` text. If omitted, the pre-pipe text is used; if still empty, the caption is used as a fallback.
- `class="..."`: Extra classes added to the `<figure>`. The `mobile-full` class is added automatically by default for responsive behavior.
- `id="..."`: Optional id for the `<figure>`.

Notes:
- If no pipe (`|`) is present in the Markdown image, it remains a standard image and is not transformed.
- Captions render in italic under the image. On narrow screens, `mobile-full` ensures images fill the width.

### 4.3. Examples
```
![A centered image | align=center | width=50%](/assets/images/example.jpg)

![Right aligned, fixed width | align=right | width=420px | caption="An informative caption"](/assets/images/example2.png)

![Alt only, caption defaults to this text | align=left](/assets/images/example3.png)

![With extra classes | align=center | width=70% | class="rounded shadow"](/assets/images/example4.jpg)
```

### 4.4. Accessibility
- Always provide meaningful pre-pipe text or an explicit `alt` to describe the image content.
- The plugin escapes HTML in `alt` and `caption` to prevent injection.
