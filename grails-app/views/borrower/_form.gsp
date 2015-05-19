<%@ page import="com.library.domain.Borrower" %>



<div class="fieldcontain ${hasErrors(bean: borrowerInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="borrower.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${borrowerInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: borrowerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="borrower.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${borrowerInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: borrowerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="borrower.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${borrowerInstance?.lastName}"/>

</div>

