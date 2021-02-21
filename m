Return-Path: <SRS0=T948=HX=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8AAC433E0
	for <ath11k@archiver.kernel.org>; Sun, 21 Feb 2021 18:28:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D933A64EE9
	for <ath11k@archiver.kernel.org>; Sun, 21 Feb 2021 18:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D933A64EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MP6Xv81zWUJw6IVPDoJ6UIhPpP0cmUfWWwh/JInMs/U=; b=uruXOMHWamrY/oSZ2ohuOb6uVt
	xPCrpnrMyX24I8litAZVV44S9ZJBpfPbl7pTxDghYVXlK3KV+7Phj3BqVetJfJlJNzWb45wcdYGhF
	u0Uqt0pbY77suJVGlSIdlo7+3c8jv6qSeISN5GoB9kUBAiUG10TISnk5PbeyztLvECcmp6LuyfcUr
	EpuWtlAMLCmgkY/IDDurhNXSrEtXJIIij5RyL/cbRpz27YmFTMEvWNgUBdOGs4/EI2bzMlUKVmEcI
	em7NGJo9LmY7gOP6lNsB4v+LNW7SgxBlQUZnSQU/ZRz+oCQZdmP3p3hnvP7S+dKh4NIxhNeiY9gjC
	KG3CibHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDtSi-0001eI-NG; Sun, 21 Feb 2021 18:28:08 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDtSf-0001dK-Q6
 for ath11k@lists.infradead.org; Sun, 21 Feb 2021 18:28:07 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2934:574d:d80c:39f5])
 by laurent.telenet-ops.be with bizsmtp
 id XuTw240073eQ4Ry01uTwbv; Sun, 21 Feb 2021 19:27:56 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lDtSV-000YhP-P7; Sun, 21 Feb 2021 19:27:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lDtSV-008gzw-3G; Sun, 21 Feb 2021 19:27:55 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] ath11k: qmi: use %pad to format dma_addr_t
Date: Sun, 21 Feb 2021 19:27:54 +0100
Message-Id: <20210221182754.2071863-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_132805_978347_E2993B7D 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SWYgQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVD1uOgoKICAgIGRyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMWsvcW1pLmM6IEluIGZ1bmN0aW9uIOKAmGF0aDExa19xbWlfcmVzcG9uZF9m
d19tZW1fcmVxdWVzdOKAmToKICAgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcW1p
LmM6MTY5MDo4OiB3YXJuaW5nOiBmb3JtYXQg4oCYJWxseOKAmSBleHBlY3RzIGFyZ3VtZW50IG9m
IHR5cGUg4oCYbG9uZyBsb25nIHVuc2lnbmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDUgaGFzIHR5
cGUg4oCYZG1hX2FkZHJfdOKAmSB7YWthIOKAmHVuc2lnbmVkIGludOKAmX0gWy1XZm9ybWF0PV0K
ICAgICAxNjkwIHwgICAgICAgICJxbWkgcmVxIG1lbV9zZWdbJWRdIDB4JWxseCAldSAldVxuIiwg
aSwKCSAgfCAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAg
MTY5MSB8ICAgICAgICAgYWItPnFtaS50YXJnZXRfbWVtW2ldLnBhZGRyLAoJICB8ICAgICAgICAg
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgkgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8CgkgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFfYWRkcl90IHtha2Eg
dW5zaWduZWQgaW50fQogICAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kZWJ1Zy5o
OjY0OjMwOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmGF0aDExa19kYmfigJkKICAg
ICAgIDY0IHwgICBfX2F0aDExa19kYmcoYXIsIGRiZ19tYXNrLCBmbXQsICMjX19WQV9BUkdTX18p
OyBcCgkgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4KICAgIGRyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMWsvcW1pLmM6MTY5MDozNDogbm90ZTogZm9ybWF0IHN0cmluZyBp
cyBkZWZpbmVkIGhlcmUKICAgICAxNjkwIHwgICAgICAgICJxbWkgcmVxIG1lbV9zZWdbJWRdIDB4
JWxseCAldSAldVxuIiwgaSwKCSAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5e
CgkgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAoJICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQKCSAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAleAoKRml4ZXM6IGQ1Mzk1YTU0ODY1OTYzMDggKCJhdGgx
MWs6IHFtaTogYWRkIGRlYnVnIG1lc3NhZ2UgZm9yIGFsbG9jYXRlZCBtZW1vcnkgc2VnbWVudCBh
ZGRyZXNzZXMgYW5kIHNpemVzIikKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFr
L3FtaS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcW1p
LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3FtaS5jCmluZGV4IDFhY2E4NDFj
ZDE0N2NmZWUuLjc5NjhmZTRlZGEyMmE4MzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMWsvcW1pLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEx
ay9xbWkuYwpAQCAtMTY4Nyw4ICsxNjg3LDggQEAgc3RhdGljIGludCBhdGgxMWtfcW1pX3Jlc3Bv
bmRfZndfbWVtX3JlcXVlc3Qoc3RydWN0IGF0aDExa19iYXNlICphYikKIAkJCXJlcS0+bWVtX3Nl
Z1tpXS5zaXplID0gYWItPnFtaS50YXJnZXRfbWVtW2ldLnNpemU7CiAJCQlyZXEtPm1lbV9zZWdb
aV0udHlwZSA9IGFiLT5xbWkudGFyZ2V0X21lbVtpXS50eXBlOwogCQkJYXRoMTFrX2RiZyhhYiwg
QVRIMTFLX0RCR19RTUksCi0JCQkJICAgInFtaSByZXEgbWVtX3NlZ1slZF0gMHglbGx4ICV1ICV1
XG4iLCBpLAotCQkJCSAgICBhYi0+cW1pLnRhcmdldF9tZW1baV0ucGFkZHIsCisJCQkJICAgInFt
aSByZXEgbWVtX3NlZ1slZF0gJXBhZCAldSAldVxuIiwgaSwKKwkJCQkgICAgJmFiLT5xbWkudGFy
Z2V0X21lbVtpXS5wYWRkciwKIAkJCQkgICAgYWItPnFtaS50YXJnZXRfbWVtW2ldLnNpemUsCiAJ
CQkJICAgIGFiLT5xbWkudGFyZ2V0X21lbVtpXS50eXBlKTsKIAkJfQotLSAKMi4yNS4xCgoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
