Return-Path: <SRS0=tZkC=IW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A70C433C1
	for <ath11k@archiver.kernel.org>; Wed, 24 Mar 2021 17:23:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EA9619C9
	for <ath11k@archiver.kernel.org>; Wed, 24 Mar 2021 17:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EA9619C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=035NJGEih0m4nXDXVERef6sNWeINjQncWuQk4XD7AqE=; b=Zln5bnaJBZz5gsWb0Xr3747La
	+qWNREJ6wH8kMCol8SvOicF8q3m0BmZWvoWJRfehERzPpQ1aEw6KWVRQCsysJurKp0jHRHu3S3o86
	MNuHaBVtfJCgabJu2fBmQrWGXNeGsOMX6/HHQU31qmiXrlhxiWcu5h1+EI5fsHt/XM3QtJVcQaXaX
	Tx+mX9KAh2dr0RcrkzB8d4RZPDc9RDjZlL/QVBVwynsuCWiKVWZksuDDnpUJMTNS6iZYa8K9uvazT
	QO+h4Q3+LhPkEv/GAmVLuMDJzUHdPpkzVKMePLxmsEPD6vy6WSg0EneX2+IdjthySD8YQw6B3+YTq
	e6gLOavog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP7E0-00HVkq-DW; Wed, 24 Mar 2021 17:23:20 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP7Dm-00HVgZ-VF; Wed, 24 Mar 2021 17:23:09 +0000
IronPort-SDR: p+kLYTKpCcs5BDRH0uxE7URHO4+WWAgludcxWdcq0V6ap3EZWJYDwzUy2qwkP63CSp0j2IdMxU
 hcIKhKyGgzWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="190173227"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="190173227"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 10:22:57 -0700
IronPort-SDR: q7x5MCG+vkoOU9Zt5AI1qoSHSHC0Zp99QAlPGLHuv2CUXVcGAPnke24VDa6jskQUUfvyu5ceVQ
 Ar5TomltcFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="443059639"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 24 Mar 2021 10:22:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 Mar 2021 19:22:48 +0200
Date: Wed, 24 Mar 2021 19:22:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Martin Sebor <msebor@gcc.gnu.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Aditya Swarup <aditya.swarup@intel.com>
Subject: Re: [PATCH 10/11] drm/i915: avoid stringop-overread warning on
 pri_latency
Message-ID: <YFt1aBFwJI+z97g3@intel.com>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-11-arnd@kernel.org>
 <874kh04lin.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874kh04lin.fsf@intel.com>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_172307_371408_818761DD 
X-CRM114-Status: GOOD (  23.18  )
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

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMDU6MzA6MjRQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gTW9uLCAyMiBNYXIgMjAyMSwgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4g
Z2NjLTExIHdhcm5zIGFib3V0IHdoYXQgYXBwZWFycyB0byBiZSBhbiBvdXQtb2YtcmFuZ2UgYXJy
YXkgYWNjZXNzOgo+ID4KPiA+IEluIGZ1bmN0aW9uIOKAmHNuYl93bV9sYXRlbmN5X3F1aXJr4oCZ
LAo+ID4gICAgIGlubGluZWQgZnJvbSDigJhpbGtfc2V0dXBfd21fbGF0ZW5jeeKAmSBhdCBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjMxMDg6MzoKPiA+IGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX3BtLmM6MzA1Nzo5OiBlcnJvcjog4oCYaW50ZWxfcHJpbnRfd21fbGF0ZW5jeeKA
mSByZWFkaW5nIDE2IGJ5dGVzIGZyb20gYSByZWdpb24gb2Ygc2l6ZSAxMCBbLVdlcnJvcj1zdHJp
bmdvcC1vdmVycmVhZF0KPiA+ICAzMDU3IHwgICAgICAgICBpbnRlbF9wcmludF93bV9sYXRlbmN5
KGRldl9wcml2LCAiUHJpbWFyeSIsIGRldl9wcml2LT53bS5wcmlfbGF0ZW5jeSk7Cj4gPiAgICAg
ICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9w
bS5jOiBJbiBmdW5jdGlvbiDigJhpbGtfc2V0dXBfd21fbGF0ZW5jeeKAmToKPiA+IGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX3BtLmM6MzA1Nzo5OiBub3RlOiByZWZlcmVuY2luZyBhcmd1bWVu
dCAzIG9mIHR5cGUg4oCYY29uc3QgdTE2ICrigJkge2FrYSDigJhjb25zdCBzaG9ydCB1bnNpZ25l
ZCBpbnQgKuKAmX0KPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmM6Mjk5NDoxMzog
bm90ZTogaW4gYSBjYWxsIHRvIGZ1bmN0aW9uIOKAmGludGVsX3ByaW50X3dtX2xhdGVuY3nigJkK
PiA+ICAyOTk0IHwgc3RhdGljIHZvaWQgaW50ZWxfcHJpbnRfd21fbGF0ZW5jeShzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCj4gPiAgICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KPiA+Cj4gPiBNeSBndWVzcyBpcyB0aGF0IHRoaXMgY29kZSBpcyBhY3R1
YWxseSBzYWZlIGJlY2F1c2UgdGhlIHNpemUgb2YgdGhlCj4gPiBhcnJheSBkZXBlbmRzIG9uIHRo
ZSBoYXJkd2FyZSBnZW5lcmF0aW9uLCBhbmQgdGhlIGZ1bmN0aW9uIGNoZWNrcyBmb3IKPiA+IHRo
YXQsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIEkgd291bGQgbm90IGV4cGVjdCB0aGUgY29tcGlsZXIg
dG8gd29yayBpdAo+ID4gb3V0IGNvcnJlY3RseSwgYW5kIHRoZSBjb2RlIHNlZW1zIGEgbGl0dGxl
IGZyYWdpbGUgd2l0aCByZWdhcmRzIHRvCj4gPiBmdXR1cmUgY2hhbmdlcy4gU2ltcGx5IGluY3Jl
YXNpbmcgdGhlIHNpemUgb2YgdGhlIGFycmF5IHNob3VsZCBoZWxwLgo+IAo+IEFncmVlZCwgSSBk
b24ndCB0aGluayB0aGVyZSdzIGFuIGlzc3VlLCBidXQgdGhlIGNvZGUgY291bGQgdXNlIGEgYnVu
Y2gKPiBvZiBpbXByb3ZlbWVudHMuCj4gCj4gTGlrZSwgd2UgaGF2ZSBpbnRlbF9wcmludF93bV9s
YXRlbmN5KCkgZm9yIGRlYnVnIGxvZ2dpbmcgYW5kCj4gd21fbGF0ZW5jeV9zaG93KCkgZm9yIGRl
YnVnZnMsIGFuZCB0aGVyZSdzIGEgYnVuY2ggb2YgZHVwbGljYXRpb24gYW5kCj4gdWdoLgoKVGhl
cmUgaXMgYWxsIHRoaXMgYW5jaWVudCBzdHVmZiBpbiByZXZpZXcgbGltYm8uLi4KaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81MDgwMi8KCi0tIApWaWxsZSBTeXJqw6Rs
w6QKSW50ZWwKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
