Return-Path: <SRS0=v7OI=IX=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761E0C433C1
	for <ath11k@archiver.kernel.org>; Thu, 25 Mar 2021 08:06:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D701961963
	for <ath11k@archiver.kernel.org>; Thu, 25 Mar 2021 08:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D701961963
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=txS5ITQ1Q9afBW71TkiXw8CJXsssLLKON6TvWZQa+1U=; b=bG1UjmnWN7PQS7V/ALLZmHDRd
	S8GtLYwds1PUgk44zfqWtR7GurO4KKRyhSCLWQD1Z9CpBFCWkD9wtESigpqgJBONwd3zvxLAGKNVp
	WgXTsHy0tZMt+amdLkRrS+YB2IGYulS+lX9GmS1TCisbkQDPaG02qLoDo/ahkgfSL1KaTkfZwvnLW
	SliXOOo9nvPplRK8ZFI0nHlR1wm9GEqRadE+4xUBFwSE88iVpmEiKzZ9ttRX54h1Dxj3PrhKhGP2m
	DurMrQk573trwVhSFxKUQaJurW6r+hhwJzhjc5AqexRt3RFnkV+/4ub+jmCExPW4vhhizQVeWcuDw
	jRcWcgbMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPL0s-000tyS-L9; Thu, 25 Mar 2021 08:06:42 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPKzc-000tkO-GI; Thu, 25 Mar 2021 08:05:29 +0000
IronPort-SDR: y62r0+EfSCXgBUJxfKuYOa2+DZ9BsVpXwtMMK//uRtOsrB5+0S10jXlJpXreYZQLyb8M28rkqi
 AhCP+oZzTm4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="211005798"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="211005798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 01:05:21 -0700
IronPort-SDR: YSlh8X6JrYCAgcFAjL5XZMs9hqgR3pcWRIp1+nLDHbTGxn8DfB0UC8NvUc6Fyh2eKqFMEpwwEz
 JeibtqsaiX5Q==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="415886752"
Received: from jweber-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 01:05:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Martin Sebor <msebor@gcc.gnu.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Ning Sun
 <ning.sun@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Simon Kelley
 <simon@thekelleys.org.uk>, James Smart <james.smart@broadcom.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Anders Larsen <al@alarsen.net>,
 Tejun Heo <tj@kernel.org>, Serge Hallyn <serge@hallyn.com>, Imre Deak
 <imre.deak@intel.com>, linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Manasi Navare
 <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>, Ankit
 Nautiyal <ankit.k.nautiyal@intel.com>, Gwan-gyeong Mun
 <gwan-gyeong.mun@intel.com>, Animesh Manna <animesh.manna@intel.com>, Sean
 Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 11/11] [RFC] drm/i915/dp: fix array overflow warning
In-Reply-To: <20210322160253.4032422-12-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-12-arnd@kernel.org>
Date: Thu, 25 Mar 2021 10:05:06 +0200
Message-ID: <87wntv3bgt.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_080525_247943_BE9628A1 
X-CRM114-Status: GOOD (  24.15  )
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

T24gTW9uLCAyMiBNYXIgMjAyMSwgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90
ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gZ2NjLTExIHdhcm5z
IHRoYXQgaW50ZWxfZHBfY2hlY2tfbXN0X3N0YXR1cygpIGhhcyBhIGxvY2FsIGFycmF5IG9mCj4g
Zm91cnRlZW4gYnl0ZXMgYW5kIHBhc3NlcyB0aGUgbGFzdCBmb3VyIGJ5dGVzIGludG8gYSBmdW5j
dGlvbiB0aGF0Cj4gZXhwZWN0cyBhIHNpeC1ieXRlIGFycmF5Ogo+Cj4gZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jOiBJbiBmdW5jdGlvbiDigJhpbnRlbF9kcF9jaGVja19t
c3Rfc3RhdHVz4oCZOgo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzo0
NTU2OjIyOiBlcnJvcjog4oCYZHJtX2RwX2NoYW5uZWxfZXFfb2vigJkgcmVhZGluZyA2IGJ5dGVz
IGZyb20gYSByZWdpb24gb2Ygc2l6ZSA0IFstV2Vycm9yPXN0cmluZ29wLW92ZXJyZWFkXQo+ICA0
NTU2IHwgICAgICAgICAgICAgICAgICAgICAhZHJtX2RwX2NoYW5uZWxfZXFfb2soJmVzaVsxMF0s
IGludGVsX2RwLT5sYW5lX2NvdW50KSkgewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzo0NTU2OjIyOiBub3RlOiByZWZl
cmVuY2luZyBhcmd1bWVudCAxIG9mIHR5cGUg4oCYY29uc3QgdTggKuKAmSB7YWthIOKAmGNvbnN0
IHVuc2lnbmVkIGNoYXIgKuKAmX0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jOjM4Ogo+IGluY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaDoxNDU5OjY6IG5vdGU6IGluIGEgY2FsbCB0byBmdW5jdGlvbiDigJhkcm1fZHBfY2hhbm5l
bF9lcV9va+KAmQo+ICAxNDU5IHwgYm9vbCBkcm1fZHBfY2hhbm5lbF9lcV9vayhjb25zdCB1OCBs
aW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKPiAgICAgICB8ICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KPgo+IENsZWFybHkgc29tZXRoaW5nIGlzIHdyb25nIGhlcmUsIGJ1dCBJIGNh
bid0IHF1aXRlIGZpZ3VyZSBvdXQgd2hhdC4KPiBDaGFuZ2luZyB0aGUgYXJyYXkgc2l6ZSB0byAx
NiBieXRlcyBhdm9pZHMgdGhlIHdhcm5pbmcsIGJ1dCBpcwo+IHByb2JhYmx5IHRoZSB3cm9uZyBz
b2x1dGlvbiBoZXJlLgoKVWdoLiBkcm1fZHBfY2hhbm5lbF9lcV9vaygpIGRvZXMgbm90IGFjdHVh
bGx5IHJlcXVpcmUgbW9yZSB0aGFuCkRQX0xJTktfU1RBVFVTX1NJWkUgLSAyIGVsZW1lbnRzIGlu
IHRoZSBsaW5rX3N0YXR1cy4gSXQncyBzb21lIG90aGVyCnJlbGF0ZWQgZnVuY3Rpb25zIHRoYXQg
ZG8sIGFuZCBpbiBtb3N0IGNhc2VzIGl0J3MgY29udmVuaWVudCB0byByZWFkIGFsbAp0aG9zZSBE
UF9MSU5LX1NUQVRVU19TSVpFIGJ5dGVzLgoKSG93ZXZlciwgaGVyZSB0aGUgY2FzZSBpcyBzbGln
aHRseSBkaWZmZXJlbnQgZm9yIERQIE1TVCwgYW5kIHRoZSBjaGFuZ2UKY2F1c2VzIHJlc2VydmVk
IERQQ0QgYWRkcmVzc2VzIHRvIGJlIHJlYWQuIE5vdCBzdXJlIGl0IG1hdHRlcnMsIGJ1dApyZWFs
bHkgSSB0aGluayB0aGUgcHJvYmxlbSBpcyB3aGF0IGRybV9kcF9jaGFubmVsX2VxX29rKCkgYWR2
ZXJ0aXplcy4KCkkgYWxzbyBkb24ndCBsaWtlIHRoZSBhcnJheSBub3RhdGlvbiB3aXRoIHNpemVz
IGluIGZ1bmN0aW9uIHBhcmFtZXRlcnMKaW4gZ2VuZXJhbCwgYmVjYXVzZSBJIHRoaW5rIGl0J3Mg
bWlzbGVhZGluZy4gV291bGQgZ2NjLTExIHdhcm4gaWYgYQpmdW5jdGlvbiBhY3R1YWxseSBhY2Nl
c3NlcyB0aGUgbWVtb3J5IG91dCBvZiBib3VuZHMgb2YgdGhlIHNpemU/CgpBbnl3YXkuIEkgZG9u
J3QgdGhpbmsgd2UncmUgZ29pbmcgdG8gZ2V0IHJpZCBvZiB0aGUgYXJyYXkgbm90YXRpb24KYW55
dGltZSBzb29uLCBpZiBldmVyLCBubyBtYXR0ZXIgaG93IG11Y2ggSSBkaXNsaWtlIGl0LCBzbyBJ
IHRoaW5rIHRoZQpyaWdodCBmaXggd291bGQgYmUgdG8gYXQgbGVhc3Qgc3RhdGUgdGhlIGNvcnJl
Y3QgcmVxdWlyZWQgc2l6ZSBpbgpkcm1fZHBfY2hhbm5lbF9lcV9vaygpLgoKCkJSLApKYW5pLgoK
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+IGluZGV4IDhjMTJkNTM3NTYwNy4uODMwZTI1MTVm
MTE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+IEBAIC02
NSw3ICs2NSw3IEBACj4gICNpbmNsdWRlICJpbnRlbF92ZHNjLmgiCj4gICNpbmNsdWRlICJpbnRl
bF92cnIuaCIKPiAgCj4gLSNkZWZpbmUgRFBfRFBSWF9FU0lfTEVOIDE0Cj4gKyNkZWZpbmUgRFBf
RFBSWF9FU0lfTEVOIDE2Cj4gIAo+ICAvKiBEUCBEU0MgdGhyb3VnaHB1dCB2YWx1ZXMgdXNlZCBm
b3Igc2xpY2UgY291bnQgY2FsY3VsYXRpb25zIEtQaXhlbHMvcyAqLwo+ICAjZGVmaW5lIERQX0RT
Q19QRUFLX1BJWEVMX1JBVEUJCQkyNzIwMDAwCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4g
U291cmNlIEdyYXBoaWNzIENlbnRlcgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMWsK
