<%@ page language = "java" isELIgnored = "false" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page import = "jstark.platform.*,org.jstark.framework.core.*,org.jstark.utils.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta name="autocomplete" content="off" />
<meta name="robots" content="none" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>JSTARK : Business Suite</title>
<link rel="stylesheet" type="text/css" href="${jcontext}/web/jstark/platform/css/jstark.min.css?<%=CoreUtils.getRevision()%>" />
<script type="text/javascript" src="${jcontext}/web/home/common/crypto/crypto.js?<%=CoreUtils.getRevision()%>"></script>
<script type="text/javascript" src="${jcontext}/web/jstark/platform/js/jstark.min.js?<%=CoreUtils.getRevision()%>"></script>
<script type="text/javascript">var jcontext="${jcontext}";</script>
<script type="text/javascript">jstark_agent_handle="<%=CoreUtils.getSecurityPublickey(request)%>";</script>