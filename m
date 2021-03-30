Return-Path: <SRS0=ucx4=I4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D6AC433C1
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 10:58:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C087E61985
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 10:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C087E61985
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gMSv4lbvjvDMETDRC7nxe7RvFGcoXX2hMA4aeGz+wOU=; b=ouhrMUaVEO6Ep3q2+iiD/SDaw
	azfAKzIQlVBfqKj6ndg5RcIwOGiFFmdK8EuXDEZ1BlhgcU31eFWcv4A6GTxgeDDFEzX8JWdHBpc0S
	Mu8pBaekKauyvHO7lzkmyE3aAAN/iD0w6d6JEBWT++VeIbVZuObOQ4xZ5jgkSe5+enV83mmX/aUpE
	OTusJuOsBKRKi8bTGbQZBlkvGllpzG9WU0+baPDjsd49SFnsdGFpnJPyIJ75KQV5Rfn6NU13CkDDH
	9quO6AQH1stB88BLnu8NBHMEw5ohnnkPLZjQETtPWzEh1Zd2UHCPsZ22JWGfM7FPsbAhVV+YQUdfh
	5D44wb3FQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRC4X-003UGS-KY; Tue, 30 Mar 2021 10:58:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRC3Q-003U2f-9h
 for ath11k@lists.infradead.org; Tue, 30 Mar 2021 10:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617101815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYqzNHiuAl/aoLjb89NUxhkCMXfILPBrl172tqHnnHE=;
 b=CNfyjNv8F23LnMAJNDnUNFKhwn/+7qb3AMe4+LBSVke3MjdtxoflURxkmkRK1pxz29h/wa
 vnfIkHKNay0CZroZ6iXTvyo6Xn63R2rHoOCxuLAkmRYilhPRBTOBrNjn4OI/wGtZljeK1R
 LcBsMTqOVdAh6cAaCzlQRs3q0Qh8TMU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-gESAC-TrMTqmb20fuQQeCw-1; Tue, 30 Mar 2021 06:56:54 -0400
X-MC-Unique: gESAC-TrMTqmb20fuQQeCw-1
Received: by mail-ej1-f72.google.com with SMTP id k16so6989842ejg.9
 for <ath11k@lists.infradead.org>; Tue, 30 Mar 2021 03:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rYqzNHiuAl/aoLjb89NUxhkCMXfILPBrl172tqHnnHE=;
 b=lk5HxbYV66VuHKMhp/RWFyefzWhTg9gU3iwejR48y2yXtrnUh8VbTtoTQGxwnhSKzH
 Lw/WbGoYoAbxhUXzJlrXjiUBixXgf7uBgWUXHfrgJOXJfSXjfRkClqwAVKFoecgqTtQ6
 cjpj+0Q2lIPay6hs5Z4yclQyD4F6Ptgb9DcWKmnbugyWdvhnZAOPo3wU8iUN6zXtdszb
 dm1Nf0jKYqJj5kzszDWbCeHXQdfOEmiN/J1MIwvP49eiIqlvnYK3Gb39kVle8+ZoQMWu
 wBc6e2joZj3G1MKCYyOr7ag1OilFwlJ654f39LoT9m7Qa6zXt7ipdMgYvz1c9ZeMPWZr
 tQGw==
X-Gm-Message-State: AOAM531H730DYBY7gUAxqr8eKqGEXdSTrNMGd8pRiLpuXiw7bP7hABVI
 NdMnFt5eChJ/eu+lXfP/jkvAL4peMvdbmj09ZoebWC7zftMgEVqEws/XWlBA+Hrb6pWck1s9stV
 ZVNpTK3elKH7k8GXkdd388w==
X-Received: by 2002:a05:6402:270e:: with SMTP id
 y14mr32945872edd.283.1617101812708; 
 Tue, 30 Mar 2021 03:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk85EwNcCIjfgTHncBkIRpyvOFJP73cc6LgtyJnG141Ecwyc7yx0+jNJ7jYIvKmaPJ/RYKmg==
X-Received: by 2002:a05:6402:270e:: with SMTP id
 y14mr32945855edd.283.1617101812562; 
 Tue, 30 Mar 2021 03:56:52 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id gq9sm5631143ejb.62.2021.03.30.03.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:56:52 -0700 (PDT)
Subject: Re: [PATCH 11/11] [RFC] drm/i915/dp: fix array overflow warning
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Martin Sebor <msebor@gcc.gnu.org>, Jani Nikula
 <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, imre.deak@intel.com
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Anders Larsen <al@alarsen.net>,
 Tejun Heo <tj@kernel.org>, Serge Hallyn <serge@hallyn.com>,
 Imre Deak <imre.deak@intel.com>, linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Animesh Manna <animesh.manna@intel.com>, Sean Paul <seanpaul@chromium.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-12-arnd@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <949db606-ac48-69ae-b0f7-b1cba6fc2d7f@redhat.com>
Date: Tue, 30 Mar 2021 12:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322160253.4032422-12-arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_115701_020373_778BADAF 
X-CRM114-Status: GOOD (  26.16  )
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

SGksCgpPbiAzLzIyLzIxIDU6MDIgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gRnJvbTogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBnY2MtMTEgd2FybnMgdGhhdCBpbnRlbF9k
cF9jaGVja19tc3Rfc3RhdHVzKCkgaGFzIGEgbG9jYWwgYXJyYXkgb2YKPiBmb3VydGVlbiBieXRl
cyBhbmQgcGFzc2VzIHRoZSBsYXN0IGZvdXIgYnl0ZXMgaW50byBhIGZ1bmN0aW9uIHRoYXQKPiBl
eHBlY3RzIGEgc2l4LWJ5dGUgYXJyYXk6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jOiBJbiBmdW5jdGlvbiDigJhpbnRlbF9kcF9jaGVja19tc3Rfc3RhdHVz4oCZ
Ogo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzo0NTU2OjIyOiBlcnJv
cjog4oCYZHJtX2RwX2NoYW5uZWxfZXFfb2vigJkgcmVhZGluZyA2IGJ5dGVzIGZyb20gYSByZWdp
b24gb2Ygc2l6ZSA0IFstV2Vycm9yPXN0cmluZ29wLW92ZXJyZWFkXQo+ICA0NTU2IHwgICAgICAg
ICAgICAgICAgICAgICAhZHJtX2RwX2NoYW5uZWxfZXFfb2soJmVzaVsxMF0sIGludGVsX2RwLT5s
YW5lX2NvdW50KSkgewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzo0NTU2OjIyOiBub3RlOiByZWZlcmVuY2luZyBhcmd1
bWVudCAxIG9mIHR5cGUg4oCYY29uc3QgdTggKuKAmSB7YWthIOKAmGNvbnN0IHVuc2lnbmVkIGNo
YXIgKuKAmX0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcC5jOjM4Ogo+IGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaDoxNDU5OjY6
IG5vdGU6IGluIGEgY2FsbCB0byBmdW5jdGlvbiDigJhkcm1fZHBfY2hhbm5lbF9lcV9va+KAmQo+
ICAxNDU5IHwgYm9vbCBkcm1fZHBfY2hhbm5lbF9lcV9vayhjb25zdCB1OCBsaW5rX3N0YXR1c1tE
UF9MSU5LX1NUQVRVU19TSVpFXSwKPiAgICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiAKPiBDbGVhcmx5IHNvbWV0aGluZyBpcyB3cm9uZyBoZXJlLCBidXQgSSBjYW4ndCBxdWl0ZSBm
aWd1cmUgb3V0IHdoYXQuCj4gQ2hhbmdpbmcgdGhlIGFycmF5IHNpemUgdG8gMTYgYnl0ZXMgYXZv
aWRzIHRoZSB3YXJuaW5nLCBidXQgaXMKPiBwcm9iYWJseSB0aGUgd3Jvbmcgc29sdXRpb24gaGVy
ZS4KClRoZSBkcm0gZGlzcGxheXBvcnQtaGVscGVycyBpbmRlZWQgZXhwZWN0IGEgNiBieXRlcyBi
dWZmZXIsIGJ1dCB0aGV5CnVzdWFsbHkgb25seSBjb25zdW1lIDQgYnl0ZXMuCgpJIGRvbid0IHRo
aW5rIHRoYXQgY2hhbmdpbmcgdGhlIERQX0RQUlhfRVNJX0xFTiBpcyBhIGdvb2QgZml4IGhlcmUs
CnNpbmNlIGl0IGlzIHVzZWQgaW4gbXVsdGlwbGUgcGxhY2VzLCBidXQgdGhlIGVzaSBhcnJheSBh
bHJlYWR5IGdldHMKemVyby1lZCBvdXQgYnkgaXRzIGluaXRpYWxpemVyLCBzbyB3ZSBjYW4ganVz
dCBwYXNzIDIgZXh0cmEgMCBieXRlcwp0byBnaXZlIGRybV9kcF9jaGFubmVsX2VxX29rKCkgY2Fs
bCB0aGUgNiBieXRlIGJ1ZmZlciBpdHMgcHJvdG90eXBlCnNwZWNpZmllcyBieSBkb2luZyB0aGlz
OgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCA4OTc3MTFkOWQ3
ZDMuLjE0Nzk2MmQ0YWQwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
YwpAQCAtNDUzOCw3ICs0NTM4LDExIEBAIGludGVsX2RwX2NoZWNrX21zdF9zdGF0dXMoc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCkKIAlkcm1fV0FSTl9PTl9PTkNFKCZpOTE1LT5kcm0sIGludGVs
X2RwLT5hY3RpdmVfbXN0X2xpbmtzIDwgMCk7CiAKIAlmb3IgKDs7KSB7Ci0JCXU4IGVzaVtEUF9E
UFJYX0VTSV9MRU5dID0ge307CisJCS8qCisJCSAqIGRybV9kcF9jaGFubmVsX2VxX29rKCkgZXhw
ZWN0cyBhIDYgYnl0ZSBsYXJnZSBidWZmZXIsIGJ1dAorCQkgKiB0aGUgRVNJIGluZm8gb25seSBj
b250YWlucyA0IGJ5dGVzLCBwYXNzIDIgZXh0cmEgMCBieXRlcy4KKwkJICovCisJCXU4IGVzaVtE
UF9EUFJYX0VTSV9MRU4gKyAyXSA9IHt9OwogCQlib29sIGhhbmRsZWQ7CiAJCWludCByZXRyeTsK
IAoKU28gaTkxNSBkZXZzLCB3b3VsZCBzdWNoIGEgZml4IGJlIGFjY2VwdGFibGUgPwoKUmVnYXJk
cywKCkhhbnMKCgoKCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiBpbmRleCA4YzEyZDUz
NzU2MDcuLjgzMGUyNTE1ZjExOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKPiBAQCAtNjUsNyArNjUsNyBAQAo+ICAjaW5jbHVkZSAiaW50ZWxfdmRzYy5oIgo+
ICAjaW5jbHVkZSAiaW50ZWxfdnJyLmgiCj4gIAo+IC0jZGVmaW5lIERQX0RQUlhfRVNJX0xFTiAx
NAo+ICsjZGVmaW5lIERQX0RQUlhfRVNJX0xFTiAxNgo+ICAKPiAgLyogRFAgRFNDIHRocm91Z2hw
dXQgdmFsdWVzIHVzZWQgZm9yIHNsaWNlIGNvdW50IGNhbGN1bGF0aW9ucyBLUGl4ZWxzL3MgKi8K
PiAgI2RlZmluZSBEUF9EU0NfUEVBS19QSVhFTF9SQVRFCQkJMjcyMDAwMAo+IAoKCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
