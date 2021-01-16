Return-Path: <SRS0=HPIx=GT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFBFC433DB
	for <ath11k@archiver.kernel.org>; Sat, 16 Jan 2021 14:11:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D46823107
	for <ath11k@archiver.kernel.org>; Sat, 16 Jan 2021 14:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D46823107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=justinmp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M7NZeKP7CRCctOyYmXmyr6QAguZRao6aZQDD0pWdCOg=; b=KZapKE1VxboqUhl2fFlQsqy1P
	y/jKNchnJWmWWE4wQRhCeWCwgUKxoWchcd+PIiHTrpmWxS6yF+DUkg4jTmfsR1n6q0PPUOd6U4Wyr
	un1/aS7ch5yBOLN+7bArX5kAGONk2Ob9VgGgllS+4tXBhk4muvtwUnLGeYcWvXVSFcjjGhPQgGoLW
	ytNs5W88mvY01xCYFDwB2nJO3sL6JiNGABHHw/Oia8Z6jz7EbvghtRepV1DJBgozQijfOj91VjOKK
	fD5uDWJsx3xe8124ib6g3fA0Xaw0qd0m4fnjOpzbOZH5cfWSpfgduh2a4hF9XlD0yDINmwEfAPnsI
	HcQO6elKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0mIF-00039X-PV; Sat, 16 Jan 2021 14:11:07 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0mIC-00038r-No
 for ath11k@lists.infradead.org; Sat, 16 Jan 2021 14:11:05 +0000
Received: by mail-qt1-x82e.google.com with SMTP id v5so8161130qtv.7
 for <ath11k@lists.infradead.org>; Sat, 16 Jan 2021 06:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=justinmp-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=e1+9FnmSH+8SPCCqumtxW/7CWNiJTUPTlAnC9W3Zmr8=;
 b=0/AN/k4W6K/WdTI+Yi1C5VqDSia+VJwTadT++/54pl0VDH5A6lWl+gx7NtVhq4UOXZ
 46Nm4XP8D/LcFL8RQij/J0ndt/6FwRWB7nr6JoJYn835hToVnosrqCa4rhysHXJLVA1p
 x+B7SWEccpsnB5cdt2VS32v3wsVlDlTj4OQgSpBc2s2qScZevy0nXJVp4H5MoDRui4ci
 U+VRnzhXxROreYD1LEgDR+u4tZXEvJJij3XKShwxR/nHxkX9CTdwTnUeB81yvK9iFITM
 7r7cFLm2FViykcujFDlaIO+dEwOJqTK2//acBe4XtAuzD2fntuPGQP8WqYywBJFlVvzP
 VGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e1+9FnmSH+8SPCCqumtxW/7CWNiJTUPTlAnC9W3Zmr8=;
 b=TuoCS8bIxSTvntQToHEM2blRJwAXDtsYxZ3pa0rymVsnK43px9JM0mAC0caGMLiUi5
 xqfiRzRXi3du0BWmKN5fyeuaEH+jRRN2JOJ4JL2Hq5MFaOmVUeenypd3Xb7NIEq2yxF9
 seQtZjItPWQzNlc3mWo9apE0AHRuzwbwTt6QgeFzkbrrChL+GnN1CXbrOnCOzU2fpd3Q
 RWsnjrIDmn+mzA464hflT9NO8KGEWSy3cWzG2rsyurLeGtTc0lMtTt6rw2VQ8dzzuvwO
 sfiERmi+BB1E+FPp+GGWIlpweWZSjzHBKkFoFXz0Hp0rxtAxSPuPhFJmaxtl+em9G5vo
 sRvg==
X-Gm-Message-State: AOAM5309V2rO4cA/E1NpjrHxhvzTmU2wPhhPcBuuNCLowKgcFILb5zkK
 b79xCrVoGeftW+sPUh2EwWBYVA==
X-Google-Smtp-Source: ABdhPJxPsAg4vLwkcfg4EUtt0j8iITUVuGY0ltz0F+7LerY21j7YQE8phuYUpriqV8o2GFcgBCwRsg==
X-Received: by 2002:aed:3943:: with SMTP id l61mr15254003qte.392.1610806260852; 
 Sat, 16 Jan 2021 06:11:00 -0800 (PST)
Received: from ?IPv6:2601:184:4a7f:a732::1f1? ([2601:184:4a7f:a732::1f1])
 by smtp.gmail.com with ESMTPSA id a206sm7123170qkc.30.2021.01.16.06.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 06:11:00 -0800 (PST)
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
To: "Luo, Sining" <sluo@ciena.com>,
 "kvalo@codeaurora.org" <kvalo@codeaurora.org>
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <075eed74b59afc9bc4f870aea6765f85d040cf47.camel@ciena.com>
 <874kjkix7m.fsf_-_@codeaurora.org>
 <97390297b66298e485ac5d477594b7d31d3aa7df.camel@ciena.com>
From: Justin Mazzola Paluska <jmp@justinmp.com>
Message-ID: <ef858ed0-b561-cf30-8741-bb3d85b22d83@justinmp.com>
Date: Sat, 16 Jan 2021 09:10:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <97390297b66298e485ac5d477594b7d31d3aa7df.camel@ciena.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_091104_942311_4D260B73 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "wink@technolu.st" <wink@technolu.st>,
 "mail@mitchellnordine.com" <mail@mitchellnordine.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMS8xMy8yMSAxOjI5IFBNLCBMdW8sIFNpbmluZyB3cm90ZToKPiBZZXMsIGl0IHdhcyBlbmFi
bGVkIGluIEJJT1MsIGJ1dCBpdCB3YXNuJ3QgZW5hYmxlZCBhdCBib290IGR1ZSB0byB0aGUKPiBC
SU9TIGJ1ZzoKPiBETUFSOiBbRmlybXdhcmUgQnVnXTogWW91ciBCSU9TIGlzIGJyb2tlbjsgRE1B
UiByZXBvcnRlZCBhdCBhZGRyZXNzIDAhCj4KPiBJIHdlbnQgYWhlYWQgdG8gdXBncmFkZSB0aGUg
QklPUyB0byAxLjIuNS4gVGhlIERNQVIgZXJyb3IgaXMgbm93IGdvbmUKPiBhbmQgSSBjYW4gZ2V0
IDMyIE1TSSB2ZWN0b3JzIGZvciB0aGUgZmlyc3QgdGltZSEKPgo+IFsgICAgMy45NzEyMThdIGF0
aDExa19wY2kgMDAwMDo3MjowMC4wOiBXQVJOSU5HOiBhdGgxMWsgUENJIHN1cHBvcnQgaXMKPiBl
eHBlcmltZW50YWwhCj4gWyAgICAzLjk3MTI4NV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IEJB
UiAwOiBhc3NpZ25lZCBbbWVtIDB4YTI1MDAwMDAtCj4gMHhhMjVmZmZmZiA2NGJpdF0KPiBbICAg
IDMuOTcxMzAyXSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAw
IC0+IDAwMDIpCj4gWyAgICAzLjk3MTQ1Ml0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IE1TSSB2
ZWN0b3JzOiAzMgo+IFsgICAgNC42MDk1OTNdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBxbWkg
cmVxIG1lbV9zZWdbMF0gMHg1M2MwMDAwMAo+IDM1MjI1NjAgMQo+IFsgICAgNC42MDk1OTVdIGF0
aDExa19wY2kgMDAwMDo3MjowMC4wOiBxbWkgcmVxIG1lbV9zZWdbMV0gMHg1NDEwMDAwMAo+IDg4
NDczNiA0Cj4gWyAgICA0LjYxNjM5Nl0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGNoaXBfaWQg
MHgwIGNoaXBfZmFtaWx5IDB4Ygo+IGJvYXJkX2lkIDB4ZmYgc29jX2lkIDB4ZmZmZmZmZmYKPiBb
ICAgIDQuNjE2Mzk4XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZndfdmVyc2lvbiAweDEwMWMw
NmNjCj4gZndfYnVpbGRfdGltZXN0YW1wIDIwMjAtMDYtMjQgMTk6NTAgZndfYnVpbGRfaWQKPiBb
ICAgIDQuNzkzNjUwXSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMCB3bHAxMTRzMDogcmVuYW1lZCBm
cm9tIHdsYW4wCj4KCgpGb3Igd2hhdCBpdCdzIHdvcnRoLCBJIHVwZ3JhZGVkIG15IERlbGwgWFBT
IDEzIDkzMTAgdG8gQklPUyAxLjIuNSBhbmQgCmNhbiBhbHNvIHJlcG9ydCB0aGF0IHRoZSBETUFS
IGVycm9yIGlzIGdvbmUgYW5kIEkgYWxzbyBnZXQgMzIgTVNJIHZlY3RvcnMuCgokIHN1ZG8gZG1l
c2cgfCBncmVwIC1lIGF0aDExa1xcXHxtaGkKW8KgwqAgMTcuMzE3MDk5XSBhdGgxMWtfcGNpIDAw
MDA6NTY6MDAuMDogV0FSTklORzogYXRoMTFrIFBDSSBzdXBwb3J0IGlzIApleHBlcmltZW50YWwh
ClvCoMKgIDE3LjMxNzE1M10gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IEJBUiAwOiBhc3NpZ25l
ZCBbbWVtIAoweDhjMzAwMDAwLTB4OGMzZmZmZmYgNjRiaXRdClvCoMKgIDE3LjMxNzE3MF0gYXRo
MTFrX3BjaSAwMDAwOjU2OjAwLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAyKQpbwqDC
oCAxNy4zMTczMzZdIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBNU0kgdmVjdG9yczogMzIKW8Kg
wqAgMTcuMzc1MDIyXSBtaGkgMDAwMDo1NjowMC4wOiBSZXF1ZXN0ZWQgdG8gcG93ZXIgT04KW8Kg
wqAgMTcuMzc1MTgxXSBtaGkgMDAwMDo1NjowMC4wOiBQb3dlciBvbiBzZXR1cCBzdWNjZXNzClvC
oMKgIDE3Ljk0NTY3MV0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IHFtaSByZXEgbWVtX3NlZ1sw
XSAweDMzMDAwMDAwIAozNTIyNTYwIDEKW8KgwqAgMTcuOTQ1Njc1XSBhdGgxMWtfcGNpIDAwMDA6
NTY6MDAuMDogcW1pIHJlcSBtZW1fc2VnWzFdIDB4MzM1MDAwMDAgCjg4NDczNiA0ClvCoMKgIDE3
Ljk1MzA1NF0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IGNoaXBfaWQgMHgwIGNoaXBfZmFtaWx5
IDB4YiAKYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHhmZmZmZmZmZgpbwqDCoCAxNy45NTMwNTZdIGF0
aDExa19wY2kgMDAwMDo1NjowMC4wOiBmd192ZXJzaW9uIDB4MTAxYzA2Y2MgCmZ3X2J1aWxkX3Rp
bWVzdGFtcCAyMDIwLTA2LTI0IDE5OjUwIGZ3X2J1aWxkX2lkClvCoMKgIDE4LjEyNzE2NV0gYXRo
MTFrX3BjaSAwMDAwOjU2OjAwLjAgd2xwODZzMDogcmVuYW1lZCBmcm9tIHdsYW4wCgpJJ20gc3Rp
bGwgdXNpbmcgdGhlIGF0aDExay1xY2E2MzkwLWJyaW5ndXAtMjAyMDEyMTQwOTM4IGJyYW5jaC7C
oCBJJ20gCmhhcHB5IHRvIHRyeSBvdXQgbmV3IHBhdGNoZXMsIHBhcnRpY3VsYXJseSBvbmVzIHJl
bGF0ZWQgdG8gcG93ZXIgCm1hbmFnZW1lbnQuwqAgVGhlIGxhcHRvcCBkb2Vzbid0IGdldCBpbnRv
IHN0YXRlcyBsb3dlciB0aGFuIHBjNiB3aGlsZSB0aGUgCndpcmVsZXNzIGNhcmQgaXMgcnVubmlu
Zy7CoCBJZiBJIHNodXQgZG93biB0aGUgY2FyZCwgdGhlIGxhcHRvcCB3aWxsIApvcHBvcnR1bmlz
dGljYWxseSBnZXQgZG93biBpbnRvIHRoZSBwYzEwIHN0YXRlLCB3aGljaCBsZWFkcyB0byBtYXNz
aXZlIApwb3dlciBzYXZpbmdzLgogwqDCoMKgwqAgLS1KdXN0aW4KCi0tIAphdGgxMWsgbWFpbGlu
ZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
