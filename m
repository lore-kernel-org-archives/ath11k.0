Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1954C61DB3
	for <ath11k@archiver.kernel.org>; Mon,  9 Jan 2023 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJ7umOSPkRD9iHv4UDyem73qG2IQ3wgKiC2lh45inVE=; b=l5zLVrW9aVMfYO
	8+8GfldJGvheWCL46G0pbp3UU7ZoOzpf1slf/nmOMiWRatxv8XotMRd/xGKgcQcey0QTxJKg+lkwZ
	cKVGaqKO94U4BT7jNGbH2672vo5Yx0ulAWoJRDP4lyO2O/cZ3SsgJm71waIVWQXudam8FcoIuwa4P
	hX+e7Lm7E0Uvaaijscd0HU5G3Zf5oHfaZXMcy4evHwYhUDV4FYXAh2Dx6Ow8uGr1vOHMYrTVu0qKY
	MWxAcq8Hd6GDZHUJ2fWNZAwmD1puGxg25KQPO2mfP8r9mIW+PFG6sa0m4HTinBWbltpNTkMM3CisV
	llytvC7A9rvPGiE65q6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuGu-002LXX-FO; Mon, 09 Jan 2023 15:41:12 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuFQ-002Kln-7D
	for ath11k@lists.infradead.org; Mon, 09 Jan 2023 15:39:42 +0000
Received: by mail-oi1-x231.google.com with SMTP id j130so7430722oif.4
        for <ath11k@lists.infradead.org>; Mon, 09 Jan 2023 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4A3Ftur2eKpa5av6Mw9JhBpO5ttJgQ/Gh6WYfLvuDMA=;
        b=jpE3nTlhZerX5p05h7yUGA9S9KIoHunY8JIQF4GGh/sXv8JVhrD/18tsYILYoX4Mzc
         9KOofcxbZJF1DOAWmKef6TAsI33PHCrEB7MavqA7cGh62lPdb+jY5C1povDUe+SJDX++
         5xWUWKCS/lnZR48jjSt90MT54dAf6UbRnU0J318VXWHc6FPApr7V966YzNM7mmcS3xx+
         u0lpHQGiwTMHbKIdZsq0y5m+pRYDSdgGWmC15qN/3kyVs5Z9mIiyDwpFBAjATfItdLFq
         Mt5z2oqiEo41ApcZeGbfe5m+jEPI4gJkgN/YX54oGAt/FynmmiHIrqCLhDPqdqVIQRdg
         xeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4A3Ftur2eKpa5av6Mw9JhBpO5ttJgQ/Gh6WYfLvuDMA=;
        b=uNGQkR3cOtEKGzNx2XBSkc0BKZsZmTx+OgT4om7WeY9gtXNd/EKpl9wFMM1YxMSU07
         Z7zKq9IMf+2iRzqyeGzqbd5Hk/49Qi4sySJwSuMAOj+to79tL0zHXHs8NFdMxWk3SfiT
         z7x6JoRqArF3TVSJ6+kdFGFN3RDfINqLPgBu+6zADvVsbIKZrT/p0ImxGTDrClxeoNH5
         OkOAzQUgWf4fc5zjuuRyjXytoL6d9vosdMcWSH6jrdoYSogJ+O/opb6oOlSXWIJMYQnp
         Ip4DI8MBYzX/oPgVesFBg4rOes7155qtUc3I9Olb2XhIf7L8xoR85cj67V9qXonSIH9I
         9eBA==
X-Gm-Message-State: AFqh2kpSuQjKlRry+HNj8WQOb5XS6Nossw+Ap/BYPNSXAkGMLdatin0t
	d+rZ5VWqebI2uIq/qvhqcao=
X-Google-Smtp-Source: AMrXdXvUSMPWGI5OIFgCIPPRoBkTq1gbUyEqJOO9eA+A8wvurEjZAv1njxMKsdrggpkpNvVDPV/q6w==
X-Received: by 2002:a05:6808:210d:b0:360:e954:9dda with SMTP id r13-20020a056808210d00b00360e9549ddamr39122810oiw.12.1673278777030;
        Mon, 09 Jan 2023 07:39:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y28-20020a544d9c000000b0035474ff66b3sm3988236oix.35.2023.01.09.07.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 07:39:36 -0800 (PST)
Message-ID: <6b39574f-e067-395f-f579-b0b805983996@roeck-us.net>
Date: Mon, 9 Jan 2023 07:39:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Alexander Wetzel <alexander@wetzel-home.de>,
 Wen Gong <quic_wgong@quicinc.com>
Cc: johannes@sipsolutions.net, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20221212083607.21536-1-quic_wgong@quicinc.com>
 <20230105052647.GA2477583@roeck-us.net>
 <d28c6340-7ad2-d7f6-939d-3a1a057cb7da@wetzel-home.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] wifi: mac80211: change initialize for sk_buff in
 ieee80211_tx_dequeue()
In-Reply-To: <d28c6340-7ad2-d7f6-939d-3a1a057cb7da@wetzel-home.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_073940_336891_7917B1CD 
X-CRM114-Status: GOOD (  20.89  )
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

T24gMS85LzIzIDA2OjA1LCBBbGV4YW5kZXIgV2V0emVsIHdyb3RlOgo+IE9uIDA1LjAxLjIzIDA2
OjI2LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+PiBPbiBNb24sIERlYyAxMiwgMjAyMiBhdCAwMzoz
NjowN0FNIC0wNTAwLCBXZW4gR29uZyB3cm90ZToKPj4+IFRoZSBza19idWZmIGlzIG9ubHkgc2V0
IHRvIE5VTEwgd2hlbiBpbml0aWFsaXplLCBzb21ldGltZXMgaXQgd2lsbCBnb3RvCj4+PiBsYWJl
bCAiYmVnaW4iIGFmdGVyIGllZWU4MDIxMV9mcmVlX3R4c2tiKCksIHRoZW4gaXQgcG9pbnRzIHRv
IGEgc2tfYnVmZgo+Pj4gd2hpY2ggaXMgYWxyZWFkeSBmcmVlZC4gSWYgaXQgcnVuIGludG8gdGhl
ICJnb3RvIG91dCIgYWZ0ZXIgYXJyaXZlZCB0bwo+Pj4gbGFiZWwgImJlZ2luIiwgdGhlbiBpdCB3
aWxsIHJldHVybiBhIHNrX2J1ZmYgd2hpY2ggaXMgZnJlZWQsIGl0IGlzIGEKPj4+IHJpc2sgZm9y
IHVzZS1hZnRlci1mcmVlLgo+Pj4KPj4+IEZpeGVzOiBkZWQ0Njk4YjU4Y2IgKCJtYWM4MDIxMTog
cnVuIGxhdGUgZGVxdWV1ZSBsYXRlIHR4IGhhbmRsZXJzIHdpdGhvdXQgaG9sZGluZyBmcS0+bG9j
ayIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8cXVpY193Z29uZ0BxdWljaW5jLmNvbT4K
Pj4KPj4gSSBkb24ndCBzZWUgYW55IHByb2dyZXNzIG9uIHRoaXMgcGF0Y2guIElzIHRoZXJlIGEg
cHJvYmxlbSB3aXRoIGl0ID8KPj4gRGlkIGl0IGdldCBsb3N0ID8KPj4KPiAKPiBMb29rcyBvayBm
b3IgbWUuIEJ1dCBJIGp1c3Qgbm90aWNlZCB0aGF0IG15IHBhdGNoCj4gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjIxMjMwMTIxODUw
LjIxODgxMC0xLWFsZXhhbmRlckB3ZXR6ZWwtaG9tZS5kZS8KPiAKPiBzaG91bGQgYWxzbyBmaXgg
dGhlIGlzc3VlIGFzIGFuIHVuaW50ZW5kZWQgc2lkZSBlZmZlY3QuCj4gCgpVbmxlc3MgSSBhbSBt
aXNzaW5nIHNvbWV0aGluZywgdGhlcmUgaXMgc3RpbGwgYSBwYXRoCgpiZWdpbjoKCS4uLgoJCglp
ZiAodW5saWtlbHkodGVzdF9iaXQoSUVFRTgwMjExX1RYUV9TVE9QLCAmdHhxaS0+ZmxhZ3MpKSkK
ICAJCWdvdG8gb3V0OwoJLi4uCglza2IgPSAuLi4KCS4uLgogICAgICAgICAgICAgICAgICAgICAg
ICAgaWVlZTgwMjExX2ZyZWVfdHhza2IoJmxvY2FsLT5odywgc2tiKTsKICAgICAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gYmVnaW47CgphZnRlciB5b3VyIHBhdGNoIGlzIGFwcGxpZWQuIFVubGVz
cyB0aGUgSUVFRTgwMjExX1RYUV9TVE9QIGNhbiBuZXZlciBiZSB0cnVlCmFmdGVyIHRoZSBmaXJz
dCBpdGVyYXRpb24gSSBkb24ndCBzZWUgaG93IHlvdXIgcGF0Y2ggd291bGQgZml4IHRoZSBwcm9i
bGVtLgoKR3VlbnRlcgoKPiBBbGV4YW5kZXIKPiAKPj4gVGhhbmtzLAo+PiBHdWVudGVyCj4+Cj4+
PiAtLS0KPj4+IMKgIG5ldC9tYWM4MDIxMS90eC5jIHwgNCArKystCj4+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4KPj4+IGJhc2UtY29t
bWl0OiA5MjI5MzJjYTAyMTkxYTM5MGY3ZjUyZmI2ZTIxYzQ0YjUwZTE0MDI1Cj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL25ldC9tYWM4MDIxMS90eC5jIGIvbmV0L21hYzgwMjExL3R4LmMKPj4+IGluZGV4
IDIxNzFjZDFjYTgwNy4uMGIyM2NjOWFiOWM3IDEwMDY0NAo+Pj4gLS0tIGEvbmV0L21hYzgwMjEx
L3R4LmMKPj4+ICsrKyBiL25ldC9tYWM4MDIxMS90eC5jCj4+PiBAQCAtMzc3Niw3ICszNzc2LDcg
QEAgc3RydWN0IHNrX2J1ZmYgKmllZWU4MDIxMV90eF9kZXF1ZXVlKHN0cnVjdCBpZWVlODAyMTFf
aHcgKmh3LAo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX2xvY2FsICpsb2NhbCA9IGh3
X3RvX2xvY2FsKGh3KTsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IHR4cV9pbmZvICp0eHFpID0gY29u
dGFpbmVyX29mKHR4cSwgc3RydWN0IHR4cV9pbmZvLCB0eHEpOwo+Pj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgaWVlZTgwMjExX2hkciAqaGRyOwo+Pj4gLcKgwqDCoCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiID0g
TlVMTDsKPj4+ICvCoMKgwqAgc3RydWN0IHNrX2J1ZmYgKnNrYjsKPj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IGZxICpmcSA9ICZsb2NhbC0+ZnE7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBmcV90aW4gKnRp
biA9ICZ0eHFpLT50aW47Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBpZWVlODAyMTFfdHhfaW5mbyAq
aW5mbzsKPj4+IEBAIC0zNzkwLDYgKzM3OTAsOCBAQCBzdHJ1Y3Qgc2tfYnVmZiAqaWVlZTgwMjEx
X3R4X2RlcXVldWUoc3RydWN0IGllZWU4MDIxMV9odyAqaHcsCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIE5VTEw7Cj4+PiDCoCBiZWdpbjoKPj4+ICvCoMKgwqAgc2tiID0gTlVMTDsKPj4+
ICsKPj4+IMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2JoKCZmcS0+bG9jayk7Cj4+PiDCoMKgwqDCoMKg
IGlmICh0ZXN0X2JpdChJRUVFODAyMTFfVFhRX1NUT1AsICZ0eHFpLT5mbGFncykgfHwKPiAKCgot
LSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
