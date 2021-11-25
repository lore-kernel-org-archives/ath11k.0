Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB6CC433F5
	for <ath11k@archiver.kernel.org>; Thu, 25 Nov 2021 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veDQhO24SLUW9a4MMogzmLdsqcnDqyJgaZXVrA/urFQ=; b=aNpVhO+dewADvL+DDhWSB637WC
	fmKLyspAI+rnVFDwAiLc8MMWd2S6w29cV5iGPV2xPSn6HXkcmhqCu1zzbkCeXFGEt2U2x+t5532fz
	caT58YJA/RTHcJpiPFeqCEWeHW05CxJP6Y/YOSlOydl1URTMAHXkBzdL/JQYltZ7eZGSh9jqHTTFw
	+M571w3TrAhum2H8u/Pcsy8zuy2NYljDt/iSclavxQuHCyQtLHDmCRZ8vfpZ21RGZVjqt6aYGb0b/
	Q0ojRv/TkVoed8lPgu/DObKcGinUGraxYdni5L1iZOGsq1SsPrd4PlixzST9ZDypqmSgHCN/su5Vw
	knfE6yOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqBR6-006ycm-8n; Thu, 25 Nov 2021 09:53:00 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqBQh-006yTp-TQ
 for ath11k@lists.infradead.org; Thu, 25 Nov 2021 09:52:37 +0000
Received: by mail-lj1-x22d.google.com with SMTP id t11so11398644ljh.6
 for <ath11k@lists.infradead.org>; Thu, 25 Nov 2021 01:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Szrqz9P+dt9sVGFiSoPelkYacT5d0NeogTG3nDY8S1w=;
 b=XORrXAs7yJcgbFEo6HIc9T4/qMyIznOPju41fI7yg0+OoJwfHsOE4KU3KWCxVjlVYh
 kuiKtQrPMZwi/vxGnCrvbywMhPwUJJVMMVcG+D+FaKutB13I5rQIdx3zYViZtIC27XVo
 lHOkIluPN7q91VL87r4k61Hnh4npHckEh6h/VgJTAlQ41dJ6MOpi8Kqc3X1sFe//Io7n
 HnavY3ntjj35aHfMHNUMxW49UZn4IGWjIw+2WiwDfqUvtpiLQuda40wqxCYThso1j+43
 djzhe6xYEDgfvQvkHkMSqCv7/keKbtHBnmtFgcPIMxkqAc8MBExYfEHj9CndWrPeVmfX
 C/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Szrqz9P+dt9sVGFiSoPelkYacT5d0NeogTG3nDY8S1w=;
 b=n6QFDHJQ6DY4tFq6PjAkFD0phGyNAuHiKAeBJZBvzvhIE4ZtqGxVGRU7EK72/kZwaU
 kE//4j3BA0zEAYrs2zF7lUTMvkSDyQw8ft/pLTFprQdk9zvZALETWkukUAwTVIXt0v6B
 UaiTMGbmDk8qpy8y7x1GGGD5AmND9cEvKD89eNytVbbqokvNQa1Zp9I8J1S625SDQKa6
 mpJtORZG4FoGgfukzzJ1qRFi/un7IAmbo1w3Bm4/KVzygK3NCl1Mo3sgpOM0FJLp3Eiw
 9ytZMByHFGdj0i9/Na5LRQYmMaMR4H0nMQPBC2ydqHeYPMDMe+BKvfuR8ZSv4ju7e2SB
 ElJA==
X-Gm-Message-State: AOAM5336eT7IqO+5mu2JXQOk3UQt73cxPuweggggwNS0JPn1qmtGlUG4
 ptZrFriQZibDyKdqSGQCUQQ=
X-Google-Smtp-Source: ABdhPJwbQ6uucyLdeNXvpvD2Zh/kpv+3edb8XMiUW3ZzdPWCZ8fnS48J6yK+cpdRvwxHb/2l8lo/dQ==
X-Received: by 2002:a2e:bc1c:: with SMTP id b28mr24264339ljf.500.1637833949871; 
 Thu, 25 Nov 2021 01:52:29 -0800 (PST)
Received: from ?IPv6:2a02:2168:88a0:5e00:a4c7:4ba3:4116:5?
 ([2a02:2168:88a0:5e00:a4c7:4ba3:4116:5])
 by smtp.gmail.com with ESMTPSA id z5sm223553lfj.8.2021.11.25.01.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 01:52:29 -0800 (PST)
Subject: Re: [PATCH v3 0/2] ath11k: add handler for board-2.bin without
 variant and read SMBIOS
To: Wen Gong <quic_wgong@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20211125084458.16352-1-quic_wgong@quicinc.com>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <e4edd060-8dcb-e1f9-27f4-3ba8c94404ea@gmail.com>
Date: Thu, 25 Nov 2021 12:52:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125084458.16352-1-quic_wgong@quicinc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_015235_986333_2839AD53 
X-CRM114-Status: GOOD (  13.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

VHJpZWQgb24gbXkgRGVsbCA5MzEwLiBJdCB3b3JrcyBub3cuCgpHaXZlcyB0aGUgd2FybmluZyB0
aGF0IFNNQklPUyByZWNvbW1lbmRlZCBmaXJtd2FyZSBub3QgZm91bmQgYnV0IApzdWNjZXNmdWx5
IGZhbGxiYWNrIHRvIGdlbmVyaWMgbW9kZSBhbmQgc3RhcnRzLgoKW8KgIDExOC40MjI2MDFdIGF0
aDExa19wY2kgMDAwMDo3MjowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGIgCmJvYXJk
X2lkIDB4ZmYgc29jX2lkIDB4ZmZmZmZmZmYKW8KgIDExOC40MjI2MTZdIGF0aDExa19wY2kgMDAw
MDo3MjowMC4wOiBmd192ZXJzaW9uIDB4MTAxMTAzNDEgCmZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIx
LTA1LTAyIDE1OjE2IGZ3X2J1aWxkX2lkClvCoCAxMTguNDIyNzc4XSBhdGgxMWtfcGNpIDAwMDA6
NzI6MDAuMDogZmFpbGVkIHRvIGZldGNoIGJvYXJkIGRhdGEgZm9yIApidXM9cGNpLHFtaS1jaGlw
LWlkPTAscW1pLWJvYXJkLWlkPTI1NSx2YXJpYW50PURFXzE5MDEgZnJvbSAKYXRoMTFrL1FDQTYz
OTAvaHcyLjAvYm9hcmQtMi5iaW4KCk9uIDI1LjExLjIwMjEgMTE6NDQsIFdlbiBHb25nIHdyb3Rl
Ogo+IHYzOgo+ICAgICAxLiBhZGQgcGF0Y2ggImF0aDExazogYWRkIGZhbGxiYWNrIGJvYXJkIG5h
bWUgd2l0aG91dCB2YXJpYW50IHdoaWxlIHNlYXJjaGluZyBib2FyZC0yLmJpbiIKPiAgICAgMi4g
cmVhYnNlZCB0byBsYXRlc3QgYXRoLmdpdCBtYXN0ZXIgYXRoLTIwMjExMTIyMTQzNgo+Cj4gdjI6
IHJlYmFzZWQgdG8gbGF0ZXN0IGF0aC5naXQgbWFzdGVyIGF0aC0yMDIxMTExNzA3MzcKPgo+IFdo
ZW4gaXQgZG9lcyBub3QgaGF2ZSBtYXRjaGVkIGJvYXJkIG5hbWUgd2l0aCB2YXJpYW50IGluIGJv
YXJkLTIuYmluLAo+IGF0aDExayB3aWxsIGZhbGxiYWNrIHRvIHNlYXJjaCB3aXRob3V0IHZhcmlh
bnQuCj4KPiBBbHNvIHJlYWQgdGhlIHZhcmlhbnQgZnJvbSBTTUJJT1MuCj4KPiBXZW4gR29uZyAo
Mik6Cj4gICAgYXRoMTFrOiBhZGQgZmFsbGJhY2sgYm9hcmQgbmFtZSB3aXRob3V0IHZhcmlhbnQg
d2hpbGUgc2VhcmNoaW5nCj4gICAgICBib2FyZC0yLmJpbgo+ICAgIGF0aDExazogYWRkIHJlYWQg
dmFyaWFudCBmcm9tIFNNQklPUyBmb3IgZG93bmxvYWQgYm9hcmQgZGF0YQo+Cj4gICBkcml2ZXJz
L25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2NvcmUuYyB8IDkzICsrKysrKysrKysrKysrKysrKysr
KysrKy0tCj4gICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2NvcmUuaCB8IDExICsr
Kwo+ICAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9xbWkuYyAgfCAgNCArKwo+ICAg
MyBmaWxlcyBjaGFuZ2VkLCAxMDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
