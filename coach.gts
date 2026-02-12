import {
  CardDef,
  field,
  contains,
  Component,
} from 'https://cardstack.com/base/card-api';
import StringField from 'https://cardstack.com/base/string';

export class Coach extends CardDef {
  static displayName = 'Coach';

  @field coachName = contains(StringField);
  @field role = contains(StringField);
  @field bio = contains(StringField);
  @field avatar = contains(StringField);
  @field specialty = contains(StringField);

  @field title = contains(StringField, {
    computeVia: function (this: Coach) {
      return this.coachName ?? 'Unnamed Coach';
    },
  });

  static isolated = class Isolated extends Component<typeof Coach> {
    get safeAvatar() {
      return (
        this.args.model?.avatar ??
        'https://via.placeholder.com/400x500/F5F0EB/1a1a1a?text=Coach'
      );
    }

    get safeName() {
      return this.args.model?.coachName ?? 'Unnamed Coach';
    }

    <template>
      <article class='coach'>
        <div class='coach-layout'>
          <div class='portrait-wrap'>
            <img src={{this.safeAvatar}} alt={{this.safeName}} class='portrait' />
          </div>

          <div class='coach-content'>
            <span class='eyebrow'>Coach Profile</span>
            <h1 class='coach-name'>{{this.safeName}}</h1>
            {{#if @model.role}}
              <span class='coach-role'>{{@model.role}}</span>
            {{/if}}

            {{#if @model.specialty}}
              <div class='specialty'>
                <span class='spec-label'>Specialty</span>
                <span class='spec-val'>{{@model.specialty}}</span>
              </div>
            {{/if}}

            {{#if @model.bio}}
              <p class='coach-bio'>{{@model.bio}}</p>
            {{/if}}
          </div>
        </div>
      </article>

      <style scoped>
        .coach {
          max-width: 48rem;
          margin: 0 auto;
          background: #ffffff;
          color: #1a1a1a;
          font-family: system-ui, -apple-system, 'Helvetica Neue', Arial, sans-serif;
        }

        .coach-layout {
          display: grid;
          grid-template-columns: 1fr 1.3fr;
          min-height: 24rem;
        }

        .portrait-wrap {
          overflow: hidden;
        }

        .portrait {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: grayscale(30%) contrast(1.05);
        }

        .coach-content {
          padding: 3rem;
          display: flex;
          flex-direction: column;
          gap: 0.75rem;
          justify-content: center;
        }

        .eyebrow {
          font-size: 0.55rem;
          font-weight: 700;
          text-transform: uppercase;
          letter-spacing: 0.25em;
          color: #B8975A;
        }

        .coach-name {
          font-size: 2rem;
          font-weight: 300;
          letter-spacing: 0.02em;
          margin: 0;
          color: #1a1a1a;
        }

        .coach-role {
          font-size: 0.65rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.15em;
          color: #999;
        }

        .specialty {
          display: flex;
          flex-direction: column;
          gap: 0.2rem;
          padding: 1rem 0;
          border-top: 1px solid #e8e8e8;
          border-bottom: 1px solid #e8e8e8;
          margin: 0.5rem 0;
        }

        .spec-label {
          font-size: 0.5rem;
          font-weight: 700;
          text-transform: uppercase;
          letter-spacing: 0.2em;
          color: #B8975A;
        }

        .spec-val {
          font-size: 0.9rem;
          color: #1a1a1a;
        }

        .coach-bio {
          font-size: 0.95rem;
          line-height: 1.8;
          color: #6B6B6B;
          margin: 0;
        }
      </style>
    </template>
  };

  static embedded = class Embedded extends Component<typeof Coach> {
    get safeAvatar() {
      return (
        this.args.model?.avatar ??
        'https://via.placeholder.com/80x80/F5F0EB/1a1a1a?text=C'
      );
    }

    get safeName() {
      return this.args.model?.coachName ?? 'Unnamed Coach';
    }

    <template>
      <div class='coach-embed'>
        <div class='avatar'>
          <img src={{this.safeAvatar}} alt={{this.safeName}} />
        </div>
        <div class='info'>
          <span class='name'>{{this.safeName}}</span>
          {{#if @model.role}}
            <span class='role'>{{@model.role}}</span>
          {{/if}}
        </div>
      </div>

      <style scoped>
        .coach-embed {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          padding: 0.75rem;
          background: #ffffff;
          border: 1px solid #e8e8e8;
          border-radius: 0.375rem;
          height: 100%;
          font-family: system-ui, -apple-system, sans-serif;
        }

        .avatar {
          flex-shrink: 0;
          width: 2.75rem;
          height: 2.75rem;
          border-radius: 50%;
          overflow: hidden;
          border: 1.5px solid #e8e8e8;
        }

        .avatar img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: grayscale(20%);
        }

        .info {
          display: flex;
          flex-direction: column;
          gap: 0.125rem;
          min-width: 0;
        }

        .name {
          font-size: 0.85rem;
          font-weight: 500;
          color: #1a1a1a;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .role {
          font-size: 0.55rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.12em;
          color: #B8975A;
        }
      </style>
    </template>
  };

  static fitted = class Fitted extends Component<typeof Coach> {
    get safeAvatar() {
      return (
        this.args.model?.avatar ??
        'https://via.placeholder.com/200x200/F5F0EB/1a1a1a?text=C'
      );
    }

    get safeName() {
      return this.args.model?.coachName ?? 'Unnamed Coach';
    }

    <template>
      <div class='coach-fitted'>
        <div class='avatar'>
          <img src={{this.safeAvatar}} alt={{this.safeName}} />
        </div>
        <span class='name'>{{this.safeName}}</span>
        {{#if @model.role}}
          <span class='role'>{{@model.role}}</span>
        {{/if}}
      </div>

      <style scoped>
        .coach-fitted {
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 0.375rem;
          padding: 1rem;
          background: #ffffff;
          border: 1px solid #e8e8e8;
          border-radius: 0.375rem;
          height: 100%;
          text-align: center;
          font-family: system-ui, -apple-system, sans-serif;
        }

        .avatar {
          width: 3.5rem;
          height: 3.5rem;
          border-radius: 50%;
          overflow: hidden;
          border: 1.5px solid #e8e8e8;
        }

        .avatar img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: grayscale(20%);
        }

        .name {
          font-size: 0.8rem;
          font-weight: 500;
          color: #1a1a1a;
        }

        .role {
          font-size: 0.5rem;
          font-weight: 600;
          text-transform: uppercase;
          letter-spacing: 0.12em;
          color: #B8975A;
        }
      </style>
    </template>
  };
}
