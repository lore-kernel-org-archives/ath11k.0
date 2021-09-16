Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C44C4167B
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 17:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE5460F38
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 17:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EE5460F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Cu6WFOmSxWjQQlmGx5U8NFwsuypBZ0KjhGa8ca4zHI=; b=Sf7AljMVaVYdzB
	4jnkprwu6AipnRu1SOWWJdIb9UQhXI6hvlYbEPTRsqMTHyzajFglwTyn78eGHaQ3o31ktfHHRLirc
	V0kbLXfcdvV3ChlvXUouTO3oQGmuVETZwoxhQWD1D60utw5Rj6aiuV7Cn3Bi3zwKmPsFSNQPwjxA9
	4OUnvIA8r2Tby6gZ822PMCpGPLy+Ywb11E6KkhkySnrXNgpclFFlfVDp16NDMrl1X5YasPBwMTnYX
	yguBICtzvQdqmLme4bbReF+g28AsmA1G7vMH0YobPUWL2k/lfZyXeINnt7re+dpfNCaYHWlU2JF8g
	Qt8Vccwk1Sv7VepBwVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQv2u-00BtO9-Nw; Thu, 16 Sep 2021 17:19:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQv2r-00BtIA-Am
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 17:19:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id g14so6591812pfm.1
 for <ath11k@lists.infradead.org>; Thu, 16 Sep 2021 10:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vfppOddBimlXKR9WfYAKpD75AZ1AT5Ln0YqbfJSrBQA=;
 b=XCkNHl8kcS/0Qgn6DtGioUwi3UGpp9yaSUkX6AIaAHVxHt6CWjhcgvE5uF0tFMJgTu
 GJ3qlQyId2bhiwxToQ9QXgA/LE1nFwFzIp1Qe319B6aUnxWfHHdLIUORYz4v50AvfcGv
 CPPhv3fd0Yd3Uzg7MgtWJveVEA3r054tjVv6p19Ui/dzOn8aoobt2VyaThJExdk6Y4oU
 h5eOXmGL5rZ2SpdIjKzi4MXwuAjSewzyUVq0BHjqXbek1y7X+pxbs/e+zm4SyboglDRT
 03uFXeQfhBae9LoI5cF13wjc0B2XppuOTkD56EnPO6UP6yl5tegpWn5qHb8VtpVRVLD0
 hsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vfppOddBimlXKR9WfYAKpD75AZ1AT5Ln0YqbfJSrBQA=;
 b=4pN0/hJnFGexBVUuFCqnGY5LubhKaBeVefRwLQGCEdS2FtJj2tYDxJNedgZ3kpaqLq
 aEoxIVsG/eNbbW9B393ONWPgq1N+MSEtCBXDU3aaxyq9jd87a1HmMDLY4yQgbmjE9Ngs
 xM9YDRycy8Vj9fTKLnLrmZoAXOHLI1bdsm0uby/Qbd93dkcmo8uyPlWfBHa110nqWmOY
 OWJmp5YF1U8LfNmdAi1wuRO0n5l5ZKflyeDdkQtHCm5D1Jy+6voSLm41d765iV+ayNsq
 KRO4nKvLxqGg2WgI4nXfKaPbIHYBgbKrB44atO9+rVR2MY9cJfvmGpzfhQ8IqRG4gXkg
 uzMQ==
X-Gm-Message-State: AOAM53220mHHwDobaBuGSbWyIBTUX916/JNT9BNAnrvGDESG0+Kz0IS3
 BQRXIs5WFDN9jqtwQAWSXJFk
X-Google-Smtp-Source: ABdhPJwVVDHmLdlkvPxa0RTx6TeaN8ENWRxxpE5tjoHD788yzE86ICDdkUJKi9NvVNz7J3GzX/2j1g==
X-Received: by 2002:aa7:9841:0:b0:439:c4cb:fe9a with SMTP id
 n1-20020aa79841000000b00439c4cbfe9amr6279540pfq.13.1631812772167; 
 Thu, 16 Sep 2021 10:19:32 -0700 (PDT)
Received: from thinkpad ([117.193.213.12])
 by smtp.gmail.com with ESMTPSA id o2sm3876721pgc.47.2021.09.16.10.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 10:19:31 -0700 (PDT)
Date: Thu, 16 Sep 2021 22:49:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210916171927.GB9027@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0jgxyjp.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_101933_483270_4D2E8C1E 
X-CRM114-Status: GOOD (  23.01  )
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

T24gVGh1LCBTZXAgMTYsIDIwMjEgYXQgMDc6NDI6MDJQTSArMDMwMCwgS2FsbGUgVmFsbyB3cm90
ZToKPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8u
b3JnPiB3cml0ZXM6Cj4gCj4gPiBPbiBUaHUsIFNlcCAxNiwgMjAyMSBhdCAwMToxODoyMlBNICsw
MjAwLCBMb2ljIFBvdWxhaW4gd3JvdGU6Cj4gPj4gTGUgamV1LiAxNiBzZXB0LiAyMDIxIMOgIDEz
OjEyLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPAo+ID4+IG1hbml2YW5uYW4uc2FkaGFzaXZhbUBs
aW5hcm8ub3JnPiBhIMOpY3JpdCA6Cj4gPj4gCj4gPgo+ID4gWy4uLl0KPiA+Cj4gPj4gPiBJZiB0
aGluZ3Mgc2VlbXMgdG8gd29yayBmaW5lIHdpdGhvdXQgdGhhdCBwYXRjaCwgdGhlbiBpdCBpbXBs
aWVzIHRoYXQKPiA+PiA+IHNldHRpbmcgTTAKPiA+PiA+IHN0YXRlIHdvcmtzIGR1cmluZyByZXN1
bWUuIEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgcmV2ZXJ0IHRoYXQgcGF0Y2guCj4gPj4gPgo+ID4+
ID4gTG9pYywgZGlkIHRoYXQgcGF0Y2ggZml4IGFueSBpc3N1ZSBmb3IgeW91IG9yIGl0IHdhcyBh
IGNvc21ldGljIGZpeCBvbmx5Pwo+ID4+IAo+ID4+IAo+ID4+IEl0IGZpeGVzIHNkeCBtb2RlbSBy
ZXN1bWluZyBpc3N1ZSwgd2l0aG91dCB0aGF0IHdlIGRvbuKAmXQga25vdyBtb2RlbSBuZWVkcwo+
ID4+IHRvIGJlIHJlaW5pdGlhbGl6ZWQuCj4gPj4gCj4gPgo+ID4gT2theS4gVGhlbiBpbiB0aGF0
IGNhc2UsIHRoZSByZWNvdmVyeSBtZWNoYW5pc20gaGFzIHRvIGJlIGFkZGVkIHRvIHRoZSBhdGgx
MWsKPiA+IE1ISSBjb250cm9sbGVyLgo+IAo+IFdoYXQgZG9lcyB0aGF0IG1lYW4gaW4gcHJhY3Rp
c2UsIGRvIHlvdSBoYXZlIGFueSBwb2ludGVycyBvciBleGFtcGxlcz8gSQo+IGhhdmUgbm8gY2x1
ZSB3aGF0IHlvdSBhcmUgcHJvcG9zaW5nIDopCj4gCgpUYWtlIGEgbG9vayBhdCB0aGUgbWhpX3Bj
aV9yZWNvdmVyeV93b3JrKCkgZnVuY3Rpb24gYmVsb3c6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMv
YnVzL21oaS9wY2lfZ2VuZXJpYy5jI242MTAKCllvdSBuZWVkIHRvIGltcGxlbWVudCBzb21ldGhp
bmcgc2ltaWxhciB0aGF0IGJhc2ljYWxseSBwb3dlcnMgdXAgdGhlIE1ISQplbmRwb2ludCAoUUNB
NjM5MCkgaW4gY2FzZSBwbV9yZXN1bWUoKSBmYWlscy4gQXQgbWluaW11bSwgeW91IG5lZWQgdG8g
Y2FsbApiZWxvdyBmdW5jdGlvbnM6CgojIENoZWNrIGlmIHRoZSBkZXZpY2UgaXMgcG93ZXJlZCBv
bi4gSWYgeWVzLCB0aGVuIHBvd2VyIGl0IGRvd24gdG8gYnJpbmcgaXQgYmFjawptaGlfcG93ZXJf
ZG93bigpCm1oaV91bnByZXBhcmVfYWZ0ZXJfcG93ZXJfZG93bigpCgojIFBvd2VyIHVwIHRoZSBk
ZXZpY2UKbWhpX3ByZXBhcmVfZm9yX3Bvd2VyX3VwKCkKbWhpX3N5bmNfcG93ZXJfdXAoKQoKVGhp
cyBpbXBsaWVzIHRoYXQgdGhlIFdMQU4gZGV2aWNlIGhhcyBiZWVuIHBvd2VyZWQgb2ZmIGR1cmlu
ZyBzdXNwZW5kLCBzbyB0aGUKcmVzdW1lIGZhaWxzIGFuZCB3ZSBhcmUgYnJpbmdpbmcgdGhlIGRl
dmljZSBiYWNrIHRvIHdvcmtpbmcgc3RhdGUuCgo+ID4gSWYgdGhhdCdzIHRvbyBtdWNoIG9mIHdv
cmsgZm9yIEthbGxlLCB0aGVuIEknbGwgbG9vayBpbnRvIGl0LiBCdXQgSSBtaWdodCBnZXQKPiA+
IHRpbWUgb25seSBhZnRlciBQbHVtYmVycy4KPiAKPiBJJ20gYnVzeSwgYXMgYWx3YXlzLCBzbyBu
b3Qgc3VyZSB3aGVuIEknbSBhYmxlIHRvIGRvIGl0IGVpdGhlci4gSSB0aGluawo+IHdlIHNob3Vs
ZCBzZXJpb3VzbHkgY29uc2lkZXIgcmV2ZXJ0aW5nIDAyMGQzYjI2YzA3YSBhbmQgYWRkaW5nIGl0
IGJhY2sKPiBhZnRlciBhdGgxMWsgaXMgYWJsZSB0byBoYW5kbGUgdGhpcyBuZXcgc2l0dWF0aW9u
Lgo+IAoKU2luY2UgTG9pYyBzYWlkIHRoYXQgcmV2ZXJ0aW5nIHdvdWxkIGNhdXNlIGhpcyBtb2Rl
bSAoU0RYIGRldmljZSkgdG8gZmFpbCBkdXJpbmcKcmVzdW1lLCB0aGlzIGlzIG5vdCBwb3NzaWJs
ZS4KClRoYW5rcywKTWFuaQoKPiAtLSAKPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KPiAKPiBodHRwczovL3dpcmVsZXNzLndpa2kua2Vy
bmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0t
IAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
