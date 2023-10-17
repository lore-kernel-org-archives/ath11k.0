Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F0BCDB474
	for <ath11k@archiver.kernel.org>; Tue, 17 Oct 2023 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyMxVzrfjpwL9VfkEvt+RF2+k0TNW7v8iZAbkD4bLSI=; b=kXus3O4unrqKUL
	lX/tBCNfEkZROCUj3y/42ZcHElblTwFfjmqWAp3iH8fpmDu8qw8ZNe2/oNm5afLqoei0BxVMqb3Fj
	utnUpd8MISp5PSeYBkfiPnZJPJJ+EDPbkhAH66Yd+r9szv3pkTrUcM+rQv167SU3y08vxJdDKEcXh
	iJxtYx6mdgQ2qaNOytchiav/Xt5Ark/17p8oTSrTUoDrjQePnoEEw+8YFJDjbvzbspCuji+pXIv+2
	rcqAhQzwuEaI1gzlVhJgEhNFfcP+OG4gJsK6gBJq/4/ESjuhDW2dLMf2P9GOxxz3XrqGR+PMAdI3o
	k0nRmr38x8Iq+86QaZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmOk-00CmyN-2l;
	Tue, 17 Oct 2023 15:54:22 +0000
Received: from forward101b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmOh-00Cmxi-0m
	for ath11k@lists.infradead.org;
	Tue, 17 Oct 2023 15:54:21 +0000
Received: from mail-nwsmtp-smtp-production-main-39.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:2087:0:640:7bf5:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTP id 6689960A7F;
	Tue, 17 Oct 2023 18:54:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id Asm1c64WrCg0-SuD4nnZc;
	Tue, 17 Oct 2023 18:54:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1697558050; bh=ExbI9XKauKt0OTBWrumrPRIe6hhpHVSKix15w8H4dWQ=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=S2XB/tuvUwzNzyZJ4bhBsBuwiMfkIax0PzhFcqeKGVdz1/JM4w4FtJ6KMa+CCcCIS
	 kehf37Iw2VkwqCetziWTatqMbNs1Ny7u/iOc6EbCgDq4viHW3C2EFCySrLHFhBzp3t
	 wuuGNTHPaGLzu4GiHjLqyb2UmrNO0RqgWPZ6h4tA=
Authentication-Results: mail-nwsmtp-smtp-production-main-39.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath11k: fix -Wformat-truncation warning
Date: Tue, 17 Oct 2023 18:53:25 +0300
Message-ID: <20231017155342.112032-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <87fs2k5l1a.fsf@kernel.org>
References: <87fs2k5l1a.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_085419_767716_203A7CA0 
X-CRM114-Status: GOOD (  10.83  )
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

Rml4IHRoZSBmb2xsb3dpbmcgd2FybmluZyBvYnNlcnZlZCB3aXRoIEdDQyAxMy4yIGFuZCAtV2Zv
cm1hdC10cnVuY2F0aW9uOgoKZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kZWJ1Z2Zz
LmM6IEluIGZ1bmN0aW9uIOKAmGF0aDExa19kZWJ1Z2ZzX3JlZ2lzdGVy4oCZOgpkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTFrL2RlYnVnZnMuYzoxNTk3OjUxOiB3YXJuaW5nOiDigJglZOKA
mSBkaXJlY3RpdmUgb3V0cHV0Cm1heSBiZSB0cnVuY2F0ZWQgd3JpdGluZyBiZXR3ZWVuIDEgYW5k
IDMgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIDIgWy1XZm9ybWF0LXRydW5jYXRpb249XQog
MTU5NyB8ICAgICAgICAgc25wcmludGYocGRldl9uYW1lLCBzaXplb2YocGRldl9uYW1lKSwgIiVz
JWQiLCAibWFjIiwgYXItPnBkZXZfaWR4KTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+CmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMWsvZGVidWdmcy5jOjE1OTc6NDg6IG5vdGU6IGRpcmVjdGl2ZSBhcmd1bWVudCBpbiB0aGUg
cmFuZ2UgWzAsIDI1NV0KIDE1OTcgfCAgICAgICAgIHNucHJpbnRmKHBkZXZfbmFtZSwgc2l6ZW9m
KHBkZXZfbmFtZSksICIlcyVkIiwgIm1hYyIsIGFyLT5wZGV2X2lkeCk7CiAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kZWJ1Z2ZzLmM6MTU5Nzo5OiBub3RlOiDigJhzbnByaW50
ZuKAmSBvdXRwdXQgYmV0d2Vlbgo1IGFuZCA3IGJ5dGVzIGludG8gYSBkZXN0aW5hdGlvbiBvZiBz
aXplIDUKIDE1OTcgfCAgICAgICAgIHNucHJpbnRmKHBkZXZfbmFtZSwgc2l6ZW9mKHBkZXZfbmFt
ZSksICIlcyVkIiwgIm1hYyIsIGFyLT5wZGV2X2lkeCk7CiAgICAgIHwgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+CgpTaW1wbGlmeSB0aGUgJ3NucHJpbnRmKCknIHN0YXRlbWVudCBhcyB3ZWxsLgoKU3VnZ2Vz
dGVkLWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBEbWl0
cnkgQW50aXBvdiA8ZG1hbnRpcG92QHlhbmRleC5ydT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTFrL2RlYnVnZnMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTFrL2RlYnVnZnMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsv
ZGVidWdmcy5jCmluZGV4IDViYjZmZDE3ZmRmNi4uZTliMDVlN2MxODliIDEwMDY0NAotLS0gYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2RlYnVnZnMuYworKysgYi9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTFrL2RlYnVnZnMuYwpAQCAtMTU5MSwxMCArMTU5MSwxMCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBmb3BzX3BzX3N0YXRlX2VuYWJsZSA9
IHsKIGludCBhdGgxMWtfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgYXRoMTFrICphcikKIHsKIAlz
dHJ1Y3QgYXRoMTFrX2Jhc2UgKmFiID0gYXItPmFiOwotCWNoYXIgcGRldl9uYW1lWzVdOworCWNo
YXIgcGRldl9uYW1lWzhdOwogCWNoYXIgYnVmWzEwMF0gPSB7MH07CiAKLQlzbnByaW50ZihwZGV2
X25hbWUsIHNpemVvZihwZGV2X25hbWUpLCAiJXMlZCIsICJtYWMiLCBhci0+cGRldl9pZHgpOwor
CXNucHJpbnRmKHBkZXZfbmFtZSwgc2l6ZW9mKHBkZXZfbmFtZSksICJtYWMldSIsIGFyLT5wZGV2
X2lkeCk7CiAKIAlhci0+ZGVidWcuZGVidWdmc19wZGV2ID0gZGVidWdmc19jcmVhdGVfZGlyKHBk
ZXZfbmFtZSwgYWItPmRlYnVnZnNfc29jKTsKIAlpZiAoSVNfRVJSKGFyLT5kZWJ1Zy5kZWJ1Z2Zz
X3BkZXYpKQotLSAKMi40MS4wCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMWsK
