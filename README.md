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

