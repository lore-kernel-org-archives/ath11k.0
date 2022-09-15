Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97C2C32771
	for <ath11k@archiver.kernel.org>; Thu, 15 Sep 2022 21:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+FKnUtviIS7LOl2w1nzR3/O9n8EKPVxkxaGATPvneg=; b=JaVm5zUpi2ZUHn
	SAu0MLsbbHt3jhUjx8p3QV6Oxp1sRvVpWdIvALxxMwEdo90bOznvR9rqlG7cOgccY8aQpLVXTjIHi
	SVCEzk72jwPYePzv2xW3ROFFetg5egivL8iibVyusAqzgbTqhrTVHLZuBDFh2AmDcXvSxlEMmxDTd
	1SB1QA3pjBs7pMt/ECkFCca1FKNngvJ1UIq/eVL5kdeCyejMCQqTN25CqmPshYrH+A2zWcW7Q4+Tj
	dy1iyIOvcy9wDy6cZrbOJE3kHE5dqM3wrgYxTUXpihgh7TtuWSXhdZ2tCI//XC40pLPQS5yTZj2F6
	ngpeyBRQOSaDN+qN3rLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwVH-000ET6-AH; Thu, 15 Sep 2022 21:34:35 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwVD-000EPd-Fq
	for ath11k@lists.infradead.org; Thu, 15 Sep 2022 21:34:33 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 2AC823200AD1;
	Thu, 15 Sep 2022 17:34:25 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute4.internal (MEProxy); Thu, 15 Sep 2022 17:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1663277664; x=
	1663364064; bh=/eknyiWI+rvegyztt8Mdl0E4m3Bnu9X/oPwwi5PsQQw=; b=e
	VypKgdBVzJ9gixTIDZIQpCVsMpIxart+PkBdJaVg6+iPZMVgzZ8rrYFbL1fPhhwF
	ew3AdFFJEOZ3wxDrCJDp7Ljy8Uj+f7yZQVRJ/4m47oC0yw7bRK5GOeMB5zqrLbMd
	/Bibrca5bDPTnSaADPSakygKPlLWw3vk/OMm+YMyGkc/68VRtfKOkOgHbSjugp32
	UBotkWhNXOPjQJ/MheR3JH9eFS8ckeF9pWi06w94Bt6kTilZB8r/5jHHVNp7y0Ss
	xD/6zV49Ld88fQwfuUAoSMYUf2iwZ77d627ZM5fRin3h4h4qUXYoVZt97mkm8htc
	XApT2x7X/NTaW4TO+s3dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663277664; x=
	1663364064; bh=/eknyiWI+rvegyztt8Mdl0E4m3Bnu9X/oPwwi5PsQQw=; b=A
	o3xkaFJQl6eeSgi7vKKICLYp5eJ4wq3L6GD/lpSxI/yWT10ly6gonL/aoMz2x6/N
	6RRZmAAVSpbwjh2ypsfjqnj2MdAzol5tmOd8eLGHlehboUkVdZqjxRglJS4hNb8s
	F5xz11UaNSf88ux2HnUMblhKZBkmnP701ThBe4Q4gyKvDcRSDuDbJhdWDKlufgZf
	EntowMYVyUPiMB6NJDs1ePDLrSWFv4igcAZYxtmru6n4YA75eAq4s1/Feb/hTIZz
	HaVRpPbRQEw95FSrBwnpWiL1ef1Mvxs1I+4mASQhKSWeBMQbJ03JCbO2c2zTlsDe
	o/we2FumaSeav/wfhgidA==
X-ME-Sender: <xms:YJojY6WYT5AlssLNnDe9kVYMvUbS-kfdmHKfRyWZKHKXhZQ-jymUxA>
    <xme:YJojY2lYGgtVGxSQKodwndm4vQOUdWcbLiMaVxXB367uBveenTf9UBY0muMCi2eKN
    -wy2fABseNTX_fK-AM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduledgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgfgse
    htqhertderreejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhn
    rdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepudefgeefte
    dugeehffdtheefgfevffelfefghefhjeeugeevtefhudduvdeihefgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghngh
    esfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:YJojY-ZS0uujzEpchMQCE4HMisHnEnN8h_Xz9-TmAcIp1RHzKgaHcg>
    <xmx:YJojYxVc84MbJkywROkNOcRA9wHXufzIGO6uIiOl8YiCr3afUCn2ZA>
    <xmx:YJojY0nX-CiIKGcOjt_yHbYxYpX3_eMHToy2Lat12lft4N_clrNv9A>
    <xmx:YJojY5wkIgeD4Z-HDf3jJ-ySxMfBPC5lzTY06syv8XzRVQ94YUV2Zg>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3E76C36A0073; Thu, 15 Sep 2022 17:34:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <ec4a6ecf-f432-4dd0-abf6-61d7b587a61b@www.fastmail.com>
In-Reply-To: <699535de25ac2d696cdf218bbb1f401bcd6048c1.camel@infradead.org>
References: <9e1d3ba6-48ac-4a97-8b65-87e395898c2a@www.fastmail.com>
 <699535de25ac2d696cdf218bbb1f401bcd6048c1.camel@infradead.org>
Date: Thu, 15 Sep 2022 22:34:03 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "David Woodhouse" <dwmw2@infradead.org>, iommu@lists.linux.dev
Cc: kvm@vger.kernel.org, ath11k@lists.infradead.org, kvalo@kernel.org
Subject: Re: ath11k VFIO MSI issue with DMAR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_143431_858211_DD31E685 
X-CRM114-Status: GOOD (  11.98  )
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

CgrlnKgyMDIy5bm0OeaciDEz5pel5Lmd5pyIIOS4i+WNiDM6NTXvvIxEYXZpZCBXb29kaG91c2Xl
hpnpgZPvvJoKPiBPbiBUdWUsIDIwMjItMDktMTMgYXQgMTU6MDkgKzAxMDAsIEppYXh1biBZYW5n
IHdyb3RlOgpbLi4uXQo+Cj4gWW91ciBiZXN0IGJldCBpcyBwcm9iYWJseSB0byBoYXZlIHRoZSBo
eXBlcnZpc29yIHRyYXAgYWNjZXNzZXMgdG8gdGhlCj4gYXRoMTFrX2NlX3NybmdfbXNpX3Jpbmdf
cGFyYW1zX3NldHVwIGFuZCBhdGgxMWtfZHBfc3JuZ19tc2lfc2V0dXAKPiByZWdpc3RlcnMgYW5k
IGRvIHRoZSBzYW1lIHRyaWNrIG9mIGFsbG9jYXRpbmcgYSBob3N0IElSUSByb3V0ZSBhbmQKPiB3
cml0aW5nIHRoZSBjb252ZXJ0ZWQgTVNJIG1lc3NhZ2UuCj4KPiBUaGUgYWx0ZXJuYXRpdmUgaXMg
dG8gYnVpbGQgc29tZSBraW5kIG9mIGVubGlnaHRlbm1lbnQgdG8gbGV0IHRoZSBndWVzdAo+IGFz
ayB0aGUgaHlwZXJ2aXNvciB0byB0ZWxsIGl0IHRoZSBjb3JyZWN0IHJlbWFwcGFibGUgZm9ybWF0
IG1lc3NhZ2UgdG8KPiB1c2UuLi4gYnV0IHRoYXQncyBnb2luZyB0byBnZXQgdmVyeSBob3JyaWQg
dmVyeSBxdWlja2x5LiBJZiB5b3VyCj4gaGFyZHdhcmUgYWxsb3dzIHlvdSB0byByZWFkIHRoZSBN
U0koWCkgdGFibGUgdmlhIHNvbWUgb3RoZXIgaW5kaXJlY3QKPiByb3V0ZSB3aGljaCBpc24ndCB0
cmFwcGVkIGJ5IHRoZSBoeXBlcnZpc29yIHRvIGdpdmUgeW91IGJhY2sgdGhlCj4gIm9yaWdpbmFs
IiB0aGluZyB5b3Ugd3JvdGUsIHBlcmhhcHMgeW91IGNvdWxkIHdyaXRlIHRvIGFuIHVudXNlZCBN
U0kKPiBhbmQgdGhlbiByZWFkIGJhY2sgd2hhdCB0aGUgaGFyZHdhcmUgKmFjdHVhbGx5KiBjb250
YWlucy4uLiB0aGVuIHdyaXRlCj4gdGhhdCB0byB0aGUgc3BlY2lhbCByZWdpc3Rlcj8gQnV0IHRo
YXQncyBraW5kIG9mIGF3ZnVsLgoKSW5kZWVkIGJvdGggaWRlYXMgc291bmQgYXdmdWwuLi4KCk15
IGN1cnJlbnQgYXBwcm9hY2ggaXMgcmFpc2UgYSBndWVzdCBBUElDIGludGVycnVwdCB3aGVuIDB4
MjUgZmF1bHQgaGFwcGVucy4KVGhvdWdoIEknbSBjdXJyZW50bHkgaGFyZGNvZGluZyBndWVzdCBB
UElDIGRlc3RpbmF0aW9uIGJ1dCBJIHRoaW5rIGl0J3MgcG9zc2libGUKdG8gY2hlY2sgZmF1bHQg
TVNJIGFkZHJlc3MvZGF0YSBmcm9tIGZhdWx0IGV2ZW50IGFkZHJlc3MvZGF0YSByZWdpc3RlcnMg
YWdhaW5zdApETUFSIGludGVycnVwdCBtYXBwaW5nIHRhYmxlIHRvIGRldGVybWluZSBhY3R1YWwg
ZGVzdGluYXRpb24/CgpJdCdzIGJpdCBvZiB0cmFwIGFuZCBlbXVsYXRpb24sIHRoaW5rIHRoYXQg
d2lsbCBlbmFibGUgRE1BUiBkcml2ZXIgdG8gaGFuZGxlIHN1Y2gKc2l0dXRhdGlvbi4KClRoYW5r
cy4KCj4KPiDpmYTku7Y6Cj4gKiBzbWltZS5wN3MKCi0tIAotIEppYXh1bgoKLS0gCmF0aDExayBt
YWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
