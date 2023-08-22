Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0B6EE49AB
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG4iU1wng9PJt4E+G/fLNrFEKuXOivAytMm6GstPwTE=; b=0csmoE+p8pN1j/
	CaY+YimoRIv4SbRR2b9rG3laMo5DDQ0wDIZwJMFPisDc7g3rnFG2UJOIneZEnlFe/7ACA5Ne9FKBu
	rSJScM8RwfaiYwDBhvQn1dZdvGXF6wM0x/i96ei5+yZF9VfBAnu3DlEJjqB0CzaL50eaMv1NLanjY
	EQeUhRrwph6RvC8LsMo94tO/FG85yPWMFgpJMfqp+f+w0HhGvVH85kCvmSAREIgeEFTppAsBTXzeU
	Z45ltdnLj+FlYdoRhnPtm+8C+qs2Ju2/pdiD9asoFsKfYbzlQLlPXr+ye1dH9gcMpmqMWC9hGDkLA
	a5cQx3tbD7T2puxyDKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMdm-00FS0Y-2n;
	Tue, 22 Aug 2023 08:21:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMdk-00FS03-0y
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 08:21:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bc0d39b52cso26699365ad.2
        for <ath11k@lists.infradead.org>; Tue, 22 Aug 2023 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692692487; x=1693297287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uI5wJ9ct8HbAPvV5fuCcTfn2AV2BtXUESKYHqH+gEZw=;
        b=dmmVzhodRiHBaiBk2cTWwNeLD5MFk3SlNyeOdRVp3rZLKMfD3iSVt1Z6Du4MoEAu3C
         VJRu+oVvutrc4I7CGNZZZPshYchrQO4wmwV7Y3suUfneMzz8yD1QkqG1lI5b++7A7aa+
         orSuAMiMZyqXA+lQN97vF1/nTbmZ+5BDyC+LJ7Nvcd98oZCs6xmsoJmX/eIFZYP2jNLG
         dKPM7tFQ7cJwC09BldNmZYtjNIch3mStTE313G3Keq55TIq+GYAcp1DUIYU0c0Evb0K0
         vCFOYBZWYTnQdh+EYHzUVnUVIu7dcUwZRts1P1r45drWpWDNjQxyoo0WL2xDG0TG/BiK
         X+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692692487; x=1693297287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uI5wJ9ct8HbAPvV5fuCcTfn2AV2BtXUESKYHqH+gEZw=;
        b=Hvz+NPRxoGUCCNfTTlPDIXbZT38srbsUUAGPDF/Ct0kC/u1WHCZKgB9aRNQKVP7k7D
         lK9BvMNuJyA1LSigIWbrU8W+ONjjXJfWncdpHSysO+76QwOO1Svs1Tt4HG3OKZxx91yj
         OhRawY9Q8UU6hVI6tmFUOfetONy4rwa0vTdqOe2j6rp4N/5VEzc7b33Uonjw6iBrV9/+
         4mqRwgYiUhg1hpZNeFpLMpYWC0LvZ3GSQ50fOmML76Q5vWp2lh1Kj1bgRDBFnZ32aDhR
         7switAS1G7qrXoa7IUVmUAgHI2Feo3lVkogX1Qw3yTj1ETN8pGpUoDuWh4GBAn+/5jhI
         yGHw==
X-Gm-Message-State: AOJu0YxkAvA3hTtgE2a+MBrdUoaEOIYJ+bgo5ByOGQYqw5EWwo4mYrd9
	zC4qq3is2fSjN932i/rCne5qsbVBfRg=
X-Google-Smtp-Source: AGHT+IGkJqTPjxCrrWnjEwUbe4lmC/X6ykOLRTrv5yzolm6JCwBcEWYWVYQI6N7/AQ/ohx6Hz0hmcg==
X-Received: by 2002:a17:903:25d4:b0:1bc:2c83:f770 with SMTP id jc20-20020a17090325d400b001bc2c83f770mr6068989plb.45.1692692486623;
        Tue, 22 Aug 2023 01:21:26 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902748300b001bbb8d5166bsm8358202pll.123.2023.08.22.01.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 01:21:26 -0700 (PDT)
Message-ID: <89c53213-cb9b-7a8c-bc9c-92cabfdbba4d@gmail.com>
Date: Tue, 22 Aug 2023 15:21:13 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Fwd: Qualcomm NFA725A on T14s AMD Gen3: Bluetooth: hci0: Failed
 to send headers (or body or access otp area)
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 =?UTF-8?Q?Fran=c3=a7ois_Armand?= <fanf42@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ath11k <ath11k@lists.infradead.org>,
 Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <a669d2d5-fee8-5841-eb5f-b7d047d3cdb2@gmail.com>
 <87il99j8dh.fsf@kernel.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87il99j8dh.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_012128_359092_D5EEBC9B 
X-CRM114-Status: GOOD (  13.56  )
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

T24gMjEvMDgvMjAyMyAxMjowMiwgS2FsbGUgVmFsbyB3cm90ZToKPiBCYWdhcyBTYW5qYXlhIDxi
YWdhc2RvdG1lQGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+PiBIaSwKPj4KPj4gSSBub3RpY2UgYSBi
dWcgcmVwb3J0IG9uIEJ1Z3ppbGxhIFsxXS4gUXVvdGluZyBmcm9tIGl0Ogo+Pgo+Pj4gSGVsbG8s
Cj4+Pgo+Pj4gKFNvcnJ5IGJ5IGFkdmFuY2UgaWYgaXQncyBub3QgdGhlIGNvcnJlY3QgcGxhY2Ug
dG8gZGlzY3VzcyB0aGF0LCBidXQKPj4+IEkgdHJpZWQgb3RoZXIgcGxhY2UgbGlrZSBteSBkaXN0
cm8ga2VybmVsIGZvcnVtCj4+PiAoaHR0cHM6Ly9iYnMuYXJjaGxpbnV4Lm9yZy92aWV3dG9waWMu
cGhwP2lkPTI4NjkyOSksIGludGVyYWN0aXZlCj4+PiBjaGF0LCBldGMgYW5kIG5vYm9keSB3YXMg
YWJsZSB0byBoZWxwKS4KPj4+Cj4+PiBbMV0gPT0gU2hvcnQgc3VtbWFyeSA9PQo+Pj4KPj4+IEkg
aGF2ZSBhIGxlbm92byBUMTRTIEFNRCBHZW4gMyB3aXRoIGEgKlF1YWxjb21tIE5GQTcyNUEqIFdp
LUZpIGNhcmQKPj4+ICh3aGljaCBpcyBhY3R1YWxseSByZXBvcnRlZCBieSBsc3BjaSBhcyBRQ05G
QTc2NSkgYW5kIGJsdWV0b290aAo+Pj4gbmV2ZXIgd29ya2VkIG9uIGl0LCBmYWlsaW5nIHRvIGxv
YWQgdGhlIHJhbXBhdGNoIHdpdGggImZhaWxlZCB0bwo+Pj4gc2VuZCBoZWFkZXIiIG9yICJmYWls
ZWQgdG8gc2VuZCBib2R5IiBvciAiRmFpbGVkIHRvIGFjY2VzcyBvdHAgYXJlYQo+Pj4gKC03MSki
Lgo+Pj4KPj4+IE90aGVyIHBlb3BsZSByZXBvcnRzIGJsdWV0b290aCBhcyB3b3JraW5nCj4+PiAo
aHR0cHM6Ly93aWtpLmFyY2hsaW51eC5vcmcvdGl0bGUvTGVub3ZvX1RoaW5rUGFkX1QxNHNfKEFN
RClfR2VuXzMpCj4+PiBhbmQgYSB3b3JrIGZyaWVuZCBoYXMgYSBUMTYgQU1EIGdlbjEgd2hpY2gg
c2VlbXMgdG8gaGF2ZSBleGFjdGx5IHRoZQo+Pj4gc2FtZSBjaGlwc2V0IGFuZCB3b3JrIGZsb3ds
ZXNzbHkuIFNvIHBlcmhhcHMgaXQncyBhbiBoYXJkd2FyZSBpc3N1ZSwKPj4+IGJ1dCBJIGRvbid0
IGtub3cgaG93IHRvIHF1YWxpZnkgaXQgaWYgc28uCj4+Pgo+Pj4gPT4gSG93IGNhbiB0aGlzIGJl
IGZ1cnRoZXIgcXVhbGlmaWVkL2RlYnVnZWQvd29ya2Fyb3VuZGVkPwo+Pj4KPj4+IEFueSBoZWxw
LCBldmVuIFJURk0gcG9pbnRpbmcgdG8gY29ycmVzcG9uZGluZyBtYW51YWxzIHdvdWxkIGJlIHZl
cnkKPj4+IG11Y2ggYXBwcmVjaWF0ZWQuCj4gCj4gVGhpcyBsb29rcyBsaWtlIGEgYmx1ZXRvb3Ro
IGJ1ZyBzbyBub3QgcmVsYXRlZCB0byBhdGgxMWsgKHdoaWNoIGlzIGEKPiBXaS1GaSBkcml2ZXIp
Lgo+IAoKT29wcywgSSByZWFsbHkgY2FuJ3QgZ3Vlc3Mgd2hpY2ggZHJpdmVyIGlzIHRoZSBjdWxw
cml0IGluIHRoaXMgY2FzZSB1bmxlc3MKdGhlIHJlcG9ydGVyIGFsc28gYXR0YWNoZXMgbHNtb2Qg
b3V0cHV0LiBUbyBGcmFuw6dvaXM6IENhbiB5b3Ugc2hvdwpsc21vZCBsaXN0IGFzIHJlcXVlc3Rl
ZD8KCkFsc28gQ2M6IGJsdWV0b290aCBwZW9wbGUuCgotLSAKQW4gb2xkIG1hbiBkb2xsLi4uIGp1
c3Qgd2hhdCBJIGFsd2F5cyB3YW50ZWQhIC0gQ2xhcmEKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
