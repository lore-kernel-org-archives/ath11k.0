Return-Path: <SRS0=npiF=JO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878B6C433B4
	for <ath11k@archiver.kernel.org>; Sat, 17 Apr 2021 19:16:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0332B60FE6
	for <ath11k@archiver.kernel.org>; Sat, 17 Apr 2021 19:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0332B60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h9uCONXw5xXiOi7aoBKSufxhbC9GLb6nUk4Xz6ycSsg=; b=F56OKzabNYsw2TRdgJlzih2Bu
	ybxNEndqeuyAsMxcnYOFxKS7r20ZjzGxbYScNOjNaxBJgDF3EljEaT5IpjGwWS0mbfcmIOMeZ4DkQ
	+7txexDEvwHmcXd7ILn0M6/cZWmrlJ1jeDCP6CvoeT+BxyzmN3P1K60uUwVOqkMSl8nXOCa64fhyi
	HO+cd3Glyq7ZXJFEN+gBqk3Lg9Aqvf/+HFQ9VNgcGpLBeg1qv7GonyL/uB7zlSyxI8K1PtI9T9+Wz
	xaNyylEl4xv/HY2mltq3J/0XIme9YmXqhr06EP4nmqlAtv3CkGZoEaRjAdz2poWAs49vJrpmpiVWH
	2YR7qoQZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXqQM-0061ms-Rx; Sat, 17 Apr 2021 19:16:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXqQK-0061m6-TB
 for ath11k@desiato.infradead.org; Sat, 17 Apr 2021 19:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=65el9mbq4m7BngVxG8EENQXiFNt4yom8FEb+0Qi2FEo=; b=j3yQeSPZst00u4D8pO6a4pKyxW
 MIF9po6cdNd6v2ojqXEnnxaZDnNs7NUORaLBM1drZ7s0EPwHONr/V7BFuuwz8BmGYFhNosZW91MU8
 cpvNevPwvk3wcRVNDTEviRHE6hN8xrAoBSTA+GMDvWs2vW/xhMklXDfnuamnzjnOUNoR3wE4Nob4W
 vber0GEZNUxJe79jMbZIWuoDf3kc2dPHQtCR9bk1OzXZDnSCGFzH1kr6M+NhY/WzXH0tFtT95B6Qe
 XxLAZRB9lZlWt6e5saT9OaTZD0MT1jAILABxi6Y4EIV7IvvNaedJuwwH1d7t1RTP0RDsaPXO5Jr9B
 f4nvL/4Q==;
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXqQF-00A9j5-Rb
 for ath11k@lists.infradead.org; Sat, 17 Apr 2021 19:16:07 +0000
Received: by mail-io1-xd30.google.com with SMTP id h141so22581590iof.2
 for <ath11k@lists.infradead.org>; Sat, 17 Apr 2021 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=65el9mbq4m7BngVxG8EENQXiFNt4yom8FEb+0Qi2FEo=;
 b=A1KyXreNZsQFKkM4bVESLgtkatgl0yQjvLGYQF8mFr55YWEHIhgwY0f3qqqjJqjFxE
 rj1xT20KXAbT+80VKTnqhaOesmZkCk7BwW/XUESO1shykQgADWyXYGp6I7Nu2RgJJ2yW
 FRZoirrIFHPTUT7Ll8bXlQPaWFKfeb3GQr86EhkC5IuM5jbDBn7JnyU8eySK0TIsP7bF
 LarENXaX4ALNk4GoDTmUflm5J8/Se5c2A2m/0QwXarI+BB3/A9bJRlr1hjxw8ynlv8It
 +w4R0E2LEInqg+ztoYiGojA8pC3cwxoY2veQ0t/T0SlcATe3cZB2qsm1QlNYO4nmUfNK
 DR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=65el9mbq4m7BngVxG8EENQXiFNt4yom8FEb+0Qi2FEo=;
 b=p4eT6cqtC1zpGQtuR2Pxo7eKOMW8J9wm28TV+tbhlIUkF8fTMOEontiEnW9mEAB8SC
 L7aYfn9KPLTXxMokm39l21/cENMy1N1phUDtZJgA+ShvE0LS6NU/KBBeZnK3cwvyIOgf
 xiC00tOeGU/psg/DFCrpWFu83+lkgdwaxMRJXxIHHHADxPsWAaAuArbfVkeAYJrEAmfy
 r6/C20yd9k2+8TWsfNBgC+vrSNIQs3r0aDmdRrv1hVZWJfMIP+0JE/fnIh+LAeyTyHPR
 CcWqF8UbRgWtRWYH+Xb8K+prVcjTWT+iT3iviP7Z52RVHhirHcdmNa0/WMMfLPAVmWdg
 26Sg==
X-Gm-Message-State: AOAM5316HkTHmqp24BGYbsFhYwBGMc0fN6lx+VReT6VuEJMrn9IkyONl
 kXll5viLtspu6ER7vJE37aeMoVb3KHBZfYPuGpY=
X-Google-Smtp-Source: ABdhPJyEn7Hi4gZDoJNwAbzphD4/7MPAt8TeCVO4sPiLtzTjeWX7ZIYkEW6wk+Ck5TldXG1YGsIXq1EOGIHOIBnWKZo=
X-Received: by 2002:a02:9508:: with SMTP id y8mr9437852jah.125.1618686962369; 
 Sat, 17 Apr 2021 12:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR02MB5520E3ADA594F9BA98E64B22E24D9@SN6PR02MB5520.namprd02.prod.outlook.com>
 <7da530f675a485bb2ccd397b4ad303fa@codeaurora.org>
 <CA+D0iCJswb8a_=YoM1=c9vNBu15nnv_BNp2Jyh8CgnNqTs4qxg@mail.gmail.com>
In-Reply-To: <CA+D0iCJswb8a_=YoM1=c9vNBu15nnv_BNp2Jyh8CgnNqTs4qxg@mail.gmail.com>
From: =?UTF-8?Q?Andr=C3=A9_Eberle?= <andre.eberle@gmail.com>
Date: Sat, 17 Apr 2021 16:15:19 -0300
Message-ID: <CA+D0iCL3wmHRLYBpt-QKoVGZNmNUzLHuG+ZyG8UALt=WeDuA_w@mail.gmail.com>
Subject: Re: ath11k-qca crashing
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_121603_920596_B943E4CF 
X-CRM114-Status: GOOD (  26.21  )
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

QWZ0ZXIgc29tZSBtb3JlIGRlYnVnZ2luZywgSSBmaWd1cmVkIHRoZXJlIGlzIHNvbWUgcHJvYmxl
bSBvbiBUWC4KUmlnaHQgbm93LCBhZGRpbmcgc21hbGwgZGVsYXlzIHRvIHRoZSBhdGgxMWtfbnNz
X3R4IGZ1bmN0aW9uIGluIG5zcy5jCmlzIHByZXZlbnRpbmcgdGhlIGNyYXNoIGZyb20gaGFwcGVu
aW5nLiBDb3VsZCBzb21lb25lIHBvaW50IG1lIHRvCndoZXJlIHJhY2UgY29uZGl0aW9ucy9vdGhl
ciBpc3N1ZXMgY291bGQgYmUgaGFwcGVuaW5nIG9uIHRoZSBUWCBzdGFjaz8KCk9uIFRodSwgQXBy
IDE1LCAyMDIxIGF0IDM6MDEgUE0gQW5kcsOpIEViZXJsZSA8YW5kcmUuZWJlcmxlQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBJIGhhdmUgYXR0YWNoZWQgdGhlIGRtZXNnLiBJdCBpcyB0aGUgVUFSVCBk
dW1wIGVzc2VudGlhbGx5LCBzbyBpdAo+IGluY2x1ZGVzIHNvbWUgcHJlLWJvb3QgaW5mbywgbWF5
YmUgaXQgaXMgdXNlZnVsOgo+Cj4gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xdTVf
QzdxNnlLOXFSeXE0VEpZUXBrWmVVLTFlUW1Sd1Ivdmlldz91c3A9c2hhcmluZwo+Cj4gVGhlcmUg
aXMgbm8gc3RhY2sgdHJhY2UgZHVtcCBkdXJpbmcgdGhlIGNyYXNoLCB1bmZvcnR1bmF0ZWx5LiBB
cyB5b3UKPiBjYW4gc2VlIHRoZSBzeXN0ZW0gc3VkZGVubHkgcmVib290cyAoc29tZXRpbWVzIGl0
IGp1c3QgZnJlZXplcykuCj4KPiBJIGhhdmUgYWRkZWQgdGhlIGxvZ3JlYWQgZnJvbSBvcGVud3J0
IGFsc28uIFRoaXMgb25lIGhhcyB0cmFjZS1sZXZlbAo+IG1lc3NhZ2VzIGZyb20gZG1lc2csIHNv
IG1heWJlIGl0IGlzIG1vcmUgaGVscGZ1bC4gSSBlbmFibGVkIG1heGltdW0KPiBkZWJ1ZyBsZXZl
bCBmb3IgYXRoMTEgb24gdGhpcyBvbmUsIGhvcGUgaXQgaGVscHM6Cj4KPiBlY2hvIDB4ZmZmZmZm
ZmYgPiAvc3lzL21vZHVsZS9hdGgxMWsvcGFyYW1ldGVycy9kZWJ1Z19tYXNrCj4KPiBodHRwczov
L2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFzYXNEOTlRVmYyVXFGN2xPUV9wRDVKaEk0M0llM0RP
Ni92aWV3P3VzcD1zaGFyaW5nCj4KPiBPbiBUaHUsIEFwciAxNSwgMjAyMSBhdCA2OjQ4IEFNIEJo
YWdhdmF0aGkgUGVydW1hbCBTCj4gPGJwZXJ1bWFsQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPiA+
Cj4gPiBPbiAyMDIxLTA0LTE1IDE0OjU4LCBCaGFnYXZhdGhpIFBlcnVtYWwgUyB3cm90ZToKPiA+
ID4gSGVsbG8sCj4gPiA+Cj4gPiA+IEkgaGF2ZSBiZWVuIHVzaW5nIHRoZSBhdGgxMWsgd2lyZWxl
c3MgZHJpdmVyIChxY2EgdmVyc2lvbiBpZS4gUVNESykgaW4KPiA+ID4gYSBJUFE4MDd4IHJvdXRl
ciwgYnV0IEkgYW0gZmFjaW5nIGNyYXNoZXMuIEV0aGVybmV0IGFuZCBXQU4gd29yayBmaW5lLgo+
ID4gPgo+ID4gPgo+ID4gPiBJIGNhbiBjb25uZWN0IHRvIFdpRmksIGFuZCByZWNlaXZlIGFuIGFk
ZHJlc3MgZnJvbSBESENQLiBJIGNhbiBldmVuCj4gPiA+IHNlbmQvcmVjZWl2ZSBhIG51bWJlciBv
ZiBwYWNrZXRzIHZpYSB0aGUgd2lmaSBuaWMsIGJ1dCBpZiBJIHRyeSB0bywKPiA+ID4gc2F5LCBz
ZW5kL3JlY3YgYSBsYXJnZXIgbnVtYmVyIG9mIHBhY2tldHMgYXQgb25jZSAobGlrZSB2aXNpdGlu
ZyBhCj4gPiA+IHdlYnBhZ2UpLCB0aGUga2VybmVsIGNyYXNoZXMuIEkgaGF2ZSBiZWVuIGRpZ2dp
bmcgaW50byB0aGUgTlNTIGFuZAo+ID4gPiBhdGgxMWsgZHJpdmVycyB0cnlpbmcgdG8gaXNvbGF0
ZSB0aGUgcHJvYmxlbSwgYnV0IHNvIGZhciBteSBkZWJ1Z2dpbmcKPiA+ID4gYXR0ZW1wdHMgaGF2
ZSBmYWlsZWQuIEkgaGF2ZSBzbyBmYXIgZmFpbGVkIHRvIHNldCB1cCBrZ2RiIG9uIHFzZGsKPiA+
ID4gYWxzbywgc28gbm8gaGVscCBvbiB0aGF0IGZyb250Lgo+ID4gPgo+ID4gPiBXaGF0IGlzIHRo
ZSBiZXN0IHdheSB0byBkZWJ1ZyB0aGUgYXRoMTFrIGRyaXZlcnMgZm9yIHN1Y2ggcHJvYmxlbXM/
IE9yCj4gPiA+IGF0IGxlYXN0IHRyeSB0byBkZXRlcm1pbmUgaWYgdGhlIGNyYXNoZXMgYXJlIGZy
b20gdGhlIGRyaXZlciwgb3IKPiA+ID4gZWxzZXdoZXJlIGluIHRoZSBOU1Mgc3lzdGVtPwo+ID4K
PiA+IFNlcmlhbCBsb2dzIGFuZCBjcmFzaCBkdW1wIHdpbGwgaGVscCB0byBkZWJ1ZyB0aGUga2Vy
bmVsIGNyYXNoZXMuIFBsZWFzZQo+ID4gc2hhcmUgZG1lc2cgbG9ncyBhbmQgc2VyaWFsIGxvZ3Mg
ZnJvbSBwb3dlciBvbiBhbmQgcGxlYXNlIHNoYXJlIGNhbGwKPiA+IHN0YWNrIGRldGFpbHMgZHVy
aW5nIGNyYXNoIGlmIGFueS4KPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+Cj4gPiA+IGF0aDExayBt
YWlsaW5nIGxpc3QKPiA+ID4KPiA+ID4gYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4K
PiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
