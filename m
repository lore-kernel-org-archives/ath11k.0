Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB5EC433DB
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:32:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2374B61923
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2374B61923
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RkVhmCSdroih+GXuQrJv8a9vkhu7AkVeVexL3VMi/tI=; b=GwE9xdgvL944LrMoXNnMpXrwD
	w8KlmO4g1w7nUlScPl0S6PtcxWMTW7BV2Mg8bupmm07MWScrPHG1D6c2NKmEnYsbLeUdHQM2rHNeu
	/rv2OrAOHmg7m2OHMXQHO3MdTT+W5r8Obuauw2jHGT09e+jefO7sXamuTIx3jRLFJgAGFb9sNv173
	wWuIwbE3Lqv1SnP0UZL+0HYIeJ/kieIApZ1yrtiFDGvIS2KAYAcyihqOigwcGTg9JhhxwTEF1qtLN
	mJuMxHBq6p5x34qFhMGPWv6/Pfkx/iHWiRJcYn4hGOZLcO8WOC60xtH2QEQWdt86kfm+sMYnymuYy
	oU4UMsF3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lONTP-00C2Wz-Bk; Mon, 22 Mar 2021 16:32:12 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lONT0-00C2Tf-AY; Mon, 22 Mar 2021 16:31:50 +0000
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1lONSm-0008Gw-T8; Mon, 22 Mar 2021 16:31:33 +0000
Date: Mon, 22 Mar 2021 17:31:31 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Serge Hallyn <serge@hallyn.com>, James Morris <jmorris@namei.org>,
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Imre Deak <imre.deak@intel.com>, linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Miklos Szeredi <mszeredi@redhat.com>,
 Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH 03/11] security: commoncap: fix -Wstringop-overread warning
Message-ID: <20210322163131.yaovowes2raydgyg@wittgenstein>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322160253.4032422-4-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_163146_723554_0A9DBCDD 
X-CRM114-Status: GOOD (  13.27  )
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

T24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDU6MDI6NDFQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IGdjYy0xMSBp
bnRyb2RjZXMgYSBoYXJtbGVzcyB3YXJuaW5nIGZvciBjYXBfaW5vZGVfZ2V0c2VjdXJpdHk6Cj4g
Cj4gc2VjdXJpdHkvY29tbW9uY2FwLmM6IEluIGZ1bmN0aW9uIOKAmGNhcF9pbm9kZV9nZXRzZWN1
cml0eeKAmToKPiBzZWN1cml0eS9jb21tb25jYXAuYzo0NDA6MzM6IGVycm9yOiDigJhtZW1jcHni
gJkgcmVhZGluZyAxNiBieXRlcyBmcm9tIGEgcmVnaW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJp
bmdvcC1vdmVycmVhZF0KPiAgIDQ0MCB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bWVtY3B5KCZuc2NhcC0+ZGF0YSwgJmNhcC0+ZGF0YSwgc2l6ZW9mKF9fbGUzMikgKiAyICogVkZT
X0NBUF9VMzIpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KPiAKPiBUaGUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgdG1wYnVmIGlzIGluaXRpYWxpemVk
IHRvIE5VTEwsIHNvIGdjYyBhc3N1bWVzCj4gaXQgaXMgbm90IGFjY2Vzc2libGUgdW5sZXNzIGl0
IGdldHMgc2V0IGJ5IHZmc19nZXR4YXR0cl9hbGxvYygpLiAgVGhpcyBpcwo+IGEgbGVnaXRpbWF0
ZSB3YXJuaW5nIGFzIGZhciBhcyBJIGNhbiB0ZWxsLCBidXQgdGhlIGNvZGUgaXMgY29ycmVjdCBz
aW5jZQo+IGl0IGNvcnJlY3RseSBoYW5kbGVzIHRoZSBlcnJvciB3aGVuIHRoYXQgZnVuY3Rpb24g
ZmFpbHMuCj4gCj4gQWRkIGEgc2VwYXJhdGUgTlVMTCBjaGVjayB0byB0ZWxsIGdjYyBhYm91dCBp
dCBhcyB3ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4gLS0tCgpTZWVtcyByZWFzb25hYmxlLApBY2tlZC1ieTogQ2hyaXN0aWFuIEJyYXVuZXIg
PGNocmlzdGlhbi5icmF1bmVyQHVidW50dS5jb20+CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAph
dGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDExawo=
