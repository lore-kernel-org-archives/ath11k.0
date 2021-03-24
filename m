Return-Path: <SRS0=tZkC=IW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F3BC433DB
	for <ath11k@archiver.kernel.org>; Wed, 24 Mar 2021 15:31:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF67F619FF
	for <ath11k@archiver.kernel.org>; Wed, 24 Mar 2021 15:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF67F619FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gfUPJyyQyWEJChebsewc+r16balpWZkvStpGWqlAv/I=; b=HrqFn1nmaM9WCrgMUZhsD5ctQ
	ZGGEhGPdDg0qREQWGJ4PuhcyP0nLKhtdm8ssAl8wKIpSQLRqXM7vPNtZzXqw7qpWbxtA8iB/6trMv
	CY41QMD7zwOVc/Mb4+bYLDhRWvaTKXlykWjInznki0TjiinRXkXotMwcM7Cys9lkcCHpGPbUqMIKv
	AXPPjELVu0OhR5nJzLqhnEviDIbivXNsGPsDiphjP8J9GqgavNkNXb2k2wqGkbNANX2iOf30q7ApV
	K8gCXN6qaS1UiJf5T3zu+HWWhHwCelr/P1FRRJdoqq0KjoKDMiYuqVlr6Bea7W4fhm/WsoTN6mHEM
	v+zdYJs2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP5TG-00HIS6-9a; Wed, 24 Mar 2021 15:30:58 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP5T5-00HIPd-0U; Wed, 24 Mar 2021 15:30:49 +0000
IronPort-SDR: 2U6lb/U+CLS/uRRkP0w2Hfn1X6Ko2pGjPB7ZWqyylhc6tqPacFC5hYHT9zsSmucxVAGQ8Z+m4X
 TYUf25opVxzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188427213"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="188427213"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 08:30:38 -0700
IronPort-SDR: /4dqq/0JWisBWvhTbTEBIBwFyl3ZwxDSlbNQvn9KHdRvSPPQs9Sb14vUi+jgB7se4K1pbShwF/
 LGKAbJDldGYw==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="415534424"
Received: from hcarliss-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.166])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 08:30:27 -0700
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
 linux-security-module@vger.kernel.org, Chris Wilson
 <chris@chris-wilson.co.uk>, =?utf-8?Q?Jos=C3=A9?= Roberto de Souza
 <jose.souza@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Aditya Swarup <aditya.swarup@intel.com>
Subject: Re: [PATCH 10/11] drm/i915: avoid stringop-overread warning on
 pri_latency
In-Reply-To: <20210322160253.4032422-11-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-11-arnd@kernel.org>
Date: Wed, 24 Mar 2021 17:30:24 +0200
Message-ID: <874kh04lin.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_153047_429688_ED7E46AC 
X-CRM114-Status: GOOD (  22.00  )
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
IGFib3V0IHdoYXQgYXBwZWFycyB0byBiZSBhbiBvdXQtb2YtcmFuZ2UgYXJyYXkgYWNjZXNzOgo+
Cj4gSW4gZnVuY3Rpb24g4oCYc25iX3dtX2xhdGVuY3lfcXVpcmvigJksCj4gICAgIGlubGluZWQg
ZnJvbSDigJhpbGtfc2V0dXBfd21fbGF0ZW5jeeKAmSBhdCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9wbS5jOjMxMDg6MzoKPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjMwNTc6
OTogZXJyb3I6IOKAmGludGVsX3ByaW50X3dtX2xhdGVuY3nigJkgcmVhZGluZyAxNiBieXRlcyBm
cm9tIGEgcmVnaW9uIG9mIHNpemUgMTAgWy1XZXJyb3I9c3RyaW5nb3Atb3ZlcnJlYWRdCj4gIDMw
NTcgfCAgICAgICAgIGludGVsX3ByaW50X3dtX2xhdGVuY3koZGV2X3ByaXYsICJQcmltYXJ5Iiwg
ZGV2X3ByaXYtPndtLnByaV9sYXRlbmN5KTsKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYzogSW4gZnVuY3Rpb24g4oCYaWxrX3Nl
dHVwX3dtX2xhdGVuY3nigJk6Cj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYzozMDU3
Ojk6IG5vdGU6IHJlZmVyZW5jaW5nIGFyZ3VtZW50IDMgb2YgdHlwZSDigJhjb25zdCB1MTYgKuKA
mSB7YWthIOKAmGNvbnN0IHNob3J0IHVuc2lnbmVkIGludCAq4oCZfQo+IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX3BtLmM6Mjk5NDoxMzogbm90ZTogaW4gYSBjYWxsIHRvIGZ1bmN0aW9uIOKA
mGludGVsX3ByaW50X3dtX2xhdGVuY3nigJkKPiAgMjk5NCB8IHN0YXRpYyB2b2lkIGludGVsX3By
aW50X3dtX2xhdGVuY3koc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAo+ICAgICAg
IHwgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+Cj4gTXkgZ3Vlc3MgaXMgdGhh
dCB0aGlzIGNvZGUgaXMgYWN0dWFsbHkgc2FmZSBiZWNhdXNlIHRoZSBzaXplIG9mIHRoZQo+IGFy
cmF5IGRlcGVuZHMgb24gdGhlIGhhcmR3YXJlIGdlbmVyYXRpb24sIGFuZCB0aGUgZnVuY3Rpb24g
Y2hlY2tzIGZvcgo+IHRoYXQsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIEkgd291bGQgbm90IGV4cGVj
dCB0aGUgY29tcGlsZXIgdG8gd29yayBpdAo+IG91dCBjb3JyZWN0bHksIGFuZCB0aGUgY29kZSBz
ZWVtcyBhIGxpdHRsZSBmcmFnaWxlIHdpdGggcmVnYXJkcyB0bwo+IGZ1dHVyZSBjaGFuZ2VzLiBT
aW1wbHkgaW5jcmVhc2luZyB0aGUgc2l6ZSBvZiB0aGUgYXJyYXkgc2hvdWxkIGhlbHAuCgpBZ3Jl
ZWQsIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbiBpc3N1ZSwgYnV0IHRoZSBjb2RlIGNvdWxkIHVz
ZSBhIGJ1bmNoCm9mIGltcHJvdmVtZW50cy4KCkxpa2UsIHdlIGhhdmUgaW50ZWxfcHJpbnRfd21f
bGF0ZW5jeSgpIGZvciBkZWJ1ZyBsb2dnaW5nIGFuZAp3bV9sYXRlbmN5X3Nob3coKSBmb3IgZGVi
dWdmcywgYW5kIHRoZXJlJ3MgYSBidW5jaCBvZiBkdXBsaWNhdGlvbiBhbmQKdWdoLgoKQnV0IHRo
aXMgc2VlbXMgbGlrZSB0aGUgZWFzaWVzdCBmaXggZm9yIHRoZSB3YXJuaW5nLgoKUmV2aWV3ZWQt
Ynk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgoKPiBTaWduZWQtb2ZmLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2Rydi5oIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaAo+IGluZGV4IDI2
ZDY5ZDA2YWE2ZC4uMzU2NzYwMmUwYTM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCj4g
QEAgLTEwOTUsMTEgKzEwOTUsMTEgQEAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgewo+ICAJCSAq
IGluIDAuNXVzIHVuaXRzIGZvciBXTTErLgo+ICAJCSAqLwo+ICAJCS8qIHByaW1hcnkgKi8KPiAt
CQl1MTYgcHJpX2xhdGVuY3lbNV07Cj4gKwkJdTE2IHByaV9sYXRlbmN5WzhdOwo+ICAJCS8qIHNw
cml0ZSAqLwo+IC0JCXUxNiBzcHJfbGF0ZW5jeVs1XTsKPiArCQl1MTYgc3ByX2xhdGVuY3lbOF07
Cj4gIAkJLyogY3Vyc29yICovCj4gLQkJdTE2IGN1cl9sYXRlbmN5WzVdOwo+ICsJCXUxNiBjdXJf
bGF0ZW5jeVs4XTsKPiAgCQkvKgo+ICAJCSAqIFJhdyB3YXRlcm1hcmsgbWVtb3J5IGxhdGVuY3kg
dmFsdWVzCj4gIAkJICogZm9yIFNLTCBmb3IgYWxsIDggbGV2ZWxzCgotLSAKSmFuaSBOaWt1bGEs
IEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
