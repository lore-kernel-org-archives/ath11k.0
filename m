Return-Path: <SRS0=q65b=NO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BCAC4320A
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 16:12:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5080C613CD
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 16:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5080C613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V8WvsocPZJn82v4/lmed2BsHX5lFii/c9nd3zAdSDBE=; b=l/vg+TYvxu3Q6AEUPgCOuSvG9U
	iDgR6m8DkmWX5Nk7rrhF+5nFQrBbgGgC8W+f2Dccp+qY4FN0kQDAABCPfHrQ99VeDYMofsUsul9hV
	uvgxBexkgSRIfTCCJ3NLNdj9BnRi3HCbQ9QPVGArjmjXALYVWUsHimQ0Frixjd79NmeccOy8EbeWr
	UsNUDD6zdo1ZtXZvgMLv3xunYTp2HdbOKael/m6R/anH6M60GSquSl06jlJSRdMaetUfrpZrWX0gT
	+i4G2EleHWt/yg1FQ5mC+Ro7Vz2YpevhPwe0bhXlJ5XSj/I6Da1kkmlMcJaBYNUqfahXLXVrfOtkO
	oqm2FlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mICYa-00HXrx-1l; Mon, 23 Aug 2021 16:12:16 +0000
Received: from ns.iliad.fr ([212.27.33.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mICYK-00HXqN-OY
 for ath11k@lists.infradead.org; Mon, 23 Aug 2021 16:12:04 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id D0EB3205A4;
 Mon, 23 Aug 2021 18:02:33 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id B5AD92021B;
 Mon, 23 Aug 2021 18:02:33 +0200 (CEST)
Subject: Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
To: Kalle Valo <kvalo@codeaurora.org>, Wren Turkal <wt@penguintechs.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
From: Nicolas Schichan <nschichan@freebox.fr>
Message-ID: <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
Date: Mon, 23 Aug 2021 18:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87y28sqq4l.fsf@codeaurora.org>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Mon Aug 23 18:02:33 2021 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_091200_987783_22C93304 
X-CRM114-Status: GOOD (  11.38  )
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

T24gMjMvMDgvMjAyMSAxNDo1MywgS2FsbGUgVmFsbyB3cm90ZToKPiAoYWRkaW5nIGxpbnV4LXdp
cmVsZXNzLCByZWdyZXNzaW9ucyBhbmQgc29tZSBtaGkgZm9sa3MpCj4gCj4gV3JlbiBUdXJrYWwg
PHd0QHBlbmd1aW50ZWNocy5vcmc+IHdyaXRlczoKPiAKPj4gSSBoYXZlIG5vIGRldmljZSBmb3Ig
dGhlIHdpZmkgb24gbXkgY29tcHV0ZXIuIDUuMTMgd29ya2VkIHByZXR0eSB3ZWxsLgo+PiBJIGFs
c28gZm91bmQgb3RoZXJzIHJlcG9ydGluZyBzaW1pbGFyIGlzc3VlczoKPj4gaHR0cHM6Ly9mb3J1
bS5tYW5qYXJvLm9yZy90L2tlcm5lbDUtMTQtcmM2LWF0aDExay1vbi1xY2E2MzkwLXJlZ3Jlc3Np
b24tbWhpLXByb2JlLWZhaWx1cmUvNzkzNjIKPj4KPj4gSGVyZSdzIGluZm8gYWJvdXQgdGhlIGhh
cmR3YXJlIG9uIG15IGxhcHRvcDoKPj4g4p6cICB+IHN1ZG8gZG1pZGVjb2RlIC1zIHN5c3RlbS1w
cm9kdWN0LW5hbWUKPj4gWFBTIDEzIDkzMTAKPj4KPj4g4p6cICB+IHN1ZG8gZG1pZGVjb2RlIC1z
IGJpb3MtdmVyc2lvbgo+PiAzLjAuNAo+IAo+IERvIHlvdSBnZXQgdGhlIHNhbWUgbWhpIGVycm9y
IGFzIGluIHRoZSBmb3J1bSBwb3N0Pwo+IAo+IHFjb21fbWhpX3FydHI6IHByb2JlIG9mIG1oaTBf
SVBDUiBmYWlsZWQgd2l0aCBlcnJvciAtMjIKPiAKPiBNSEkgZm9sa3MsIGFueSBpZGVhcz8gSSBo
YXZlIFhQUyAxMyA5MzEwIG15c2VsZiBidXQgSSdtIG5vdCBhYmxlIHRvIHRlc3QKPiB2NS4xNC1y
YzYga2VybmVsIHJpZ2h0IG5vdy4KCkhlbGxvLAoKSSBoYXZlIGhpdCB0aGUgc2FtZSBpc3N1ZSBv
biBMaW51eCA1LjE0LXJjNzoKClsgICAxNC43ODA1NjZdIHFjb21fbWhpX3FydHI6IHByb2JlIG9m
IG1oaTBfSVBDUiBmYWlsZWQgd2l0aCBlcnJvciAtMjIKClRoaXMgbG9va3MgdG8gYmUgY2F1c2Vk
IGJ5IGNvbW1pdDoKCmNlNzhmZmEzZWYxNiBuZXQ6IHJlYWxseSBmaXggdGhlIGJ1aWxkLi4uCgpS
ZXZlcnRpbmcgdGhpcyBjb21taXQgcmVzdWx0cyBpbiBhdGgxMWsgYmVpbmcgYWJsZSB0byBsb2Fk
IHdpdGhvdXQgZXJyb3JzLgoKUmVnYXJkcywKCi0tIApOaWNvbGFzIFNjaGljaGFuCgoKLS0gCmF0
aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
