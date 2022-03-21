Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFB1C433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 05:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b7LEptW2PF2SAztGYx+PZBnnzx1BbxBRwkI2E1VXaOQ=; b=0DU3UpCtv3MEih
	sFjUIVBobIkk1EXp30hojhXgQ0ov1OkNDlMfNu11yxaNCQJcu8u9mFEuM+XFbAo5ghBDet17wvgYH
	aMPsPEtYb7TWWOQ/sLUks/96I+wwVV0nTCbK8H3P9SZh/5n493bXABu9Zs5KfJZftq8oFcRGxDDoL
	3Cq1zlA5a7xyT8j9gUc0w/vi1sEPE4ARD5RzeJiSgGP6FPiFST5r9jRPRfZkrm/AH0OHOBC4JAbeU
	/x+U/4tfjwj77j0jgCTp7pNw4hJv1FbCATvv73I2GjEBH8Kh3EejupvmXchvBRSmk79N+o48CNflq
	LMw/eXFAFxki22hPuxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWApg-006bKl-V6; Mon, 21 Mar 2022 05:43:56 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWApe-006bJj-7e
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 05:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647841434; x=1679377434;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HAur4Qv3s+r4ZYeU6xri0n2RledHIZ3CB3ZRWxT01MQ=;
 b=S/AeW9Wcm5u1u2qh5EgV6+nTtqtpgSwMkLIOOnI9fIL79unW5olr8+yP
 mwv56XZYEE985xLrZQL8ZAxfEWXVP+2FoPC6KhKbImfLnoiujREtaJB7H
 /BKdzPkKj1xmg4XTLw3uIUiYdjxgwjS4YkSMjaRz0v1VmAGALebOqMTRj o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Mar 2022 22:43:49 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 22:43:49 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 20 Mar 2022 22:43:48 -0700
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 20 Mar 2022 22:43:44 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: [PATCH v2 0/2] Add support to configure 6GHz non-ht duplicate
 transmission
Date: Mon, 21 Mar 2022 11:13:13 +0530
Message-ID: <1647841395-20213-1-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_224354_389492_2569E28E 
X-CRM114-Status: UNSURE (   5.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

QSA2R0h6IEFQIGNhbiBkZWNpZGUgdG8gdHJhbnNtaXQgQmVhY29uLCBCcm9hZGNhc3QgcHJvYmUg
cmVzcG9uc2UKYW5kIEZJTFMgZGlzY292ZXJ5IGZyYW1lcyBpbiBhIG5vbi1IVCBkdXBsaWNhdGUg
UFBEVSB3aGVuCm9wZXJhdGluZyBpbiBub24gMjBNSHogQmFuZHdpZHRoIHRvIGVuaGFuY2UgaXRz
IGRpc2NvdmVyYWJpbGl0eS4KKElFRUUgU3RkIDgwMi4xMWF44oCQMjAyMS0yNi4xNy4yLjIpCgpB
ZGQgY2hhbmdlcyB0byBjb25maWd1cmUgNkdIeiBub24tSFQgZHVwbGljYXRlIGJlYWNvbiB0cmFu
c21pc3Npb24KYmFzZWQgb24gRHVwbGljYXRlIEJlYWNvbiBzdWJmaWVsZCBvZiA2R0h6IE9wZXJh
dGlvbiBJbmZvcm1hdGlvbgpmaWVsZCBvZiB0aGUgSEUgT3BlcmF0aW9uIGVsZW1lbnQgaW4gQmVh
Y29uLgoKdjIKKiBBZGRyZXNzZWQgSm9oYW5uZXMgY29tbWVudHMuCgpTaWduZWQtb2ZmLWJ5OiBS
YW1lc2hrdW1hciBTdW5kYXJhbSA8cXVpY19yYW1lc3NAcXVpY2luYy5jb20+CgpSYW1lc2hrdW1h
ciBTdW5kYXJhbSAoMik6CiAgbWFjODAyMTE6IGFkZCBzdXBwb3J0IHRvIGNvbmZpZ3VyZSA2R0h6
IG5vbi1odCBkdXBsaWNhdGUgdHJhbnNtaXNzaW9uCiAgYXRoMTFrOiBhZGQgc3VwcG9ydCB0byBj
b25maWd1cmUgNkdIeiBub24taHQgZHVwbGljYXRlIHRyYW5zbWlzc2lvbgoKIGRyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay93bWkuaCB8ICA4ICsr
KysrKysrCiBpbmNsdWRlL25ldC9tYWM4MDIxMS5oICAgICAgICAgICAgICAgIHwgIDMgKysrCiBu
ZXQvbWFjODAyMTEvY2ZnLmMgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKysrKysrKysrKysK
IDQgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQoKLS0gCjIuNy40CgoKLS0gCmF0aDEx
ayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
