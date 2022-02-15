Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A17FC433F5
	for <ath11k@archiver.kernel.org>; Tue, 15 Feb 2022 18:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhQqGN+rDFUO5ig/k/7O0Roy8RTMbwWG9EvrHmf07Fk=; b=nj9YDWSHAXQe3E
	kjoIAo2F25FShiF2jE58f0lp6XHgo2CLpg1k3T0CDT4eNvoIYKMWYkqFP7QC4vTDUmzJdXUYNfjlu
	8Kru/K2S97h8fcmr+ZKVwGiFBP2xpnD5VfE80WizIr1qT81fS/iKudLfbBi93Urb7bq36elcRFgkF
	iURq2w97wy3fpoFWYT84QKyziUKpWcchxxp0/GQTV4IM+3q1mIMS+N2O4n4k80f7Oo2MM5u5oLkh/
	8jMflBm4IRn0dOUg2+WZ67sYCb/QdpfUHfj4/d8AIuEG6F9p8ceMRdivQd7AQf9vx/OQJs3yKDzpC
	wV+XK5lugBoa8dxyHjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK2mm-0048Gn-9r; Tue, 15 Feb 2022 18:42:48 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK2mi-0048EG-Pc
 for ath11k@lists.infradead.org; Tue, 15 Feb 2022 18:42:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id b9so14486642lfv.7
 for <ath11k@lists.infradead.org>; Tue, 15 Feb 2022 10:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X4BJ6YnorDSpdEgA5/mr714jnWM+KIZeP6f6v43yCVA=;
 b=mfFvIU9bSHzIimIsErjasX0kHByACY7Re6jlgNxtCP5vNwOihj7KycqfUFoHiETqVB
 s9zf848U5vJmrNpRO6+10D1mObHJ7qv9YflgklBa4oYylamEIlO254pZ8sUfldYT+AEZ
 aVKmP3SZK097GCvdYqAqMn9jKHC8ZYkoIXwqob3sv+rb85v4UyIMF28IcteYm5nij3FA
 lHd1GKqc+CL/NoFnX7z4yG9BsJf9zolsAMfk7yGSbWSQj23d++pQ8t7wjvHZrRQvcoh0
 bpXIpGCWorJKdsGSGFhhLfYEHKkmi0J7Ma7MBPntJ9ksK1COf96ah5c8qwoW+cuzuil4
 l1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X4BJ6YnorDSpdEgA5/mr714jnWM+KIZeP6f6v43yCVA=;
 b=d0kOKES/5kHKEj30MY5oyB9ORZJGzRjdFqNAvom7FWaSnFBw5Iq0j81nrOTIeZG9xq
 O/vBp693ccjkPu3oeqzYk4ItNpGpALAMxXGSwXKSIDQt2n9YxKuTy0/4VldCq9zfg5H2
 cyZjNqji2rI9/VDZqKbVcIiFysF9JbAm7YC69JcwVDcZQh5c6kYs0O4GLsjk6AfeM4+J
 sn2s/MBL02wstlyFRE0u7ny2qF4WujADKpCvSVi68jOwsqN5TXo4NbS2gIEnBJZqfwTJ
 +x+n02S1mpBoTgZaJwcmVPmvaXtMkk28cqHqQICY6722LfPosnhAZ9YeRe5qLfAlH24o
 v6mw==
X-Gm-Message-State: AOAM532zR8kdRVIASGQFK1aeGysYKaz6JkNUdUQGkxZf6Nx9InyMtLkE
 Zm169NaurkzXefC0ByLq1WE=
X-Google-Smtp-Source: ABdhPJyTAYYwDicG8q8Xiw+G9Q4/DgD1ZLEepQ+c1B9kxbWjZdZiVDtzFlWd/pxzxp/Ow60nDAYa7w==
X-Received: by 2002:a05:6512:22d4:: with SMTP id
 g20mr338742lfu.116.1644950560968; 
 Tue, 15 Feb 2022 10:42:40 -0800 (PST)
Received: from ?IPV6:2a02:2168:88a0:5e00:a4c7:4ba3:4116:4?
 ([2a02:2168:88a0:5e00:a4c7:4ba3:4116:4])
 by smtp.gmail.com with ESMTPSA id g30sm1333078lja.39.2022.02.15.10.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 10:42:40 -0800 (PST)
Message-ID: <fc387c93-77a0-bc26-e87c-d6ab7ed42a18@gmail.com>
Date: Tue, 15 Feb 2022 21:42:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: Fwd: AX500 support quirks
Content-Language: en-US
To: Patricio Ferraggi Ares <pattferraggi@gmail.com>,
 Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
 <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
 <87ilu5jr98.fsf@kernel.org> <198d5223-0dcf-6006-407f-7f9eeeb90c92@gmail.com>
 <CAGYwnbkh=RebRnSxXy7jXyfgMUXd=VBBZPTCB2zWbAM5y40XzQ@mail.gmail.com>
 <a00b83f2-ceba-ec6c-dd41-edaa9f84a041@gmail.com>
 <CAGYwnbnJb_0B0rwbDkTseJVZvNxn_XN2dPF5rG_ni9Hoy8MXgw@mail.gmail.com>
 <87ee4ocgfq.fsf@tynnyri.adurom.net>
 <CAGYwnbk9mUim8GvzLYqqkHLNjtJdQUMqhP1+82s3tCnRHRam=w@mail.gmail.com>
 <87o8381e6x.fsf@kernel.org>
 <CAGYwnbkLheu-d-AnKy7aN_zACKnRw8AgiBg6iBCys2cYQqiV5w@mail.gmail.com>
From: Mark Herbert <mark.herbert42@gmail.com>
In-Reply-To: <CAGYwnbkLheu-d-AnKy7aN_zACKnRw8AgiBg6iBCys2cYQqiV5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_104244_868004_EE25A35C 
X-CRM114-Status: GOOD (  28.15  )
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

SGkgUGF0cmljaW8sCgpGb3IgYmx1ZXRvb3RoIHlvdSBkbyBub3QgbmVlZCBsYXRlc3QgYXRoMTFr
IHBhdGNoZXMuwqAgSXQgaXMgd29ya2luZyBmaW5lIApmb3IgYSBwcmV0dHkgbG9uZyB0aW1lIGFs
cmVhZHksIGFuZCBrZXJuZWwgNS4xNiBpcyBPSy4KCkJ1dCB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRo
IDUuMTctcmMga2VybmVsIHdoZXJlwqAgYmx1ZXRvb3RoIHNjYW5uaW5nIGlzIApicm9rZW4gZm9y
IGEgd2hpbGUsIGF0wqAgbGVhc3Qgb24gbXkgZ2VudG9vKzkzMTAKCiBGcm9tIHdoYXQgSSByZWFk
IGluIHlvdXIgbWFpbHMgbG9va3MgbGlrZSB0aGUgcXVlc3Rpb25zIGFyZSBtb3N0bHkgCmFyY2hs
aW51eCBzcGVjaWZpYyAtIHNvIGl0IGlzIGJldHRlciB0byBhc2sgYXJjaCBjb21tdW5pdHkuCgpo
dHRwczovL3dpa2kuYXJjaGxpbnV4Lm9yZy90aXRsZS9EZWxsX1hQU18xM18oOTMxMCnCoCAtIHdp
a2kgcGFnZS4gCkltcG9ydGFudCBwb2ludCBzZXQgZ3J1YiBwYXJhbWV0ZXIgbWVtbWFwPTEyTVxc
XCQyME0uwqDCoCBBcyBJIHNlZSB0aGUgCmF0aDExayBXaUZpL0J0IHN0YXR1cyBpbiB0aGUgd2lr
aSBpcyBzdGlsbCByZWQuCgpodHRwczovL3dpa2kuYXJjaGxpbnV4Lm9yZy90aXRsZS9UYWxrOkRl
bGxfWFBTXzEzXyg5MzEwKcKgIC0gb25lIG1vcmUgCnNvdXJjZSBvZiBleHBlcmllbmNlIHdpdGgg
YXJjaCBhbmQgRGVsbCA5MzEwLgoKCkFsc28gdHJ5IHRvIGFzayBhdCBiYnMuYXJjaGxpbnV4Lm9y
ZyAtIGtlcm5lbCBhbmQgaGFyZHdhcmUKCmh0dHBzOi8vYmJzLmFyY2hsaW51eC5vcmcvdmlld2Zv
cnVtLnBocD9pZD0yMgoKCkkgYW0gd3JpdGluZyBpdCBvbiBteSBYcHMgOTMxMCB3aXRoIGF0aDEx
ayB1c2luZyBibHVldG9vdGggbW91c2UgYW5kIApsaXN0ZW5pbmcgbXVzaWMgaW4gQlQgaGVhZHBo
b25lcyBjb25uZWN0ZWQgdG8gaXQgLSBzbyBmb3Igc3VyZSBpIGtub3cgaXQgCmNhbiB3b3JrLsKg
IEJ1dCBJIGRvIG5vdCB1c2UgYXJjaCAtIHNvIGRvIG5vdCBrbm93IGhvdyB0byBtYWtlIGFyY2gg
d29yay4gCkJ1dCBJIHVzZWQgYSBsb3Qgb2YgaW5mbyBmcm9tIGFyY2ggV2lraSBhbmQgYXJjaCBm
b3J1bXMgdG8gbWFrZSBteSAKZ2VudG9vIHdvcmsuCgoKT24gMi8xNS8yMiAxNjowMywgUGF0cmlj
aW8gRmVycmFnZ2kgQXJlcyB3cm90ZToKPiBIaSBLYWxsZSwKPgo+IFdlbGwgYnV0IEkgZG9uJ3Qg
cmVhbGx5IG5lZWQgaW5mbyBvbiBob3cgdG8gYnVpbGQgdGhlIGtlcm5lbCwgSSBjYW4KPiBnZXQg
dGhhdCBmcm9tIHRoZSBhcmNoIGRvY3MgYXMgeW91IHBvaW50ZWQgb3V0Lgo+IFdoYXQgSSBkbyBu
ZWVkIGlzIGluZm9ybWF0aW9uIG9uIGhvdyBzaG91bGQgSSBpbmNsdWRlIHlvdXIgbGF0ZXN0Cj4g
Y2hhbmdlcyBvbiB0aGUgYXRoMTFrIGFuZCBmcm9tIE1hcmsgd2hpY2ggbW9kdWxlcyBoZSBpbmNs
dWRlZCB3aGlsZQo+IGJ1aWxkaW5nIGhpcyBrZXJuZWwgdG8gZ2V0IEJsdWV0b290aC4KPgo+IEJh
c2ljYWxseSBhbnl0aGluZyB0aGF0IGlzIHNwZWNpZmljIHRvIHRoZSBkZWxsIHhwcyA5MzEwCj4K
PiBCdWlsZGluZyB0aGUga2VybmVsIHdpdGggdGhlIGRlZmF1bHQgYXJjaCBjb25maWd1cmF0aW9u
IHdvdWxkIG1ha2Ugbm8KPiBkaWZmZXJlbmNlIGluIHRlcm1zIG9mIGhhcmR3YXJlIHN1cHBvcnQu
Cj4KPiBFbCBtYXIsIDE1IGZlYiAyMDIyIGEgbGEocykgMTM6NTYsIEthbGxlIFZhbG8gKGt2YWxv
QGtlcm5lbC5vcmcpIGVzY3JpYmnDszoKPj4gUGF0cmljaW8gRmVycmFnZ2kgQXJlcyA8cGF0dGZl
cnJhZ2dpQGdtYWlsLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gSGV5IGZvbGtzLAo+Pj4KPj4+IFNvLiBJ
IGFtIHN0aWxsIHVzaW5nIGFyY2ggbGludXgsIGJ1dCBub3QgZXZlcnl0aGluZyBpcyB3b3JraW5n
Lgo+Pj4gSSBoYXZlIGRlY2lkZWQgdG8gZ2l2ZSBpdCBhIHRyeSBhbmQgZGl2ZSBkZWVwZXIgYnkg
dHJ5aW5nIHRvIGNvbXBpbGUKPj4+IG15IG93biBrZXJuZWwgd2l0aCB0aGUgbmVjZXNzYXJ5IG1v
ZHVsZXMgYW5kIGZpcm13YXJlIGZvciBXaWZpIGFuZAo+Pj4gQmx1ZXRvb3RoLgo+Pj4KPj4+IENv
dWxkIHlvdSBndXlzIHNoYXJlIHdpdGggbWUgd2hpY2ggcmVwb3MgKGFwYXJ0IGZyb20gdGhlIGtl
cm5lbAo+Pj4gc291cmNlKSBJIHNob3VsZCB1c2UgaW4gb3JkZXIgdG8gYnVpbGQgc29tZXRoaW5n
IGJhc2VkIG9uIHRoZSBsYXRlc3QKPj4+IGxpbnV4LW1haW5saW5lIGtlcm5lbD8KPj4+IEkgYW0g
dW5hd2FyZSBvZiBob3cgc2hvdWxkIEkgaW5jbHVkZSB0aGUgbGF0ZXN0IGF0aDExayBkcml2ZXJz
IGZyb20KPj4+IEthbGxlIGFuZCB3aGljaCBtb2R1bGVzIEkgbmVlZCBpbiBvcmRlciB0byBtYWtl
IEJUIHdvcmsuCj4+PiBJIHdvdWxkIHJlYWxseSBhcHByZWNpYXRlIGl0IGlmIHlvdSBjb3VsZCBn
aXZlIG1lIHNvbWUgbGlua3MgdG8gdGhlCj4+PiByZXBvcywgc29tZSBpbmZvLCBhbmQgbWF5YmUg
YSBiYXNpYyBzdHJhdGVneSBvbiBob3cgdG8gYXBwcm9hY2ggdGhpcy4KPj4+IEkgd2lsbCBzZWFy
Y2ggYW5kIGxlYXJuIGZyb20gdGhhdCBzdGFydGluZyBwb2ludC4KPj4gQXJjaCB3aWtpIGlzIGEg
Z3JlYXQgc291cmNlIGZvciBpbmZvcm1hdGlvbjoKPj4KPj4gaHR0cHM6Ly93aWtpLmFyY2hsaW51
eC5vcmcvdGl0bGUva2VybmVsCj4+Cj4+IEFyY2ggc2VlbXMgdG8gaGF2ZSBhIGxpbnV4LW1haW5s
aW5lIHBhY2thZ2U6Cj4+Cj4+IGh0dHBzOi8vYXVyLmFyY2hsaW51eC5vcmcvcGFja2FnZXMvbGlu
dXgtbWFpbmxpbmUKPj4KPj4gQnV0IHF1ZXN0aW9ucyBhYm91dCBjb21waWxpbmcgdGhlIGtlcm5l
bCBzaG91bGQgYmUgc2VudCB0byBkaXN0cm8KPj4gc3VwcG9ydCBjaGFubmVscyBhcyB0aGV5IGtu
b3cgYmVzdCBob3cgdGhlaXIgZGlzdHJvIHdvcmtzLCBub3QgdG8gYXRoMTFrCj4+IGxpc3QuCj4+
Cj4+IC0tCj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJl
bGVzcy9saXN0Lwo+Pgo+PiBodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZl
bG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGlu
ZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
