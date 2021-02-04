Return-Path: <SRS0=ZsjY=HG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F78C433E6
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 03:37:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE7CA64F5D
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 03:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE7CA64F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UJxxyCd07Me/jGhtLfS2j236+IIVmfcmLDbC9KwYUs0=; b=yjV/A7Gr6HM7TkVGjG1sBfPKw
	Zikta3vdtnazWKHe+HEYyBN794KgDhi19GSwB7YXqJ+Zt5Xk8JQLoNmzNUuIzHDV0FKAyXYr5W11z
	x0UI6au1LjIWDjbQ9QdFh9RrWNGmBmwq5jZIMTMsZZAhzn2UevdGA+ik6GbMmCXXUhhK4LWmpNIKz
	dZdU6vSzbD54H6hKLqhCh4atoApj54cgfWInv9FXyqISJlzAQ2KGzbMNv8Xb6GIWUpYP9SVqVWQ06
	CsUM/tls5QTHwlPlJPruX5CxfCYBWmRXg5I3GS1hfQouTFF9H2opJfkv0BATsVCKn47jumLGMGvsB
	TipJpOl2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7VSg-0007Xx-Dp; Thu, 04 Feb 2021 03:37:42 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7VSe-0007X9-2p
 for ath11k@lists.infradead.org; Thu, 04 Feb 2021 03:37:41 +0000
Received: by mail-pf1-x42c.google.com with SMTP id q131so1217246pfq.10
 for <ath11k@lists.infradead.org>; Wed, 03 Feb 2021 19:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dQcZ9kr2eRxPZi8AE7aZJtfRw3wUMvLj2JFrqWoE+hU=;
 b=HBHpo3TueSQGotd+hW3e8PzgY3oLpvezf/8R8rNNlqmDdbwBcbp2GigrxjSTKl+bEt
 GfRB5gCRCzPo9tY+6yEyGWTjBT+sIXFsVztcWkoFMx85bhOZpmSMczIQOad8H1h4Ga/E
 UAl4NKg0Q1gVdIdQXV/icNaemtZzxJriEb61w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dQcZ9kr2eRxPZi8AE7aZJtfRw3wUMvLj2JFrqWoE+hU=;
 b=BhiQlnet3p/fl2TxOGAXc7tOiov8C1931yDuyrD7gS3hp1GDtVYIRE9criaNGQDSCP
 EawvDtI4oBtL2zAmju6JMRIG1szXO3V6JpHvVWcfOVstCFzODiLeXTRB65XGgL6tnReU
 yWknZDmXM4fjcRPt8b8PT9fvxNv8ZfCPYU57DEuHB7vanHTyxE3T9RNYsaC2+8WvHy9w
 l7Z67VakU2io942GM5L1fPParsY0OalH8UE7UC9gU6ZJIF2sm/RDAXtQPNO45kZBMQGV
 6VaJzsH0W7wHjuzIAxZWC6K6wnzZx5A0iYnwyDnohzP4cpqgRLCEhvmzsKHmaOhP4N8E
 z9xg==
X-Gm-Message-State: AOAM5306NofMdMocMXaz2meAw7t8es5prBNq8BcwbC+1K4Q91de/bapa
 JOtAtARSZyGPg2pZyfzvNrfK+zqaeulvGbF9
X-Google-Smtp-Source: ABdhPJxpsEcbDYJCtgsf4DAwa8asGxvxa9jyoyAFiL0bxLNNuEGRuwKGG4gMv+ZaWG+jSU0Ku5MyaQ==
X-Received: by 2002:aa7:8b0f:0:b029:1c0:e782:ba29 with SMTP id
 f15-20020aa78b0f0000b02901c0e782ba29mr6064608pfd.37.1612409857509; 
 Wed, 03 Feb 2021 19:37:37 -0800 (PST)
Received: from [192.168.4.200]
 (107-196-182-50.lightspeed.sntcca.sbcglobal.net. [107.196.182.50])
 by smtp.gmail.com with ESMTPSA id 124sm3872977pfc.196.2021.02.03.19.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 19:37:37 -0800 (PST)
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
To: Karthikeyan periyasamy <periyasa@codeaurora.org>
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
 <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
 <d6cbfd2aff787faa3be69252b2677df9@codeaurora.org>
 <08ef5e10-de7a-fe13-d23a-d1afa1dbd0e5@eero.com>
 <ea757176a6438f1b0cf9bee41f8a9f8c@codeaurora.org>
 <dc8f531f-2ab5-f690-2b94-917880682fcc@eero.com>
 <7e3bae2db30d90963f96bb9be82951f0@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <ea3fb227-8324-dd73-f400-b6e591bc91df@eero.com>
Date: Wed, 3 Feb 2021 19:37:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7e3bae2db30d90963f96bb9be82951f0@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_223740_912326_32758EF5 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ck9uIDIvMy8yMSA3OjE3IFBNLCBLYXJ0aGlrZXlhbiBwZXJpeWFzYW15IHdyb3RlOgo+IE9uIDIw
MjEtMDItMDQgMDg6MzgsIFBldGVyIE9oIHdyb3RlOgo+PiBPbiAyLzMvMjEgNTowOCBQTSwgS2Fy
dGhpa2V5YW4gcGVyaXlhc2FteSB3cm90ZToKPj4+IE9uIDIwMjEtMDItMDQgMDA6NTksIFBldGVy
IE9oIHdyb3RlOgo+Pj4+IE9uIDEvMjYvMjEgNjo0NiBQTSwgS2FydGhpa2V5YW4gcGVyaXlhc2Ft
eSB3cm90ZToKPj4+Pj4gT24gMjAyMC0xMi0xOSAwMDo1MywgUGV0ZXIgT2ggd3JvdGU6Cj4+Pj4+
PiBPbiAxMi8xOC8yMCA3OjI0IEFNLCBLYXJ0aGlrZXlhbiBQZXJpeWFzYW15IHdyb3RlOgo+Pj4+
Pj4+IFR4IGRlc2NyaXB0b3Igc2VhcmNoIGluZGV4IGZpZWxkIHNob3VsZCBiZSB1cGRhdGVkIHdp
dGggaHcgcGVlciBpZAo+Pj4+Pj4+IGFuZCBub3QgYnkgQVNUIEhhc2guIEluY29ycmVjdCBzZWFy
Y2ggaW5kZXggY2F1c2VzIHRocm91Z2hwdXQgCj4+Pj4+Pj4gZGVncmFkYXRpb24KPj4+Pj4+PiBp
biBhbGwgdGhlIHBsYXRmb3Jtcy4gc28gdXBkYXRlZCB0aGUgc2VhcmNoIGluZGV4IGZpZWxkIHdp
dGggaHcgCj4+Pj4+Pj4gcGVlciBpZCwKPj4+Pj4+PiB3aGljaCBpcyBhIGNvbW1vbiBjaGFuZ2Ug
YXBwbGljYWJsZSBmb3IgYWxsIHRoZSBwbGF0Zm9ybXMuCj4+Pj4+Pj4KPj4+Pj4+PiBUZXN0ZWQt
b246IElQUTgwNzQgaHcyLjAgQUhCIAo+Pj4+Pj4+IFdMQU4uSEsuMi40LjAuMS0wMTQ5Mi1RQ0FI
S1NXUExfU0lMSUNPTlotMQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGVlci5jIAo+Pj4+Pj4+IGIvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDExay9wZWVyLmMKPj4+Pj4+PiBpbmRleCBiNjllN2ViLi5mNDlhYmVmYSAxMDA2
NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3BlZXIuYwo+
Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGVlci5jCj4+Pj4+
Pj4KPj4+Pj4+PiBAQCAtMzA5LDcgKzMxMCwxMSBAQCBpbnQgYXRoMTFrX3BlZXJfY3JlYXRlKHN0
cnVjdCBhdGgxMWsgKmFyLCAKPj4+Pj4+PiBzdHJ1Y3QgYXRoMTFrX3ZpZiAqYXJ2aWYsCj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqAgcGVlci0+cGRldl9pZHggPSBhci0+cGRldl9pZHg7Cj4+Pj4+Pj4g
wqDCoMKgwqDCoCBwZWVyLT5zdGEgPSBzdGE7Cj4+Pj4+Pj4gLcKgwqDCoCBhcnZpZi0+YXN0X2hh
c2ggPSBwZWVyLT5hc3RfaGFzaDsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCBpZiAoYXJ2aWYt
PnZpZi0+dHlwZSA9PSBOTDgwMjExX0lGVFlQRV9TVEFUSU9OKSB7Cj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGFydmlmLT5hc3RfaGFzaCA9IHBlZXItPmFzdF9oYXNoOwo+Pj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBhcnZpZi0+YXN0X2lkeCA9IHBlZXItPmh3X3BlZXJfaWQ7Cj4+Pj4+Pj4gK8KgwqDC
oCB9Cj4+Pj4+Pgo+Pj4+Pj4gSG93IGFib3V0IG5vbiBTVEFUSU9OIHR5cGU/Cj4+Pj4+Pgo+Pj4+
Pgo+Pj4+PiBubyBuZWVkIG9mIGNvbmZpZ3VyaW5nIHRoZSBhc3RfaWR4LCBhc3RfaGFzaCBmaWVs
ZCBmb3Igbm9uIHN0YXRpb24gCj4+Pj4+IHR5cGUuIEl0cyByZWNvbW1lbmRlZCBieSBIVy9GVyB0
ZWFtLgo+Pj4+Pgo+Pj4+IENhbiB5b3UgYWRkIHRoaXMgY29tbWVudCBpbiBjb21taXQgbWVzc2Fn
ZT8KPj4+Pgo+Pj4KPj4+IHN1cmUKPj4+Cj4+Pj4gQWxzbyBjb3VsZCB5b3UgaW5jbHVkZSB0aGUg
YW5zd2VyIHRvICJ3aGF0IGNvbmRpdGlvbnMgeW91IG9ic2VydmVkIHRoZQo+Pj4+IHRocm91Z2hw
dXQgZGVncmFkYXRpb24/IiBpbiBjb21taXQgbWVzc2FnZSB0b28/Cj4+Pgo+Pj4gSW4gYWxsIHRo
ZSBzY2VuYXJpbyB3aWxsIHNlZSBkZWdyYWRhdGlvbi4gSXRzIGEgZ2VuZXJhbCBpbXByb3ZlbWVu
dC4KPj4+Cj4+IEl0IHNvdW5kcyBnb29kIGFuZCBpdCB3aWxsIGJldHRlciBpZiB5b3Ugc2hhcmUg
dGhlIG51bWJlciBiZWZvcmUgYW5kCj4+IGFmdGVyIHRoZSBwYXRjaC4KPgo+IEkgaGF2ZSBzZWVu
IDEwJSBpbmNyZWFzZSBpbiBXRFMgc2NlbmFyaW8uCj4KPiBUaGFua3MsCj4gS2FydGhpa2V5YW4g
UAoKVGhhbmsgeW91IGZvciB0aGUgc2hhcmluZy4KCkJUVywgYWxsIHN1Y2ggaW5mb3JtYXRpb24g
c2hvdWxkIGdvIHRvIGNvbW1pdCBtZXNzYWdlLgoKUGV0ZXIKCgotLSAKYXRoMTFrIG1haWxpbmcg
bGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
