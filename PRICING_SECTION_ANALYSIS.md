# Pricing Section - Structure & Sizing Analysis

## 📍 Location

**Primary Location:**
- **File**: `c:\projects\ai\pricing\index.html`
- **Main Container**: `.pricing-plan-cards-container`
- **CSS File**: `c:\projects\ai\ram.digitscpu.com\_astro-assets\_slug_.Ctc1eOEO.css`

## 🏗️ HTML Structure

```
pricing-plan-cards-container
├── pricing-plan-cards-cards (Grid Container)
    ├── pricing-plan-card-container (Starter - $35)
    │   ├── pricing-plan-card (blue)
    │   │   ├── pricing-plan-card-top-tab
    │   │   ├── pricing-plan-card-content-wrapper
    │   │   │   ├── pricing-plan-card-header
    │   │   │   ├── pricing-plan-card-price-box
    │   │   │   ├── pricing-plan-card-cta
    │   │   │   └── pricing-plan-card-footer
    │   └── pricing-plan-card-arguments
    │
    ├── pricing-plan-card-container (Core - $100)
    │   ├── pricing-plan-card (green) [Most Popular]
    │   │   ├── pricing-plan-card-top-tab
    │   │   ├── pricing-plan-card-content-wrapper
    │   │   │   ├── pricing-plan-card-header
    │   │   │   ├── pricing-plan-card-price-box
    │   │   │   ├── pricing-plan-card-cta
    │   │   │   └── pricing-plan-card-footer
    │   └── pricing-plan-card-arguments
    │
    └── pricing-plan-card-container (Professional - Custom)
        ├── pricing-plan-card (yellow)
        │   ├── pricing-plan-card-top-tab
        │   ├── pricing-plan-card-content-wrapper
        │   │   ├── pricing-plan-card-header
        │   │   ├── pricing-plan-card-price-box
        │   │   ├── pricing-plan-card-cta
        │   │   └── pricing-plan-card-footer
        └── pricing-plan-card-arguments
```

## 📐 Sizing & Spacing Details

### Container Level

#### `.pricing-plan-cards-container`
- **Background**: `rgba(5%, 5%, 5%, 0.05)` (light gray with transparency)
- **Border Radius**: `var(--global-border-radius)`
- **Layout**: `flex`, `flex-direction: column`
- **Gap**: `var(--space-s-responsive)`
- **Padding**: 
  - Mobile: `var(--space-s-responsive)`
  - Tablet (768px+): `var(--space-xxs-responsive)`
  - Desktop (1025px+): `var(--space-s-responsive)`

#### `.pricing-plan-cards-cards` (Grid Container)
- **Display**: `grid`
- **Grid Template**:
  - Mobile: `1fr` (single column)
  - Tablet (768px+): `1fr 1fr 1fr` (3 columns)
- **Gap**:
  - Mobile: `var(--space-s-responsive)`
  - Tablet (768px+): `var(--space-xxs-responsive)`
  - Desktop (1025px+): `var(--space-s-responsive)`

### Card Level

#### `.pricing-plan-card-container`
- **Display**: `flex`, `flex-direction: column`
- **Gap**: `var(--space-s-responsive)`
- **Height**: `100%` ← **NEW: Makes all containers equal height**
- **Order** (Mobile):
  - First child (Starter): `order: 2`
  - Second child (Core): `order: 1` ← Featured first on mobile
  - Third child (Professional): `order: 3`
- **Order** (Tablet+): Natural order (1, 2, 3)

#### `.pricing-plan-card`
- **Background**: `var(--plan-card-background)` → `#ffffff` (white)
- **Border Radius**: `var(--global-border-radius)`
- **Display**: `flex`, `flex-direction: column`
- **Overflow**: `hidden`
- **Transition**: `all 0.45s var(--ease-in-out-sine)`
- **Flex**: `1` ← **NEW: Stretches to fill available height**

#### Color Variants:
- **Blue** (Starter): `linear-gradient(90deg, rgba(45,184,232,0.7), rgba(56,239,225,0.7))`
- **Green** (Core): `linear-gradient(84deg, #6ecddd -4.07%, rgba(0,255,190,0.6) 95.1%)`
- **Yellow** (Professional): `linear-gradient(90deg, #fad338, #fcb53f)`

### Card Components

#### `.pricing-plan-card-top-tab`
- **Background**: `var(--plan-card-color)` (gradient based on card variant)
- **Height**: `30px`
- **Width**: `100%`

#### `.pricing-plan-card-content-wrapper`
- **Padding Left/Right**: `var(--plan-card-padding)` → `24px`

#### `.pricing-plan-card-header`
- **Padding Top**: `var(--space-m)`
- **Position**: `relative`

#### `.pricing-plan-card-title`
- **Font Size**: 
  - Mobile: `2rem` (32px)
  - Tablet+: Default `subheadline-regular`
- **Color**: `var(--plan-card-text-color)`

#### `.pricing-plan-card-tag` (e.g., "Most Popular")
- **Background**: `rgba(64, 238, 224, 0.3)`
- **Padding**: `2px 20px`
- **Position**: `absolute`, `right: calc(var(--plan-card-padding) * -1)`, `top: var(--space-m)`

#### `.pricing-plan-card-price-box`
- **Padding Top**: `var(--space-s)`
- **Min Height**:
  - Mobile: Not set
  - Tablet (768px+): `125px`
  - Desktop (1025px+): `148px`

#### `.pricing-plan-card-price`
- **Font Size**:
  - Mobile: `70px`
  - Tablet (1025px+): `74px`
  - Desktop (1280px+): `96px`
- **Font Weight**: `300`
- **Letter Spacing**:
  - Mobile: `-3.84px`
  - Tablet: `-2.96px`
  - Desktop: `-3.84px`
- **Line Height**: Default
- **Color**: `var(--plan-card-text-color)`

#### `.pricing-plan-card-currency`
- **Font Size**: `0.5em` (50% of price font)
- **Position**: `relative`, `top: -15px` (Mobile), `top: -18px` (Tablet+)

#### `.pricing-plan-card-term` ("/mo")
- **Font Size**: `20px`
- **Letter Spacing**: `-0.2px`
- **Line Height**: `130%`
- **Margin Left**: `-0.5em`

#### `.pricing-plan-card-cta` (Button Container)
- No specific spacing defined (inherits from parent)

#### `.pricing-plan-card-footer`
- **Border Top**: `1px solid var(--plan-card-border-color)`
- **Margin**: 
  - Top: `var(--space-m)`
  - Left/Right: `calc(var(--plan-card-padding) * -1)` (extends to card edges)

### Footer Components

#### `.pricing-plan-card-agents`
- **Display**: `flex`, `flex-direction: column`
- **Gap**: `var(--space-s-responsive)`
- **Padding**: `var(--space-xs-responsive)`

#### `.pricing-plan-card-agent`
- **Background**: `var(--plan-card-agent-bg-color)` → `rgba(245,246,249,0.7)`
- **Border Radius**: `8px`
- **Display**: `flex`, `gap: 10px`
- **Padding**: `10px`
- **Align Items**: `flex-start`

#### `.pricing-plan-card-agent-icon`
- **Background**: `rgba(110, 205, 221, 0.3)`
- **Border Radius**: `6px`
- **Color**: `#0bc3b7`
- **Size**: `27px × 27px`
- **Display**: `flex`, `align-items: center`, `justify-content: center`

#### `.pricing-plan-card-features`
- **Border Top**: `1px solid var(--plan-card-border-color)`
- **Display**: `flex`, `flex-direction: column`
- **Gap**: `var(--space-s-responsive)`
- **Padding**: `var(--space-xs-responsive)`

#### `.pricing-plan-card-feature`
- **Border**: `1px solid var(--plan-card-border-color)`
- **Border Radius**: `8px`
- **Display**: `flex`, `gap: var(--space-xxxs-responsive)`
- **Padding**: `var(--space-xxxs-responsive)`
- **Align Items**: `flex-start`

### Bottom "Arguments" Section

#### `.pricing-plan-card-arguments`
- **Background**: `var(--plan-card-background)`
- **Border Radius**: `var(--global-border-radius)`
- **Display**: `flex`, `flex-direction: column`
- **Gap**: `var(--space-xs-responsive)`
- **Padding**: `var(--space-xs-responsive)`

#### `.pricing-plan-card-argument`
- **Background**: `var(--plan-card-agent-bg-color)`
- **Border Radius**: `8px`
- **Padding**: `var(--space-xxxs-responsive)`
- **Color**: `var(--plan-card-text-color-secondary)`

## 🎨 CSS Variables Used

```css
--pricing-plans-container-background: hsla(0, 0%, 5%, 0.05)
--plan-card-padding: 24px
--plan-card-color: [gradient - varies by card]
--plan-card-background: var(--color-white)
--plan-card-text-color: var(--color-black)
--plan-card-text-color-secondary: var(--color-black-60)
--plan-card-button-color: var(--color-green)
--plan-card-border-color: var(--color-black-10)
--plan-card-agent-bg-color: rgba(245, 246, 249, 0.7)
--plan-card-agent-border-color: var(--color-black-5)
```

### Dark Mode Variations (`.bg-mode-blue`)
```css
--pricing-plans-container-background: rgba(248, 248, 251, 0.05)
--plan-card-background: var(--color-blue-darker)
--plan-card-text-color: var(--color-white)
--plan-card-text-color-secondary: var(--color-white-50)
--plan-card-border-color: var(--color-white-10)
--plan-card-agent-bg-color: rgba(64, 66, 82, 0.3)
--plan-card-agent-border-color: var(--color-white-05)
```

## 🔄 Responsive Breakpoints

- **Mobile**: `< 768px` - Single column, Core card shown first
- **Tablet**: `768px - 1024px` - Three columns, smaller gaps
- **Desktop**: `≥ 1025px` - Three columns, full spacing

## 📝 Key Design Patterns

1. **Visual Hierarchy**: Colored top tab → Large price → CTA button → Features
2. **Negative Space**: Extended borders (negative margins) for footer sections
3. **Consistency**: All cards use same spacing variables for uniformity
4. **Mobile-First**: Core (most popular) card prioritized via flexbox order
5. **Accessibility**: High contrast, clear typography hierarchy
6. **Visual Indicators**: Icon backgrounds, borders, and backgrounds for content grouping

---

**Created**: February 3, 2026  
**Purpose**: Documentation for pricing section structure and sizing
