import {
  CardDef,
  field,
  contains,
  Component,
} from 'https://cardstack.com/base/card-api';
import StringField from 'https://cardstack.com/base/string';
import enumField from 'https://cardstack.com/base/enum';

const LevelField = enumField(StringField, {
  options: ['Junior', 'Adult', 'Elite', 'Private'],
});

export class Program extends CardDef {
  static displayName = 'Program';

  @field programName = contains(StringField);
  @field level = contains(LevelField);
  @field description = contains(StringField);
  @field schedule = contains(StringField);
  @field price = contains(StringField);
  @field image = contains(StringField);

  @field title = contains(StringField, {
    computeVia: function (this: Program) {
      return this.programName ?? 'Untitled Program';
    },
  });

  static isolated = class Isolated extends Component<typeof Program> {
    get safeName() {
      return this.args.model?.programName ?? 'Untitled Program';
    }

    get safeLevel() {
      return this.args.model?.level ?? 'Adult';
    }

    get safeImage() {
      return (
        this.args.model?.image ??
        'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=800&h=500&fit=crop'
      );
    }

    <template>
      <article class='program'>
        <div class='program-hero'>
          <img src={{this.safeImage}} alt={{this.safeName}} class='hero-img' />
        </div>

        <div class='program-content'>
          <span class='level-tag'>{{this.safeLevel}}</span>
          <h1 class='program-title'>{{this.safeName}}</h1>

          {{#if @model.description}}
            <p class='program-desc'>{{@model.description}}</p>
          {{/if}}

          <div class='details-row'>
            {{#if @model.schedule}}
              <div class='detail'>
                <span class='detail-label'>Schedule</span>
                <span class='detail-val'>{{@model.schedule}}</span>
              </div>
            {{/if}}
            {{#if @model.price}}
              <div class='detail'>
                <span class='detail-label'>Investment</span>
                <span class='detail-val'>{{@model.price}}</span>
              </div>
            {{/if}}
          </div>
        </div>
      </article>

      <style scoped>
        .program {
          max-width: 40rem;
          margin: 0 auto;
          background: #ffffff;
          color: #1a1a1a;
          font-family: system-ui, -apple-system, 'Helvetica Neue', Arial, sans-serif;
        }

        .program-hero {
          width: 100%;
          height: 20rem;
          overflow: hidden;
        }

        .hero-img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: grayscale(15%) contrast(1.05);
        }

        .program-content {
          padding: 2.5rem;
          display: flex;
          flex-direction: column;
          gap: 1rem;
        }

        .level-tag {
          font-size: 0.6rem;
          font-weight: 700;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #B8975A;
        }

        .program-title {
          font-size: 2rem;
          font-weight: 300;
          letter-spacing: 0.02em;
          margin: 0;
          color: #1a1a1a;
        }

        .program-desc {
          font-size: 1rem;
          line-height: 1.8;
          color: #6B6B6B;
          margin: 0.5rem 0 0;
        }

        .details-row {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 1.5rem;
          padding-top: 1.5rem;
          border-top: 1px solid #e8e8e8;
          margin-top: 0.5rem;
        }

        .detail {
          display: flex;
          flex-direction: column;
          gap: 0.25rem;
        }

        .detail-label {
          font-size: 0.55rem;
          font-weight: 700;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #B8975A;
        }

        .detail-val {
          font-size: 0.95rem;
          color: #1a1a1a;
        }
      </style>
    </template>
  };

  static embedded = class Embedded extends Component<typeof Program> {
    get safeName() {
      return this.args.model?.programName ?? 'Untitled Program';
    }

    get safeLevel() {
      return this.args.model?.level ?? 'Adult';
    }

    <template>
      <div class='prog-embed'>
        <div class='prog-left'>
          <span class='level'>{{this.safeLevel}}</span>
          <span class='name'>{{this.safeName}}</span>
        </div>
        {{#if @model.price}}
          <span class='price'>{{@model.price}}</span>
        {{/if}}
      </div>

      <style scoped>
        .prog-embed {
          display: flex;
          align-items: center;
          justify-content: space-between;
          gap: 1rem;
          padding: 0.875rem 1rem;
          background: #ffffff;
          border: 1px solid #e8e8e8;
          border-radius: 0.375rem;
          height: 100%;
          font-family: system-ui, -apple-system, sans-serif;
        }

        .prog-left {
          display: flex;
          flex-direction: column;
          gap: 0.125rem;
          min-width: 0;
        }

        .level {
          font-size: 0.5rem;
          font-weight: 700;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #B8975A;
        }

        .name {
          font-size: 0.85rem;
          font-weight: 500;
          color: #1a1a1a;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .price {
          font-size: 0.75rem;
          font-weight: 600;
          color: #1a1a1a;
          flex-shrink: 0;
        }
      </style>
    </template>
  };

  static fitted = class Fitted extends Component<typeof Program> {
    get safeName() {
      return this.args.model?.programName ?? 'Untitled Program';
    }

    get safeImage() {
      return (
        this.args.model?.image ??
        'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=400&h=300&fit=crop'
      );
    }

    <template>
      <div class='prog-fitted'>
        <img src={{this.safeImage}} alt={{this.safeName}} class='bg' />
        <div class='overlay'></div>
        <div class='content'>
          <span class='name'>{{this.safeName}}</span>
        </div>
      </div>

      <style scoped>
        .prog-fitted {
          position: relative;
          width: 100%;
          height: 100%;
          border-radius: 0.375rem;
          overflow: hidden;
        }

        .bg {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: brightness(0.4) grayscale(20%);
        }

        .overlay {
          position: absolute;
          inset: 0;
          background: linear-gradient(transparent 40%, rgba(26, 26, 26, 0.8) 100%);
        }

        .content {
          position: absolute;
          bottom: 0;
          left: 0;
          right: 0;
          padding: 0.75rem;
        }

        .name {
          font-size: 0.7rem;
          font-weight: 500;
          color: #ffffff;
          letter-spacing: 0.02em;
        }
      </style>
    </template>
  };
}
