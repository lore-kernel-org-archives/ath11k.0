Return-Path: <SRS0=JYJ7=PM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C36C433EF
	for <ath11k@archiver.kernel.org>; Sun, 24 Oct 2021 05:22:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83ACF60C40
	for <ath11k@archiver.kernel.org>; Sun, 24 Oct 2021 05:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83ACF60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juEqwOF3D61KhK0M/wkvLUIOHFza9ZJJbXufrfdtpiU=; b=ktF74ouUCD3G+Zk5hoyh/YJz+D
	lQYdzmnFINURIlkWNBZkjUkFWbqvCaZxM9Wn4wq0gsb02J9IVbXf+Suh6u73UxWA2j5DKREgjqlAe
	HY4P0sj3TbYfy8nmVKZt/ExhUVH00WF6SUVlakI2gCTRMaiJcGpy7xeAH1474rpoa5HGUCL3lc2g0
	rgbGYHOs24nX+RfLwet7DPWKk6cd4Aae+8pvxf2Ur8fuMd1A4J5r/FAQicjTqjp/V4Xe+RAE5VMBL
	cO7q/0cvXObhOo26fWzQWD++kgQtOmpSq5d2LAvGmjYAMEC9kEJPYpgOD5bYcvjfq4hAOs3u4qH42
	3whgihJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meVxW-00DhmJ-1Y; Sun, 24 Oct 2021 05:22:14 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meVxT-00Dhlz-0W
 for ath11k@lists.infradead.org; Sun, 24 Oct 2021 05:22:12 +0000
Received: by mail-lj1-x22c.google.com with SMTP id u5so5566954ljo.8
 for <ath11k@lists.infradead.org>; Sat, 23 Oct 2021 22:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zvbSw0Fzkc4vs/mCxvP08xvphC+SUe3Sqtw2KBPI8xA=;
 b=oYn8Uld2Pwgqw9kuS/5LgQ/WQD/GgKbUz57WpOYlkL1466ySZC6Kk65Ee8HkC5pIY+
 zqNjX1r+Oijppl5AsxeAzfuBAh6i+NP8xscS+rzs9SSYFdiz0QfMBItSA9AU+f5AAQRh
 IGoN7p0xyJesDyvq0dewnNoMJj607+F88hzHijKbYXY+CvD7dI7k7MPoxQ6rvP+qL9gJ
 33tAJBdoxcFCqIHVltCEZ8+xy4EChvhMPkoH9VOH1MxjozxEv7+/DaB0fHxYUqlQXkNW
 NIWfffDWo612sPpS0vN5m0ciXp2q0AXsBJ89Ex4qa2Sd8nYyTdXME/XRlTdXm2vS7CnS
 8Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zvbSw0Fzkc4vs/mCxvP08xvphC+SUe3Sqtw2KBPI8xA=;
 b=xg4b1yusZV/Bfr/e5RfcAKxqw/oyW5T0vVb0OQ0k80jxH7owyTs8tDoN1yY8xSvKCl
 j0I/lsWt3SNclwG/A/sb0dv5d+NQQnn4j2BHJLaU5bOkbRnrmF9yCMr/AzAXbBwzck1B
 zdzs74emIJV5muI2AIh2jGonFfsd0S+f/GZbQafw5UGrCSUuu3muC2MKWmc6gYiHBF1+
 EsGXmV8aFv6gs7yfxi6oyLNwejrXxUtpXIPKrFedtJqwVMaBY338cDPSJhumjyy7h043
 01JQziUUpntGWdMXvBQwSIU0uFVh3sQUAPeFrnDnHZmYazjZeAiGxj+KLXZaeWWLAdMa
 2Now==
X-Gm-Message-State: AOAM530KSksk7uUiINTSEJ5KWbJmj4ydCkmCNeiqN/sRlFrceLBCE7W6
 quB8BYX0IFhQofzl6iGp3n8cRCkcYolkWYBW
X-Google-Smtp-Source: ABdhPJxzxSJy1p8pDt9rh+99xUDjcTPb4wbw2JLuo8B6cbLD9WKjXlYvx70Oqq26K+13XbjMm+sE7g==
X-Received: by 2002:a2e:a5c4:: with SMTP id n4mr7859644ljp.72.1635052928503;
 Sat, 23 Oct 2021 22:22:08 -0700 (PDT)
Received: from [192.168.2.114] ([109.106.143.2])
 by smtp.gmail.com with ESMTPSA id a16sm1313812ljk.100.2021.10.23.22.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 22:22:07 -0700 (PDT)
From: Mark Herbert <mark.herbert42@gmail.com>
Subject: Re: Can not unload ath11k_pci and load it back
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
 <875yu9e4li.fsf@codeaurora.org>
 <8324ec52-303d-ea04-b635-a550e83ad47c@gmail.com>
 <87y275cm2x.fsf@codeaurora.org>
Message-ID: <1dc6dc61-78a8-9693-b334-97b43f35cf9d@gmail.com>
Date: Sun, 24 Oct 2021 08:22:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87y275cm2x.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_222211_104283_5084D0EC 
X-CRM114-Status: GOOD (  24.36  )
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

QXBwbGllZCBzZXZlcmFsIHBhdGNoZXMgc2VyaWVzIGZyb20gbGF0ZXN0IG1haWxpbmcgbGlzdAoK
YXRoMTFrOiBhZGQgZmVhdHVyZSBmb3IgZGV2aWNlIHJlY292ZXJ5ICgzIHBhdGhlcykKCmF0aDEx
azogc3VwcG9ydCBmb3IgV29XIGZ1bmN0aW9uYWxpdGllcyAoNiBwYXRjaGVzKQoKYXRoMTFrOiBB
ZHZlcnRpc2UgUExBVEZPUk0gQ0FQIFBDSUUgR0xPQkFMIFJFU0VULgoKCkJlZm9yZSB0aG9zZSB0
aGUgc3lzdGVtIHdhcyBkZWFkbHkgc3R1Y2sgb24gcmVzdW1lIGZyb20gaGliZXJuYXRpb24gLSAK
YnV0IG5vdyBpdCBnaXZlcyBjb250cm9sIGJhY2ssIHNvIEkgY2FuIHNlZSB0aGUgZXJyb3IgbG9n
IGluIERNRVNHLsKgIFRoZSAKY2FyZCBpcyBub3Qgd2Fpa2luZyB1cCAsIGFuZCBJIHN0aWxsIGNh
biBub3QgdW5sb2FkL3JlbG9hZCB0aGUgCmF0aDExa19wY2kgbW9kdWxlIHRvIGdldCBkZXZpY2Ug
YmFjay4gQnV0IGhlcmUgaXMgdGhlIGxvZ8KgIC0gbWF5YmUgaXQgCndpbGwgZ2l2ZSBzb21lIGlk
ZWFzLgoKClsxMzc2OTguMzAxOTc0XSBBQ1BJOiBFQzogaW50ZXJydXB0IHVuYmxvY2tlZApbMTM3
Njk4LjQ5ODExOV0gdXNiIHVzYjE6IHJvb3QgaHViIGxvc3QgcG93ZXIgb3Igd2FzIHJlc2V0Clsx
Mzc2OTguNDk4MTIyXSB1c2IgdXNiMjogcm9vdCBodWIgbG9zdCBwb3dlciBvciB3YXMgcmVzZXQK
WzEzNzY5OC40OTgxODZdIHVzYiB1c2IzOiByb290IGh1YiBsb3N0IHBvd2VyIG9yIHdhcyByZXNl
dApbMTM3Njk4LjQ5ODE5NV0gdXNiIHVzYjQ6IHJvb3QgaHViIGxvc3QgcG93ZXIgb3Igd2FzIHJl
c2V0ClsxMzc2OTguNDk4MjMxXSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZmFpbGVkIHRvIHNl
dCBtaGkgc3RhdGU6IFJFU1VNRSg2KQpbMTM3Njk4LjUyMjg3MV0gbnZtZSBudm1lMDogNy8wLzAg
ZGVmYXVsdC9yZWFkL3BvbGwgcXVldWVzClsxMzc2OTguNjU2ODQzXSBpOTE1IDAwMDA6MDA6MDIu
MDogW2RybV0gR3VDIGZpcm13YXJlIAppOTE1L3RnbF9ndWNfNjIuMC4wLmJpbiB2ZXJzaW9uIDYy
LjAgc3VibWlzc2lvbjpkaXNhYmxlZApbMTM3Njk4LjY1Njg0OV0gaTkxNSAwMDAwOjAwOjAyLjA6
IFtkcm1dIEd1QyBTTFBDOiBkaXNhYmxlZApbMTM3Njk4LjY1Njg1MF0gaTkxNSAwMDAwOjAwOjAy
LjA6IFtkcm1dIEh1QyBmaXJtd2FyZSAKaTkxNS90Z2xfaHVjXzcuOS4zLmJpbiB2ZXJzaW9uIDcu
OSBhdXRoZW50aWNhdGVkOnllcwpbMTM3Njk4Ljg0ODcyNV0gdXNiIDMtNjogcmVzZXQgaGlnaC1z
cGVlZCBVU0IgZGV2aWNlIG51bWJlciAzIHVzaW5nIHhoY2lfaGNkClsxMzc2OTkuMDQyMzQ3XSB1
c2IgMy02OiByZXN0b3JpbmcgY29udHJvbCAKMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAw
MDAwMTAxLzEwLzUKWzEzNzY5OS4wNDIzNTZdIHVzYiAzLTY6IHJlc3RvcmluZyBjb250cm9sIAow
MDAwMDAwMC0wMDAwLTAwMDAtMDAwMC0wMDAwMDAwMDAxMDEvMTIvMTEKWzEzNzY5OS4xNzg5MzRd
IHVzYiAzLTM6IHJlc2V0IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4aGNp
X2hjZApbMTM3NzAxLjU0ODU4OV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IHRpbWVkIG91dCB3
aGlsZSB3YWl0aW5nIGZvciB3b3cgCndha2V1cCBjb21wbGV0aW9uClsxMzc3MDEuNTQ4NTk2XSBh
dGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZmFpbGVkIHRvIHdha2V1cCB3b3cgZHVyaW5nIApyZXN1
bWU6IC0xMTAKWzEzNzcwMS41NDg1OTldIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWlsZWQg
dG8gcmVzdW1lIGNvcmU6IC0xMTAKWzEzNzcwMS41NDg2MDFdIFBNOiBkcG1fcnVuX2NhbGxiYWNr
KCk6IHBjaV9wbV9yZXN0b3JlKzB4MC8weGQwIHJldHVybnMgLTExMApbMTM3NzAxLjU0ODYyMV0g
YXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IFBNOiBmYWlsZWQgdG8gcmVzdG9yZSBhc3luYzogCmVy
cm9yIC0xMTAKWzEzNzcwMS41NTcxMTBdIFBNOiBoaWJlcm5hdGlvbjogQmFzaWMgbWVtb3J5IGJp
dG1hcHMgZnJlZWQKWzEzNzcwMS41NTcxMTNdIE9PTSBraWxsZXIgZW5hYmxlZC4KWzEzNzcwMS41
NTcxMTVdIFJlc3RhcnRpbmcgdGFza3MgLi4uIGRvbmUuClsxMzc3MDEuNjE5OTQ4XSBQTTogaGli
ZXJuYXRpb246IGhpYmVybmF0aW9uIGV4aXQKWzEzNzcwMS42MjQ0MDldIHVzYmNvcmU6IHJlZ2lz
dGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgYnR1c2IKWzEzNzcwNC42Njg3MzldIGF0aDExa19w
Y2kgMDAwMDo3MjowMC4wOiB3bWkgY29tbWFuZCAxNjM4NyB0aW1lb3V0ClsxMzc3MDQuNjY4Nzgx
XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZmFpbGVkIHRvIHNlbmQgCldNSV9QREVWX1NFVF9Q
QVJBTSBjbWQKWzEzNzcwNC42Njg3OTVdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWlsZWQg
dG8gZW5hYmxlIFBNRiBRT1M6ICgtMTEKCgpPbiAwNy4xMC4yMDIxIDEwOjQ4LCBLYWxsZSBWYWxv
IHdyb3RlOgo+IE1hcmsgSGVyYmVydCA8bWFyay5oZXJiZXJ0NDJAZ21haWwuY29tPiB3cml0ZXM6
Cj4KPj4gSSd2ZSBmb3VuZCBzaW1pbGFyIGJ1ZyBmaWxlcyBhbHJlYWR5IC0gc28gbm90IHRvIGNy
ZWF0ZSBkdXBsaWNhdGVzCj4+IHNpbXBseSBjb21tZW50ZWQgdGhlcmUKPj4KPj4gaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTQ1NDEKPj4KPj4gRXhhY3RseSAt
IGhpYmVybmF0aW9uIG1lYW5zIHNhdmluZyBzdGF0ZSBvbiBkaXNrIGFuZCByZXN1bWluZyBsYXRl
ciwKPj4gaXQgaXMgYSB2ZXJ5IHVzZWZ1bGwgZmVhdHVyZSB3aGVuIHlvdSBhcmUgcnVubmluZyBv
dXQgb2YgYmF0dGVyeSBhbmQKPj4gd2FudCB0byBzYXZlIHlvdXIgd29yay4KPiBHb3QgaXQsIHRo
YW5rcy4gU28gaXQgc2VlbXMgd2UgaGF2ZSB0d28gaXNzdWVzIGhlcmU6IGF0aDExayBkb2VzIG5v
dAo+IHN1cHBvcnQgaGliZXJuYXRpb24gYW5kIGF0aDExayBtb2R1bGUgcmVsb2FkIGZhaWxpbmcu
IExldCdzIGhhbmRsZSB0aGUKPiBtb2R1bGUgcmVsb2FkIGZhaWxpbmcgaW4gYnVnICMyMTQ1NDEs
IGJ1dCBjYW4geW91IGZpbGUgYW5vdGhlciBidWcgYWJvdXQKPiB0aGUgbWlzc2luZyBzdXBwb3J0
IGZvciBoaWJlcm5hdGlvbj8gTGV0J3MgaGF2ZSBvbmUgaXNzdWUgcGVyIGJ1Zwo+IHJlcG9ydCwg
aXQncyBlYXNpZXIgdG8gbWFuYWdlIGJ1Z3ppbGxhIHRoYXQgd2F5Lgo+Cj4+IEFsc28gb25lIG1v
cmUgcG9pbnQgSSd2ZSBmb3VuZCAtIGlmIE1ISSBpcyBjb25maWd1cmVkIGluIHRoZSBrZXJuZWwg
LQo+PiB0aGUgY2FyZCBpcyBzdGFydGluZyB1cCBvbiB0aHIgZmlyc3QgYm9vdCBhbmQgd29ya3Mu
IEJ1dCBpZiBpCj4+IGNvbmZpZ3VyZSBNSEkgYXMgYSBtb2R1bGUgLSBpdCBkb2VzIG5vdC4gTUhJ
IG1vZHVsZSBkbyBsb2FkLiBTbyBkbwo+PiBhdGgxMWsgYW5kIGF0aDExa19wY2kuwqAgQnV0IHRo
ZSBsYXN0IGF0aDExayBkbWVzZyBzYXlzIDoKPj4KPj4gbWhpIG1oaTA6IFdhaXQgZm9yIGRldmlj
ZSB0byBlbnRlciBTQkwgb3IgTWlzc2lvbiBtb2RlCj4+Cj4+IEV4YWN0bHkgYXMgaWYgScKgIGRv
IHJtbW9kL21vZHByb2JlIHNlcXVlbmNlLgo+Pgo+PiBJIHVzZSBsYXRlc3QgQklPUyBmcm9tIERl
bGwgKGluIGZhY3QgdXBncmFkaW5nIDMuMC40IHRvIDMuMS4wIGRpZCBub3QKPj4gY2FuZ2UgYW55
dGhuZykgLMKgIGFuZCBoYXZlIHRyaWVkIG11bHRpcGxlIGtlcm5lbHMuIFN0YWJsZSA1LjE0IHNl
cmllcwo+PiBhbmQgYXRoMTFrIGdpdCB0cmVlIChuZXh0IGFuZCBtYXN0ZXItcGVuZGluZykuIE5v
dGhpbmcgaGVscHMuCj4+IFNvbWV0aW1lcyBpdCB3b2tzIG91dCAtIEkgaGFkIGNvdXBsZSBvZiB0
aW1lcyBzdWNjZXNzZnVsbHkKPj4gcm1tb2QvbW9kcHJvYmUgYXRoMTFrX3BjaSBidXQgaXQgcyBh
IGtpbmQgb2YgcmFuZG9tIGFuZCB2ZXJ5IHJhcmUKPj4gZXZlbnQgKCBJIGhhZCBpdCAyIHRpbWVz
IG9ubHkpLgo+Pgo+PiBTbyBmb3IgbWUgaXQgbG9va3MgbGlrZSBhbiBpc3N1ZSBiZXR3ZWVuIE1I
SSBhbmQgYXRoMTFrICwgYnV0Cj4+IHViZm9ydHVuYXRlbHkgbXkga25vd2xlZGdlIGlzIG5vdCBl
bm91Z2ggdG8gcHJvcG9zZSBhbnkgc29sdXRpb24gaGVyZS4KPiBPbiBteSBOVUMgeDg2IHRlc3Qg
Ym94IEkgcmVsb2FkIGF0aDExayBtb2R1bGVzIHNldmVyYWwgdGltZXMgYSBkYXkgd2hpbGUKPiBJ
IHRlc3QgYXRoMTFrIGJ1dCBJIGFsd2F5cyByZWxvYWQgdGhlIG1oaSBtb2R1bGVzIGF0IHRoZSBz
YW1lIHRpbWUsCj4gbWF5YmUgdGhhdCBtYWtlcyB0aGUgZGlmZmVyZW5jZT8gT3IgWFBTIDEzIDkz
MTAgd29ya3MgZGlmZmVyZW50bHkgZnJvbQo+IE5VQywgdGhhdCdzIGFsc28gcG9zc2libGUuCj4K
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
