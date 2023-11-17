Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EE6C072A2
	for <ath11k@archiver.kernel.org>; Fri, 17 Nov 2023 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCmHeiuaoao4sW1zcgKukGHM3w/CXDb7yABxhWetzgE=; b=gWdgNtgECTBExC
	Kkmfqz0iZKuDsehVzupPOkgTvEEohgP61FBnUsQCNm+DUyzvcu51YP05sQAqRLjKr/07uEs0n6TIL
	lmmr5MwVLEtsy/gPI4Bp5Bv9roaF0V0xX7Tl3l5ZkGRuStWwKCMGGg1uZ9c4CnQPi1FN5K4Fnazwt
	Fz+CuZUS5t7SVxTKrkRh/hJ4oGM3lheMP5oJb94ScylSYzXN7nXtDPry46TEFNTs0buq8Hc3oicbV
	xqfezLoNgOE16DMM4noTPE/PdZgc9GQ7O4Ct8skVERpt9Ipj3VEHpCWYYawJmk+DsygFFHTZ4iYDT
	bYkh+wAN2dr74ccZBqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vC5-00658N-0T;
	Fri, 17 Nov 2023 09:31:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vC2-00655i-0x
	for ath11k@lists.infradead.org;
	Fri, 17 Nov 2023 09:31:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBw-0002W1-7T; Fri, 17 Nov 2023 10:31:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBv-009e8M-Ga; Fri, 17 Nov 2023 10:31:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBv-002yjZ-7e; Fri, 17 Nov 2023 10:31:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH wifi-next 1/6] wifi: ath11k: Convert to platform remove callback returning void
Date: Fri, 17 Nov 2023 10:30:58 +0100
Message-ID: <20231117093056.873834-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117093056.873834-8-u.kleine-koenig@pengutronix.de>
References: <20231117093056.873834-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3hYN3tnM4/NZ3knZ/+upus+mpO+Pxs5arIlHPwnJHaU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVzLSL9vS6NnmImZuTLnRn0N7U5Tf5PTOeIPAq +P5ZjIJpaaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVcy0gAKCRCPgPtYfRL+ Tsi0B/9CWelcJYoumkh4qKAWMn+yfrTHa3oNZC8oj2WIo1CAmki62h720/KIXJAKJNhRUgxlPBd a/AM6wsviq081gNYx5al77rBGez7HA1HWdjJmgCNKDPfF+NoU/n1/8TRerAaQU/yfKSRRsn5ZCf ANcAFLLiJMMvOjfgmp3S+Fs/l3jvXIjBwB3SgUnyHMCVZTWZvIl8OaC17iHYiLhpZSy7ezGdyN2 1Guu929RP0Y6BXZsSW2L8ovYi2EqcOdm0LvV6KdDFRmZgqOldK/sh0UvcixRfOT6UVis9yC8GbQ Fm9ZlQumTYb4qSqoLlxzm3HbzAUoUEVcQJ5JXVds+mfxXJU+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_013118_338833_DA3D1E6C 
X-CRM114-Status: GOOD (  14.33  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2FoYi5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9haGIuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMWsvYWhiLmMKaW5kZXggMjM1MzM2ZWYyYTdhLi5mOGFlOWJhODU1MDAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvYWhiLmMKKysrIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9haGIuYwpAQCAtMTI1MSw3ICsxMjUxLDcgQEAgc3RhdGlj
IHZvaWQgYXRoMTFrX2FoYl9mcmVlX3Jlc291cmNlcyhzdHJ1Y3QgYXRoMTFrX2Jhc2UgKmFiKQog
CXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOwogfQogCi1zdGF0aWMgaW50IGF0aDEx
a19haGJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBh
dGgxMWtfYWhiX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVj
dCBhdGgxMWtfYmFzZSAqYWIgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIApAQCAtMTI2
Nyw4ICsxMjY3LDYgQEAgc3RhdGljIGludCBhdGgxMWtfYWhiX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCiBxbWlfZmFpbDoKIAlhdGgxMWtfYWhiX2ZyZWVfcmVzb3VyY2Vz
KGFiKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9pZCBhdGgxMWtfYWhiX3NodXRkb3du
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCkBAIC0xMjk2LDcgKzEyOTQsNyBAQCBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhdGgxMWtfYWhiX2RyaXZlciA9IHsKIAkJLm9mX21h
dGNoX3RhYmxlID0gYXRoMTFrX2FoYl9vZl9tYXRjaCwKIAl9LAogCS5wcm9iZSAgPSBhdGgxMWtf
YWhiX3Byb2JlLAotCS5yZW1vdmUgPSBhdGgxMWtfYWhiX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9
IGF0aDExa19haGJfcmVtb3ZlLAogCS5zaHV0ZG93biA9IGF0aDExa19haGJfc2h1dGRvd24sCiB9
OwogCi0tIAoyLjQyLjAKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDExawo=
