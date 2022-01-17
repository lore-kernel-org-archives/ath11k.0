Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBDEC433F5
	for <ath11k@archiver.kernel.org>; Mon, 17 Jan 2022 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwWJy3d2IG9eNS3Uw1bTLUpLjJWMybkWrA+WCtYiZVI=; b=eUMcOylbVIz5Ll
	uKMj/g629STZEhXL1DOjae5Q+Yc0zq/hlaPvh1ENru2Ezps+Xx2DOh9LsFNhiLy8dlaW6Xfvc8w9i
	QhAYcaWT/pbOUxw6vO1FZ/a3zouxQq63P1yaXzkQrBnJ2DS/lAtJkLyFk8vCFtcb1ykK36QQSHIYO
	GqnSnZLzduVR08FLO54WXqswSYulB0RSnyQjxbosnA8dt1K6mScCSaXB8yQpvvEylV0/2SFB7CSG4
	Ehk0GG84L6MsbXzHrgWcPeR15sDSXM7NxLEQGGAz5zjvcWF5FbtbX23hE1OZ6ejU8UtlLyuLnae7M
	qGgok9wNkhrfdPMCoAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9TJX-00FEol-S3; Mon, 17 Jan 2022 14:48:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9TJV-00FEoF-MS
 for ath11k@lists.infradead.org; Mon, 17 Jan 2022 14:48:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4997660A6B;
 Mon, 17 Jan 2022 14:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE99EC36AEC;
 Mon, 17 Jan 2022 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642430932;
 bh=uxtZp7jFFEMwhOZNMTMWbivpAvT9tM/QEjNTQflZiDI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=qGnlxrKJDj6iLgVBpN2Vfb69Uhr+hqj5zCCamhEw0Z+FxYR1imQhL095e6sEPWtuy
 RDbaTq4xZwuqjWQHV/HvjODpW7QLs8zh1lWM1bM0IvMJ6mHuWuho7f1EN2eG8cIVwM
 7lIsoCy7mLtPDH2UYeIEe+rC1f105yW9rfAuQvEuDpQ5MnIzBLP5/Rqs/z+7ii2QoC
 I9u5nRA//hQhM/XG3LyGBRH5+Ug1rhaJcbmd7rnOO295riMJWRtZpSa3QB6yN/XQKh
 rsjiouo2b3quaGdTnRAY148tT/A8pdFN9ZNDfJzcy2fDClkG0hRScs8yFJFaR6yrIi
 fN+2Sfbze6m9A==
From: Kalle Valo <kvalo@kernel.org>
To: fckath@web.de
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: ath11k and the 32 MSI problem
References: <trinity-f503010b-028a-4c52-a368-56b3e6a1e645-1642429792868@3c-app-webde-bap30>
Date: Mon, 17 Jan 2022 16:48:49 +0200
In-Reply-To: <trinity-f503010b-028a-4c52-a368-56b3e6a1e645-1642429792868@3c-app-webde-bap30>
 (fckath's message of "Mon, 17 Jan 2022 15:29:52 +0100")
Message-ID: <87zgnuifji.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_064853_809798_17A04533 
X-CRM114-Status: GOOD (  18.85  )
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

KGFkZGluZyBhdGgxMWsgbGlzdCkKCmZja2F0aEB3ZWIuZGUgd3JpdGVzOgoKPiBIZWxsbyB3b3Js
ZDsKPiDCoAo+IEkndmUgZ290IGEgYnVuY2ggb2YgTS4yIFR5cGUgQS9FIFdpZmkgNmUgY2FyZHMg
ZnJvbSBFbXdpY29uIChXTVg3MjA1KQo+IGFuZCBTcGFya2xhbiAoV05GUS0yNjhBWEkoQlQpKSB3
aXJ0aCBRdWFsY29tbSBXQ042ODU2IGNoaXBzLgo+IMKgCj4gSSdkIGxpa2UgdG8gdXNlIHRoZW0g
b24gREZJIEFMNTUzIDMuNSIgU0JDcyB3aXRoIEFUT00gRTM5NDAgcHJvY2Vzc29yCj4gKGh0dHBz
Oi8vd3d3LmRmaS5jb20vZGUvcHJvZHVjdC9pbmRleC8xNDA5KSwgYnV0IEkgd2FzIGhpdCBieSB0
aGUKPiBlcnJvciBtZXNzYWdlICJmYWlsZWQgdG8gZ2V0IDMyIE1TSSB2ZWN0b3JzLCBvbmx5IC0y
OCBhdmFpbGFibGUiLiBPaywKPiBpdCBzZWVtcyB0aGF0IHRoZSBBdG9tIEUzOTAwIGRvZXMgbm90
IHN1cHBvcnQgVlQtZC4gSSBtYW5hZ2VkIHRvIGdldAo+IHRoZXNlIGNhcmQgd29ya2luZyBvbiBz
dGFuZGFyZCBQQ3Mgd2l0aCBpNyBhbmQgaTUgd2l0aCBhY3RpdmUgVlQtZC4KPiBIb3dldmVyLCB3
aGVuIGRpc2FibGluZyBWVC1kIGluIHRoZSBCSU9TIEkgZ2V0IHRoZSBzYW1lIGJlaGF2aW91ciBh
cwo+IG9uIHRoZSBBdG9tIGJvYXJkcy4KPgo+IEkgdHJpZWQgdGhlIHNpbmdsZSBNU0kgcGF0Y2gg
b24KPiBodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0
aDExayBidXQgZmFpbGVkIHRvCj4gYXBwbHkgdGhlc2UgcGF0Y2hlcyB0byBhbiA1LjE1LjAga2Vy
bmVsIGZyb20gRGViaWFuIGJhY2twb3J0cy4KPgo+IEFyZSB0aGVyZQo+ICAtIHBhdGNoZXMgZm9y
IDUuMTUgb3IgNS4xNj8KPiAgLSBwYXRjaGVkIGRyaXZlcnMgZm9yIDUuMTUgb3IgNS4xNj8KPiAg
LSBpbmZvcm1hdGlvbiB3aGVyZSB0byBmaW5kIGEgbWF0Y2hpbmcgZHJpdmVyIHNvdXJjZSBvbiB3
aGljaCB0aGUgcGF0Y2hlcyB3aWxsIGFwcGx5PwoKVGhlIHN1cHBvcnQgZm9yIG9uZSBNU0kgdmVj
dG9ycyB3aWxsIGJlIGluIHY1LjE3LXJjMSwgd2hpY2ggc2hvdWxkIGJlCnJlbGVhc2VkIG5leHQg
U3VuZGF5LiBUaGUgZmVhdHVyZSBpcyBhbHJlYWR5IG9uIExpbnVzJyB0cmVlLgoKSUlSQyB5b3Ug
bmVlZCB0aGVzZSBjb21taXRzLCBpbiBjYXNlIHlvdSB3YW50IHRvIGJhY2twb3J0IHRoZW06Cgpl
OTRiMDc0OTNkYTMgYXRoMTFrOiBTZXQgSVJRIGFmZmluaXR5IHRvIENQVTAgaW4gY2FzZSBvZiBv
bmUgTVNJIHZlY3Rvcgo5MTVhMDgxZmYzMDcgYXRoMTFrOiBkbyBub3QgcmVzdG9yZSBBU1BNIGlu
IGNhc2Ugb2Ygc2luZ2xlIE1TSSB2ZWN0b3IKYWM2ZTczNDgzZjdiIGF0aDExazogYWRkIHN1cHBv
cnQgb25lIE1TSSB2ZWN0b3IKYzQxYTY3MDBiMjc2IGF0aDExazogcmVmYWN0b3IgbXVsdGlwbGUg
TVNJIHZlY3RvciBpbXBsZW1lbnRhdGlvbgo0YWI0NjkzZjMyN2EgYXRoMTFrOiB1c2UgQVRIMTFL
X1BDSV9JUlFfRFBfT0ZGU0VUIGZvciBEUCBJUlEKMDEyNzliY2QwMWQ5IGF0aDExazogYWRkIENF
IGFuZCBleHQgSVJRIGZsYWcgdG8gaW5kaWNhdGUgaXJxX2hhbmRsZXIKODdiNDA3MmQ3ZWY4IGF0
aDExazogZ2V0IG1zaV9kYXRhIGFnYWluIGFmdGVyIHJlcXVlc3RfaXJxIGlzIGNhbGxlZAowODFl
MmQ2NDc2ZTMgYXRoMTFrOiBhZGQgaHdfcGFyYW0gZm9yIHdha2V1cF9taGkKCi0tIApodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBz
Oi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9z
dWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMWsK
