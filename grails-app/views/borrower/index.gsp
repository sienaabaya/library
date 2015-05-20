
<%@ page import="com.library.domain.Borrower" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'borrower.label', default: 'Borrower')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-borrower" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div ng-app="borrowerList" ng-controller="borrowerCtrl" id="list-borrower" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div><span>Search: </span><span><input type="text" ng-model="searchBorrower"></span></div>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="address" title="${message(code: 'borrower.address.label', default: 'Address')}" />

            <g:sortableColumn property="firstName" title="${message(code: 'borrower.firstName.label', default: 'First Name')}" />

            <g:sortableColumn property="lastName" title="${message(code: 'borrower.lastName.label', default: 'Last Name')}" />

        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="borrower in borrowers | filter: searchBorrower" ng-class="{'odd': $odd, 'even': $even}">

            <td><g:link action="show" id="{{borrower.id}}">{{borrower.address}}</g:link></td>

            <td>{{borrower.firstName}}</td>

            <td>{{borrower.lastName}}</td>

        </tr>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${borrowerInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>
