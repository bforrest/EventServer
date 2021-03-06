﻿<%@ Control Language="C#" Inherits="ViewUserControl<Session>" %>
<div class="post">
    <h2 class="title">
        <%= Html.ActionLink<SessionsController>(c => c.Show(Model.Id, Model.Title.MakeUrlFriendly()), Model.Title) %></h2>
    <div class="entry">
        <div>
            <% if (Model.User != null)
               { %>
            <div>
                Speaker:
                <%= Html.ActionLink<SpeakersController>(c => c.Show(Model.User.Id, Model.User.UrlName), Model.User.Name) %></div>
            <% } %>
            
            <div title="<%= Model.Level %>">
                Level:
                <%= (int)Model.Level %></div>
            <% if (Html.IsCurrentUserOwnerOrAdmin(Model))
               { %>
            <div class="session-status-<%= Model.Status %>">
                Status:
                <%= Model.Status %></div>
            <div>
                Category:
                <%= Model.Category %></div>
            <% } %>
            <% if (Model.Status == SessionStatus.Accepted)
               { %>
            <div>
                Track:
                <%= Model.Track %></div>
            <div>
                Time:
                <%= Model.TimeSlot %></div>
            <div>
                Day:
                <%= Model.Day %></div>
            <div>
                Room:
                <%= Model.Room %></div>
            <% } %>
        </div>
        <%= Html.ToParagraphs(Model.Description) %>
    </div>
</div>
