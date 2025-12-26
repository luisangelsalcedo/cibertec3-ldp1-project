<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" type="image/svg+xml" href="<%= request.getContextPath() %>/favicon.svg" />
    <title>Dashboard</title>

    <style>
        .dashboard-item {
          display: flex;
          align-items: center;
          gap: 1em;
          padding: 1.5em 1em 1.5em 3em;
          background-color: #8ca0b5;
          border-radius: 1em;
          color: #fff;
          margin-left: 2em;
          position: relative;
          flex: 1;
          font-size: 0.8em;
        }
    </style>
</head>

<body>
<div class="general-page-component">

    <div class="general-page-component-header">
    </div>

   
    <div class="dashboard-component">
        <div class="container-component">

            <div class="dashboard-item">
                <div class="dashboard-item-digit">
                    <%= request.getAttribute("vehiculos") != null ? request.getAttribute("vehiculos") : 18 %>
                </div>
                <div class="dashboard-item-label">Vehículos estacionados</div>
            </div>

            <div class="dashboard-item">
                <div class="dashboard-item-digit">
                    <%= request.getAttribute("reservas") != null ? request.getAttribute("reservas") : 5 %>
                </div>
                <div class="dashboard-item-label">Reservas realizadas</div>
            </div>

            <div class="dashboard-item">
                <div class="dashboard-item-digit">
                    <%= request.getAttribute("disponibles") != null ? request.getAttribute("disponibles") : 3 %>
                </div>
                <div class="dashboard-item-label">Lugares disponibles</div>
            </div>

        </div>
    </div>


    <div class="container-component">
        <div class="welcome-component">
            <div class="welcome-component-name">
                <b>Bienvenido</b> <%= session.getAttribute("usuario") != null ? session.getAttribute("usuario") : "Luis Angel Salcedo Gavidia" %>
            </div>
            <div class="welcome-component-avatar">LA</div>
        </div>

        <div class="panel-component">
            <h3 class="main-title" style="--align:left">Próximas reservas</h3>

            <div class="reservation-list-item">
                <div>2025/12/20</div>
                <div class="reservation-list-item-status">Pendiente</div>
                <a href="detalleReserva.jsp?id=10" class="btn">Ver detalle</a>
            </div>

            <div class="reservation-list-item">
                <div>2025/12/21</div>
                <div class="reservation-list-item-status inprogress">En progreso</div>
                <a href="detalleReserva.jsp?id=11" class="btn">Ver detalle</a>
            </div>

            <div class="reservation-list-item">
                <div>2025/12/23</div>
                <div class="reservation-list-item-status complete">Completo</div>
                <a href="detalleReserva.jsp?id=12" class="btn">Ver detalle</a>
            </div>

            <div class="flex">
                <a href="misReservas.jsp" class="simple-button btn secondary block">Ver todas mis reservas</a>
                <a href="nuevaReserva.jsp" class="simple-button btn primary block">Reservar</a>
            </div>
        </div>
    </div>

</div>
</body>
</html>
