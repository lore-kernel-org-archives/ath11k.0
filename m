Return-Path: <SRS0=ib+T=LQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3424C2B9F4
	for <ath11k@archiver.kernel.org>; Tue, 22 Jun 2021 09:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AA860230
	for <ath11k@archiver.kernel.org>; Tue, 22 Jun 2021 09:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9AA860230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gecius.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ux1l7vu+tMzADjIDP5UKjQkv8xjDXgjHdPygcnx+fW4=; b=eGYJ1b5LwpfHB83hlCwfi/ke33
	7IllzY6invkWlecsSgypIa2DL23JiYY/cfQ2Fjs/SYRWmfuz2hnMfuRFl3qQrLX8f37a3LRDPkR8O
	rUNHPLUcF59u+gAi2le57N2fhW5gpvQtFHj2P6Sv0513ZpyIHHEVgOHVhGSZe57rJmDtv4icqN8S1
	X7/XUsIf39cVDZuSbyq3pr4ML95Edf+U/CyjcupCEsY1vGvEzXySIelLpk+FC+rOPdsEH8nDygaru
	vge5cet9xiZytadBI2S3EG019ZftFOeACTimPMcE65hvpTiN4pEY2KjBSve/X8sVlUqGD/bXE2olF
	2VXvDoCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvd3B-006WWl-11; Tue, 22 Jun 2021 09:50:33 +0000
Received: from [2a01:4f8:210:31ae:175::25] (helo=bum5.dynsinn.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvd37-006WS2-Sp
 for ath11k@lists.infradead.org; Tue, 22 Jun 2021 09:50:31 +0000
Received: from [192.168.178.88] (p54bf9538.dip0.t-ipconnect.de [84.191.149.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: jens@gecius.de)
 by bum5.dynsinn.org (mail2.gecius.de) with ESMTPSA id CF210400E6F2
 for <ath11k@lists.infradead.org>; Tue, 22 Jun 2021 11:50:14 +0200 (CEST)
Subject: Re: qca/hci issues with Bluetooth on Dell XPS 13/AX500 (9310)
To: ath11k@lists.infradead.org
References: <d078b4bb-0cd5-ee9f-5d5d-6a95b3fe2ed9@gecius.de>
From: Jens Gecius <kernel@gecius.de>
Message-ID: <b6670ede-ffbb-02bc-0607-db267329585c@gecius.de>
Date: Tue, 22 Jun 2021 11:50:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d078b4bb-0cd5-ee9f-5d5d-6a95b3fe2ed9@gecius.de>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_025030_140062_3AEAB379 
X-CRM114-Status: GOOD (  24.03  )
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

QW0gMTEuMDUuMjEgdW0gMTU6MDIgc2NocmllYiBKZW5zIEdlY2l1czoKPiBEZWFyIGFsbCwKPgo+
IHRoZXJlIHdhcyBhbiBlYXJsaWVyIChNYXJjaCAzMCAiaXNzdWVzIHdpdGggUUNBNjM5MCBvbiBE
ZWxsIFhQUyAxMyIpIAo+IHJlcG9ydCBvZiB0aGUgc2FtZS9zaW1pbGFyIHByb2JsZW0gKGp1c3Qg
cmVhbGl6ZWQgdG9kYXkpLgo+Cj4gQXMgdGhhdCByZXBvcnRlciwgSSBoYXZlIGEgRGVsbCBYUFMg
MTMgZGV2IGVkaXRpb24vVWJ1bnR1ICh3b3JraW5nKS4gCj4gTXkgOTMxMCBoYXMgdGhlIEFYNTAw
IEtpbGxlciBXaWZpLiBXaWZpIGlzIHdvcmtpbmcgZmluZSwgYnV0IEJsdWV0b290aCAKPiBhbHdh
eXMgZ2l2ZXMgbWUgYSBjcmFzaCAoSSBibGFja2xpc3RlZCBCVCByZXF1aXJlZCBtb2R1bGVzIHRv
IGxhdGVyIAo+IHRyaWdnZXIgdGhlIG9vcHMgbXlzZWxmIG9yIHJ1biB3aXRob3V0KS4gVGhlIGNy
YXNoIHJlbmRlcnMgdGhlIAo+IHN1c3BlbmQvcmVzdW1lIGNhcGFiaWxpdGllcyBpbm9wZXJhYmxl
LCB0aGUgaGNpX3VhcnQgbW9kdWxlIGlzIG5vdCAKPiByZW1vdmVhYmxlLgo+Cj4gSSB0cmllZCB0
byBnZXQgZGlmZmVyZW5jZXMgb2YgdGhlIERlbGwgc3VwcGxpZWQgVWJ1bnR1LU9FTSA1LjYga2Vy
bmVsIAo+IHRvIGN1cnJlbnQgbWFpbmxpbmUsIGJ1dCBteSBncmV5IG1hdHRlciBpcyB1bmFibGUg
dG8gZGlnZXN0IHRoYXQgCj4gaW5mb3JtYXRpb24gYW5kIHN1cHBseSBoZWxwZnVsIGhpbnRzLgo+
IC9saWIvZmlybXdhcmUtZmlsZXMgd2VyZSB0aGUgc2FtZSBvbiBVYnVudHUgYW5kIEZlZG9yYSAo
aXQgcmVjZW50bHkgCj4gZ290IHVwZGF0ZWQgb24gbXkgRmVkb3JhIDM0IC0gY3Jhc2ggdW5jaGFu
Z2VkKS4KPgo+IEZ1bGwgZG1lc2cgb3V0cHV0IG9mIG1vZHVsZSBsb2FkaW5nIGF0dGFjaGVkLgo+
Cj4gSW50ZW50aW9uYWxseSwgSSBkaWQgYSBzdXNwZW5kLXJlc3VtZSBjeWNsZSBmaXJzdCBmb3Ig
eW91ciBraW5kIAo+IGluZm9ybWF0aW9uIGFuZCB0aGVuIGxvYWRlZCB0aGUgQlQgbW9kdWxlcy4g
VGhlIGNyYXNoIGFsc28gb2NjdXJzIGlmIEkgCj4gbG9hZCB0aGUgaGNpX3VhcnQgZGlyZWN0bHkg
YWZ0ZXIgc3lzdGVtIHN0YXJ0dXAuCj4KPiBUaGF0IGlzIHVuY2hhbmdlZCBzaW5jZSByZWNlaXZp
bmcgdGhlIG5vdGVib29rIGluIEFwcmlsLCBldmVuIHdpdGggCj4gZWFybGllciBmaXJtd2FyZSB2
ZXJzaW9uLiBJIGFtIG9uIHRoZSBsYXRlc3QgRmVkb3JhIGtlcm5lbCwgbm93IAo+IDUuMTEuMTgt
MzAwLmZjMzQueDg2XzY0LiBCSU9TIGlzIGxhdGVzdCAyLjIuMC4KPgo+IFRoZSB0cmFjZSBzYXlz
LCB0aGF0IHFjYV9yZWFkX3NvY192ZXJzaW9uIGlzIGNhdXNpbmcgdGhlIGNyYXNoIGR1cmluZyAK
PiBxY2FfdWFydF9zZXR1cCBpbiBidHFjYS4gSXMgdGhhdCBjb3JyZWN0Pwo+CgpKdXN0IHRvIHJl
cG9ydCBiYWNrLCB0aGF0IGJsdWV0b290aCB3b3JrcyB3aXRoIDUuMTIuMTEgKC4xMCBkaWRuJ3Qp
LiBBcyAKZmFyIGFzIEkgY2FuIHNlZSwgYSBjaGFuZ2UgdG8gbmV0L2JsdWV0b290aC9oY2lfY29y
ZS5jIHdhcyBtYWRlLiBOb3QgCnN1cmUsIGlmIHRoaXMgaXMgdGhlIHJlbGV2YW50IGNoYW5nZS4K
CgoKPiBBbmQgLSBtYXliZSBJJ20gb24gdGhlIHdyb25nIGxpc3QgaGVyZSAoQlQgLyBhdGgxMWsp
IGFueXdheSwgcGxlYXNlIAo+IGxldCBtZSBrbm93IGlmIHNvLiA6LSkKPgo+IElmIEkgY2FuIHN1
cHBvcnQsIHBsZWFzZSBsZXQgbWUga25vdy4gVGhhbmsgeW91IHZlcnkgbXVjaC4KPgo+IEJlc3QK
PiDCoEplbnMKPgoKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEx
awo=
