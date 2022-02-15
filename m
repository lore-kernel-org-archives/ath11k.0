Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED968C4332F
	for <ath11k@archiver.kernel.org>; Tue, 15 Feb 2022 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKCD0Q+hPldNujm4bjA9lYvnDhKHhU7PiEN7a3AX0Bg=; b=px8Lu5gM8ZTJln
	7NyvrN0/Smdw9qOaliLYkwR2T5wUjFtu9/x6LYnC7WcbAyokCLErM0WrFi/n4BGQXANbrrF6E8S2P
	SH8uXeIRzS7QtOztFOPtuASbPQJHIGJSBYh8Dyqb/zwyI/1uFakvJ/Gxsmr7fc1hj+k4Lbj8KCOnu
	yXzGkq1eSirOH7BXkpC6pgzoWiqgBZXB21gbFt+Dd+pPiz/cKYXOS1Jc9Ikek9qw8ooNTfteFbtmX
	/PBmlRG2CBT3mSGLTiDiPLjGjZXB5mCYOJIxqYxOjKCrBa4q3R6l8gCjmoN/SsIaYwNzJJqqq8g39
	FJq4ytURcTc1BDgzChyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtRB-001moU-Qu; Tue, 15 Feb 2022 08:43:53 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtR8-001mmf-Ff
 for ath11k@lists.infradead.org; Tue, 15 Feb 2022 08:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644914630; x=1676450630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+iSfWR1zZLuPXVLfsryJMksusx1cFvAT3XIXOwbIuu0=;
 b=TZC9Shz5kOa0IgZsZK+PGMXa+qHOdkN6GQbWZG2e6lw8MSEkUc8STsh4
 5k1jB/ShSCneQXFT7SauqQChSxO0LnkFF2X9QR6UmQ+vGPlZtIxatIB3a
 1CKgAjRw7etT7ot8PvMxPKWSN9d/TdgiONBGzCf+fS0tBYnwcHpwwJjtK 8=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 15 Feb 2022 00:43:50 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 00:43:50 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 00:43:49 -0800
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 15 Feb 2022 00:43:47 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht duplicate
 transmission
Date: Tue, 15 Feb 2022 14:13:00 +0530
Message-ID: <1644914581-21682-2-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
References: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_004350_613012_A63AAA51 
X-CRM114-Status: GOOD (  10.64  )
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
aWNpbmMuY29tPgotLS0KIGluY2x1ZGUvbmV0L21hYzgwMjExLmggfCAgMSArCiBuZXQvbWFjODAy
MTEvY2ZnLmMgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbmV0L21hYzgwMjExLmggYi9pbmNs
dWRlL25ldC9tYWM4MDIxMS5oCmluZGV4IGM1MDIyMWQuLmE0YjFlZmIgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbmV0L21hYzgwMjExLmgKKysrIGIvaW5jbHVkZS9uZXQvbWFjODAyMTEuaApAQCAtNzA0
LDYgKzcwNCw3IEBAIHN0cnVjdCBpZWVlODAyMTFfYnNzX2NvbmYgewogCXN0cnVjdCBjZmc4MDIx
MV9oZV9ic3NfY29sb3IgaGVfYnNzX2NvbG9yOwogCXN0cnVjdCBpZWVlODAyMTFfZmlsc19kaXNj
b3ZlcnkgZmlsc19kaXNjb3Zlcnk7CiAJdTMyIHVuc29sX2JjYXN0X3Byb2JlX3Jlc3BfaW50ZXJ2
YWw7CisJYm9vbCBoZV82Z19ub25odF9kdXBfYmVhY29uX3NldDsKIAlib29sIHMxZzsKIAlzdHJ1
Y3QgY2ZnODAyMTFfYml0cmF0ZV9tYXNrIGJlYWNvbl90eF9yYXRlOwogCWVudW0gaWVlZTgwMjEx
X2FwX3JlZ19wb3dlciBwb3dlcl90eXBlOwpkaWZmIC0tZ2l0IGEvbmV0L21hYzgwMjExL2NmZy5j
IGIvbmV0L21hYzgwMjExL2NmZy5jCmluZGV4IDg3YTIwODAuLjliNmY1NWUgMTAwNjQ0Ci0tLSBh
L25ldC9tYWM4MDIxMS9jZmcuYworKysgYi9uZXQvbWFjODAyMTEvY2ZnLmMKQEAgLTk5Nyw2ICs5
OTcsOSBAQCBzdGF0aWMgaW50IGllZWU4MDIxMV9hc3NpZ25fYmVhY29uKHN0cnVjdCBpZWVlODAy
MTFfc3ViX2lmX2RhdGEgKnNkYXRhLAogCXN0cnVjdCBiZWFjb25fZGF0YSAqbmV3LCAqb2xkOwog
CWludCBuZXdfaGVhZF9sZW4sIG5ld190YWlsX2xlbjsKIAlpbnQgc2l6ZSwgZXJyOworCWNvbnN0
IHN0cnVjdCBlbGVtZW50ICpjYXA7CisJc3RydWN0IGllZWU4MDIxMV9oZV9vcGVyYXRpb24gKmhl
X29wZXI7CisJY29uc3Qgc3RydWN0IGllZWU4MDIxMV9oZV82Z2h6X29wZXIgKmhlXzZnaHpfb3Bl
cjsKIAl1MzIgY2hhbmdlZCA9IEJTU19DSEFOR0VEX0JFQUNPTjsKIAogCW9sZCA9IHNkYXRhX2Rl
cmVmZXJlbmNlKHNkYXRhLT51LmFwLmJlYWNvbiwgc2RhdGEpOwpAQCAtMTA4NCw2ICsxMDg3LDIw
IEBAIHN0YXRpYyBpbnQgaWVlZTgwMjExX2Fzc2lnbl9iZWFjb24oc3RydWN0IGllZWU4MDIxMV9z
dWJfaWZfZGF0YSAqc2RhdGEsCiAJCWNoYW5nZWQgfD0gQlNTX0NIQU5HRURfRlRNX1JFU1BPTkRF
UjsKIAl9CiAKKwljYXAgPSBjZmc4MDIxMV9maW5kX2V4dF9lbGVtKFdMQU5fRUlEX0VYVF9IRV9P
UEVSQVRJT04sCisJCQkJICAgICBwYXJhbXMtPnRhaWwsIHBhcmFtcy0+dGFpbF9sZW4pOworCWlm
IChjYXAgJiYgY2FwLT5kYXRhbGVuID49IHNpemVvZigqaGVfb3BlcikgKyAxKSB7CisJCWhlX29w
ZXIgPSAodm9pZCAqKShjYXAtPmRhdGEgKyAxKTsKKwkJaGVfNmdoel9vcGVyID0gaWVlZTgwMjEx
X2hlXzZnaHpfb3BlcihoZV9vcGVyKTsKKwkJaWYgKGhlXzZnaHpfb3BlcikgeworCQkJc2RhdGEt
PnZpZi5ic3NfY29uZi5oZV82Z19ub25odF9kdXBfYmVhY29uX3NldCA9IGZhbHNlOworCQkJaWYg
KHU4X2dldF9iaXRzKGhlXzZnaHpfb3Blci0+Y29udHJvbCwKKwkJCQkJSUVFRTgwMjExX0hFXzZH
SFpfT1BFUl9DVFJMX0RVUF9CRUFDT04pKSB7CisJCQkJc2RhdGEtPnZpZi5ic3NfY29uZi5oZV82
Z19ub25odF9kdXBfYmVhY29uX3NldCA9IHRydWU7CisJCQl9CisJCX0KKwl9CisKIAlyY3VfYXNz
aWduX3BvaW50ZXIoc2RhdGEtPnUuYXAuYmVhY29uLCBuZXcpOwogCiAJaWYgKG9sZCkKLS0gCjIu
Ny40CgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
