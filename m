Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D004EC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:30:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9738C60F4A
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9738C60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ok7Vx2nS260pyCSzsCUl3x/WaA87/EO0PPL2oSDJdoc=; b=MIYDA8yoXAEUnK
	Z1THaslaHBSi9I3dPDyewBGtCrTzDmJa0Sr2IQlbEEhOrKkG78XJ4H+8wnBZjhLUzZ05RakY7nKVK
	ph4NdG28BWBk4j64GqYnGx2Z5AaoWmgilmCE+UD8JxeSbxOxtZmVkKjFCbesPCkkwt1obwACciRQY
	UIkRMX89GncKwFqbX0wZOtJRsgMgqrf3ZVkvz/4CiFlsBboIqA5+uscGBQ3RyTfwWGudzOXfUdAPV
	QF1wKo8JgEmjuoYLsbiVdsSt88yxTsQ4U66GyPhZCBikpErbq4mWvGG9GeZwVY0FiM5tVUtw2gnc3
	aRH5jvNqnbFGCWsg5UgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAmX-009YOy-K0; Thu, 26 Aug 2021 08:30:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAmR-009YOS-NB
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 08:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=xmX32MGO2AKihv8f66b1MAJsZEvCTBwLG94/AXPlyvs=; 
 t=1629966635; x=1631176235; b=kDdY6kj5J/nrzsKYyaoWlfAPJG4WQ3gnJ5iSx3CvQTg1IXk
 yDXRDKhaVAFZqBdyuXJGzzmxzPViw4meSatdeUCtdWgJkj7DDZT24v/57O1+2qpDoyj+XyCBpimHp
 rHIlClvkA8QwSzMFzEirEWMgg39hV3PB/Fzd0VHaquDTR5i1hZDy6Wt0V4mDP8aCKTyOsvghr5CTn
 fTW25wqrQVVUCda+Q/wr4YJY+9Zr0h0VCka0EhOOtPImYw4SR+tNx6/bug+fpgzaY2LBPot1uJWcG
 VWbCCzg9H6f4CBNuUWB1Eb9PxHg4Z0GbT+1CeukbEMDYljYn0+KJSnpgxf3VKqIA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJAmQ-00G4uU-6g; Thu, 26 Aug 2021 10:30:34 +0200
Message-ID: <ab8ec9741e01bad0857e165ca35d968e8dc9dee7.camel@sipsolutions.net>
Subject: Re: [PATCH v2 6/8] mac80211: add definition for transmit power
 envelope element
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 10:30:33 +0200
In-Reply-To: <20210820122041.12157-7-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-7-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_013035_794355_FCAAE4F9 
X-CRM114-Status: UNSURE (   9.35  )
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

T24gRnJpLCAyMDIxLTA4LTIwIGF0IDA4OjIwIC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPiBJRUVF
IFN0ZCA4MDIuMTFheOKEoi0yMDIxIGhhdmUgc29tZSBjaGFuZ2UgZm9yIHRyYW5zbWl0IHBvd2Vy
IGVudmVsb3BlCj4gZWxlbWVudC4gVGhpcyBwYXRjaCB0byBhZGQgdGhlIGRlZmluaXRpb24gb2Yg
aXQuCj4gCgpHZW5lcmFsbHk6IEknbSBzdXJlIEthbGxlIGhhcyBzb21lIHBhZ2Ugb24gdGhpcywg
YnV0IHlvdXIgY29tbWl0Cm1lc3NhZ2VzIGNvdWxkIHVzZSBzb21lIHdvcmsgLSB5b3UgZG9uJ3Qg
bmVlZCB0byBzYXkgInRoaXMgcGF0Y2giIGZvcgpleGFtcGxlLCB0aGF0J3MgZW50aXJlbHkgb2J2
aW91cyA6KQoKCj4gCj4gKy8qKgoKbm90IGFjdHVhbGx5IGtlcm5lbC1kb2MsIGJ1dCBJIGNhbiBm
aXggCgo+ICsgKiBJbiAiOS40LjIuMTYxIFRyYW5zbWl0IFBvd2VyIEVudmVsb3BlIGVsZW1lbnQi
IG9mICJJRUVFIFN0ZCA4MDIuMTFheC0yMDIxIiwKPiArICogaXQgc2hvdyA0IHR5cGVzIGluICJU
YWJsZSA5LTI3NWEtTWF4aW11bSBUcmFuc21pdCBQb3dlciBJbnRlcnByZXRhdGlvbiBzdWJmaWVs
ZCBlbmNvZGluZyIuCj4gKyAqIEFuZCBpdCBoYXMgMiBjYXRlZ29yeSBmb3IgZWFjaCB0eXBlIGlu
ICJUYWJsZSBFLTEyLVJlZ3VsYXRvcnkgSW5mbyBzdWJmaWVsZCBlbmNvZGluZyBpbiB0aGUgVW5p
dGVkIFN0YXRlcyIuCj4gKyAqIFNvIGl0IGl0IHRvdGFsbHkgbWF4IDggVHJhbnNtaXQgUG93ZXIg
RW52ZWxvcGUgZWxlbWVudC4KCnZlcnkgbG9uZyBsaW5lcywgd2lsbCBmaXggdGhhdCB0b28KCmpv
aGFubmVzCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
