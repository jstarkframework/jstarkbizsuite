<%@ page isELIgnored = "false" trimDirectiveWhitespaces="true" %>
<%@ page errorPage = "/WEB-INF/jsp/jstark/error/error.jsp" %>
<%@ page import = "jstark.platform.*,org.jstark.framework.core.*,org.jstark.utils.*" %>
<%@ page import = "org.jstark.framework.core.hs.*,org.jstark.framework.web.*" %>
<%@ page import = "org.jstark.platform.core.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jskfn" uri="/WEB-INF/taglib/jskfunctions.tld"%>
<jsp:useBean id="ro" class="org.jstark.framework.core.RequestObject" scope="request" />
<jsp:useBean id="jcontext" class="java.lang.String" scope="request" />