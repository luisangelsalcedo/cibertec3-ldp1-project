<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width" />
  <link rel="icon" type="image/svg+xml"
        href="<%= request.getContextPath() %>/favicon.svg" />
  <title>Registro de Usuario</title>

  <style>
  .panel-component[data-astro-cid-u23vcbo2] {
        padding: 2em 1.5em 1.5em;
        border-radius: 1em;
        background-color: #fff;
        box-shadow: 0 0 0.5em #0000004d;
        margin-bottom: 1em;
      }
      .container-component[data-astro-cid-d6puh33w] {
        max-width: 950px;
        padding: 1.5em 1em 1em;
        margin: 0 auto;
        position: relative;
      }
      .main-title[data-astro-cid-aup47j5x] {
        color: #000;
        margin-bottom: 0.9em;
        font-size: 1.4em;
        text-align: var(--align);
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 200;
        font-style: normal;
        src: url(../_astro/Lexend-ExtraLight.9KLIkcKL.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 300;
        font-style: normal;
        src: url(../_astro/Lexend-Light.CljLvlWl.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 400;
        font-style: normal;
        src: url(../_astro/Lexend-Regular.peUU6jwM.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 500;
        font-style: normal;
        src: url(../_astro/Lexend-Medium.B4Ng5Mcm.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 600;
        font-style: normal;
        src: url(../_astro/Lexend-SemiBold.B1FI2Xqt.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 700;
        font-style: normal;
        src: url(../_astro/Lexend-Bold.BHD1AiDd.ttf) format("truetype");
      }
      @font-face {
        font-family: Lexend, sans-serif;
        font-weight: 800;
        font-style: normal;
        src: url(../_astro/Lexend-ExtraBold.IeePgDw2.ttf) format("truetype");
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
      .simple-button[data-astro-cid-quglckyz] {
        outline: none;
        padding: 0.7em 2em;
        border-radius: 0.4em;
        border: solid 0.1rem transparent;
        margin-bottom: 0.4em;
        background-color: transparent;
        text-decoration: none;
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
      .twocolumns-component {
        width: 100%;
        height: 100dvh;
        overflow: hidden;
      }
      .twocolumns-component .container-component {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding-top: 0;
        padding-bottom: 0;
        height: inherit;
        flex-direction: column-reverse;
      }
      @media (min-width: 768px) {
        .twocolumns-component .container-component {
          flex-direction: var(--flexDirection);
          justify-content: flex-start;
          align-items: flex-start;
        }
      }
      @media (min-width: 768px) and (max-height: 640px) {
        .twocolumns-component .container-component {
          height: 768px;
        }
      }
      .twocolumns-component .container-component > div {
        position: relative;
      }
      .twocolumns-component-left {
        width: 100%;
        z-index: 5;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }
      @media (min-width: 768px) {
        .twocolumns-component-left {
          width: 50em;
          height: inherit;
        }
      }
      .twocolumns-component-right {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1;
      }
      @media (min-width: 768px) {
        .twocolumns-component-right {
          height: inherit;
        }
      }
      .twocolumns-component-right .background {
        background-color: #8ca0b5;
        background-image: var(--bgimage);
        height: inherit;
        position: fixed;
        inset: 0;
        width: 100vw;
        overflow: hidden;
        z-index: 1;
      }
      @media (min-width: 768px) {
        .twocolumns-component-right .background {
          position: absolute;
          left: var(--directionLeft);
          right: var(--directionRight);
        }
      }
      .twocolumns-component-right .background:before {
        content: "";
        position: absolute;
        inset: 0;
        background-color: #0009;
        z-index: 1;
      }
      .twocolumns-component-right .background img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      .twocolumns-component-right .aside {
        position: relative;
        z-index: 2;
        color: #fff;
        padding: 2em;
        max-width: 30em;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
      }
      @media (min-width: 768px) {
        .twocolumns-component-right .aside {
          align-items: flex-start;
          text-align: left;
        }
      }
      form[data-astro-cid-jfgd5vnc] {
        width: 18em;
      }
      .signup-page .logo {
        width: 10em;
      }
      @media (min-width: 640px) {
        .signup-page .logo {
          width: 13em;
        }
      }
      .signup-page .options {
        color: #fff;
        font-size: 0.9em;
        margin-bottom: 2em;
      }
      @media (min-width: 768px) {
        .signup-page .options {
          color: #333;
        }
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
  </style>
</head>

<body>
<div class="signup-page">
  <div class="twocolumns-component"
       style="--flexDirection: row-reverse; --directionLeft: auto; --directionRight: 0;">

    <div class="container-component">

      <div class="twocolumns-component-left">

        <div class="panel-component">
          <form class="form"
                method="post"
                action="<%= request.getContextPath() %>/RegistroServlet">

            <h3 class="main-title" style="--align: center">
              Cree su cuenta
            </h3>

            <div class="form-group">
              <label>
                <span>Nombres completos:</span>
                <input class="form-control"
                       type="text"
                       name="names"
                       placeholder="Ingresa tu nombre" />
              </label>
            </div>

            <div class="form-group">
              <label>
                <span>Usuario:</span>
                <input class="form-control"
                       type="text"
                       name="user"
                       placeholder="Inserta un usuario válido" />
              </label>
            </div>

            <div class="form-group">
              <label>
                <span>Contraseña:</span>
                <input class="form-control"
                       type="password"
                       name="pass"
                       placeholder="Inserta una contraseña" />
              </label>
            </div>

            <div class="form-group">
              <label>
                <span>Repite la contraseña:</span>
                <input class="form-control"
                       type="password"
                       name="passrepeat"
                       placeholder="Repita la contraseña" />
              </label>
            </div>

            <div class="flex">
              <button class="simple-button btn primary block" type="submit">
                Crear
              </button>
              <a href="<%= request.getContextPath() %>/login.jsp"
                 class="simple-button btn secondary block">
                Cancelar
              </a>
            </div>
          </form>
        </div>

        <div class="options">
          ¿Ya tiene una cuenta? |
          <a href="<%= request.getContextPath() %>/login.jsp" class="btn">
            Iniciar sesión
          </a>
        </div>
      </div>

      <div class="twocolumns-component-right">
        <div class="background">
          <img
            src="<%= request.getContextPath() %>/assets/img/entrada.webp"
            alt="background" />
        </div>

        <div class="aside">
        </div>
      </div>

    </div>
  </div>
</div>
</body>
</html>
