# HOA Storage Program — Feasibility & Revenue Analysis

An interactive financial model for evaluating a basement storage cage program in a New Jersey HOA community.

## Overview

This project provides a comprehensive analysis tool for HOA boards considering converting underutilized basement space into climate-controlled storage units. The model accounts for:

- **Space configuration**: Cage dimensions (3×3 ft to 5×5 ft, custom)
- **Pricing strategy**: Competitive NJ market rates, HOA member discounts
- **Financial projections**: 5-year revenue, build cost, payback period
- **Market benchmarking**: NJ self-storage rates and competitive analysis
- **AI advisor**: Context-aware guidance on NJ regulations, ROI, and next steps

## Features

### Interactive Sliders
- Usable basement area (300–650 sq ft)
- Cage dimensions (width, depth)
- Occupancy rate (50–100%)
- Monthly rent per cage ($25–$80)
- Installation cost per cage ($100–$450)
- Key deposit ($0–$150)
- Annual rent increase (0–8%)

### Dynamic Calculations
- Number of cages that fit
- Monthly and annual revenue projections
- Total build cost
- Payback period (months to break even)
- 5-year cumulative profit

### Scenario Configurations
- **3×3 ft**: Compact — shoes, small boxes, seasonal items
- **3×4 ft**: Standard — recommended baseline (12 sq ft)
- **4×4 ft**: Mid — luggage, bikes, holiday decor
- **4×6 ft**: Large — equivalent to 5×5 commercial
- **5×5 ft**: Commercial standard size
- **Mixed split**: 50% small, 50% large

### 5-Year Financial Projections
- Annual net revenue (bars)
- Cumulative net profit (line chart)
- Interactive Chart.js visualization

### Comparison Table
All cage configurations side-by-side:
- Size, square footage, cage count
- NJ market rate vs. HOA price
- Savings vs. market (%)
- Monthly and annual revenue
- Build cost and payback period

### NJ Market Benchmarks
- 5×5 ft non-climate: $40–$70/month
- 5×5 ft climate-controlled: $70–$100/month
- HOA competitive advantage: 25–40% below market

### AI Advisor
Claude-powered chatbot with full context on your model:
- Best-case ROI scenarios
- NJ fire code and egress requirements (44" minimum)
- Board presentation strategies
- Resident interest survey templates
- Legal risk assessment
- Wire mesh vendor recommendations

## Next Steps (Workflow)

1. **Immediate**: Run a resident waitlist survey (20+ yeses = proceed)
2. **Short-term**: Board resolution + local building department code check
3. **Medium-term**: Bicycle relocation plan (30–60 day notice)
4. **Build phase**: 3 contractor bids + storage license agreement

## Technical Stack

- **HTML5** with semantic structure
- **Vanilla JavaScript** (no frameworks)
- **Chart.js 4.4.1** for financial projections
- **CSS Grid & Flexbox** for responsive design
- **GitHub-themed dark UI** (matching GitHub design system colors)
- **Claude API** integration for AI advisor (Sonnet 4.6)

## File Structure

```
HOA/
├── index.html          # Main interactive model (single-page app)
└── README.md           # This file
```

## How to Use

1. Open `index.html` in a modern web browser (Chrome, Firefox, Safari, Edge)
2. Adjust sliders to explore different space and pricing scenarios
3. Click scenario cards (3×4 ft, 4×6 ft, etc.) to quickly apply configurations
4. View the 5-year projection chart and comparison table
5. Use the AI advisor to ask about ROI, NJ regulations, board strategies, or next steps

## Key Assumptions

- **NJ Market Data**: Current as of 2025
- **Occupancy**: Conservative baseline of 85% (adjustable)
- **Build Cost**: $100–$450 per cage installed (wire mesh prefab panels)
- **Depreciation**: Not modeled (5-year horizon)
- **Operating Costs**: Not included (maintenance, insurance, liability)
- **Regulatory**: Fire egress (44" min), Certificate of Occupancy (if required)
- **Bicycle Relocation**: 30–60 day notice to residents required

## Vendor Notes

- **Wire mesh prefab panels**: Wirecrafters, SpaceMaker recommended
- **Separate storage license** from HOA lease agreement
- **Key deposit**: Recommended to offset turnover costs

## License

This project is provided as-is for HOA board planning and feasibility analysis.

## Contact & Support

For questions about the model or results, consult with:
- Local NJ building department (fire egress, Certificate of Occupancy)
- HOA legal counsel (bylaws, resident agreements)
- Commercial real estate appraiser (market rates validation)
