<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" data-astro-cid-sckkx6r4>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" type="image/svg+xml" href="<%= request.getContextPath() %>/dist/favicon.svg" />
    <meta name="generator" content="Astro v5.16.6" />
    <title>Astro Basics</title>
    <style>
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 200;
        font-style: normal;
        src: url(./dist/_astro/Lexend-ExtraLight.9KLIkcKL.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 300;
        font-style: normal;
        src: url(./dist/_astro/Lexend-Light.CljLvlWl.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 400;
        font-style: normal;
        src: url(./dist/_astro/Lexend-Regular.peUU6jwM.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 500;
        font-style: normal;
        src: url(./dist/_astro/Lexend-Medium.B4Ng5Mcm.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 600;
        font-style: normal;
        src: url(./dist/_astro/Lexend-SemiBold.B1FI2Xqt.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 700;
        font-style: normal;
        src: url(./dist/_astro/Lexend-Bold.BHD1AiDd.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 800;
        font-style: normal;
        src: url(./dist/_astro/Lexend-ExtraBold.IeePgDw2.ttf) format("truetype");
      }
      * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
      }
      body {
        font-size: 16px;
        font-family: Lexend, sans-serif;
        background-color: #edf2f4;
        color: #333;
      }
      img {
        display: block;
      }
      .btn {
        color: #ff5733;
        font-weight: 700;
        text-decoration: none;
      }
      .btn:hover {
        text-decoration: underline;
        text-underline-offset: 0.2rem;
      }
      .flex {
        display: flex;
        align-items: center;
        gap: 0.5em;
      }
      html,
      body {
        margin: 0;
        width: 100%;
        height: 100%;
      }
      .main-title[data-astro-cid-aup47j5x] {
        color: #000;
        margin-bottom: 0.9em;
        font-size: 1.4em;
        text-align: var(--align);
      }
      .simple-button[data-astro-cid-quglckyz] {
        text-align: center;
        outline: none;
        padding: 0.7em 2em;
        border-radius: 0.4em;
        border: solid 0.1rem transparent;
        margin-bottom: 0.4em;
        background-color: transparent;
        text-decoration: none;
        font-size: 0.9em;
      }
      .simple-button[data-astro-cid-quglckyz]:hover {
        text-decoration: none;
      }
      .simple-button[data-astro-cid-quglckyz].primary {
        background-color: #ff5733;
        border-color: #ff5733;
        color: #fff;
      }
      .simple-button[data-astro-cid-quglckyz].primary:hover {
        background-color: #cc2400;
      }
      .simple-button[data-astro-cid-quglckyz].secondary {
        border: solid 0.1rem #ff5733;
        color: #ff5733;
        background-color: #fff;
      }
      .simple-button[data-astro-cid-quglckyz].secondary:hover {
        border-color: #cc2400;
        color: #cc2400;
      }
      .simple-button[data-astro-cid-quglckyz].default:hover {
        color: #cc2400;
      }
      .simple-button[data-astro-cid-quglckyz].block {
        display: block;
        width: 100%;
      }
      .welcome-component[data-astro-cid-mmc7otgs] {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 1em;
      }
      .welcome-component-name[data-astro-cid-mmc7otgs] {
        font-size: 1.3em;
      }
      .welcome-component-avatar[data-astro-cid-mmc7otgs] {
        background-color: #5a1846;
        color: #fff;
        font-size: 1.3em;
        width: 2em;
        height: 2em;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-shrink: 0;
      }
      .general-page-component-header {
        display: flex;
        justify-content: center;
      }
      .general-page-component .logo {
        width: 10em;
        position: relative;
        margin-left: auto;
        margin-right: auto;
      }
      .general-page-component .logo path {
        fill: #ff5733;
      }
      .container-component[data-astro-cid-d6puh33w] {
        max-width: 950px;
        padding: 1.5em 1em 1em;
        margin: 0 auto;
        position: relative;
      }
      .form-group[data-astro-cid-atrthr4o] {
        margin-bottom: 0.5em;
      }
      .form-group[data-astro-cid-atrthr4o] label[data-astro-cid-atrthr4o] {
        display: flex;
        flex-direction: column;
      }
      .form-group[data-astro-cid-atrthr4o]
        label[data-astro-cid-atrthr4o]
        span[data-astro-cid-atrthr4o] {
        padding-bottom: 0.3em;
        font-weight: 600;
        font-size: 0.9em;
      }
      .form-control[data-astro-cid-atrthr4o] {
        border: solid 0.1rem #8ca0b5;
        border-radius: 0.4em;
        outline: none;
        flex: 1;
        padding: 0.7em;
      }
      .form-control[data-astro-cid-atrthr4o].error {
        border-color: red;
        color: red;
      }
      .panel-component[data-astro-cid-u23vcbo2] {
        padding: 2em 1.5em 1.5em;
        border-radius: 1em;
        background-color: #fff;
        box-shadow: 0 0 0.5em #0000004d;
        margin-bottom: 1em;
      }
      .select-reservation .parking {
        border: solid 0.2em #edf2f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 3em;
      }
      .select-reservation .parking:hover {
        border-color: #cddbe1;
      }
      .select-reservation .parking img {
        opacity: 0;
        width: 70%;
        height: 70%;
        object-fit: contain;
        display: none;
      }
      @media (min-width: 768px) {
        .select-reservation .parking img {
          display: block;
        }
      }
      .select-reservation .parking .number {
        font-size: 1em;
      }
      @media (min-width: 768px) {
        .select-reservation .parking .number {
          font-size: 1.5em;
        }
      }
      @media (min-width: 768px) {
        .select-reservation .parking {
          height: 8em;
        }
      }
      .select-reservation input {
        display: none;
      }
      .select-reservation input:checked + .parking {
        color: #00f;
        border-color: #00f;
      }
      .select-reservation input:checked + .parking img {
        opacity: 1;
      }
      .select-reservation input:disabled + .parking {
        color: red;
        border-color: red;
      }
      .select-reservation input:disabled + .parking img {
        opacity: 1;
      }
      .create-reservation-select[data-astro-cid-ithn625t] {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(2em, 1fr));
        gap: 0.5em;
        margin-top: 0.5em;
        margin-bottom: 2em;
      }
      @media (min-width: 768px) {
        .create-reservation-select[data-astro-cid-ithn625t] {
          grid-template-columns: repeat(auto-fit, minmax(7em, 1fr));
        }
      }
      @media (max-width: 768px) {
        .create-reservation[data-astro-cid-ithn625t]
          .flex[data-astro-cid-ithn625t] {
          flex-direction: column-reverse;
        }
      }
    </style>
  </head>
  <body data-astro-cid-sckkx6r4>
    <div class="general-page-component">
      <div class="general-page-component-header">
        <svg
          width="311"
          height="113"
          fill="none"
          viewBox="0 0 311 113"
          class="logo"
        >
          <path
            fill="#fcfcfc"
            d="M139.464 76.414q-5.538 0-8.419-3.616-2.825-3.672-2.825-11.921 0-8.024 2.769-11.752 2.825-3.786 8.418-3.786 4.859 0 7.289 3.277 2.486 3.22 2.486 10.679v2.938h-16.103q.057 5.197 1.639 7.627 1.581 2.43 4.859 2.43 2.203 0 3.616-1.752 1.412-1.808 1.412-4.915h4.577q0 4.97-2.712 7.91-2.656 2.88-7.006 2.881m-6.328-18.306h11.187q0-4.238-1.243-6.44-1.243-2.205-3.673-2.204-3.108 0-4.576 2.203-1.413 2.146-1.695 6.441M155.569 75.736V36.977h13.843q3.842 0 6.384 1.413 2.599 1.412 3.899 3.955 1.299 2.542 1.299 5.932t-1.412 5.99a10.17 10.17 0 0 1-4.012 4.067q-2.543 1.413-6.158 1.413h-8.871v15.99zm4.972-20.51h8.701q2.996 0 4.746-1.92 1.808-1.921 1.808-5.029 0-3.165-1.695-4.972-1.694-1.808-4.859-1.808h-8.701zM192.231 76.414q-1.074 0-2.43-.339-1.356-.282-2.599-1.13-1.186-.904-1.977-2.542-.791-1.64-.791-4.35 0-4.125 1.921-6.216 1.977-2.146 5.367-2.938 3.447-.79 7.741-.79v-3.843q0-2.147-.961-3.446-.904-1.356-3.729-1.356-2.6 0-3.616 1.525-.96 1.47-.96 3.164v.678h-4.577a3 3 0 0 1-.056-.565v-.678q0-4.068 2.655-6.158 2.712-2.09 6.893-2.09 4.52 0 6.724 2.203 2.26 2.146 2.26 6.102v16.667q0 1.074.508 1.526t1.074.452h1.808v3.22q-.396.225-1.187.452-.735.225-1.864.226-1.809 0-3.051-1.017-1.187-1.017-1.639-2.655h-.282a8.3 8.3 0 0 1-3.051 2.881q-1.865 1.017-4.181 1.017m1.073-4.124q1.469 0 2.882-.791 1.412-.848 2.316-2.486.96-1.64.961-4.068v-2.712q-3.052 0-5.368.452-2.26.394-3.559 1.582-1.243 1.185-1.243 3.503 0 2.542 1.017 3.56 1.072.96 2.994.96M211.67 75.736V46.017h3.503l.621 3.899h.339a9.5 9.5 0 0 1 1.752-3.108q1.186-1.47 3.277-1.469.96 0 1.582.226l.621.226v4.803h-1.525q-1.47 0-2.769.678-1.242.621-2.034 2.147-.734 1.525-.734 4.18v18.137zM227.119 75.736v-40.85h4.633v24.917l9.605-13.786h5.141l-8.757 12.204 9.209 17.515h-5.254l-6.78-13.56-3.164 3.447v10.113zM251.027 75.736V46.017h4.633v29.72zm-.113-35.482v-5.367h4.803v5.367zM263.149 75.736V46.017h3.503l.621 3.447h.339q1.243-2.204 3.108-3.164t4.068-.96q3.333 0 5.311 2.033 2.034 1.977 2.034 6.95v21.413H277.5V54.662q0-3.108-1.187-4.125-1.13-1.074-2.994-1.073-2.204 0-3.899 2.147-1.638 2.146-1.638 5.989v18.136zM293.605 86.02q-3.615 0-5.48-2.091-1.865-2.034-1.865-4.972 0-2.147 1.017-3.899 1.074-1.751 2.825-2.43a5.5 5.5 0 0 1-1.808-1.92 5.6 5.6 0 0 1-.621-2.543q0-1.808 1.13-3.107 1.187-1.356 3.051-2.034-1.582-1.3-2.543-3.22-.903-1.98-.904-4.464 0-4.69 2.599-7.345t7.119-2.656q2.317 0 4.294 1.074 1.978-1.074 2.712-2.43t.961-2.768h4.068q0 2.655-1.356 4.576-1.3 1.92-3.616 2.543 1.243 1.242 1.921 3.05.734 1.752.734 3.956 0 4.633-2.599 7.288-2.542 2.655-6.893 2.712h-3.107q-1.13 0-1.921.791-.791.734-.791 1.865 0 1.073.791 1.864.847.79 1.921.791h8.475q3.22 0 5.085 2.09 1.92 2.035 1.921 4.86 0 2.316-1.017 4.237-.961 1.92-2.938 3.051-1.922 1.13-4.746 1.13zm.735-4.012h8.192q1.47 0 2.486-1.074 1.017-1.017 1.017-2.43 0-1.468-.847-2.485-.847-.96-2.656-.96h-8.192q-1.752 0-2.599.96-.848 1.016-.848 2.486 0 1.412.848 2.43.847 1.073 2.599 1.073m3.729-20.51q2.486 0 3.785-1.638 1.3-1.695 1.3-4.52 0-2.995-1.3-4.577t-3.785-1.582q-2.43 0-3.729 1.695-1.3 1.638-1.3 4.464 0 2.938 1.3 4.576 1.299 1.582 3.729 1.582M56.5 0C25.347 0 0 25.347 0 56.5S25.347 113 56.5 113s56.506-25.347 56.506-56.5S87.659 0 56.5 0m0 106.674c-27.664 0-50.168-22.503-50.168-50.174S28.836 6.332 56.5 6.332s50.174 22.504 50.174 50.168-22.51 50.174-50.174 50.174"
          />
          <path fill="#fcfcfc" d="M77.965 16.552h-14.31v14.31h14.31z" />
          <path
            fill="#fcfcfc"
            d="M35.041 30.862v58.88h42.924v-14.31H49.351v-7.978h28.614V53.15H49.351v-7.978h14.304v-14.31z"
          />
        </svg>
      </div>

      <div class="container-component" data-astro-cid-d6puh33w>
        <div class="welcome-component" data-astro-cid-mmc7otgs>
          <div class="welcome-component-name" data-astro-cid-mmc7otgs>
            <b data-astro-cid-mmc7otgs>Bienvenido</b> Luis Angel Salcedo Gavidia
          </div>
          <div class="welcome-component-avatar" data-astro-cid-mmc7otgs>LA</div>
        </div>
        <div class="panel-component" data-astro-cid-u23vcbo2>
          <div class="create-reservation" data-astro-cid-ithn625t>
            <h3
              class="main-title"
              data-astro-cid-aup47j5x
              style="--align: left"
            >
              Nueva Reserva
            </h3>

            <form class="form" data-astro-cid-ithn625t>
              <div class="form-group" data-astro-cid-atrthr4o>
                <label data-astro-cid-atrthr4o>
                  <span data-astro-cid-atrthr4o>Fecha de reserva</span>
                  <input
                    class="form-control"
                    type="date"
                    name="reservar"
                    data-astro-cid-ithn625t="true"
                    data-astro-cid-atrthr4o
                  />
                  <span class="form-error" data-astro-cid-atrthr4o></span>
                </label>
              </div>

              <b data-astro-cid-ithn625t>Selecciona un estacionamiento libre</b>
              <div class="create-reservation-select" data-astro-cid-ithn625t>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" disabled />
                    <div class="parking">
                      <div class="number">01</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" disabled />
                    <div class="parking">
                      <div class="number">02</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">03</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">04</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">05</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">06</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">07</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">08</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">09</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">10</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">11</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">12</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">13</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
                <div class="select-reservation">
                  <label>
                    <input type="radio" name="parking" id="parking" />
                    <div class="parking">
                      <div class="number">14</div>

                      <img
                        src="./dist/_astro/car.CUnHoD-D_Z2oJt5n.webp"
                        alt="car image reference"
                        loading="lazy"
                        decoding="async"
                        fetchpriority="auto"
                        width="75"
                        height="134"
                      />
                    </div>
                  </label>
                </div>
              </div>
            </form>

            <div class="flex" data-astro-cid-ithn625t>
              <button
                class="simple-button btn secondary block"
                data-astro-cid-quglckyz
              >
                Cancelar
              </button>

              <button
                class="simple-button btn primary block"
                data-astro-cid-quglckyz
              >
                Registrar Reserva
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
