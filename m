Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45CEC433F5
	for <ath11k@archiver.kernel.org>; Wed, 16 Feb 2022 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSXqEF7uOreQ2MWORGJURyiHhHjhV2ib3MlCnroeUNI=; b=YWmUrkmfogHgXH
	/d3lCkEBjQgEWf6DFKjbPyx+OV3NfysbsL5y4eeNu+uQw883v3SothfLwCYskCg29TphonPruZouu
	nLfV31P8bj1l6w8Pq4zaMIVDpYlvglUM+qzCXYBHMbSb4BJa8w7q9i92trEITb9U14bN2nVy4oK+o
	uwlMXMDuNHyaHKASCN2rfSVz3DL0CW2x9kEr+cyinMmyDRZnRC+FdzSo3EM2fqea2ayrUX3KMYw9m
	qt2jf4CPxzgLAH17j+SY9bbIXH8SG1eg0CGuPRzm8GzOlKmAeiDSzZa+GQR5eP6qK4sOabbT3YWrN
	ypvtEFtrVcgcMZ+vTGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKEGh-005lmP-NU; Wed, 16 Feb 2022 06:58:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKEGf-005lhr-0c
 for ath11k@lists.infradead.org; Wed, 16 Feb 2022 06:58:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C64EB60B93;
 Wed, 16 Feb 2022 06:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE0BC004E1;
 Wed, 16 Feb 2022 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644994703;
 bh=/vwB5yXs4gDz58JesfiQQTqr2RrPBMQTbgwqNSsMtbA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dzhz3gQk2n7g8xrvbnDd0PVhVH0y2CbfWekq1Q9ZNYxLbJ9Gxymju6Ak+C/Hc4A2j
 UDa7T4EpI61gy5/sTYutePinZRdP2/RFDJZpGv1Oq2YgyMhLA1DY/VDkkD5p218mi0
 5+Qx00y3uyIIlKKZafkspSmK+Eohiw5rLeimFa5PKXUtvDZg9Afs/VfKNMPQG5NYnG
 6P+eZh657c4GKLlEo+gcUhgFcRUFX1PeiSYwxpVn/mzRAPTdMt2xsKxW+vh1yOXRjq
 Vh6UDSQNEIW4ahryMLXFosT8ESIzp54lq4YLmkLv1koLD/lBX3ups065lPv8oMT5/+
 DEH8S3PKtKY6g==
From: Kalle Valo <kvalo@kernel.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: Patricio Ferraggi Ares <pattferraggi@gmail.com>, ath11k@lists.infradead.org
Subject: Re: Fwd: AX500 support quirks
In-Reply-To: <fc387c93-77a0-bc26-e87c-d6ab7ed42a18@gmail.com> (Mark Herbert's
 message of "Tue, 15 Feb 2022 21:42:39 +0300")
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
 <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
 <87ilu5jr98.fsf@kernel.org>
 <198d5223-0dcf-6006-407f-7f9eeeb90c92@gmail.com>
 <CAGYwnbkh=RebRnSxXy7jXyfgMUXd=VBBZPTCB2zWbAM5y40XzQ@mail.gmail.com>
 <a00b83f2-ceba-ec6c-dd41-edaa9f84a041@gmail.com>
 <CAGYwnbnJb_0B0rwbDkTseJVZvNxn_XN2dPF5rG_ni9Hoy8MXgw@mail.gmail.com>
 <87ee4ocgfq.fsf@tynnyri.adurom.net>
 <CAGYwnbk9mUim8GvzLYqqkHLNjtJdQUMqhP1+82s3tCnRHRam=w@mail.gmail.com>
 <87o8381e6x.fsf@kernel.org>
 <CAGYwnbkLheu-d-AnKy7aN_zACKnRw8AgiBg6iBCys2cYQqiV5w@mail.gmail.com>
 <fc387c93-77a0-bc26-e87c-d6ab7ed42a18@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 16 Feb 2022 08:58:18 +0200
Message-ID: <87fsoj1enp.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_225825_127424_F63F88CB 
X-CRM114-Status: GOOD (  12.52  )
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

TWFyayBIZXJiZXJ0IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKCj4gRm9yIGJs
dWV0b290aCB5b3UgZG8gbm90IG5lZWQgbGF0ZXN0IGF0aDExayBwYXRjaGVzLsKgIEl0IGlzIHdv
cmtpbmcKPiBmaW5lIGZvciBhIHByZXR0eSBsb25nIHRpbWUgYWxyZWFkeSwgYW5kIGtlcm5lbCA1
LjE2IGlzIE9LLgo+Cj4gQnV0IHRoZXJlIGlzIGFuIGlzc3VlIHdpdGggNS4xNy1yYyBrZXJuZWwg
d2hlcmXCoCBibHVldG9vdGggc2Nhbm5pbmcgaXMKPiBicm9rZW4gZm9yIGEgd2hpbGUsIGF0wqAg
bGVhc3Qgb24gbXkgZ2VudG9vKzkzMTAKPgo+IEZyb20gd2hhdCBJIHJlYWQgaW4geW91ciBtYWls
cyBsb29rcyBsaWtlIHRoZSBxdWVzdGlvbnMgYXJlIG1vc3RseQo+IGFyY2hsaW51eCBzcGVjaWZp
YyAtIHNvIGl0IGlzIGJldHRlciB0byBhc2sgYXJjaCBjb21tdW5pdHkuCj4KPiBodHRwczovL3dp
a2kuYXJjaGxpbnV4Lm9yZy90aXRsZS9EZWxsX1hQU18xM18oOTMxMCnCoCAtIHdpa2kgcGFnZS4K
PiBJbXBvcnRhbnQgcG9pbnQgc2V0IGdydWIgcGFyYW1ldGVyIG1lbW1hcD0xMk1cXFwkMjBNLsKg
wqAgQXMgSSBzZWUgdGhlCj4gYXRoMTFrIFdpRmkvQnQgc3RhdHVzIGluIHRoZSB3aWtpIGlzIHN0
aWxsIHJlZC4KCldpdGggUUNBNjM5MCBmaXJtd2FyZSBXTEFOLkhTVC4xLjAuMS0wNTI2Ni1RQ0FI
U1RTV1BMWl9WMl9UT19YODYtMSB0aGUKbWVtbWFwIGhhY2sgaXMgbm90IG5lZWRlZCBhbnltb3Jl
LiBBbHNvIFdDTjY4NTUgZG9lcyBub3QgbmVlZCBpdC4KCi0tIApodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mu
d2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0
Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
