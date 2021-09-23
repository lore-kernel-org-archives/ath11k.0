Return-Path: <SRS0=q7Iz=ON=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C138CC433EF
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 08:35:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8265F6103C
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 08:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8265F6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlV+RAGTTeAEKpaXUXEiPuSOcq+5qTD1JYxDzHwv8m8=; b=I9gX2x2dKAGVwpRYGVUkq/c7kc
	6W4mF3s/Cu0nxddOwXQ+1swn0yJGMbEDPk3MHrNXbtVVMKpKh2lFFfyjRCzhzdix7oCXkG21mus0F
	q2Bsu3/JX1xBv7tqFK5RnN7kxHmIpVRXdH+r7cdeBvRC0FxszUGiRsuT+VKkmdFtizwFApE0GXiS/
	xxw/sMroUruPwoVTY3Ohbz6Sj7YONiZLgpRXm+jo5k2yTbI6QykNlRMbPqzouhXsVS55BQYMiQaib
	/T9ivFtF6ZW2Xp55mul/2JUrYrF6pvJovwS/cIUOp82lZeyDnhamQAwvuYEK0BNiC6d2gxvufTZle
	spzgfHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTKC3-00AeMU-2v; Thu, 23 Sep 2021 08:34:59 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTKBx-00AeLp-7a
 for ath11k@lists.infradead.org; Thu, 23 Sep 2021 08:34:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632386095; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RnAXDb/cdy2vNbulmV0mjCa/sumMUiZffdwxvVj6GIc=;
 b=cW9PSa2vkgAC1C2jWPdnY4eQoGM4YXTNrD6uMxJKcC10Ks2xCdFfJ7vvn8rh/tiem4U5MSsv
 xJ5TTQvA34kXRIHfecOUJIT4mpm7KiopmDrSz85MmWiHMTaEhrrf1NyFWAZAJ1ZHOkQdO8F8
 vAJ720bZrshpZ55/Jfu2rUednps=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 614c3c24ec62f57c9ad4da86 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Sep 2021 08:34:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DB83CC4360C; Thu, 23 Sep 2021 08:34:43 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 10B7EC4338F;
 Thu, 23 Sep 2021 08:34:43 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 23 Sep 2021 16:34:43 +0800
From: Carl Huang <cjhuang@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Loic Poulain
 <loic.poulain@linaro.org>, ath11k@lists.infradead.org, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
In-Reply-To: <20210916171927.GB9027@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
 <20210916171927.GB9027@thinkpad>
Message-ID: <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
X-Sender: cjhuang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_013456_118566_72EC25F5 
X-CRM114-Status: GOOD (  25.65  )
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

T24gMjAyMS0wOS0xNyAwMToxOSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+IE9uIFRo
dSwgU2VwIDE2LCAyMDIxIGF0IDA3OjQyOjAyUE0gKzAzMDAsIEthbGxlIFZhbG8gd3JvdGU6Cj4+
IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+
IHdyaXRlczoKPj4gCj4+ID4gT24gVGh1LCBTZXAgMTYsIDIwMjEgYXQgMDE6MTg6MjJQTSArMDIw
MCwgTG9pYyBQb3VsYWluIHdyb3RlOgo+PiA+PiBMZSBqZXUuIDE2IHNlcHQuIDIwMjEgw6AgMTM6
MTIsIE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8Cj4+ID4+IG1hbml2YW5uYW4uc2FkaGFzaXZhbUBs
aW5hcm8ub3JnPiBhIMOpY3JpdCA6Cj4+ID4+Cj4+ID4KPj4gPiBbLi4uXQo+PiA+Cj4+ID4+ID4g
SWYgdGhpbmdzIHNlZW1zIHRvIHdvcmsgZmluZSB3aXRob3V0IHRoYXQgcGF0Y2gsIHRoZW4gaXQg
aW1wbGllcyB0aGF0Cj4+ID4+ID4gc2V0dGluZyBNMAo+PiA+PiA+IHN0YXRlIHdvcmtzIGR1cmlu
ZyByZXN1bWUuIEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgcmV2ZXJ0IHRoYXQgcGF0Y2guCj4+ID4+
ID4KPj4gPj4gPiBMb2ljLCBkaWQgdGhhdCBwYXRjaCBmaXggYW55IGlzc3VlIGZvciB5b3Ugb3Ig
aXQgd2FzIGEgY29zbWV0aWMgZml4IG9ubHk/Cj4+ID4+Cj4+ID4+Cj4+ID4+IEl0IGZpeGVzIHNk
eCBtb2RlbSByZXN1bWluZyBpc3N1ZSwgd2l0aG91dCB0aGF0IHdlIGRvbuKAmXQga25vdyBtb2Rl
bSBuZWVkcwo+PiA+PiB0byBiZSByZWluaXRpYWxpemVkLgo+PiA+Pgo+PiA+Cj4+ID4gT2theS4g
VGhlbiBpbiB0aGF0IGNhc2UsIHRoZSByZWNvdmVyeSBtZWNoYW5pc20gaGFzIHRvIGJlIGFkZGVk
IHRvIHRoZSBhdGgxMWsKPj4gPiBNSEkgY29udHJvbGxlci4KPj4gCj4+IFdoYXQgZG9lcyB0aGF0
IG1lYW4gaW4gcHJhY3Rpc2UsIGRvIHlvdSBoYXZlIGFueSBwb2ludGVycyBvciBleGFtcGxlcz8g
Cj4+IEkKPj4gaGF2ZSBubyBjbHVlIHdoYXQgeW91IGFyZSBwcm9wb3NpbmcgOikKPj4gCj4gCj4g
VGFrZSBhIGxvb2sgYXQgdGhlIG1oaV9wY2lfcmVjb3Zlcnlfd29yaygpIGZ1bmN0aW9uIGJlbG93
Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvYnVzL21oaS9wY2lfZ2VuZXJpYy5jI242MTAKPiAK
PiBZb3UgbmVlZCB0byBpbXBsZW1lbnQgc29tZXRoaW5nIHNpbWlsYXIgdGhhdCBiYXNpY2FsbHkg
cG93ZXJzIHVwIHRoZSAKPiBNSEkKPiBlbmRwb2ludCAoUUNBNjM5MCkgaW4gY2FzZSBwbV9yZXN1
bWUoKSBmYWlscy4gQXQgbWluaW11bSwgeW91IG5lZWQgdG8gCj4gY2FsbAo+IGJlbG93IGZ1bmN0
aW9uczoKPiAKPiAjIENoZWNrIGlmIHRoZSBkZXZpY2UgaXMgcG93ZXJlZCBvbi4gSWYgeWVzLCB0
aGVuIHBvd2VyIGl0IGRvd24gdG8gCj4gYnJpbmcgaXQgYmFjawo+IG1oaV9wb3dlcl9kb3duKCkK
PiBtaGlfdW5wcmVwYXJlX2FmdGVyX3Bvd2VyX2Rvd24oKQo+IAo+ICMgUG93ZXIgdXAgdGhlIGRl
dmljZQo+IG1oaV9wcmVwYXJlX2Zvcl9wb3dlcl91cCgpCj4gbWhpX3N5bmNfcG93ZXJfdXAoKQo+
IAo+IFRoaXMgaW1wbGllcyB0aGF0IHRoZSBXTEFOIGRldmljZSBoYXMgYmVlbiBwb3dlcmVkIG9m
ZiBkdXJpbmcgc3VzcGVuZCwgCj4gc28gdGhlCj4gcmVzdW1lIGZhaWxzIGFuZCB3ZSBhcmUgYnJp
bmdpbmcgdGhlIGRldmljZSBiYWNrIHRvIHdvcmtpbmcgc3RhdGUuCj4gClRoaXMgaXMgZmluZSBm
b3IgcGxhdGZvcm0gd2hpY2ggZG9lc24ndCBwcm92aWRlIHBvd2VyIHN1cHBseSBkdXJpbmcgCnN1
c3BlbmQuCkJ1dCBOVUMgaGFzIHBvd2VyIHN1cHBseSBpbiBzdXNwZW5kIHN0YXRlLgpRQ0E2Mzkw
IG9uIE5VQyB3b3JrcyBhZnRlciBqdXN0IHJldmVydGluZyB0aGlzIGNvbW1pdCBhbHNvIHByb3Zl
cyBOVUMgCmhhcyBwb3dlciBzdXBwbHkgaW4Kc3VzcGVuZCBzdGF0ZS4KClRoZSByZWFzb24gaXMg
TUhJLVNUQVRVUyByZWdpc3RlciBjYW4ndCBiZSByZWFkIHNvbWVob3cgaW4gTTMgc3RhdGUgb24g
Ck5VQy4KRG9lcyB0aGUgTUhJIHNwZWMgc3RhdGUgdGhhdCBNSEktU1RBVFVTIHJlZ2lzdGVyIGNh
biBiZSByZWFkIGluIE0zIApzdGF0ZT8KCj4+ID4gSWYgdGhhdCdzIHRvbyBtdWNoIG9mIHdvcmsg
Zm9yIEthbGxlLCB0aGVuIEknbGwgbG9vayBpbnRvIGl0LiBCdXQgSSBtaWdodCBnZXQKPj4gPiB0
aW1lIG9ubHkgYWZ0ZXIgUGx1bWJlcnMuCj4+IAo+PiBJJ20gYnVzeSwgYXMgYWx3YXlzLCBzbyBu
b3Qgc3VyZSB3aGVuIEknbSBhYmxlIHRvIGRvIGl0IGVpdGhlci4gSSAKPj4gdGhpbmsKPj4gd2Ug
c2hvdWxkIHNlcmlvdXNseSBjb25zaWRlciByZXZlcnRpbmcgMDIwZDNiMjZjMDdhIGFuZCBhZGRp
bmcgaXQgYmFjawo+PiBhZnRlciBhdGgxMWsgaXMgYWJsZSB0byBoYW5kbGUgdGhpcyBuZXcgc2l0
dWF0aW9uLgo+PiAKPiAKPiBTaW5jZSBMb2ljIHNhaWQgdGhhdCByZXZlcnRpbmcgd291bGQgY2F1
c2UgaGlzIG1vZGVtIChTRFggZGV2aWNlKSB0byAKPiBmYWlsIGR1cmluZwo+IHJlc3VtZSwgdGhp
cyBpcyBub3QgcG9zc2libGUuCj4gCj4gVGhhbmtzLAo+IE1hbmkKPiAKPj4gLS0KPj4gaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCj4+IAo+
PiBodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50
YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTFrCg==
