Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A63C433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:15:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D02B60FE3
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D02B60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nER8cLMPGi+aMpEVoYnbH9IkFB0dj0Tnr10b869MK8g=; b=wjsMA9AWxolQwfjqbzg91RHspp
	zx/2tsTgZKeo9IgaIuuYjnXXC43lltFoJkZrHqgqPSfSyN5wtAivsMu3qBIPoGfT08XxBKRPFNbvv
	LqixRrVbmqPnWhUL74Nj80vgdek/jxOherQsNyk+WaD7II4kvW+D/9549f8SJ5LzsovD0WllvYojp
	2+GQKzTQOwi1WilBR8U4qCQXazk5CDSDx/8ZJ9CElvVhNECfIuPmMTjvTF06Y71RDoGk86phfxfvv
	riXCIEuIxP9Q9d7tFKPNsgQdqzHCFdFGAhTbnXeZX+LjPyDEuG/SxYBXfPOEWbL/2UKTXp9RLb4iD
	yp4KOdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV9Cj-006W8n-Jo; Tue, 28 Sep 2021 09:15:13 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV938-006RHy-GN
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 09:05:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632819918; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AEADEe6Ao53VNzkjzr4ASMukE0IbDTiq22jiTURIqwU=;
 b=W9FanhFTRng4wK42cjadtxBtmiDVVQ+S5OqNqKbZTwlWYb0eTDURxYs4l57ZtC0Jq0ZuFiZ5
 gIYK64FcUUUgirmdoapVsCP5VHp0vo/2G+jeRSAs2yt+V3dBla5lfIrfH09RLogEczZLo4JG
 DDIHsGhqOiNSwSdDvb2FANZt9QI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6152dacd9ffb41314996308b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 09:05:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31035C43617; Tue, 28 Sep 2021 09:05:17 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 87F1EC43460;
 Tue, 28 Sep 2021 09:05:16 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 28 Sep 2021 17:05:16 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 4/6] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <a4e56dbbe88771456bcf3051a0891d66d5e34fd4.camel@sipsolutions.net>
References: <20210924100052.32029-1-wgong@codeaurora.org>
 <20210924100052.32029-5-wgong@codeaurora.org>
 <a4e56dbbe88771456bcf3051a0891d66d5e34fd4.camel@sipsolutions.net>
Message-ID: <5b40dee9ca9d91bb0ca6aaa82deae370@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_020518_670549_D7780A98 
X-CRM114-Status: GOOD (  27.15  )
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

T24gMjAyMS0wOS0yNyAxOToyNywgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBGcmksIDIwMjEt
MDktMjQgYXQgMDY6MDAgLTA0MDAsIFdlbiBHb25nIHdyb3RlOgo+PiBUaGUgcG93ZXIgc3BlY3Ry
YWwgZGVuc2l0eShwc2QpIG9mIHJlZ3VsYXRvcnkgcnVsZSBzaG91bGQgYmUgdGFrZQo+PiBlZmZl
Y3QgdG8gdGhlIGNoYW5uZWxzLiBUaGlzIHBhdGNoIGlzIHRvIHNhdmUgdGhlIHZhbHVlcyB0byB0
aGUKPj4gY2hhbm5lbCB3aGljaCBoYXMgcHNkIHZhbHVlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTog
V2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPgo+PiAtLS0KPj4gwqBuZXQvd2lyZWxlc3Mv
cmVnLmMgfCAxNyArKysrKysrKysrKysrKysrKwo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvbmV0L3dpcmVsZXNzL3JlZy5jIGIvbmV0L3dp
cmVsZXNzL3JlZy5jCj4+IGluZGV4IGRmODdjN2YzYTA0OS4uOGY3NjViZWZiOWJjIDEwMDY0NAo+
PiAtLS0gYS9uZXQvd2lyZWxlc3MvcmVnLmMKPj4gKysrIGIvbmV0L3dpcmVsZXNzL3JlZy5jCj4+
IEBAIC0xNTkwLDYgKzE1OTAsOCBAQCBzdGF0aWMgdTMyIG1hcF9yZWdkb21fZmxhZ3ModTMyIHJk
X2ZsYWdzKQo+PiDCoAkJY2hhbm5lbF9mbGFncyB8PSBJRUVFODAyMTFfQ0hBTl9OT18xNjBNSFo7
Cj4+IMKgCWlmIChyZF9mbGFncyAmIE5MODAyMTFfUlJGX05PX0hFKQo+PiDCoAkJY2hhbm5lbF9m
bGFncyB8PSBJRUVFODAyMTFfQ0hBTl9OT19IRTsKPj4gKwlpZiAocmRfZmxhZ3MgJiBOTDgwMjEx
X1JSRl9QU0QpCj4+ICsJCWNoYW5uZWxfZmxhZ3MgfD0gSUVFRTgwMjExX0NIQU5fUFNEOwo+IAo+
IEkgd2VudCB0byBnbyBzcXVhc2ggdGhpcyB3aXRoIHBhdGNoIDMgYW5kIHRvb2sgYSBjbG9zZXIg
bG9vaywgYW5kIHRoZW4gCj4gSQo+IHJlYWxpemVkIHlvdSdyZSBkb2luZyB0aGlzIHdlaXJkLgo+
IAo+IFBsZWFzZSB3aGVuIHlvdSByZXNlbmQgYWxzbyBzcXVhc2ggdGhpcyAtIGl0J3MgYSBiaXQg
d2VpcmQgdG8gcmVhZCBpbgo+IHR3byBwYXRjaGVzLgo+IAo+IEhvd2V2ZXIsIEkgdGhpbmsgdGhp
cyBpcyBtaXNzaW5nIGEgbG90IG9mIHRoaW5ncyAtIHdlIGFscmVhZHkgdGFsa2VkCj4gYWJvdXQg
dGhlIHJlZ3VsYXRvcnkgZGF0YWJhc2UsIGFuZCB3aGlsZSB0aGF0J2QgYmUgbmljZSwgSSBndWVz
cyBJCj4gY29uY2VkZWQgdGhhdCB5b3UgZG9uJ3QgcmVhbGx5IGhhdmUgdG8gZG8gaXQgbm93Lgo+
IAo+IEhvd2V2ZXIsIGZvciB2aXNpYmlsaXR5IHJlYXNvbnMsIEkgKnJlYWxseSogdGhpbmsgeW91
IG5lZWQgdG8gYWRkCj4gbmw4MDIxMSBhdHRyaWJ1dGVzIGZvciBhbGwgb2YgdGhpcyBkYXRhIC0g
d2hlbiB0aGUgcmVnZG9tYWluIGlzIGR1bXBlZAo+IGluIG5sODAyMTFfcHV0X3JlZ2RvbSgpIHlv
dSB3b3VsZCBoYXZlIHRoZSBmbGFnIG5vdyAoaXQgZHVtcHMgdGhlIHZhbHVlCj4gb2YgcmVnX3J1
bGUtPmZsYWdzIGluIE5MODAyMTFfQVRUUl9SRUdfUlVMRV9GTEFHUyksIGJ1dCB5b3UgZGlkbid0
IGFkZAo+IHRoZSB2YWx1ZSBvZiByZWdfcnVsZS0+cHNkIHdoaWNoIHlvdSd2ZSBhZGRlZC4KPiAK
PiBTaW1pbGFybHksIHlvdSdyZSBub3QgYWRkaW5nIHRoZSBQU0QgZmxhZyBub3IgdGhlIFBTRCB2
YWx1ZSBmb3IgdGhlCj4gKmNoYW5uZWwqIGluIG5sODAyMTFfbXNnX3B1dF9jaGFubmVsKCksIGJv
dGggb2Ygd2hpY2ggSSB0aGluayB5b3UgCj4gc2hvdWxkCj4gaGF2ZSBmb3IgdmlzaWJpbGl0eSBp
bnRvIHdoYXQncyBnb2luZyBvbiBpbiB0aGUga2VybmVsL2RyaXZlci4KPiAKPiBJJ3ZlIGFwcGxp
ZWQgYWxsIHRoZSBvdGhlciBwYXRjaGVzLCBzbyBwbGVhc2UganVzdCByZXNlbmQgMyBhbmQgNCwK
PiBzcXVhc2hlZCBpbnRvIGEgc2luZ2xlIHBhdGNoLCB3aXRoIHRoZSBmaXhlcy4KPiAKClRoYW5r
cwoKSSBoYXZlIHNlbnQgIltQQVRDSCB2NV0gY2ZnODAyMTE6IHNhdmUgcG93ZXIgc3BlY3RyYWwg
ZGVuc2l0eShwc2QpIG9mIApyZWd1bGF0b3J5IHJ1bGUiCmZvciB0aGlzLgoKPiBqb2hhbm5lcwoK
LS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
