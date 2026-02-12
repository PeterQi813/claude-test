import {
  CardDef,
  field,
  contains,
  Component,
} from 'https://cardstack.com/base/card-api';
import StringField from 'https://cardstack.com/base/string';

export class BrandGuide extends CardDef {
  static displayName = 'Brand Guide';

  @field brandName = contains(StringField);
  @field philosophy = contains(StringField);

  @field title = contains(StringField, {
    computeVia: function (this: BrandGuide) {
      return this.brandName ? `${this.brandName} — Brand Guide` : 'Brand Guide';
    },
  });

  static isolated = class Isolated extends Component<typeof BrandGuide> {
    get safeName() {
      return this.args.model?.brandName ?? 'RF Tennis Academy';
    }

    <template>
      <div class='brand-guide'>

        {{! ── Cover ── }}
        <section class='cover'>
          <span class='cover-label'>Brand Guidelines</span>
          <h1 class='cover-title'>{{this.safeName}}</h1>
          <div class='cover-rule'></div>
          <p class='cover-edition'>2026 Edition</p>
        </section>

        {{! ── Philosophy ── }}
        <section class='section'>
          <div class='section-num'>01</div>
          <h2 class='section-title'>Philosophy</h2>
          <p class='section-body'>
            The RF Tennis Academy brand draws from the ethos of Roger Federer:
            effortless elegance, Swiss precision, and quiet confidence. Every
            design decision should feel intentional yet understated — never
            decorative for its own sake. We prize negative space as much as
            content. Restraint is our luxury.
          </p>
        </section>

        {{! ── Color Palette ── }}
        <section class='section'>
          <div class='section-num'>02</div>
          <h2 class='section-title'>Color Palette</h2>

          <div class='color-grid'>
            <div class='color-card'>
              <div class='color-swatch swatch-white'></div>
              <span class='color-name'>Canvas White</span>
              <span class='color-hex'>#FFFFFF</span>
              <span class='color-use'>Primary background. The dominant tone — 70%+ of any composition.</span>
            </div>

            <div class='color-card'>
              <div class='color-swatch swatch-charcoal'></div>
              <span class='color-name'>Federer Charcoal</span>
              <span class='color-hex'>#1A1A1A</span>
              <span class='color-use'>Headlines, primary text, hero overlays, footer.</span>
            </div>

            <div class='color-card'>
              <div class='color-swatch swatch-warm'></div>
              <span class='color-name'>Warm Stone</span>
              <span class='color-hex'>#F5F0EB</span>
              <span class='color-use'>Alternate section backgrounds. Adds warmth without color.</span>
            </div>

            <div class='color-card'>
              <div class='color-swatch swatch-mid'></div>
              <span class='color-name'>Mid Grey</span>
              <span class='color-hex'>#6B6B6B</span>
              <span class='color-use'>Body text, captions, secondary information.</span>
            </div>

            <div class='color-card'>
              <div class='color-swatch swatch-gold'></div>
              <span class='color-name'>Championship Gold</span>
              <span class='color-hex'>#B8975A</span>
              <span class='color-use'>Sparingly — rule lines, micro-accents, stat numbers. Never on backgrounds.</span>
            </div>

            <div class='color-card'>
              <div class='color-swatch swatch-court'></div>
              <span class='color-name'>Court Green</span>
              <span class='color-hex'>#2D5A3D</span>
              <span class='color-use'>Accent only — level badges, success states. Evokes grass courts.</span>
            </div>
          </div>
        </section>

        {{! ── Typography ── }}
        <section class='section'>
          <div class='section-num'>03</div>
          <h2 class='section-title'>Typography</h2>

          <div class='type-specimen'>
            <div class='type-row'>
              <span class='type-label'>Display</span>
              <span class='type-example type-display'>RF Tennis Academy</span>
              <span class='type-spec'>System sans-serif · 200 weight · 0.14em tracking · Uppercase</span>
            </div>
            <div class='type-divider'></div>

            <div class='type-row'>
              <span class='type-label'>Headline</span>
              <span class='type-example type-headline'>Where Elegance Meets Excellence</span>
              <span class='type-spec'>System sans-serif · 300 weight · 0.02em tracking</span>
            </div>
            <div class='type-divider'></div>

            <div class='type-row'>
              <span class='type-label'>Label</span>
              <span class='type-example type-label-text'>ESTABLISHED 2026</span>
              <span class='type-spec'>System sans-serif · 600 weight · 0.18em tracking · Uppercase · 11px</span>
            </div>
            <div class='type-divider'></div>

            <div class='type-row'>
              <span class='type-label'>Body</span>
              <span class='type-example type-body'>Tennis is not merely a sport, it is an expression of discipline, creativity, and character.</span>
              <span class='type-spec'>System sans-serif · 400 weight · 1.8 line-height · #6B6B6B</span>
            </div>
          </div>
        </section>

        {{! ── Design Principles ── }}
        <section class='section'>
          <div class='section-num'>04</div>
          <h2 class='section-title'>Design Principles</h2>

          <div class='principles-grid'>
            <div class='principle'>
              <span class='principle-num'>I</span>
              <h3 class='principle-title'>Effortless Restraint</h3>
              <p class='principle-desc'>Remove until it breaks, then add one thing back. Every element must earn its place. If in doubt, leave it out.</p>
            </div>
            <div class='principle'>
              <span class='principle-num'>II</span>
              <h3 class='principle-title'>Dramatic Scale</h3>
              <p class='principle-desc'>Contrast between large and small creates visual tension. Headlines should be bold in scale, not in weight.</p>
            </div>
            <div class='principle'>
              <span class='principle-num'>III</span>
              <h3 class='principle-title'>Cinematic Imagery</h3>
              <p class='principle-desc'>Photography should feel editorial — high contrast, desaturated, dramatic angles. Never stock-photo generic.</p>
            </div>
            <div class='principle'>
              <span class='principle-num'>IV</span>
              <h3 class='principle-title'>Quiet Confidence</h3>
              <p class='principle-desc'>The brand whispers, never shouts. Let the work speak. No exclamation marks, no aggressive CTAs, no visual noise.</p>
            </div>
          </div>
        </section>

        {{! ── Spacing ── }}
        <section class='section'>
          <div class='section-num'>05</div>
          <h2 class='section-title'>Spacing &amp; Rhythm</h2>
          <p class='section-body'>
            Generous whitespace is the signature of this brand. Section padding
            should be no less than 6rem vertical. Between elements within a
            section, use 2-3rem. The page should breathe — scroll depth is a
            feature, not a cost.
          </p>
          <div class='spacing-demo'>
            <div class='space-block space-xs'><span>0.5rem</span></div>
            <div class='space-block space-sm'><span>1rem</span></div>
            <div class='space-block space-md'><span>2rem</span></div>
            <div class='space-block space-lg'><span>4rem</span></div>
            <div class='space-block space-xl'><span>6rem</span></div>
            <div class='space-block space-2xl'><span>8rem</span></div>
          </div>
        </section>

        {{! ── Components ── }}
        <section class='section'>
          <div class='section-num'>06</div>
          <h2 class='section-title'>Components</h2>

          <div class='component-row'>
            <span class='comp-label'>Pill Button</span>
            <div class='comp-demo'>
              <span class='pill-btn'>Explore Programs</span>
              <span class='pill-btn pill-btn-outline'>Learn More</span>
            </div>
          </div>

          <div class='component-row'>
            <span class='comp-label'>Section Divider</span>
            <div class='comp-demo'>
              <div class='demo-rule'></div>
            </div>
          </div>

          <div class='component-row'>
            <span class='comp-label'>Stat Number</span>
            <div class='comp-demo'>
              <span class='demo-stat-num'>20</span>
              <span class='demo-stat-label'>Grand Slam Titles</span>
            </div>
          </div>
        </section>

        {{! ── Footer ── }}
        <footer class='guide-footer'>
          <div class='footer-rule'></div>
          <span class='footer-text'>{{this.safeName}} — Brand Guidelines — Confidential</span>
        </footer>
      </div>

      <style scoped>
        .brand-guide {
          width: 100%;
          background: #ffffff;
          color: #1a1a1a;
          font-family: system-ui, -apple-system, 'Helvetica Neue', Arial, sans-serif;
        }

        /* ── Cover ── */
        .cover {
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          padding: 8rem 2rem;
          text-align: center;
          background: #1a1a1a;
          color: #ffffff;
        }

        .cover-label {
          font-size: 0.65rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.25em;
          color: #B8975A;
          margin-bottom: 2rem;
        }

        .cover-title {
          font-size: 3rem;
          font-weight: 200;
          letter-spacing: 0.14em;
          text-transform: uppercase;
          margin: 0;
          line-height: 1.1;
        }

        .cover-rule {
          width: 3rem;
          height: 1px;
          background: #B8975A;
          margin: 2rem 0;
        }

        .cover-edition {
          font-size: 0.75rem;
          font-weight: 400;
          letter-spacing: 0.1em;
          color: rgba(255, 255, 255, 0.4);
          margin: 0;
        }

        /* ── Sections ── */
        .section {
          padding: 5rem 3rem;
          max-width: 52rem;
          margin: 0 auto;
          border-bottom: 1px solid #e8e8e8;
        }

        .section-num {
          font-size: 0.65rem;
          font-weight: 600;
          letter-spacing: 0.2em;
          color: #B8975A;
          margin-bottom: 0.75rem;
        }

        .section-title {
          font-size: 2rem;
          font-weight: 300;
          letter-spacing: 0.02em;
          margin: 0 0 2rem;
          color: #1a1a1a;
        }

        .section-body {
          font-size: 1rem;
          line-height: 1.8;
          color: #6B6B6B;
          margin: 0;
          max-width: 38rem;
        }

        /* ── Colors ── */
        .color-grid {
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 1.5rem;
        }

        .color-card {
          display: flex;
          flex-direction: column;
          gap: 0.5rem;
        }

        .color-swatch {
          width: 100%;
          height: 5rem;
          border-radius: 0.5rem;
        }

        .swatch-white {
          background: #ffffff;
          border: 1px solid #e8e8e8;
        }

        .swatch-charcoal {
          background: #1a1a1a;
        }

        .swatch-warm {
          background: #F5F0EB;
        }

        .swatch-mid {
          background: #6B6B6B;
        }

        .swatch-gold {
          background: #B8975A;
        }

        .swatch-court {
          background: #2D5A3D;
        }

        .color-name {
          font-size: 0.8rem;
          font-weight: 600;
          color: #1a1a1a;
        }

        .color-hex {
          font-size: 0.7rem;
          font-weight: 400;
          font-family: 'SF Mono', 'Menlo', monospace;
          color: #999;
        }

        .color-use {
          font-size: 0.7rem;
          line-height: 1.5;
          color: #6B6B6B;
        }

        /* ── Typography ── */
        .type-specimen {
          display: flex;
          flex-direction: column;
        }

        .type-row {
          display: flex;
          flex-direction: column;
          gap: 0.5rem;
          padding: 1.5rem 0;
        }

        .type-label {
          font-size: 0.6rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #B8975A;
        }

        .type-example {
          color: #1a1a1a;
        }

        .type-display {
          font-size: 2.5rem;
          font-weight: 200;
          letter-spacing: 0.14em;
          text-transform: uppercase;
        }

        .type-headline {
          font-size: 1.75rem;
          font-weight: 300;
          letter-spacing: 0.02em;
        }

        .type-label-text {
          font-size: 0.7rem;
          font-weight: 600;
          letter-spacing: 0.18em;
          text-transform: uppercase;
        }

        .type-body {
          font-size: 1rem;
          font-weight: 400;
          line-height: 1.8;
          color: #6B6B6B;
        }

        .type-spec {
          font-size: 0.65rem;
          color: #999;
          font-family: 'SF Mono', 'Menlo', monospace;
        }

        .type-divider {
          height: 1px;
          background: #f0f0f0;
        }

        /* ── Principles ── */
        .principles-grid {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 2.5rem;
        }

        .principle {
          display: flex;
          flex-direction: column;
          gap: 0.5rem;
        }

        .principle-num {
          font-size: 0.85rem;
          font-weight: 300;
          color: #B8975A;
          font-style: italic;
        }

        .principle-title {
          font-size: 1rem;
          font-weight: 600;
          margin: 0;
          color: #1a1a1a;
        }

        .principle-desc {
          font-size: 0.85rem;
          line-height: 1.6;
          color: #6B6B6B;
          margin: 0;
        }

        /* ── Spacing Demo ── */
        .spacing-demo {
          display: flex;
          align-items: flex-end;
          gap: 1rem;
          margin-top: 2rem;
        }

        .space-block {
          background: #F5F0EB;
          border-radius: 0.25rem;
          display: flex;
          align-items: center;
          justify-content: center;
          width: 4rem;
        }

        .space-block span {
          font-size: 0.6rem;
          font-family: 'SF Mono', 'Menlo', monospace;
          color: #999;
          writing-mode: vertical-lr;
          transform: rotate(180deg);
        }

        .space-xs { height: 2rem; }
        .space-sm { height: 3rem; }
        .space-md { height: 4.5rem; }
        .space-lg { height: 6.5rem; }
        .space-xl { height: 9rem; }
        .space-2xl { height: 12rem; }

        /* ── Components ── */
        .component-row {
          display: flex;
          align-items: center;
          gap: 2rem;
          padding: 1.5rem 0;
          border-bottom: 1px solid #f0f0f0;
        }

        .component-row:last-child {
          border-bottom: none;
        }

        .comp-label {
          font-size: 0.65rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.15em;
          color: #999;
          width: 8rem;
          flex-shrink: 0;
        }

        .comp-demo {
          display: flex;
          align-items: center;
          gap: 1rem;
        }

        .pill-btn {
          display: inline-block;
          padding: 0.75rem 2rem;
          border-radius: 9999px;
          font-size: 0.75rem;
          font-weight: 600;
          letter-spacing: 0.08em;
          text-transform: uppercase;
          background: #1a1a1a;
          color: #ffffff;
        }

        .pill-btn-outline {
          background: transparent;
          color: #1a1a1a;
          box-shadow: inset 0 0 0 1.5px #1a1a1a;
        }

        .demo-rule {
          width: 12rem;
          height: 1px;
          background: #B8975A;
        }

        .demo-stat-num {
          font-size: 2.5rem;
          font-weight: 200;
          color: #B8975A;
          line-height: 1;
        }

        .demo-stat-label {
          font-size: 0.65rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.15em;
          color: #6B6B6B;
          margin-left: 1rem;
        }

        /* ── Footer ── */
        .guide-footer {
          padding: 3rem;
          text-align: center;
        }

        .footer-rule {
          width: 2rem;
          height: 1px;
          background: #e8e8e8;
          margin: 0 auto 1.5rem;
        }

        .footer-text {
          font-size: 0.6rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #ccc;
        }
      </style>
    </template>
  };

  static embedded = class Embedded extends Component<typeof BrandGuide> {
    get safeName() {
      return this.args.model?.brandName ?? 'RF Tennis Academy';
    }

    <template>
      <div class='guide-embed'>
        <span class='label'>Brand Guide</span>
        <span class='name'>{{this.safeName}}</span>
      </div>

      <style scoped>
        .guide-embed {
          display: flex;
          flex-direction: column;
          justify-content: center;
          gap: 0.375rem;
          padding: 1rem;
          background: #1a1a1a;
          border-radius: 0.5rem;
          height: 100%;
        }

        .label {
          font-size: 0.55rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #B8975A;
        }

        .name {
          font-size: 0.9rem;
          font-weight: 300;
          letter-spacing: 0.06em;
          color: #ffffff;
        }
      </style>
    </template>
  };

  static fitted = class Fitted extends Component<typeof BrandGuide> {
    <template>
      <div class='guide-fitted'>
        <div class='mark'>BG</div>
        <span class='label'>Brand Guide</span>
      </div>

      <style scoped>
        .guide-fitted {
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 0.5rem;
          padding: 1rem;
          background: #1a1a1a;
          height: 100%;
          border-radius: 0.5rem;
        }

        .mark {
          font-size: 1.5rem;
          font-weight: 200;
          letter-spacing: 0.1em;
          color: #B8975A;
        }

        .label {
          font-size: 0.55rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: rgba(255, 255, 255, 0.4);
        }
      </style>
    </template>
  };
}
