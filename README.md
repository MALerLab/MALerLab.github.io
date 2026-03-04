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

To add a `[bib]` copy button for a publication:

**Step 1.** Add a BibTeX entry to `_bibliography/references.bib`:
```bibtex
@inproceedings{sixdragons2024,
  title={Six dragons fly again: ...},
  author={Han, Danbinaerin and ...},
  booktitle={Proceedings of ISMIR},
  year={2024}
}
```

**Step 2.** In `_pages/publications.md`, append `[[bib]](#bib:<key>)` to the publication line:
```markdown
+ *Proceedings of ISMIR* [[pdf]](url) [[code]](url) [[bib]](#bib:sixdragons2024)
```

The citation key after `#bib:` must match the key in `references.bib`. When a user clicks `[bib]`, the BibTeX entry is copied to their clipboard.

### 1.3. Update News
> _data/news.yml

Add new entries **at the top** of the file so the latest news appears first.

#### Basic entry
```yml
- date: "June-2025"
  content: "Our paper got accepted for ISMIR 2025!"
```
This will be displayed as:
```
[June-2025] Our paper got accepted for ISMIR 2025!
```

#### Using links in content
You can use Markdown links inside `content`:
```yml
- date: "Sep-2-2023"
  content: >-
    One paper got accepted to [DLfM](https://dlfm.web.ox.ac.uk/).
    Danbinaerin Han and Daewoong Kim contributed to this work.
```
> **Tip:** Use `>-` when your text spans multiple lines. It joins the lines into a single paragraph.

#### Adding a collapsible section with images

**Step 1.** Place your image file in the `assets/images/` folder.

**Step 2.** Add a `details` block to the entry:
```yml
- date: "Feb-3-2023"
  content: "Jiin An has won excellence award in HCI Korea 2023."
  details:
    summary: "The photo of Creativity Award, HCI Korea 2023"
    images:
      - creativity_award.jpg
    image_style: "width:40%"
```
Clicking the summary text will expand and show the image(s).

#### Adding a collapsible section with HTML (e.g., Twitter embed)
```yml
- date: "Feb-10-2023"
  content: "We won first-prize award in AI Music Generation Challenge 2022!"
  details:
    summary: "The tweets from Prof. Dasaem Jeong"
    html: |
      <blockquote class="twitter-tweet"><p>...</p></blockquote>
      <script async src="https://platform.twitter.com/widgets.js"></script>
```

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

