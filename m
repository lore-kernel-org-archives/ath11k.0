Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631E3C4320A
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2705C60FC1
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2705C60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muAUDC0Xshy0pmgFt3vLxZAKRXXc6iBBscv/5UrPQbk=; b=4TsQzTD0N93Ee46DSmGukCo0Wd
	GOokmbpkXdwUCnaC2IyQjqPOPXmTWsvYkiTdEQPd7WM6qrmxMmMZmaFzKuhxK868Su1kA02swPkzl
	TbTJaGVVmXILaOaNf1KlJIyFw0Mrx4vratsFKftwPmrnFa4OTmf5/HGcnPY5Pohnfl70z1r/wJZia
	hcn8Y4w/ciIvaRkDhDLtdHqQakuwcij6pftHDaghDvRioVHhJScH5WvedGgWVilbFDaHedoPGx+8Q
	meEcMH4BcAZTG77IGhTYSoNXo6MHNjTHZXi4ga+S2oNE0Xfk+5DXFhmyv07fO5/s4pyEGdHfesJxC
	HnEfdbBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJD5Y-009qQU-97; Thu, 26 Aug 2021 10:58:28 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJD5T-009qOi-7p
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 10:58:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629975503; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xZ9f5YweIHW3EJbHkWywB5FAVNNQmgT1gvPPdXZDi6M=;
 b=eakUkB5iQXTXhPlik8npZCDpPb22nEfyCguRbzIPWQODdTQwXq5DPsGmxGU/a0RCTci3TB2B
 l9Dhh7SK6foIhn1wZX9HUgRABxXozbf3QjxcaEo7RoGae+daLx3U4KKCIXde9vWFOZ6+1wtV
 7rGzPdiqK3xL1/WMCgvj/hyEzlY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 612773ce40d2129ac11371b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 10:58:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0F617C43460; Thu, 26 Aug 2021 10:58:22 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CAA95C4338F;
 Thu, 26 Aug 2021 10:58:21 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 18:58:21 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 5/8] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <b3d00d00525bbc2a31653df6c0ce72cfb4d1c8d7.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-6-wgong@codeaurora.org>
 <101b523a6fe06fea3e1c9642a1bf5e85a9d0e680.camel@sipsolutions.net>
 <4eca272868dae4f7a923656a12b03024@codeaurora.org>
 <b3d00d00525bbc2a31653df6c0ce72cfb4d1c8d7.camel@sipsolutions.net>
Message-ID: <ed8cc5660a16e2249f3043401de2ad98@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_035823_383750_8BF335A0 
X-CRM114-Status: GOOD (  13.10  )
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

T24gMjAyMS0wOC0yNiAxODo1NiwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBUaHUsIDIwMjEt
MDgtMjYgYXQgMTg6NDMgKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+PiBPbiAyMDIxLTA4LTI2IDE2
OjI1LCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+PiA+IEkgd2FzIGdvaW5nIHRvIGFwcGx5IHRoaXMg
YW5kIHBhdGNoIDQgc3F1YXNoZWQsIHNheWluZzoKPj4gPgo+PiA+Cj4+ID4gwqDCoMKgwqBjZmc4
MDIxMTogcmVndWxhdG9yeTogaGFuZGxlIDYgR0h6IHBvd2VyIHNwZWN0cmFsIGRlbnNpdHkgKFBT
RCkKPj4gPgo+PiA+IMKgwqDCoMKgNiBHSHogcmVndWxhdG9yeSBkb21haW5zIGludHJvZHVjZSBw
b3dlciBzcGVjdHJhbCBkZW5zaXR5IChQU0QpLgo+PiA+IMKgwqDCoMKgQWxsb3cgd2lwaHktc3Bl
Y2lmaWMgcmVndWxhdG9yeSBydWxlcyB0byBzcGVjaWZ5IHRoZXNlIHZhbHVlcy4KPj4gPgo+PiA+
IGJ1dCAuLi4KPj4gPiA+Cj4+ID4gPiArCQlpZiAoY2hhbi0+ZmxhZ3MgJiBJRUVFODAyMTFfQ0hB
Tl9QU0QpCj4+ID4gPiArCQkJY2hhbi0+cHNkID0gbWluX3QoczgsIHJydWxlMS0+cHNkLCBycnVs
ZTEtPnBzZCk7Cj4+ID4gPiArCj4+ID4KPj4gPiBUaGlzIGlzIG9idmlvdXNseSB3cm9uZz8KPj4g
WWVzIGl0IHNob3VsZCBjaGFuZ2UgbGlrZSB0aGlzOgo+PiAKPj4gCWlmICgocnJ1bGUxLT5mbGFn
cyAmIE5MODAyMTFfUlJGX1BTRCkgJiYgKHJydWxlMS0+ZmxhZ3MgJgo+PiBOTDgwMjExX1JSRl9Q
U0QpKQo+PiAJCWNoYW4tPnBzZCA9IG1pbl90KHM4LCBycnVsZTEtPnBzZCwgcnJ1bGUxLT5wc2Qp
Owo+IAo+IE9uZSBvZiB0aG9zZSBzdGlsbCBzaG91bGQgYmUgcnJ1bGUyIDopCj4gCnllcwogICAg
IGlmICgocnJ1bGUxLT5mbGFncyAmIE5MODAyMTFfUlJGX1BTRCkgJiYgKHJydWxlMi0+ZmxhZ3Mg
JiAKTkw4MDIxMV9SUkZfUFNEKSkKICAgICAgICAgY2hhbi0+cHNkID0gbWluX3QoczgsIHJydWxl
MS0+cHNkLCBycnVsZTItPnBzZCk7CiAgICAgZWxzZQogICAgICAgICBjaGFuLT5mbGFncyAmPSB+
Tkw4MDIxMV9SUkZfUFNEOwo+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgx
MWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDExawo=
