Return-Path: <SRS0=q7Iz=ON=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79840C433F5
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 08:59:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3627961278
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 08:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3627961278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ePgXy0HVHOHCmQ9rDs2dK2DBRvYX8WKNLD45tJeLjU=; b=5DAMJqG3B9n/8A
	t2wdbdPFcw3v6Uo+RcEotBxy3xk8+uoEbL2StK05NcudP9UEZlEhSTjd51lkBlIekB+5JXjwZi0dy
	xEPA5ygE87uwh+FCzLtkxHvqI2Ti6fuY3cL6O8ggwzsveEsPHGoDP18yhKMQ8WxsWlfoLz/vNfwv1
	m7UXjRH29CtuJuO3h6QrhJvUXuAqS2vyVP1dpq7riLVnEWLnSrVnszBVmdVHOZik2xVlql1gey9Mv
	EX7V0I/N3R08hgGgy+AdyGkmrY8UtNxE1lkkkZAYU+WVuNL4Ka5hyLxU0ez9wfaiQH5EPgO3+YZlU
	CV1zRCUG+kqgHjUGWFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTKZs-00AhaR-3R; Thu, 23 Sep 2021 08:59:36 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTKZp-00AhZi-Ky
 for ath11k@lists.infradead.org; Thu, 23 Sep 2021 08:59:35 +0000
Received: by mail-pf1-x434.google.com with SMTP id k17so5117240pff.8
 for <ath11k@lists.infradead.org>; Thu, 23 Sep 2021 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IwZWh7TVy1EsJ4/Xl5ph0XhiwHhsFLWIFyxY44IHD6c=;
 b=EtCi7o76f+Y3DWLNDkwwIIvlAA4cVI0p3JtUo3aGd6gHqYvwHf5nl75xwRDeWi9NyX
 04vxuYbauytQ0qUNsZBilOckJOidDrCsNThS00KJPtvOjD63yUtWG+JBvtIp7OIPpQM6
 ZD/LS9uAIA1YOmyHt0b2n9l5BnOXO9wtgQpGzk3G0IAnm+IjPClViLRS0nH3h0BAb97p
 Gp+3xBRf2C66aNcS/Uy2Yz2bryZLoDolIg1QCpXz0tlDZEMdBLcJ8pANb0qejWWBxYCP
 VFIo1hlxn3CV59KkHhVS8tvGcnCMsfdmQG8h9SwRiE0sMNb3mcVfXJWUM6+MpfQigzIU
 h5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IwZWh7TVy1EsJ4/Xl5ph0XhiwHhsFLWIFyxY44IHD6c=;
 b=c8O7q03oyc/AnyGu7yh8h3xfw26IJf/i5Oc9emZ5nGrogVqcc9N8DwBnDQcEzIgvFa
 YMepv01bXnhxI217RmjStEjil+zls0xUkz7BOp62tQPOd9sSU+Xmmf4yvkakMJDaooPh
 THl2O1OOGlx1qj7NgMvGaPTwXINzT0wMuQB37pMY/VhlSjtcqksjMdWhvoIDm60awMr/
 lTw70U4JS1Lg6fhnCRG7G4GsNOrQEY9Uy4QEFQid7Zkh6uGaFl6F2OKIHEWjqsk5mRmT
 0SONV1SR99IO/Dkx9D018ZYDnkP91pMUw4nuUJBSt/2G0skDCuROHKKgN2NbKmjL7nhc
 KGIg==
X-Gm-Message-State: AOAM530TftCqeQz4kAkVDmLjeK0xd1qHCXFyJtKUEAjmLWjkVNIDdHVO
 WQ6yrKFtYdPXNCLcpneD/8fItilRuhxg
X-Google-Smtp-Source: ABdhPJwwaXILnaoOCOksr0wpBKXGHCF7fnZfoGHzfcogdAEo2/ZL/8T1fOEFbOYoPvUfpQ98obaaKw==
X-Received: by 2002:a63:770b:: with SMTP id s11mr3133224pgc.275.1632387572197; 
 Thu, 23 Sep 2021 01:59:32 -0700 (PDT)
Received: from thinkpad ([117.193.215.78])
 by smtp.gmail.com with ESMTPSA id s2sm8830002pjs.56.2021.09.23.01.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 01:59:31 -0700 (PDT)
Date: Thu, 23 Sep 2021 14:29:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210923085926.GD6083@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
 <20210916171927.GB9027@thinkpad>
 <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_015933_752665_82DE7DCB 
X-CRM114-Status: GOOD (  32.04  )
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

T24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgMDQ6MzQ6NDNQTSArMDgwMCwgQ2FybCBIdWFuZyB3cm90
ZToKPiBPbiAyMDIxLTA5LTE3IDAxOjE5LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4g
PiBPbiBUaHUsIFNlcCAxNiwgMjAyMSBhdCAwNzo0MjowMlBNICswMzAwLCBLYWxsZSBWYWxvIHdy
b3RlOgo+ID4gPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBs
aW5hcm8ub3JnPiB3cml0ZXM6Cj4gPiA+IAo+ID4gPiA+IE9uIFRodSwgU2VwIDE2LCAyMDIxIGF0
IDAxOjE4OjIyUE0gKzAyMDAsIExvaWMgUG91bGFpbiB3cm90ZToKPiA+ID4gPj4gTGUgamV1LiAx
NiBzZXB0LiAyMDIxIMOgIDEzOjEyLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPAo+ID4gPiA+PiBt
YW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gYSDDqWNyaXQgOgo+ID4gPiA+Pgo+ID4g
PiA+Cj4gPiA+ID4gWy4uLl0KPiA+ID4gPgo+ID4gPiA+PiA+IElmIHRoaW5ncyBzZWVtcyB0byB3
b3JrIGZpbmUgd2l0aG91dCB0aGF0IHBhdGNoLCB0aGVuIGl0IGltcGxpZXMgdGhhdAo+ID4gPiA+
PiA+IHNldHRpbmcgTTAKPiA+ID4gPj4gPiBzdGF0ZSB3b3JrcyBkdXJpbmcgcmVzdW1lLiBJIHRo
aW5rIHdlIHNob3VsZCBqdXN0IHJldmVydCB0aGF0IHBhdGNoLgo+ID4gPiA+PiA+Cj4gPiA+ID4+
ID4gTG9pYywgZGlkIHRoYXQgcGF0Y2ggZml4IGFueSBpc3N1ZSBmb3IgeW91IG9yIGl0IHdhcyBh
IGNvc21ldGljIGZpeCBvbmx5Pwo+ID4gPiA+Pgo+ID4gPiA+Pgo+ID4gPiA+PiBJdCBmaXhlcyBz
ZHggbW9kZW0gcmVzdW1pbmcgaXNzdWUsIHdpdGhvdXQgdGhhdCB3ZSBkb27igJl0IGtub3cgbW9k
ZW0gbmVlZHMKPiA+ID4gPj4gdG8gYmUgcmVpbml0aWFsaXplZC4KPiA+ID4gPj4KPiA+ID4gPgo+
ID4gPiA+IE9rYXkuIFRoZW4gaW4gdGhhdCBjYXNlLCB0aGUgcmVjb3ZlcnkgbWVjaGFuaXNtIGhh
cyB0byBiZSBhZGRlZCB0byB0aGUgYXRoMTFrCj4gPiA+ID4gTUhJIGNvbnRyb2xsZXIuCj4gPiA+
IAo+ID4gPiBXaGF0IGRvZXMgdGhhdCBtZWFuIGluIHByYWN0aXNlLCBkbyB5b3UgaGF2ZSBhbnkg
cG9pbnRlcnMgb3IKPiA+ID4gZXhhbXBsZXM/IEkKPiA+ID4gaGF2ZSBubyBjbHVlIHdoYXQgeW91
IGFyZSBwcm9wb3NpbmcgOikKPiA+ID4gCj4gPiAKPiA+IFRha2UgYSBsb29rIGF0IHRoZSBtaGlf
cGNpX3JlY292ZXJ5X3dvcmsoKSBmdW5jdGlvbiBiZWxvdzoKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2Ry
aXZlcnMvYnVzL21oaS9wY2lfZ2VuZXJpYy5jI242MTAKPiA+IAo+ID4gWW91IG5lZWQgdG8gaW1w
bGVtZW50IHNvbWV0aGluZyBzaW1pbGFyIHRoYXQgYmFzaWNhbGx5IHBvd2VycyB1cCB0aGUgTUhJ
Cj4gPiBlbmRwb2ludCAoUUNBNjM5MCkgaW4gY2FzZSBwbV9yZXN1bWUoKSBmYWlscy4gQXQgbWlu
aW11bSwgeW91IG5lZWQgdG8KPiA+IGNhbGwKPiA+IGJlbG93IGZ1bmN0aW9uczoKPiA+IAo+ID4g
IyBDaGVjayBpZiB0aGUgZGV2aWNlIGlzIHBvd2VyZWQgb24uIElmIHllcywgdGhlbiBwb3dlciBp
dCBkb3duIHRvIGJyaW5nCj4gPiBpdCBiYWNrCj4gPiBtaGlfcG93ZXJfZG93bigpCj4gPiBtaGlf
dW5wcmVwYXJlX2FmdGVyX3Bvd2VyX2Rvd24oKQo+ID4gCj4gPiAjIFBvd2VyIHVwIHRoZSBkZXZp
Y2UKPiA+IG1oaV9wcmVwYXJlX2Zvcl9wb3dlcl91cCgpCj4gPiBtaGlfc3luY19wb3dlcl91cCgp
Cj4gPiAKPiA+IFRoaXMgaW1wbGllcyB0aGF0IHRoZSBXTEFOIGRldmljZSBoYXMgYmVlbiBwb3dl
cmVkIG9mZiBkdXJpbmcgc3VzcGVuZCwKPiA+IHNvIHRoZQo+ID4gcmVzdW1lIGZhaWxzIGFuZCB3
ZSBhcmUgYnJpbmdpbmcgdGhlIGRldmljZSBiYWNrIHRvIHdvcmtpbmcgc3RhdGUuCj4gPiAKPiBU
aGlzIGlzIGZpbmUgZm9yIHBsYXRmb3JtIHdoaWNoIGRvZXNuJ3QgcHJvdmlkZSBwb3dlciBzdXBw
bHkgZHVyaW5nIHN1c3BlbmQuCj4gQnV0IE5VQyBoYXMgcG93ZXIgc3VwcGx5IGluIHN1c3BlbmQg
c3RhdGUuCgpJZiBOVUMgcmV0YWlucyBwb3dlciBzdXBwbHkgZHVyaW5nIHN1c3BlbmQgdGhlbiBp
dCBzaG91bGQgd29yayB3aXRoIHRoYXQgY29tbWl0LgpEdXJpbmcgcmVzdW1lLCB0aGUgZGV2aWNl
IGlzIGV4cGVjdGVkIHRvIGJlIGluIE0zIHN0YXRlIGFuZCB0aGF0J3Mgd2hhdCB0aGUKY29tbWl0
IHZlcmlmaWVzLgoKSWYgdGhlIGRldmljZSBpcyBpbiBhIGRpZmZlcmVudCBzdGF0ZSwgdGhlbiBt
b3N0IGxpa2VseSB0aGUgZGV2aWNlIGhhdmUgcG93ZXIKY3ljbGVkLgoKPiBRQ0E2MzkwIG9uIE5V
QyB3b3JrcyBhZnRlciBqdXN0IHJldmVydGluZyB0aGlzIGNvbW1pdCBhbHNvIHByb3ZlcyBOVUMg
aGFzCj4gcG93ZXIgc3VwcGx5IGluCj4gc3VzcGVuZCBzdGF0ZS4KPiAKClRoYXQncyBiZWNhdXNl
IHdlIGFsbG93ZWQgdGhlIGRldmljZSB0byBiZSBpbiBhbnkgc3RhdGUgZHVyaW5nIHJlc3VtZSBh
bmQgaWYgaXQKcmVzcG9uZHMgdG8gdGhlIE0wIHRyYW5zaXRpb24gaXQgd29ya2VkLgoKPiBUaGUg
cmVhc29uIGlzIE1ISS1TVEFUVVMgcmVnaXN0ZXIgY2FuJ3QgYmUgcmVhZCBzb21laG93IGluIE0z
IHN0YXRlIG9uIE5VQy4KCk5vLCB0aGF0J3Mgbm90IGNvcnJlY3QuCgo+IERvZXMgdGhlIE1ISSBz
cGVjIHN0YXRlIHRoYXQgTUhJLVNUQVRVUyByZWdpc3RlciBjYW4gYmUgcmVhZCBpbiBNMyBzdGF0
ZT8KPiAKClllcywgYWxsIHRoZSBNSEkgcmVnaXN0ZXJzIGFyZSBhY2Nlc3NpYmxlIGluIGFsbCBz
dGF0ZXMuIER1cmluZyBNMywgYm90aCBNSEkKaG9zdCBhbmQgZGV2aWNlIChpZiBzdXBwb3J0ZWQp
IHdpbGwgdHJhbnNpdGlvbiB0byBEMyBDb2xkLiBUaGVuIGR1cmluZyByZXN1bWUsCmhvc3Qgd2ls
bCBzd2l0Y2ggdG8gRDAgbGluayBzdGF0ZSBhbmQgd2lsbCBhbHNvIG5vdGlmeSB0aGUgZGV2aWNl
IHRvIGVudGVyIEQwLgoKRm9yIGFpZCBkZWJ1Z2dpbmcsIHBsZWFzZSBzZWUgdGhlIHN0YXRlIHRo
ZSBkZXZpY2UgaXMgaW4gZHVyaW5nIG1oaV9wbV9yZXN1bWUoKS4KWW91IGNhbiB1c2UgYmVsb3cg
ZGlmZjoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvY29yZS9wbS5jIGIvZHJpdmVycy9i
dXMvbWhpL2NvcmUvcG0uYwppbmRleCBmYjk5ZTM3MjcxNTUuLjQ4MmQ1NWRkMjA5ZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9idXMvbWhpL2NvcmUvcG0uYworKysgYi9kcml2ZXJzL2J1cy9taGkvY29y
ZS9wbS5jCkBAIC04OTgsNiArODk4LDkgQEAgaW50IG1oaV9wbV9yZXN1bWUoc3RydWN0IG1oaV9j
b250cm9sbGVyICptaGlfY250cmwpCiAgICAgICAgaWYgKE1ISV9QTV9JTl9FUlJPUl9TVEFURSht
aGlfY250cmwtPnBtX3N0YXRlKSkKICAgICAgICAgICAgICAgIHJldHVybiAtRUlPOwogCisgICAg
ICAgZGV2X2luZm8oZGV2LCAiRGV2aWNlIHN0YXRlOiAlc1xuIiwKKyAgICAgICAgICAgICAgICBU
T19NSElfU1RBVEVfU1RSKG1oaV9nZXRfbWhpX3N0YXRlKG1oaV9jbnRybCkpKTsKKwogICAgICAg
IGlmIChtaGlfZ2V0X21oaV9zdGF0ZShtaGlfY250cmwpICE9IE1ISV9TVEFURV9NMykKICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKClRoYW5rcywKTWFuaQoKLS0gCmF0aDExayBtYWls
aW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
