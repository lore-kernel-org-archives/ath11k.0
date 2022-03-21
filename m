Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD8DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 05:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kQ617Nm2x/kOg2UlKQiom6iEmrXAmrKAA1tXN5olDA=; b=RA2FaL0YkJCxke
	+H+i9zlbUSb5wzyhWhBXxaEnjEBUNG7aOj/dYtqX74dxDubLrIzZD8jy3RG23gSWg7iIe650xe3yN
	mLeYNKJaKgU4ctZ3rY8JBzwgzOJ+rqZjszVYqFC2PLxuSc1y5F27zNgGIZ7v8o8kkWHdohDRCmcwN
	IAWQrMNrXoG16/zQZZgvHhySQ3c6p2SsBywMSIVcUXqUJfrVB2IusTWG3VEHCA5jMPYrNxwTPFf8h
	HVKNUOrIx7bG8NKpfprGEnurijxHGH7Px6NTj6/6H5fJpnmwwuun1ahsPQGZjI4jngbracjVRPcyg
	152yxTfbpq3h6WSA8W7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWApf-006bKF-Iv; Mon, 21 Mar 2022 05:43:55 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWApc-006bJT-Uv
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 05:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647841433; x=1679377433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bX/wltRAcwz+t1OSIXOTT7Xb0j5/zg7RTcvJPFmWv4=;
 b=od/im/KnT0oDL73K4enXHvYUjkc8VhiOnRcICqI+iK3kRQO8q1w22UWN
 VZnzeTIwSZ+u5+Io5u7FCiNnKUkdcV8HkydaIsvAHz3/L36Z2vyRkCmES
 C9QalpTdTSxIfEG9fIVLf/zKQHlo2480xqVl/NKazbaFKH/GM02GOa5+B g=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 20 Mar 2022 22:43:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 22:43:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 20 Mar 2022 22:43:50 -0700
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 20 Mar 2022 22:43:48 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: [PATCH v2 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
Date: Mon, 21 Mar 2022 11:13:14 +0530
Message-ID: <1647841395-20213-2-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647841395-20213-1-git-send-email-quic_ramess@quicinc.com>
References: <1647841395-20213-1-git-send-email-quic_ramess@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_224353_202554_78B4AEA3 
X-CRM114-Status: GOOD (  11.35  )
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
Y29uLgoKU2lnbmVkLW9mZi1ieTogUmFtZXNoa3VtYXIgU3VuZGFyYW0gPHF1aWNfcmFtZXNzQHF1
aWNpbmMuY29tPgotLS0KIGluY2x1ZGUvbmV0L21hYzgwMjExLmggfCAgMyArKysKIG5ldC9tYWM4
MDIxMS9jZmcuYyAgICAgfCAxNSArKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbmV0L21hYzgwMjExLmggYi9pbmNs
dWRlL25ldC9tYWM4MDIxMS5oCmluZGV4IGM1MDIyMWQuLjE0NzJjYTAgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbmV0L21hYzgwMjExLmgKKysrIGIvaW5jbHVkZS9uZXQvbWFjODAyMTEuaApAQCAtNjMw
LDYgKzYzMCw4IEBAIHN0cnVjdCBpZWVlODAyMTFfZmlsc19kaXNjb3ZlcnkgewogICogQHVuc29s
X2JjYXN0X3Byb2JlX3Jlc3BfaW50ZXJ2YWw6IFVuc29saWNpdGVkIGJyb2FkY2FzdCBwcm9iZSBy
ZXNwb25zZQogICoJaW50ZXJ2YWwuCiAgKiBAczFnOiBCU1MgaXMgUzFHIEJTUyAoYWZmZWN0cyBB
c3NvY2lhdGlvbiBSZXF1ZXN0IGZvcm1hdCkuCisgKiBAaGVfNmdfbm9uaHRfZHVwX2JlYWNvbl9z
ZXQ6IGlmIHNldCwgaW5kaWNhdGVzIHRoYXQgSEUgNkdIeiBub24tSFQgZHVwbGljYXRlCisgKgli
ZWFjb24gdHJhbnNtaXNzaW9uIGlzIGVuYWJsZWQgZm9yIHRoaXMgQlNTLgogICogQGJlYWNvbl90
eF9yYXRlOiBUaGUgY29uZmlndXJlZCBiZWFjb24gdHJhbnNtaXQgcmF0ZSB0aGF0IG5lZWRzIHRv
IGJlIHBhc3NlZAogICoJdG8gZHJpdmVyIHdoZW4gcmF0ZSBjb250cm9sIGlzIG9mZmxvYWRlZCB0
byBmaXJtd2FyZS4KICAqIEBwb3dlcl90eXBlOiBwb3dlciB0eXBlIG9mIEJTUyBmb3IgNiBHSHoK
QEAgLTcwNCw2ICs3MDYsNyBAQCBzdHJ1Y3QgaWVlZTgwMjExX2Jzc19jb25mIHsKIAlzdHJ1Y3Qg
Y2ZnODAyMTFfaGVfYnNzX2NvbG9yIGhlX2Jzc19jb2xvcjsKIAlzdHJ1Y3QgaWVlZTgwMjExX2Zp
bHNfZGlzY292ZXJ5IGZpbHNfZGlzY292ZXJ5OwogCXUzMiB1bnNvbF9iY2FzdF9wcm9iZV9yZXNw
X2ludGVydmFsOworCWJvb2wgaGVfNmdfbm9uaHRfZHVwX2JlYWNvbl9zZXQ7CiAJYm9vbCBzMWc7
CiAJc3RydWN0IGNmZzgwMjExX2JpdHJhdGVfbWFzayBiZWFjb25fdHhfcmF0ZTsKIAllbnVtIGll
ZWU4MDIxMV9hcF9yZWdfcG93ZXIgcG93ZXJfdHlwZTsKZGlmZiAtLWdpdCBhL25ldC9tYWM4MDIx
MS9jZmcuYyBiL25ldC9tYWM4MDIxMS9jZmcuYwppbmRleCA4N2EyMDgwLi4wNzdlMWJkIDEwMDY0
NAotLS0gYS9uZXQvbWFjODAyMTEvY2ZnLmMKKysrIGIvbmV0L21hYzgwMjExL2NmZy5jCkBAIC05
OTcsNiArOTk3LDkgQEAgc3RhdGljIGludCBpZWVlODAyMTFfYXNzaWduX2JlYWNvbihzdHJ1Y3Qg
aWVlZTgwMjExX3N1Yl9pZl9kYXRhICpzZGF0YSwKIAlzdHJ1Y3QgYmVhY29uX2RhdGEgKm5ldywg
Km9sZDsKIAlpbnQgbmV3X2hlYWRfbGVuLCBuZXdfdGFpbF9sZW47CiAJaW50IHNpemUsIGVycjsK
Kwljb25zdCBzdHJ1Y3QgZWxlbWVudCAqY2FwOworCXN0cnVjdCBpZWVlODAyMTFfaGVfb3BlcmF0
aW9uICpoZV9vcGVyOworCWNvbnN0IHN0cnVjdCBpZWVlODAyMTFfaGVfNmdoel9vcGVyICpoZV82
Z2h6X29wZXI7CiAJdTMyIGNoYW5nZWQgPSBCU1NfQ0hBTkdFRF9CRUFDT047CiAKIAlvbGQgPSBz
ZGF0YV9kZXJlZmVyZW5jZShzZGF0YS0+dS5hcC5iZWFjb24sIHNkYXRhKTsKQEAgLTEwODQsNiAr
MTA4NywxOCBAQCBzdGF0aWMgaW50IGllZWU4MDIxMV9hc3NpZ25fYmVhY29uKHN0cnVjdCBpZWVl
ODAyMTFfc3ViX2lmX2RhdGEgKnNkYXRhLAogCQljaGFuZ2VkIHw9IEJTU19DSEFOR0VEX0ZUTV9S
RVNQT05ERVI7CiAJfQogCisJY2FwID0gY2ZnODAyMTFfZmluZF9leHRfZWxlbShXTEFOX0VJRF9F
WFRfSEVfT1BFUkFUSU9OLAorCQkJCSAgICAgcGFyYW1zLT50YWlsLCBwYXJhbXMtPnRhaWxfbGVu
KTsKKwlpZiAoY2FwICYmIGNhcC0+ZGF0YWxlbiA+PSBzaXplb2YoKmhlX29wZXIpICsgMSkgewor
CQloZV9vcGVyID0gKHZvaWQgKikoY2FwLT5kYXRhICsgMSk7CisJCWhlXzZnaHpfb3BlciA9IGll
ZWU4MDIxMV9oZV82Z2h6X29wZXIoaGVfb3Blcik7CisJCWlmIChoZV82Z2h6X29wZXIpIHsKKwkJ
CXNkYXRhLT52aWYuYnNzX2NvbmYuaGVfNmdfbm9uaHRfZHVwX2JlYWNvbl9zZXQgPSBmYWxzZTsK
KwkJCWlmIChoZV82Z2h6X29wZXItPmNvbnRyb2wgJiBJRUVFODAyMTFfSEVfNkdIWl9PUEVSX0NU
UkxfRFVQX0JFQUNPTikKKwkJCQlzZGF0YS0+dmlmLmJzc19jb25mLmhlXzZnX25vbmh0X2R1cF9i
ZWFjb25fc2V0ID0gdHJ1ZTsKKwkJfQorCX0KKwogCXJjdV9hc3NpZ25fcG9pbnRlcihzZGF0YS0+
dS5hcC5iZWFjb24sIG5ldyk7CiAKIAlpZiAob2xkKQotLSAKMi43LjQKCgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
