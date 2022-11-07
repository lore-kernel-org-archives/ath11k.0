Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C318CC4332F
	for <ath11k@archiver.kernel.org>; Mon,  7 Nov 2022 11:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzBTFWSQtuSOTmnkpOfTHc3PwHv3vnG0inil698dqZg=; b=dvf5/wEAyoFWvE
	DWQUwY0AC7UYg+wjrNoIO0fMA/XppVjDbyB+EixRBGI7J3pP6x9zZ3ohUeIBm6/lyEdIZyO3idRF+
	o6Vl4U+C/dvQXHqgWrmOCFu/Z9li1C5K2l6IHyh6/KZriVJ6j1aip6cicIGPnwTWLp/nP1irEMzqc
	88LvDapolICDpD2qgMFyhKQJsqo9zjhwP6A6YEXz52DQf+XdpY/XoMc4rCfU35HlJzi/Ifg9yD+DK
	D0EAFbNWgYXheVIP4WF789Afr0YksUS7T/HyLqMGy0/+HSpHixzvqZ6vy8S019taObj4urhUtjWTL
	d8cf7+t7wZH79lVHkBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0Ia-00E9GZ-Cm; Mon, 07 Nov 2022 11:28:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0IX-00E9Fh-Q9
	for ath11k@lists.infradead.org; Mon, 07 Nov 2022 11:28:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D0D4B8100E;
	Mon,  7 Nov 2022 11:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586B4C433D6;
	Mon,  7 Nov 2022 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667820490;
	bh=gX0czMPTs+259vGom9QGdlIGR+c8u6kSHEipAFI8adA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvTLkC3VKRS9PtAELzxSU8KvwKLl0f7r4w9dHgMyB6a/OXsiruhEGzQN0QcVuBg+Z
	 /PaoGMX43mD9PbvRm5DdocDSs3I7JFdPC8rDGJ1fP+UF3eC4G32sdRpgAml8IeiORp
	 xvIrH8jnQofutAF5rio2BDGUbuH9pBOkiDGF1JiiaWVptKA9S/VmtXJq4b8a92Ln7F
	 uEMnU8pZPFeXVtvSgBdCv2v3GwhppLvhl7t8aFHDKWPMKxszmZClEn2kKBIuGsCOVX
	 lqU+DD6OEiC16RcBT5bmOuNtRUV6SL2ChUfq/xLPon/SrCMaEmbc+gOelhv3qbkA+Y
	 G4JoRFRAf/i0g==
Date: Mon, 7 Nov 2022 16:57:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, gregkh@linuxfoundation.org,
	elder@linaro.org, hemantk@codeaurora.org, quic_jhugo@quicinc.com,
	quic_qianyu@quicinc.com, bbhatt@codeaurora.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] bus: mhi: core: add SBL state callback
Message-ID: <20221107112756.GB2220@thinkpad>
References: <20221105194943.826847-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221105194943.826847-1-robimarko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_032814_039843_0D1BE63F 
X-CRM114-Status: GOOD (  20.68  )
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

T24gU2F0LCBOb3YgMDUsIDIwMjIgYXQgMDg6NDk6NDJQTSArMDEwMCwgUm9iZXJ0IE1hcmtvIHdy
b3RlOgo+IEFkZCBzdXBwb3J0IGZvciBTQkwgc3RhdGUgY2FsbGJhY2sgaW4gTUhJIGNvcmUuCj4g
Cj4gSXQgaXMgcmVxdWlyZWQgZm9yIGF0aDExayBNSEkgZGV2aWNlcyBpbiBvcmRlciB0byBiZSBh
YmxlIHRvIHNldCBRUlRSCj4gaW5zdGFuY2UgSUQgaW4gdGhlIFNCTCBzdGF0ZSBzbyB0aGF0IFFS
VFIgaW5zdGFuY2UgSUQtcyBkb250IGNvbmZsaWN0IGluCj4gY2FzZSBvZiBtdWx0aXBsZSBQQ0kv
TUhJIGNhcmRzIG9yIEFIQiArIFBDSS9NSEkgY2FyZC4KPiBTZXR0aW5nIFFSVFIgaW5zdGFuY2Ug
SUQgaXMgb25seSBwb3NzaWJsZSBpbiBTQkwgc3RhdGUgYW5kIHRoZXJlIGlzCj4gY3VycmVudGx5
IG5vIHdheSB0byBlbnN1cmUgdGhhdCB3ZSBhcmUgaW4gdGhhdCBzdGF0ZSwgc28gcHJvdmlkZSBh
Cj4gY2FsbGJhY2sgdGhhdCB0aGUgY29udHJvbGxlciBjYW4gdHJpZ2dlciBvZmYuCj4gCgpXaGVy
ZSBjYW4gSSBmaW5kIHRoZSBjb3JyZXNwb25kaW5nIGF0aDExayBwYXRjaCB0aGF0IG1ha2VzIHVz
ZSBvZiB0aGlzCmNhbGxiYWNrPwoKVGhhbmtzLApNYW5pCgo+IFNpZ25lZC1vZmYtYnk6IFJvYmVy
dCBNYXJrbyA8cm9iaW1hcmtvQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9idXMvbWhpL2hv
c3QvbWFpbi5jIHwgMSArCj4gIGluY2x1ZGUvbGludXgvbWhpLmggICAgICAgICB8IDIgKysKPiAg
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9idXMvbWhpL2hvc3QvbWFpbi5jIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvbWFpbi5jCj4gaW5k
ZXggZGYwZmJmZWU3Yjc4Li44YjAzZGQxZjBjYjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9idXMv
bWhpL2hvc3QvbWFpbi5jCj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvbWFpbi5jCj4gQEAg
LTkwMCw2ICs5MDAsNyBAQCBpbnQgbWhpX3Byb2Nlc3NfY3RybF9ldl9yaW5nKHN0cnVjdCBtaGlf
Y29udHJvbGxlciAqbWhpX2NudHJsLAo+ICAJCQlzd2l0Y2ggKGV2ZW50KSB7Cj4gIAkJCWNhc2Ug
TUhJX0VFX1NCTDoKPiAgCQkJCXN0ID0gREVWX1NUX1RSQU5TSVRJT05fU0JMOwo+ICsJCQkJbWhp
X2NudHJsLT5zdGF0dXNfY2IobWhpX2NudHJsLCBNSElfQ0JfRUVfU0JMX01PREUpOwo+ICAJCQkJ
YnJlYWs7Cj4gIAkJCWNhc2UgTUhJX0VFX1dGVzoKPiAgCQkJY2FzZSBNSElfRUVfQU1TUzoKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9taGkuaCBiL2luY2x1ZGUvbGludXgvbWhpLmgKPiBp
bmRleCBhNTQ0MWFkMzNjNzQuLmJlZmZlMTAyZGQxOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L21oaS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9taGkuaAo+IEBAIC0zNCw2ICszNCw3IEBA
IHN0cnVjdCBtaGlfYnVmX2luZm87Cj4gICAqIEBNSElfQ0JfU1lTX0VSUk9SOiBNSEkgZGV2aWNl
IGVudGVyZWQgZXJyb3Igc3RhdGUgKG1heSByZWNvdmVyKQo+ICAgKiBATUhJX0NCX0ZBVEFMX0VS
Uk9SOiBNSEkgZGV2aWNlIGVudGVyZWQgZmF0YWwgZXJyb3Igc3RhdGUKPiAgICogQE1ISV9DQl9C
V19SRVE6IFJlY2VpdmVkIGEgYmFuZHdpZHRoIHN3aXRjaCByZXF1ZXN0IGZyb20gZGV2aWNlCj4g
KyAqIEBNSElfQ0JfRUVfU0JMX01PREU6IE1ISSBkZXZpY2UgZW50ZXJlZCBTQkwgbW9kZQo+ICAg
Ki8KPiAgZW51bSBtaGlfY2FsbGJhY2sgewo+ICAJTUhJX0NCX0lETEUsCj4gQEAgLTQ1LDYgKzQ2
LDcgQEAgZW51bSBtaGlfY2FsbGJhY2sgewo+ICAJTUhJX0NCX1NZU19FUlJPUiwKPiAgCU1ISV9D
Ql9GQVRBTF9FUlJPUiwKPiAgCU1ISV9DQl9CV19SRVEsCj4gKwlNSElfQ0JfRUVfU0JMX01PREUs
Cj4gIH07Cj4gIAo+ICAvKioKPiAtLSAKPiAyLjM4LjEKPiAKCi0tIArgrq7grqPgrr/grrXgrqPg
r43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgotLSAKYXRoMTFrIG1haWxpbmcg
bGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
