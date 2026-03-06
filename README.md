# Resume Builder

⭐ If you find this helpful, please consider giving it a star to show your support!

A professional, ATS-friendly resume generator that converts JSON data into a beautifully formatted PDF resume using LaTeX.

## Features

- **JSON-based**: Manage your resume data in a simple JSON file
- **ATS-optimized**: Clean formatting that passes Applicant Tracking Systems
- **Professional design**: Modern, clean layout with customizable colors
- **Easy to use**: Simple build process with one command
- **Open source**: MIT licensed, contributions welcome

## Project Structure

```
resume-builder/
├── README.md                    # This file
├── LICENSE                      # MIT License
├── .gitignore                   # Git ignore rules
│
├── data/
│   └── input-data.json          # Your resume data (edit this)
│
├── output/
│   ├── resume.pdf               # Generated resume
│   └── logs/                    # Build logs
│
├── scripts/
│   └── generate_config.py       # Generates LaTeX from JSON
│
└── templates/
    └── ats_format/              # ATS-optimized template
        ├── build.sh             # Build script
        ├── config/
        │   └── styles.yaml      # Styling configuration
        └── template/            # LaTeX files
            ├── resume.tex       # Main resume file
            ├── _header.tex      # Header section
            ├── TLCresume.sty    # LaTeX styles
            └── sections/        # Auto-generated sections
```

## Quick Start

### Prerequisites

- Python 3.7+
- Tectonic (LaTeX engine) - automatically downloaded on first build

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/resume-builder.git
cd resume-builder
```

### Generate Your Resume

1. **Edit your data**:
   ```bash
   # Open and edit data/input-data.json with your information
   ```

2. **Build the resume**:
   ```bash
   bash templates/ats_format/build.sh
   ```

3. **View the result**:
   ```bash
   # Your resume is at: output/resume.pdf
   ```

## Data Format

Edit `data/input-data.json` with your resume information:

```json
{
  "name": "Your Name",
  "role": "Your Job Title",
  "phone": "(+1) 123-456-7890",
  "email": "your.email@example.com",
  "city": "City, State",
  "linkedin": "your-linkedin-username",
  "objective": "Your professional summary...",
  "skills": [
    {
      "category": "Languages:",
      "items": "Python, JavaScript, Java, SQL"
    },
    {
      "category": "Tools:",
      "items": "Git, Docker, AWS, Kubernetes"
    }
  ],
  "experience": [
    {
      "role": "Senior Developer",
      "company": "Tech Company",
      "startDate": "JAN 2020",
      "endDate": "Present",
      "description": "Led development of cloud-based solutions",
      "highlights": [
        "Increased performance by 40%",
        "Mentored team of 5 developers",
        "Reduced deployment time from 2 hours to 15 minutes"
      ]
    }
  ],
  "education": [
    {
      "degree": "Bachelor of Science in Computer Science",
      "institution": "University Name",
      "date": "2019"
    }
  ],
  "awards": [
    {
      "title": "Employee of the Year",
      "institution": "Tech Company",
      "date": "2023"
    }
  ]
}
```

## Formatting

### Bold Text

Use `\\textbf{text}` to make text bold (note the double backslash for JSON):

```json
"description": "Led \\textbf{team of 5} developers"
```

### Italic Text

Use `\\textit{text}` for italic:

```json
"institution": "\\textit{Prestigious University}"
```

### Special Characters

- Ampersand: Use `\\&` instead of `&`
- Other special characters are automatically escaped

## Configuration

### Styling

Edit `templates/ats_format/config/styles.yaml` to customize:

```yaml
colors:
  highlight: "61, 90, 128"  # RGB values for headings

fonts:
  family: "sourcesanspro"   # Font family

spacing:
  top_margin: "0.3in"       # Top margin
  bottom_margin: "1in"      # Bottom margin
```

## Build Process

### Automatic Build

```bash
bash templates/ats_format/build.sh
```

This will:
1. Generate LaTeX config from your JSON data
2. Compile the resume using Tectonic
3. Output `resume.pdf` in the `output/` directory

### Manual Build

```bash
# Generate LaTeX sections from JSON
python3 scripts/generate_config.py ats_format

# Compile to PDF
tectonic -X compile templates/ats_format/template/resume.tex --outdir output/
```

## Template Output

### Current Template: ats_format

A clean, ATS-optimized resume template with:
- Professional header with contact information
- Organized sections: Skills, Technical Experience, Awards & Recognition, Education
- Highlighted company names and dates
- Bullet-point highlights for each role
- Optimized spacing and typography

### Sample Output

Check out the generated resume:

📄 **[View Sample Resume](output/resume.pdf)**

The resume is automatically generated from `data/input-data.json` and committed to the repository.

## Troubleshooting

### Build fails with "Missing input-data.json"

Make sure `data/input-data.json` exists and is valid JSON.

### JSON parse error

Check your JSON syntax:
- All strings must be in double quotes
- Use `\\` for backslashes (e.g., `\\textbf{text}`)
- Use `\\&` for ampersands

### Resume looks different than expected

- Check `output/logs/resume.log` for LaTeX errors
- Verify your JSON is valid
- Make sure special characters are properly escaped

### Permission denied on build.sh

Make the script executable:
```bash
chmod +x templates/ats_format/build.sh
```

## Adding New Templates

To create a new template:

1. Create a new folder in `templates/` (e.g., `templates/modern_template/`)
2. Copy the structure from `templates/ats_format/`
3. Customize the LaTeX files in `template/` and styling in `config/styles.yaml`
4. Run the build script with your template name:
   ```bash
   bash templates/modern_template/build.sh
   ```

## ATS Compatibility Tips

1. **Keep it simple**: Avoid complex formatting
2. **Use standard fonts**: Stick with sans-serif fonts
3. **Clear sections**: Use standard section headers
4. **No images**: Don't include graphics or logos
5. **Standard dates**: Use consistent date formats (e.g., "JAN 2020")
6. **Plain text friendly**: Ensure content is readable when converted to plain text

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT License - see LICENSE file for details

## Support

For issues, questions, or suggestions, please open an issue on GitHub.

## Acknowledgments

- LaTeX template inspired by professional resume designs
- Built with Tectonic for reliable PDF generation
- Original template by [TimmyChan](https://github.com/TimmyChan)
