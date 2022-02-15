Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D85AC433EF
	for <ath11k@archiver.kernel.org>; Tue, 15 Feb 2022 08:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUTadmCXWOj/Nw9hF1MQ8AEIxKpMXila5t6ecvjj9BI=; b=lnZSvDucVm9Dmz
	5owvWdYkWBZBQuw4YnhHeG1aNZV+3m0RXTVrfxZfpRx/GNBmAfOLXIFhBHE6n12UiebUmpEtNQQO0
	OahxwFyBQRc4Iu0hnQU4jKDiu5qPRurvOCb5UxWVbmDnKeKI5Z5iAtmeYzi3HBM00E7L6PrG098w/
	BPssRpnHnYJoiSFi/e6HFxAFPrpA+rW28X6RZzgZqZKr3ypLMTdBJ8p86EZl8nytdItA/5goVn73W
	yk00MBvQnQdAcfmGw1nhDE/82VBryrxqh6Op8rC4YwNnI5URZrZza93ROTx3wvbRBklIgcn+wn3JX
	oyRt9nm318lAsarQzerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtRE-001mqT-MW; Tue, 15 Feb 2022 08:43:56 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtRB-001mnq-8B
 for ath11k@lists.infradead.org; Tue, 15 Feb 2022 08:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644914633; x=1676450633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2cTkS91DX279QZ0RG41/ce3k2PPmJNrvauPZBlg8zW4=;
 b=tueyI2SRhIlYoaiHeoS35vawFp33lxjCvWy5aQoByNRY2rFSj0eQf3iu
 dVE2OEDfJF2cQ5IV+cLVmErXIdpareA0WjAiDU8iGHKnlBds/hl59pchd
 ayfwYuWaGC+bp/yMAbc3Z7r8gaGhX2tpSofwoWh5tkZaPkph+IUd7AWAy Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Feb 2022 00:43:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 00:43:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 00:43:51 -0800
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 15 Feb 2022 00:43:49 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH 2/2] ath11k: add support to configure 6GHz non-ht duplicate
 transmission
Date: Tue, 15 Feb 2022 14:13:01 +0530
Message-ID: <1644914581-21682-3-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
References: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_004353_361472_685465C1 
X-CRM114-Status: GOOD (  13.27  )
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
IGRpc2NvdmVyYWJpbGl0eS4KKElFRUUgU3RkIDgwMi4xMWF44oCQMjAyMS0yNi4xNy4yLjIpCgpT
ZW5kIFdNSV9WREVWX1BBUkFNXzZHSFpfUEFSQU1TIHdpdGggZW5hYmxlL2Rpc2FibGUgb3B0aW9u
IHRvIEZXCmJhc2VkIG9uIGhlXzZnX25vbmh0X2R1cF9iZWFjb25fc2V0LgoKVGVzdGVkLW9uOiBR
Q045MDc0IGh3MS4wIFBDSSBXTEFOLkhLLjIuNS4wLjEtMDExMDAtUUNBSEtTV1BMX1NJTElDT05a
LTEKClNpZ25lZC1vZmYtYnk6IFJhbWVzaGt1bWFyIFN1bmRhcmFtIDxxdWljX3JhbWVzc0BxdWlj
aW5jLmNvbT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jIHwgMzgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMWsvd21pLmggfCAgOCArKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9t
YWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKaW5kZXggODBmODY0
MC4uMzA3Mzc3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9t
YWMuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCkBAIC0yOTE1
LDYgKzI5MTUsMzMgQEAgc3RhdGljIGludCBhdGgxMWtfbWFjX2ZpbHNfZGlzY292ZXJ5KHN0cnVj
dCBhdGgxMWtfdmlmICphcnZpZiwKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IGF0aDEx
a19tYWNfc2V0XzZnX25vbmh0X2R1cF9jb25mKHN0cnVjdCBhdGgxMWtfdmlmICphcnZpZiwKKwkJ
CQkJICAgIGNvbnN0IHN0cnVjdCBjZmc4MDIxMV9jaGFuX2RlZiAqY2hhbmRlZikKK3sKKwlzdHJ1
Y3QgYXRoMTFrICphciA9IGFydmlmLT5hcjsKKwlpbnQgcmV0ID0gMDsKKwlib29sIGlzX25vbnR4
X2FwID0gYXJ2aWYtPnZpZi0+YnNzX2NvbmYubm9udHJhbnNtaXR0ZWQ7CisJZW51bSB3bWlfcGh5
X21vZGUgbW9kZSA9IGF0aDExa19waHltb2Rlc1tjaGFuZGVmLT5jaGFuLT5iYW5kXVtjaGFuZGVm
LT53aWR0aF07CisJYm9vbCBkdXBfYmNuX2VuYWJsZSA9IGFydmlmLT52aWYtPmJzc19jb25mLmhl
XzZnX25vbmh0X2R1cF9iZWFjb25fc2V0OworCisJaWYgKChhcnZpZi0+dmRldl90eXBlID09IFdN
SV9WREVWX1RZUEVfQVApICYmICFpc19ub250eF9hcCAmJgorCSAgICAoY2hhbmRlZi0+Y2hhbi0+
YmFuZCA9PSBOTDgwMjExX0JBTkRfNkdIWikpIHsKKwkJdTMyIHBhcmFtX2lkID0gV01JX1ZERVZf
UEFSQU1fNkdIWl9QQVJBTVM7CisJCXUzMiB2YWx1ZSA9IDA7CisKKwkJaWYgKG1vZGUgPiBNT0RF
XzExQVhfSEUyMCAmJiBkdXBfYmNuX2VuYWJsZSkgeworCQkJdmFsdWUgfD0gV01JX1ZERVZfNkdI
Wl9CSVRNQVBfTk9OX0hUX0RVUExJQ0FURV9CRUFDT047CisJCQl2YWx1ZSB8PSBXTUlfVkRFVl82
R0haX0JJVE1BUF9OT05fSFRfRFVQTElDQVRFX0JDQVNUX1BST0JFX1JTUDsKKwkJCXZhbHVlIHw9
IFdNSV9WREVWXzZHSFpfQklUTUFQX05PTl9IVF9EVVBMSUNBVEVfRkRfRlJBTUU7CisJCX0KKwkJ
YXRoMTFrX2RiZyhhci0+YWIsIEFUSDExS19EQkdfTUFDLCAiU2V0IDZHSHogbm9uLWh0IGR1cCBw
YXJhbXMgZm9yICIKKwkJCSAgICJ2ZGV2ICVwTSB2ZGV2X2lkICVkIHBhcmFtICVkIHZhbHVlICVk
XG4iLCBhcnZpZi0+dmlmLT5hZGRyLAorCQkJICAgYXJ2aWYtPnZkZXZfaWQsIHBhcmFtX2lkLCB2
YWx1ZSk7CisJCXJldCA9IGF0aDExa193bWlfdmRldl9zZXRfcGFyYW1fY21kKGFyLCBhcnZpZi0+
dmRldl9pZCwgcGFyYW1faWQsIHZhbHVlKTsKKwl9CisJcmV0dXJuIHJldDsKK30KKwogc3RhdGlj
IGludCBhdGgxMWtfbWFjX2NvbmZpZ19vYnNzX3BkKHN0cnVjdCBhdGgxMWsgKmFyLAogCQkJCSAg
ICAgc3RydWN0IGllZWU4MDIxMV9oZV9vYnNzX3BkICpoZV9vYnNzX3BkKQogewpAQCAtMzEyOSw2
ICszMTU2LDE3IEBAIHN0YXRpYyB2b2lkIGF0aDExa19tYWNfb3BfYnNzX2luZm9fY2hhbmdlZChz
dHJ1Y3QgaWVlZTgwMjExX2h3ICpodywKIAkJCWFydmlmLT5kb19ub3Rfc2VuZF90bXBsID0gdHJ1
ZTsKIAkJZWxzZQogCQkJYXJ2aWYtPmRvX25vdF9zZW5kX3RtcGwgPSBmYWxzZTsKKworCQlpZiAo
dmlmLT50eXBlID09IE5MODAyMTFfSUZUWVBFX0FQICYmIHZpZi0+YnNzX2NvbmYuaGVfc3VwcG9y
dCkgeworCQkJaWYgKCFhdGgxMWtfbWFjX3ZpZl9jaGFuKGFydmlmLT52aWYsICZkZWYpKSB7CisJ
CQkJcmV0ID0gYXRoMTFrX21hY19zZXRfNmdfbm9uaHRfZHVwX2NvbmYoYXJ2aWYsICZkZWYpOwor
CQkJCWlmIChyZXQpIHsKKwkJCQkJYXRoMTFrX3dhcm4oYXItPmFiLCAiZmFpbGVkIHRvIHNldCA2
RyBub24taHQgZHVwIgorCQkJCQkJICAgICIgY29uZiBmb3IgdmRldiAlZDogJWRcbiIsCisJCQkJ
CQkgICAgYXJ2aWYtPnZkZXZfaWQsIHJldCk7CisJCQkJfQorCQkJfQorCQl9CiAJfQogCiAJaWYg
KGNoYW5nZWQgJiAoQlNTX0NIQU5HRURfQkVBQ09OX0lORk8gfCBCU1NfQ0hBTkdFRF9CRUFDT04p
KSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3dtaS5oIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay93bWkuaAppbmRleCAyZjI2ZWMxYS4uOTZl
ZDg5MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay93bWkuaAor
KysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3dtaS5oCkBAIC0yMTI1LDYgKzIx
MjUsMTQgQEAgZW51bSB7CiAvKiBwcmVhYmxiZSBzaG9ydCAqLwogI2RlZmluZSBXTUlfVkRFVl9Q
UkVBTUJMRV9TSE9SVCAgICAgICAgIDB4MgogCisvKiogNkdIWiBwYXJhbXMgKiovCisvKiBDb250
cm9sIHRvIGVuYWJsZS9kaXNhYmxlIGJlYWNvbiB0eCBpbiBub24tSFQgZHVwbGljYXRlICovCisj
ZGVmaW5lIFdNSV9WREVWXzZHSFpfQklUTUFQX05PTl9IVF9EVVBMSUNBVEVfQkVBQ09OCQlCSVQo
MCkKKy8qIENvbnRyb2wgdG8gZW5hYmxlL2Rpc2FibGUgYnJvYWRjYXN0IHByb2JlIHJlc3BvbnNl
IHR4IGluIG5vbi1IVCBkdXBsaWNhdGUgKi8KKyNkZWZpbmUgV01JX1ZERVZfNkdIWl9CSVRNQVBf
Tk9OX0hUX0RVUExJQ0FURV9CQ0FTVF9QUk9CRV9SU1AJQklUKDEpCisvKiBDb250cm9sIHRvIGVu
YWJsZS9kaXNhYmxlIEZJTFMgZGlzY292ZXJ5IGZyYW1lIHR4IGluIG5vbi1IVCBkdXBsaWNhdGUg
Ki8KKyNkZWZpbmUgV01JX1ZERVZfNkdIWl9CSVRNQVBfTk9OX0hUX0RVUExJQ0FURV9GRF9GUkFN
RQkJQklUKDIpCisKIGVudW0gd21pX3BlZXJfc21wc19zdGF0ZSB7CiAJV01JX1BFRVJfU01QU19Q
U19OT05FID0gMHgwLAogCVdNSV9QRUVSX1NNUFNfU1RBVElDICA9IDB4MSwKLS0gCjIuNy40CgoK
LS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
