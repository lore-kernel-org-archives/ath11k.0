Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E00DC433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:48:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E1561019
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3E1561019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImcRPUB8SRkLrn8K3mkAl38ypXrGsgk9k4+kLAW6Sd4=; b=mfRSmpkjwPkdb9
	br+btZPHHsysFi8C9bqzmSu/Cr6VaI+uKI8hs/HQhghcKqT6qakFOqVaCUeLavC1N2sIIKm0D82RK
	S/9YsS9MjzQSEGOcIk1oYk6GHSgXumjWIy8uIUdSQaHNzyr7xA1daWjQGs0vOGqhxqpTmXi+Dh/1x
	AvPNofEUgnt5iGhl55Oxf13DFaUhjuc2N8kZlpYCw9nM6QdnvMjYCOviaQgCEgRzfTnPsrVset1eJ
	uEz9CO0I2Z1KCyGRA4BFjscBEwUdgpZXKk8buF7LZmogOO7oIRFD/mDfWWhLTg3+WkxWv2Xe0KTc+
	hLNx5x0KuFWYxAFyQvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTikI-00E7TE-HO; Fri, 24 Sep 2021 10:47:58 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTikF-00E7Sv-Uk
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 10:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=UwM4aAzBj6rN1BXyl4YIBsxqe561TcfDXv5VBrcAq6U=; 
 t=1632480475; x=1633690075; b=Hte4s0n3yoP6oc5wHesqvCMNjLf+V6zUZsP/Gblqm3XVXlO
 IR5020q3VGBrL1eYsYjrOn0t9dMhc56I5L5nLMnZve2fb7ogbvYUmKjWsGXESbH0YYCkQL0sW7ktJ
 29AMK4Lwg+ifi+JeK0nlzujxHv8RnJrCy+nuiXinsa32QpG12wfGOTNBTYnt32DnEjPsGTr2+SUtm
 ES+I9NU6nf6h4uO8P9WjhMjitrhBXI554wgEE1A+gjsimCO2MnpXOHvVJ7y9I0FS1sdZBYSXTfKHe
 sWf8O0reAnn4rAYrAsFvI3k7DnrhcpXRL3RP0ZZvETcG/OhNqugxjQyL155r6bxg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mTikE-00B9pG-4u; Fri, 24 Sep 2021 12:47:54 +0200
Message-ID: <19473132ad2e3bab492c001402e0b08886a5493c.camel@sipsolutions.net>
Subject: Re: [PATCH v4 5/6] mac80211: use ieee802_11_parse_elems() to find
 ies instead of ieee80211_bss_get_ie()
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 24 Sep 2021 12:47:53 +0200
In-Reply-To: <b02735cc844c9ba2222d23a7e6ad112a82a36891.camel@sipsolutions.net>
References: <20210924100052.32029-1-wgong@codeaurora.org>
 <20210924100052.32029-6-wgong@codeaurora.org>
 <b02735cc844c9ba2222d23a7e6ad112a82a36891.camel@sipsolutions.net>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_034756_015635_287AE20A 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCAyMDIxLTA5LTI0IGF0IDEyOjEzICswMjAwLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+
IFRha2luZyBhIGJyaWVmIGxvb2sgYmVmb3JlIGx1bmNoLAo+IAo+ID4gwqAJaWYgKCEoaWZtZ2Qt
PmZsYWdzICYgSUVFRTgwMjExX1NUQV9ESVNBQkxFX0hUKSAmJiAhaXNfNmdoeikgewo+ID4gwqAJ
CWNvbnN0IHU4ICpodF9vcGVyX2llLCAqaHRfY2FwX2llOwo+ID4gwqAKPiA+IAo+ID4gCj4gPiAK
PiA+IC0JCWh0X29wZXJfaWUgPSBpZWVlODAyMTFfYnNzX2dldF9pZShjYnNzLCBXTEFOX0VJRF9I
VF9PUEVSQVRJT04pOwo+ID4gKwkJaHRfb3Blcl9pZSA9IGVsZW1zLT5odF9vcGVyYXRpb24gPwo+
ID4gKwkJCSgoY29uc3QgdTggKillbGVtcy0+aHRfb3BlcmF0aW9uKSAtIDIgOgo+ID4gKwkJCU5V
TEw7Cj4gPiDCoAkJaWYgKGh0X29wZXJfaWUgJiYgaHRfb3Blcl9pZVsxXSA+PSBzaXplb2YoKmh0
X29wZXIpKQo+ID4gwqAJCQlodF9vcGVyID0gKHZvaWQgKikoaHRfb3Blcl9pZSArIDIpOwo+IAo+
IENhbid0IHdlIGRyb3AgdGhlc2UgY2hlY2tzLCBhbmQgc2ltcGx5IGRvCj4gCj4gaHRfb3BlciA9
IGVsZW1zLT5odF9vcGVyYXRpb24/CgpJIGNoZWNrZWQsIHllcywgd2UgY2FuIGRvIHRoYXQuIFNp
bmNlIEkganVzdCBkaWQgaXQgYW55d2F5LCBubyBuZWVkIHRvCnJlc2VuZC4KCmpvaGFubmVzCgoK
LS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
