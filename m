Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576E9C433F5
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 07:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E0461130
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 07:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18E0461130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Hrg6i1rxYFymUPSaQlaE+8+H3XO6RcOEIJPOdxA/po=; b=JXgnejrKzqz+0JpI0+YPvYt1/y
	joJ/mOXNDVbNyG6SUWVWyXA5yqsN2TkqoleosOZN/XRT8EN8ueAoMfVSHbcClJxpDyjkn2xHFeSKm
	UJHUnPR7RenqJCos8/498Fw7PrjA/17Nn++bHVNwqRAlphxLBhGaxmLgZ73IXJ0KcSv3Rur9Paxqn
	lr34aUgpr1R59gupNU4b2sTNkr2DZ+7WhCJ3XuAe8AoMvgIfqK/GjG8AEFBzqotC75uqpTK5DVruZ
	Q3o5wJeP2qzzUM87FEkR70UN/3fkieMolTi0WNFfM2VJQ3vIcfc3z+iBBg6EpewM5D7TGOWET/QGe
	UsfOIlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNsh-00GR51-LN; Thu, 07 Oct 2021 07:31:55 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNsd-00GR4C-M4
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 07:31:53 +0000
Received: by mail-lf1-x130.google.com with SMTP id b20so21348017lfv.3
 for <ath11k@lists.infradead.org>; Thu, 07 Oct 2021 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8kKGxvDgnkWoDMWCfd3dMCq4WXGMxT3NcgXQGtV1oUE=;
 b=HdsvDHi3Zs+rwVOfPiv46qZ9bny153dEW0/Eq7rhgPBXichcVQ1NFCgzxxx44d4BkW
 +Dp9swBGWuDKj1ZosyFr83f011eamP5QAqTk9aGit3QQ5YsubMbBouToprAlQavL09Yu
 8+5/IaCIT7FUjEJTeN4m91fYhUCIxPDmdV1qzCj+IQqwPXVo2uj557XYnuRcUc5HRbys
 to7u/CjAtFvj+Qb99iHDWH6sOu00TnZ5QRwPo8WQIZGkrb5ePgbpgBTy5gLRNlP3OgQp
 ql/PpfhIJSms1cxO99g9S7LJ/roaXjcVpoNY+LB42bZjA+pzVa798TB6zoJzzw9op0Rx
 J7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8kKGxvDgnkWoDMWCfd3dMCq4WXGMxT3NcgXQGtV1oUE=;
 b=iwZOjamljzaMVJLvQnrdss2GTuzjIiUxNhgZOfSfKtnHk3h0ezf8sQNLHRGDMhqeSj
 aoSNaa09x1oZx8pFp+wpYNx6QN6LH6KhOH6omCiPpeNMMTviMgMg7wUPiQAbLvQAVngm
 6FP2rZ91JOF427s9+X2T3JXCaYn7NWnKZGbSoAcaX6JkrMQmRkyLJRB4KuDdJju4GMIk
 cCcWOJcjwpAOc2iHQo4Ch8HHOIua4IXYaNysPmx4gqPdJuJp4h/yuIu/NvPlkrHbT0VD
 TJpb7PGn/lMi3NT0aD24pahTgaojmeG7hYs3qeHSTHZvGZfTWKXXl5fbRN41qHX29rEX
 HB8g==
X-Gm-Message-State: AOAM532YfyJY3r8rmb/jc1bmyWcAQNvVc3M5HMQFFzM0lpN+UMyTwwc4
 7wqMi2muWC3T8APQ5zJ5BF3k05rLW93KX8Eh
X-Google-Smtp-Source: ABdhPJwk8dio5tieqK0SqlgOmcPF4qX5Zss2OtQ/wlaEukGMX6/RVjPTiHDIFiJBB7LmvUMtQyuuMQ==
X-Received: by 2002:a05:651c:170e:: with SMTP id
 be14mr2836981ljb.487.1633591909111; 
 Thu, 07 Oct 2021 00:31:49 -0700 (PDT)
Received: from [192.168.2.114] ([109.106.141.149])
 by smtp.gmail.com with ESMTPSA id b16sm751112lfq.229.2021.10.07.00.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 00:31:48 -0700 (PDT)
Subject: Re: Can not unload ath11k_pci and load it back
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org
References: <190a1b14-0a8c-f1fb-9f0d-e25cc57034a7@gmail.com>
 <875yu9e4li.fsf@codeaurora.org>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <8324ec52-303d-ea04-b635-a550e83ad47c@gmail.com>
Date: Thu, 7 Oct 2021 10:31:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <875yu9e4li.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_003151_753834_EBDCB561 
X-CRM114-Status: GOOD (  26.87  )
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

SSd2ZSBmb3VuZCBzaW1pbGFyIGJ1ZyBmaWxlcyBhbHJlYWR5IC0gc28gbm90IHRvIGNyZWF0ZSBk
dXBsaWNhdGVzIApzaW1wbHkgY29tbWVudGVkIHRoZXJlCgpodHRwczovL2J1Z3ppbGxhLmtlcm5l
bC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNDU0MQoKRXhhY3RseSAtIGhpYmVybmF0aW9uIG1lYW5z
IHNhdmluZyBzdGF0ZSBvbiBkaXNrIGFuZCByZXN1bWluZyBsYXRlciwgaXQgCmlzIGEgdmVyeSB1
c2VmdWxsIGZlYXR1cmUgd2hlbiB5b3UgYXJlIHJ1bm5pbmcgb3V0IG9mIGJhdHRlcnkgYW5kIHdh
bnQgCnRvIHNhdmUgeW91ciB3b3JrLgoKQWxzbyBvbmUgbW9yZSBwb2ludCBJJ3ZlIGZvdW5kIC0g
aWYgTUhJIGlzIGNvbmZpZ3VyZWQgaW4gdGhlIGtlcm5lbCAtIAp0aGUgY2FyZCBpcyBzdGFydGlu
ZyB1cCBvbiB0aHIgZmlyc3QgYm9vdCBhbmQgd29ya3MuIEJ1dCBpZiBpIGNvbmZpZ3VyZSAKTUhJ
IGFzIGEgbW9kdWxlIC0gaXQgZG9lcyBub3QuIE1ISSBtb2R1bGUgZG8gbG9hZC4gU28gZG/CoCBh
dGgxMWsgYW5kIAphdGgxMWtfcGNpLsKgIEJ1dCB0aGUgbGFzdCBhdGgxMWsgZG1lc2cgc2F5cyA6
CgptaGkgbWhpMDogV2FpdCBmb3IgZGV2aWNlIHRvIGVudGVyIFNCTCBvciBNaXNzaW9uIG1vZGUK
CkV4YWN0bHkgYXMgaWYgScKgIGRvIHJtbW9kL21vZHByb2JlIHNlcXVlbmNlLgoKSSB1c2UgbGF0
ZXN0IEJJT1MgZnJvbSBEZWxsIChpbiBmYWN0IHVwZ3JhZGluZyAzLjAuNCB0byAzLjEuMCBkaWQg
bm90IApjYW5nZSBhbnl0aG5nKSAswqAgYW5kIGhhdmUgdHJpZWQgbXVsdGlwbGUga2VybmVscy4g
U3RhYmxlIDUuMTQgc2VyaWVzIAphbmQgYXRoMTFrIGdpdCB0cmVlIChuZXh0IGFuZCBtYXN0ZXIt
cGVuZGluZykuIE5vdGhpbmcgaGVscHMuwqAgU29tZXRpbWVzIAppdCB3b2tzIG91dCAtIEkgaGFk
IGNvdXBsZSBvZiB0aW1lcyBzdWNjZXNzZnVsbHkgcm1tb2QvbW9kcHJvYmUgCmF0aDExa19wY2kg
YnV0IGl0IHMgYSBraW5kIG9mIHJhbmRvbSBhbmQgdmVyeSByYXJlIGV2ZW50ICggSSBoYWQgaXQg
MiAKdGltZXMgb25seSkuCgpTbyBmb3IgbWUgaXQgbG9va3MgbGlrZSBhbiBpc3N1ZSBiZXR3ZWVu
IE1ISSBhbmQgYXRoMTFrICwgYnV0IAp1YmZvcnR1bmF0ZWx5IG15IGtub3dsZWRnZSBpcyBub3Qg
ZW5vdWdoIHRvIHByb3Bvc2UgYW55IHNvbHV0aW9uIGhlcmUuCgpPbiAwNy4xMC4yMDIxIDA5OjIy
LCBLYWxsZSBWYWxvIHdyb3RlOgo+IE1hcmsgSGVyYmVydCA8bWFyay5oZXJiZXJ0NDJAZ21haWwu
Y29tPiB3cml0ZXM6Cj4KPj4gRGVhciBhdGgxMWsgdGVhbSwKPj4KPj4gVGhlIG1haW4gaXNzdWUg
aXMgSSBjYW4gbm90IGhpYmVybmF0ZSBhbmQgd2FrZSB1cCBteSBYUFMgMTMgOTMxMC7CoCBJZgo+
PiBJIGtlZXAgbW9kdWxlIGxvYWRlZCBpdCBoaWJlcm5hdGUuIEJ1IGhhbmdzIG9uIHJlc3VtZS4K
PiBKdXN0IHRvIGF2b2lkIGNvbmZ1c2lvbnMgd2l0aCB0ZXJtaW5vbG9neSwgd2l0aCBoaWJlcm5h
dGUgeW91IG1lYW4KPiBzdG9yaW5nIHRoZSBzeXN0ZW0gc3RhdGUgdG8gYSBkaXNrIGFuZCBjb21w
bGV0ZWx5IHBvd2VyaW5nIG9mZiB0aGUKPiBsYXB0b3A/Cj4KPiBJIGFzc3VtZSBoaWJlcm5hdGlv
biBmYWlscyBiZWNhdXNlIGF0aDExayBrZWVwcyB0aGUgZmlybXdhcmUgcnVubmluZwo+IGR1cmlu
ZyBzdXNwZW5kIGFuZCBhdGgxMWsgaXMgbm90IGFibGUgdG8gcmVjb3ZlciBpZiB0aGUgZmlybXdh
cmUgaXMgZGVhZAo+IGR1cmluZyByZXN1bWUuCj4KPiBDYW4geW91IGZpbGUgYSBidWcgYWJvdXQg
dGhpcywgaW5zdHJ1Y3Rpb25zIGhlcmU6Cj4KPiBodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVs
Lm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0aDExay9idWdyZXBvcnQKPgo+PiBJZiBJIHVubG9hZCBt
b2R1bGUgLSBpdCByZXN1bWVzIE9LIGJ1dCB0aGVyZSBpcyBubyBjaGFuY2UgdG8gaGF2ZSBXSUZJ
Cj4+IGJhY2sgd2l0aG91dCByZWJvb3QuCj4+Cj4+IElmIEkgZG8gcm1tb2QgYXRoMTFrX3BjaSAt
IGl0IHNob3dzIGVycm9ycyBpbiBkbWVzZzoKPj4KPj4gW8KgwqAgNDguODAxNTA0XSBhdGgxMWtf
cGNpIDAwMDA6NzI6MDAuMDogbGluayBkb3duIGVycm9yIGR1cmluZyBnbG9iYWwgcmVzZXQKPj4g
W8KgwqAgNDguODAxNzAwXSBETUFSOiBEUkhEOiBoYW5kbGluZyBmYXVsdCBzdGF0dXMgcmVnIDIK
Pj4gW8KgwqAgNDguODAxNzA5XSBETUFSOiBbSU5UUi1SRU1BUF0gUmVxdWVzdCBkZXZpY2UgWzB4
NzI6MHgwMC4wXSBmYXVsdAo+PiBpbmRleCAweDYwIFtmYXVsdCByZWFzb24gMHgyMl0gUHJlc2Vu
dCBmaWVsZCBpbiB0aGUgSVJURSBlbnRyeSBpcwo+PiBjbGVhcgo+Pgo+PiBJZiBJIGRvIG1vZHBy
b2JlIGltbWVkaWF0ZWx5IGl0IGRvZXMgbG9hZCBtb2R1bGUgYnV0IGNhcmQgd2lsbCBub3QKPj4g
Y29tZSBiYWNrIGFnYWluLgo+Pgo+PiBJbiBBcmNoIHdpa2kgcmVsb2FkaW5nIG1vZHVsZXMgd2Fz
IGV4cGxhaW5lZCBhcyBhIHdvcmthcm91bmQgdG8KPj4gc3VzcGVuZC1yZXN1bWUgOTMxMCwgYnV0
IGxvb2tzIGxpa2UgaXQgZG9lcyBub3Qgd29yayBhbnltb3JlLiBTdXNwZW5kCj4+IHRvIGlkbGUg
d29ya3MgZmluZSAtIG5vIG1vZHVsZSB1bmxvYWRpbmcgbmVlZGVkLgo+IEkgaGF2ZSBhbiBYUFMg
MTMgOTMxMCBhcyB3ZWxsIGJ1dCBJIGNhbid0IHRlc3QgdGhpcyByaWdodCBub3cuIENhbiB5b3UK
PiBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGNhcmQgbm90IGdldHRpbmcgYmFj
ayBhZnRlciBtb2Rwcm9iZT8KPiBXaGF0IGV4YWN0IGtlcm5lbCBhbmQgQklPUyB2ZXJzaW9ucyBh
cmUgeW91IHVzaW5nPyBXaGF0IGxvZyBtZXNzYWdlcyB5b3UKPiBnZXQgZnJvbSBhdGgxMWs/IFBy
ZWZlcmFibHkgdGhlIGV4YWN0IGNvbW1hbmRzIHlvdSB1c2UgYW5kIHRoZSBvdXRwdXQKPiB5b3Ug
Z2V0IGZyb20gYXRoMTFrIHdvdWxkIGhlbHAgYSBsb3QgdG8gdW5kZXJzdGFuZCB3aGF0J3MgaGFw
cGVuaW5nLgo+CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
