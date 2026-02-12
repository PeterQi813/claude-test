import {
  CardDef,
  field,
  contains,
  Component,
  getCards,
} from 'https://cardstack.com/base/card-api';
import StringField from 'https://cardstack.com/base/string';
import MarkdownField from 'https://cardstack.com/base/markdown';
import { tracked } from '@glimmer/tracking';

export class LandingPage extends CardDef {
  static displayName = 'Landing Page';

  @field academyName = contains(StringField);
  @field tagline = contains(StringField);
  @field heroImage = contains(StringField);
  @field description = contains(MarkdownField);
  @field contactEmail = contains(StringField);
  @field contactPhone = contains(StringField);
  @field location = contains(StringField);
  @field philosophyQuote = contains(StringField);
  @field philosophyAttribution = contains(StringField);
  @field stat1Number = contains(StringField);
  @field stat1Label = contains(StringField);
  @field stat2Number = contains(StringField);
  @field stat2Label = contains(StringField);
  @field stat3Number = contains(StringField);
  @field stat3Label = contains(StringField);
  @field stat4Number = contains(StringField);
  @field stat4Label = contains(StringField);
  @field secondaryImage = contains(StringField);

  @field title = contains(StringField, {
    computeVia: function (this: LandingPage) {
      return this.academyName ?? 'Tennis Academy';
    },
  });

  static isolated = class Isolated extends Component<typeof LandingPage> {
    @tracked programs: any[] = [];
    @tracked coaches: any[] = [];
    @tracked isLoading = true;

    constructor(owner: any, args: any) {
      super(owner, args);
      this.loadData();
    }

    async loadData() {
      try {
        this.isLoading = true;
        const realmURL = this.args.model?.[Symbol.for('realmURL')];

        const [programResults, coachResults] = await Promise.all([
          getCards(
            {
              filter: {
                type: {
                  module: new URL('./program', import.meta.url).href,
                  name: 'Program',
                },
              },
            },
            { realmURL },
          ),
          getCards(
            {
              filter: {
                type: {
                  module: new URL('./coach', import.meta.url).href,
                  name: 'Coach',
                },
              },
            },
            { realmURL },
          ),
        ]);

        this.programs = programResults || [];
        this.coaches = coachResults || [];
      } catch (error) {
        console.error('Error loading landing page data:', error);
      } finally {
        this.isLoading = false;
      }
    }

    get safeName() {
      return this.args.model?.academyName ?? 'Tennis Academy';
    }

    get safeTagline() {
      return this.args.model?.tagline ?? 'Excellence in Every Rally';
    }

    get safeHeroImage() {
      return (
        this.args.model?.heroImage ??
        'https://images.unsplash.com/photo-1622279457486-62dcc4a431d6?w=1920&h=1080&fit=crop'
      );
    }

    get safeSecondaryImage() {
      return (
        this.args.model?.secondaryImage ??
        'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=1200&h=800&fit=crop'
      );
    }

    <template>
      <div class='lp'>

        {{! ═══════════ HERO ═══════════ }}
        <section class='hero'>
          <div class='hero-img-wrap'>
            <img src={{this.safeHeroImage}} alt='' class='hero-img' />
          </div>
          <div class='hero-overlay'></div>
          <div class='hero-content'>
            <span class='hero-eyebrow'>Est. 2026 · Lausanne, Switzerland</span>
            <h1 class='hero-display'>{{this.safeName}}</h1>
            <div class='hero-rule'></div>
            <p class='hero-tagline'>{{this.safeTagline}}</p>
            <div class='hero-cta-row'>
              <span class='pill-btn'>Explore Programs</span>
              <span class='pill-btn pill-outline'>Our Philosophy</span>
            </div>
          </div>
        </section>

        {{! ═══════════ PHILOSOPHY QUOTE ═══════════ }}
        {{#if @model.philosophyQuote}}
          <section class='quote-section'>
            <div class='quote-inner'>
              <div class='quote-mark'>"</div>
              <blockquote class='quote-text'>{{@model.philosophyQuote}}</blockquote>
              {{#if @model.philosophyAttribution}}
                <cite class='quote-cite'>— {{@model.philosophyAttribution}}</cite>
              {{/if}}
            </div>
          </section>
        {{/if}}

        {{! ═══════════ STATS BAR ═══════════ }}
        <section class='stats-bar'>
          <div class='stats-inner'>
            {{#if @model.stat1Number}}
              <div class='stat'>
                <span class='stat-num'>{{@model.stat1Number}}</span>
                <span class='stat-label'>{{@model.stat1Label}}</span>
              </div>
            {{/if}}
            {{#if @model.stat2Number}}
              <div class='stat'>
                <span class='stat-num'>{{@model.stat2Number}}</span>
                <span class='stat-label'>{{@model.stat2Label}}</span>
              </div>
            {{/if}}
            {{#if @model.stat3Number}}
              <div class='stat'>
                <span class='stat-num'>{{@model.stat3Number}}</span>
                <span class='stat-label'>{{@model.stat3Label}}</span>
              </div>
            {{/if}}
            {{#if @model.stat4Number}}
              <div class='stat'>
                <span class='stat-num'>{{@model.stat4Number}}</span>
                <span class='stat-label'>{{@model.stat4Label}}</span>
              </div>
            {{/if}}
          </div>
        </section>

        {{! ═══════════ ABOUT ═══════════ }}
        {{#if @model.description}}
          <section class='about'>
            <div class='about-inner'>
              <div class='about-left'>
                <span class='section-eyebrow'>About the Academy</span>
                <h2 class='section-headline'>Precision.<br />Grace.<br />Character.</h2>
              </div>
              <div class='about-right'>
                <div class='about-text'>
                  <@fields.description />
                </div>
              </div>
            </div>
          </section>
        {{/if}}

        {{! ═══════════ EDITORIAL IMAGE ═══════════ }}
        <section class='editorial'>
          <div class='editorial-img-wrap'>
            <img src={{this.safeSecondaryImage}} alt='' class='editorial-img' />
          </div>
        </section>

        {{! ═══════════ PROGRAMS ═══════════ }}
        {{#if this.programs.length}}
          <section class='programs'>
            <div class='programs-header'>
              <span class='section-eyebrow'>Programs</span>
              <h2 class='section-headline'>Pathways to Excellence</h2>
              <p class='section-sub'>Tailored programs for every stage of the journey, from first serve to centre court.</p>
            </div>
            <div class='programs-grid'>
              {{#each this.programs as |program|}}
                <div class='prog-card'>
                  <div class='prog-img-wrap'>
                    <img
                      src={{if
                        program.image
                        program.image
                        'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=600&h=400&fit=crop'
                      }}
                      alt={{if program.programName program.programName 'Program'}}
                      class='prog-img'
                    />
                  </div>
                  <div class='prog-body'>
                    {{#if program.level}}
                      <span class='prog-level'>{{program.level}}</span>
                    {{/if}}
                    <h3 class='prog-name'>{{if program.programName program.programName 'Program'}}</h3>
                    {{#if program.description}}
                      <p class='prog-desc'>{{program.description}}</p>
                    {{/if}}
                    <div class='prog-footer'>
                      {{#if program.schedule}}
                        <span class='prog-schedule'>{{program.schedule}}</span>
                      {{/if}}
                      {{#if program.price}}
                        <span class='prog-price'>{{program.price}}</span>
                      {{/if}}
                    </div>
                  </div>
                </div>
              {{/each}}
            </div>
          </section>
        {{/if}}

        {{! ═══════════ COACHES ═══════════ }}
        {{#if this.coaches.length}}
          <section class='coaches'>
            <div class='coaches-header'>
              <span class='section-eyebrow'>Coaching Team</span>
              <h2 class='section-headline'>Led by the Best</h2>
            </div>
            <div class='coaches-grid'>
              {{#each this.coaches as |coach|}}
                <div class='coach-card'>
                  <div class='coach-img-wrap'>
                    <img
                      src={{if
                        coach.avatar
                        coach.avatar
                        'https://via.placeholder.com/400x500/1a1a1a/B8975A?text=Coach'
                      }}
                      alt={{if coach.coachName coach.coachName 'Coach'}}
                      class='coach-img'
                    />
                  </div>
                  <div class='coach-info'>
                    <h3 class='coach-name'>{{if coach.coachName coach.coachName 'Coach'}}</h3>
                    {{#if coach.role}}
                      <span class='coach-role'>{{coach.role}}</span>
                    {{/if}}
                    {{#if coach.specialty}}
                      <span class='coach-spec'>{{coach.specialty}}</span>
                    {{/if}}
                  </div>
                </div>
              {{/each}}
            </div>
          </section>
        {{/if}}

        {{! ═══════════ CONTACT / CTA ═══════════ }}
        <section class='contact'>
          <div class='contact-inner'>
            <span class='section-eyebrow section-eyebrow-light'>Begin Your Journey</span>
            <h2 class='contact-headline'>The court awaits.</h2>
            <div class='contact-details'>
              {{#if @model.location}}
                <div class='contact-col'>
                  <span class='contact-label'>Location</span>
                  <span class='contact-val'>{{@model.location}}</span>
                </div>
              {{/if}}
              {{#if @model.contactEmail}}
                <div class='contact-col'>
                  <span class='contact-label'>Email</span>
                  <span class='contact-val'>{{@model.contactEmail}}</span>
                </div>
              {{/if}}
              {{#if @model.contactPhone}}
                <div class='contact-col'>
                  <span class='contact-label'>Telephone</span>
                  <span class='contact-val'>{{@model.contactPhone}}</span>
                </div>
              {{/if}}
            </div>
            <div class='contact-cta'>
              <span class='pill-btn pill-white'>Book a Visit</span>
            </div>
          </div>
        </section>

        {{! ═══════════ FOOTER ═══════════ }}
        <footer class='footer'>
          <div class='footer-inner'>
            <span class='footer-brand'>{{this.safeName}}</span>
            <div class='footer-rule'></div>
            <span class='footer-legal'>All rights reserved.</span>
          </div>
        </footer>
      </div>

      <style scoped>
        /* ══════════════════════════════════
           RF TENNIS ACADEMY — LANDING PAGE
           Brand: White-dominant, Charcoal,
           Gold accent, Swiss minimalism
           Ref: rogerfederer.com
           ══════════════════════════════════ */

        .lp {
          width: 100%;
          background: #ffffff;
          color: #1a1a1a;
          font-family: system-ui, -apple-system, 'Helvetica Neue', Arial, sans-serif;
          -webkit-font-smoothing: antialiased;
        }

        /* ── Shared Tokens ── */
        .section-eyebrow {
          display: block;
          font-size: 0.65rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.22em;
          color: #B8975A;
          margin-bottom: 1rem;
        }

        .section-eyebrow-light {
          color: #B8975A;
        }

        .section-headline {
          font-size: 2.5rem;
          font-weight: 300;
          letter-spacing: 0.01em;
          line-height: 1.15;
          margin: 0;
          color: #1a1a1a;
        }

        .section-sub {
          font-size: 1rem;
          line-height: 1.7;
          color: #6B6B6B;
          margin: 1.25rem 0 0;
          max-width: 32rem;
        }

        .pill-btn {
          display: inline-block;
          padding: 0.875rem 2.25rem;
          border-radius: 9999px;
          font-size: 0.7rem;
          font-weight: 600;
          letter-spacing: 0.1em;
          text-transform: uppercase;
          background: #1a1a1a;
          color: #ffffff;
          cursor: pointer;
          transition: opacity 0.3s ease;
        }

        .pill-btn:hover {
          opacity: 0.8;
        }

        .pill-outline {
          background: transparent;
          color: #ffffff;
          box-shadow: inset 0 0 0 1.5px rgba(255, 255, 255, 0.5);
        }

        .pill-outline:hover {
          box-shadow: inset 0 0 0 1.5px rgba(255, 255, 255, 1);
          opacity: 1;
        }

        .pill-white {
          background: #ffffff;
          color: #1a1a1a;
        }

        /* ══════ HERO ══════ */
        .hero {
          position: relative;
          height: 100vh;
          min-height: 36rem;
          max-height: 52rem;
          overflow: hidden;
        }

        .hero-img-wrap {
          position: absolute;
          inset: 0;
        }

        .hero-img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: brightness(0.35) contrast(1.1);
        }

        .hero-overlay {
          position: absolute;
          inset: 0;
          background: linear-gradient(
            180deg,
            rgba(26, 26, 26, 0.15) 0%,
            rgba(26, 26, 26, 0.6) 70%,
            rgba(26, 26, 26, 0.85) 100%
          );
        }

        .hero-content {
          position: absolute;
          inset: 0;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          text-align: center;
          padding: 2rem;
          z-index: 1;
        }

        .hero-eyebrow {
          font-size: 0.6rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.3em;
          color: rgba(255, 255, 255, 0.5);
          margin-bottom: 2rem;
        }

        .hero-display {
          font-size: 4.5rem;
          font-weight: 200;
          letter-spacing: 0.14em;
          text-transform: uppercase;
          color: #ffffff;
          margin: 0;
          line-height: 1.05;
        }

        .hero-rule {
          width: 3.5rem;
          height: 1px;
          background: #B8975A;
          margin: 2rem 0;
        }

        .hero-tagline {
          font-size: 1.15rem;
          font-weight: 300;
          letter-spacing: 0.04em;
          color: rgba(255, 255, 255, 0.7);
          margin: 0 0 2.5rem;
        }

        .hero-cta-row {
          display: flex;
          gap: 1rem;
          flex-wrap: wrap;
          justify-content: center;
        }

        /* ══════ PHILOSOPHY QUOTE ══════ */
        .quote-section {
          background: #ffffff;
          padding: 7rem 2rem;
        }

        .quote-inner {
          max-width: 44rem;
          margin: 0 auto;
          text-align: center;
        }

        .quote-mark {
          font-size: 5rem;
          font-weight: 200;
          line-height: 0.5;
          color: #B8975A;
          margin-bottom: 1.5rem;
        }

        .quote-text {
          font-size: 1.65rem;
          font-weight: 300;
          line-height: 1.6;
          color: #1a1a1a;
          margin: 0;
          letter-spacing: 0.01em;
        }

        .quote-cite {
          display: block;
          margin-top: 2rem;
          font-size: 0.7rem;
          font-weight: 600;
          font-style: normal;
          text-transform: uppercase;
          letter-spacing: 0.18em;
          color: #999;
        }

        /* ══════ STATS ══════ */
        .stats-bar {
          background: #1a1a1a;
          padding: 4.5rem 2rem;
        }

        .stats-inner {
          max-width: 60rem;
          margin: 0 auto;
          display: grid;
          grid-template-columns: repeat(4, 1fr);
          gap: 2rem;
          text-align: center;
        }

        .stat {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 0.5rem;
        }

        .stat-num {
          font-size: 3rem;
          font-weight: 200;
          color: #B8975A;
          line-height: 1;
          letter-spacing: 0.02em;
        }

        .stat-label {
          font-size: 0.6rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.18em;
          color: rgba(255, 255, 255, 0.45);
        }

        /* ══════ ABOUT ══════ */
        .about {
          padding: 8rem 2rem;
          background: #F5F0EB;
        }

        .about-inner {
          max-width: 60rem;
          margin: 0 auto;
          display: grid;
          grid-template-columns: 1fr 1.2fr;
          gap: 5rem;
          align-items: start;
        }

        .about-left {
          position: sticky;
          top: 2rem;
        }

        .about-text {
          font-size: 1.05rem;
          line-height: 1.9;
          color: #555;
        }

        /* ══════ EDITORIAL IMAGE ══════ */
        .editorial {
          padding: 0;
        }

        .editorial-img-wrap {
          width: 100%;
          max-height: 28rem;
          overflow: hidden;
        }

        .editorial-img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: grayscale(25%) contrast(1.05);
        }

        /* ══════ PROGRAMS ══════ */
        .programs {
          padding: 8rem 2rem;
          background: #ffffff;
        }

        .programs-header {
          max-width: 60rem;
          margin: 0 auto 4rem;
          text-align: center;
        }

        .programs-grid {
          max-width: 64rem;
          margin: 0 auto;
          display: grid;
          grid-template-columns: repeat(2, 1fr);
          gap: 2rem;
        }

        .prog-card {
          background: #ffffff;
          border: 1px solid #e8e8e8;
          border-radius: 0.5rem;
          overflow: hidden;
          transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .prog-card:hover {
          border-color: #ccc;
          box-shadow: 0 12px 40px rgba(0, 0, 0, 0.06);
        }

        .prog-img-wrap {
          height: 12rem;
          overflow: hidden;
        }

        .prog-img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          transition: transform 0.6s ease;
          filter: grayscale(15%);
        }

        .prog-card:hover .prog-img {
          transform: scale(1.04);
        }

        .prog-body {
          padding: 1.75rem;
          display: flex;
          flex-direction: column;
          gap: 0.625rem;
        }

        .prog-level {
          font-size: 0.55rem;
          font-weight: 700;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #B8975A;
        }

        .prog-name {
          font-size: 1.25rem;
          font-weight: 500;
          margin: 0;
          color: #1a1a1a;
          letter-spacing: 0.01em;
        }

        .prog-desc {
          font-size: 0.875rem;
          line-height: 1.65;
          color: #6B6B6B;
          margin: 0;
          display: -webkit-box;
          -webkit-line-clamp: 3;
          -webkit-box-orient: vertical;
          overflow: hidden;
        }

        .prog-footer {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding-top: 1rem;
          border-top: 1px solid #f0f0f0;
          margin-top: 0.375rem;
        }

        .prog-schedule {
          font-size: 0.65rem;
          font-weight: 500;
          color: #999;
          text-transform: uppercase;
          letter-spacing: 0.06em;
        }

        .prog-price {
          font-size: 0.8rem;
          font-weight: 600;
          color: #1a1a1a;
        }

        /* ══════ COACHES ══════ */
        .coaches {
          padding: 8rem 2rem;
          background: #F5F0EB;
        }

        .coaches-header {
          max-width: 60rem;
          margin: 0 auto 4rem;
          text-align: center;
        }

        .coaches-grid {
          max-width: 56rem;
          margin: 0 auto;
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 2.5rem;
        }

        .coach-card {
          text-align: center;
        }

        .coach-img-wrap {
          width: 100%;
          aspect-ratio: 4 / 5;
          border-radius: 0.375rem;
          overflow: hidden;
          margin-bottom: 1.25rem;
        }

        .coach-img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: grayscale(30%) contrast(1.05);
          transition: filter 0.5s ease, transform 0.5s ease;
        }

        .coach-card:hover .coach-img {
          filter: grayscale(0%) contrast(1);
          transform: scale(1.02);
        }

        .coach-info {
          display: flex;
          flex-direction: column;
          gap: 0.25rem;
        }

        .coach-name {
          font-size: 1.05rem;
          font-weight: 600;
          margin: 0;
          color: #1a1a1a;
          letter-spacing: 0.01em;
        }

        .coach-role {
          font-size: 0.6rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.15em;
          color: #B8975A;
        }

        .coach-spec {
          font-size: 0.8rem;
          color: #888;
          margin-top: 0.25rem;
        }

        /* ══════ CONTACT ══════ */
        .contact {
          background: #1a1a1a;
          padding: 8rem 2rem;
          text-align: center;
        }

        .contact-inner {
          max-width: 48rem;
          margin: 0 auto;
        }

        .contact-headline {
          font-size: 3rem;
          font-weight: 200;
          letter-spacing: 0.06em;
          color: #ffffff;
          margin: 0 0 3rem;
        }

        .contact-details {
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 2rem;
          margin-bottom: 3.5rem;
        }

        .contact-col {
          display: flex;
          flex-direction: column;
          gap: 0.375rem;
        }

        .contact-label {
          font-size: 0.55rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #B8975A;
        }

        .contact-val {
          font-size: 0.95rem;
          color: rgba(255, 255, 255, 0.75);
          line-height: 1.5;
        }

        .contact-cta {
          margin-top: 0.5rem;
        }

        /* ══════ FOOTER ══════ */
        .footer {
          background: #111111;
          padding: 3rem 2rem;
        }

        .footer-inner {
          max-width: 60rem;
          margin: 0 auto;
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 1.5rem;
        }

        .footer-brand {
          font-size: 0.6rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: rgba(255, 255, 255, 0.3);
        }

        .footer-rule {
          width: 2rem;
          height: 1px;
          background: rgba(255, 255, 255, 0.1);
        }

        .footer-legal {
          font-size: 0.6rem;
          font-weight: 400;
          letter-spacing: 0.06em;
          color: rgba(255, 255, 255, 0.2);
        }
      </style>
    </template>
  };

  static embedded = class Embedded extends Component<typeof LandingPage> {
    get safeName() {
      return this.args.model?.academyName ?? 'Tennis Academy';
    }

    get safeTagline() {
      return this.args.model?.tagline ?? 'Excellence in Every Rally';
    }

    get safeHeroImage() {
      return (
        this.args.model?.heroImage ??
        'https://images.unsplash.com/photo-1622279457486-62dcc4a431d6?w=600&h=300&fit=crop'
      );
    }

    <template>
      <div class='embed'>
        <div class='embed-bg'>
          <img src={{this.safeHeroImage}} alt='' />
        </div>
        <div class='embed-overlay'></div>
        <div class='embed-content'>
          <span class='embed-eyebrow'>Tennis Academy</span>
          <span class='embed-name'>{{this.safeName}}</span>
          <div class='embed-rule'></div>
          <span class='embed-tagline'>{{this.safeTagline}}</span>
        </div>
      </div>

      <style scoped>
        .embed {
          position: relative;
          border-radius: 0.375rem;
          overflow: hidden;
          height: 100%;
          min-height: 6rem;
        }

        .embed-bg {
          position: absolute;
          inset: 0;
        }

        .embed-bg img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: brightness(0.3) contrast(1.1);
        }

        .embed-overlay {
          position: absolute;
          inset: 0;
          background: linear-gradient(180deg, transparent 20%, rgba(26, 26, 26, 0.7) 100%);
        }

        .embed-content {
          position: relative;
          z-index: 1;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          padding: 1.25rem;
          height: 100%;
          text-align: center;
          gap: 0.375rem;
        }

        .embed-eyebrow {
          font-size: 0.5rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.25em;
          color: #B8975A;
        }

        .embed-name {
          font-size: 1.1rem;
          font-weight: 200;
          letter-spacing: 0.12em;
          text-transform: uppercase;
          color: #ffffff;
        }

        .embed-rule {
          width: 1.5rem;
          height: 1px;
          background: #B8975A;
        }

        .embed-tagline {
          font-size: 0.65rem;
          font-weight: 300;
          color: rgba(255, 255, 255, 0.6);
          letter-spacing: 0.03em;
        }
      </style>
    </template>
  };

  static fitted = class Fitted extends Component<typeof LandingPage> {
    get safeName() {
      return this.args.model?.academyName ?? 'Tennis Academy';
    }

    get safeHeroImage() {
      return (
        this.args.model?.heroImage ??
        'https://images.unsplash.com/photo-1622279457486-62dcc4a431d6?w=400&h=300&fit=crop'
      );
    }

    <template>
      <div class='fitted'>
        <img src={{this.safeHeroImage}} alt='' class='fitted-bg' />
        <div class='fitted-overlay'></div>
        <div class='fitted-content'>
          <div class='fitted-rule'></div>
          <span class='fitted-name'>{{this.safeName}}</span>
        </div>
      </div>

      <style scoped>
        .fitted {
          position: relative;
          width: 100%;
          height: 100%;
          border-radius: 0.375rem;
          overflow: hidden;
        }

        .fitted-bg {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: brightness(0.25) contrast(1.1);
        }

        .fitted-overlay {
          position: absolute;
          inset: 0;
          background: rgba(26, 26, 26, 0.3);
        }

        .fitted-content {
          position: absolute;
          inset: 0;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 0.625rem;
          padding: 0.75rem;
        }

        .fitted-rule {
          width: 1.5rem;
          height: 1px;
          background: #B8975A;
        }

        .fitted-name {
          font-size: 0.7rem;
          font-weight: 300;
          letter-spacing: 0.12em;
          text-transform: uppercase;
          color: #ffffff;
          text-align: center;
        }
      </style>
    </template>
  };
}
