Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727FAC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 14:25:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15FEE60F58
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 14:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15FEE60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isvd8krEWJdqCLQ8DwfDrREBmrsLzFabamqIrkascNs=; b=XPJDkgMevDAn4z
	Q+24i5dHGlVLarn8w+oTT3JXDOHms23yWLQnRp65m1vHfC3jPAHLNSPMOYw9YvqgBPckuOfdgWnYz
	tIaxXWNVWhLZ7QhdihQuqbCLvJn2w0Yr/+xdd0fswmuzuwr+8MkU1s+/sBt8witcEwvFNQXIu7LWI
	VzQuAXwZAzWAFQu8dshyfZCav51ZV4p7r4FPZrG4aenuviDU7wW57VPVlynb4pk4S3v613+wzQre/
	rfrxH413l/XyZb2hWM/rVavQThLfiN/rCUQf+ItJlaPiqw+pn1m18FXLxzOh29dwWHLdHISRS2TNX
	5RvdLMyQLqy3zW1lpjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGK4-00ANCP-0t; Thu, 26 Aug 2021 14:25:40 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGJx-00ANAw-OG
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 14:25:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629987934; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=m3dDgaFcDlNATkZhVEgLrNuWBjLykZdjwnfxtS/CmN0=;
 b=jn0RblWrR5m9REugojVXqsyvvCFGQa/qf6pnzAf8Ea3CrOD8jsKXAmQgUlfSgA0gK7zcwjDE
 MFO8FvCHOHAr+ivnGdfMNMQlOUPbf8Js5VEeXIv4u22AkG55l36mGDzKBduqRaYARRvMUp9E
 IDg/QKyALldWOtLv9kBq9un6AsM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6127a44acd680e8969c9d5fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 14:25:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 96308C4361C; Thu, 26 Aug 2021 14:25:13 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0FE45C4338F;
 Thu, 26 Aug 2021 14:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0FE45C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: David S. Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wren Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 Nicolas Schichan <nschichan@freebox.fr>
Subject: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org>
Date: Thu, 26 Aug 2021 17:25:04 +0300
In-Reply-To: <87tujgqcth.fsf@codeaurora.org> (Kalle Valo's message of "Mon, 23
 Aug 2021 20:40:42 +0300")
Message-ID: <87mtp47073.fsf_-_@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_072534_879675_778D4810 
X-CRM114-Status: GOOD (  20.04  )
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

KEFkZGluZyBMaW51cyBhbmQgR3JlZykKCkthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3Jn
PiB3cml0ZXM6Cgo+IChBZGRpbmcgRGF2ZSBhbmQgSmFrdWIgdG8gQ0MpCj4KPiBOaWNvbGFzIFNj
aGljaGFuIDxuc2NoaWNoYW5AZnJlZWJveC5mcj4gd3JpdGVzOgo+Cj4+IE9uIDIzLzA4LzIwMjEg
MTQ6NTMsIEthbGxlIFZhbG8gd3JvdGU6Cj4+PiAoYWRkaW5nIGxpbnV4LXdpcmVsZXNzLCByZWdy
ZXNzaW9ucyBhbmQgc29tZSBtaGkgZm9sa3MpCj4+PiAKPj4+IFdyZW4gVHVya2FsIDx3dEBwZW5n
dWludGVjaHMub3JnPiB3cml0ZXM6Cj4+PiAKPj4+PiBJIGhhdmUgbm8gZGV2aWNlIGZvciB0aGUg
d2lmaSBvbiBteSBjb21wdXRlci4gNS4xMyB3b3JrZWQgcHJldHR5IHdlbGwuCj4+Pj4gSSBhbHNv
IGZvdW5kIG90aGVycyByZXBvcnRpbmcgc2ltaWxhciBpc3N1ZXM6Cj4+Pj4gaHR0cHM6Ly9mb3J1
bS5tYW5qYXJvLm9yZy90L2tlcm5lbDUtMTQtcmM2LWF0aDExay1vbi1xY2E2MzkwLXJlZ3Jlc3Np
b24tbWhpLXByb2JlLWZhaWx1cmUvNzkzNjIKPj4+Pgo+Pj4+IEhlcmUncyBpbmZvIGFib3V0IHRo
ZSBoYXJkd2FyZSBvbiBteSBsYXB0b3A6Cj4+Pj4g4p6cICB+IHN1ZG8gZG1pZGVjb2RlIC1zIHN5
c3RlbS1wcm9kdWN0LW5hbWUKPj4+PiBYUFMgMTMgOTMxMAo+Pj4+Cj4+Pj4g4p6cICB+IHN1ZG8g
ZG1pZGVjb2RlIC1zIGJpb3MtdmVyc2lvbgo+Pj4+IDMuMC40Cj4+PiAKPj4+IERvIHlvdSBnZXQg
dGhlIHNhbWUgbWhpIGVycm9yIGFzIGluIHRoZSBmb3J1bSBwb3N0Pwo+Pj4gCj4+PiBxY29tX21o
aV9xcnRyOiBwcm9iZSBvZiBtaGkwX0lQQ1IgZmFpbGVkIHdpdGggZXJyb3IgLTIyCj4+PiAKPj4+
IE1ISSBmb2xrcywgYW55IGlkZWFzPyBJIGhhdmUgWFBTIDEzIDkzMTAgbXlzZWxmIGJ1dCBJJ20g
bm90IGFibGUgdG8gdGVzdAo+Pj4gdjUuMTQtcmM2IGtlcm5lbCByaWdodCBub3cuCj4+Cj4+IEhl
bGxvLAo+Pgo+PiBJIGhhdmUgaGl0IHRoZSBzYW1lIGlzc3VlIG9uIExpbnV4IDUuMTQtcmM3Ogo+
Pgo+PiBbICAgMTQuNzgwNTY2XSBxY29tX21oaV9xcnRyOiBwcm9iZSBvZiBtaGkwX0lQQ1IgZmFp
bGVkIHdpdGggZXJyb3IgLTIyCj4+Cj4+IFRoaXMgbG9va3MgdG8gYmUgY2F1c2VkIGJ5IGNvbW1p
dDoKPj4KPj4gY2U3OGZmYTNlZjE2IG5ldDogcmVhbGx5IGZpeCB0aGUgYnVpbGQuLi4KPj4KPj4g
UmV2ZXJ0aW5nIHRoaXMgY29tbWl0IHJlc3VsdHMgaW4gYXRoMTFrIGJlaW5nIGFibGUgdG8gbG9h
ZCB3aXRob3V0IGVycm9ycy4KPgo+IFRoYW5rcywgdGhpcyBoZWxwcyBhIGxvdC4gQ29tbWl0IGNl
NzhmZmEzZWYxNiB3YXMgaW50cm9kdWNlZCBpbgo+IHY1LjE0LXJjNSBzbyBJIGFzc3VtZSB0aGF0
J3MgdGhlIGZpcnN0IHJlbGVhc2Ugd2hpY2ggYnJva2UgYXRoMTFrLgo+Cj4gRGF2ZSwgd2hhdCBi
dWlsZCBpc3N1ZSBkaWQgeW91IGZpeCB3aXRoIGNvbW1pdCBjZTc4ZmZhM2VmMTY/IENvdWxkIHdl
Cj4gcmV2ZXJ0IHRoZSBjb21taXQ/IFRoZSBwcm9ibGVtIGlzIHRoYXQsIHVubGVzcyB3ZSBmaXgg
dGhpcyBpc3N1ZSwgd2l0aAo+IHY1LjE0IFdMQU4gd2lsbCBiZSBicm9rZW4gb24gYSBxdWl0ZSBm
ZXcgbmV3ZXIgRGVsbCBsYXB0b3BzLgoKSSBkaWQgc29tZSBpbnZlc3RpYXRpb24gYW5kIEkgc3Vz
cGVjdCB0aGF0IGNvbW1pdCBjZTc4ZmZhM2VmMTYgKCJuZXQ6CnJlYWxseSBmaXggdGhlIGJ1aWxk
Li4uIilbMV0gaXMgZm9yIGhhbmRsaW5nIGEgY29uZmxpY3QgYmV0d2VlbiBuZXQtbmV4dAphbmQg
Y2hhci1taXNjLW5leHQgdHJlZXMgcmVsYXRlZCB0byBMb2ljJ3MgY29tbWl0IDAwOTJhMWUzZjc2
MyAoImJ1czoKbWhpOiBBZGQgaW5ib3VuZCBidWZmZXJzIGFsbG9jYXRpb24gZmxhZyIpLiBHcmVn
IG1lbnRpb25zIHRoaXMgaW4gYQpjb21taXRbMl06Cgpjb21taXQgODEzMjcyZWQ1MjM4YjM3Yzgx
ZTQ0OGIzMDIwNDhlODAwODU3MDEyMQpNZXJnZTogZGUwNTM0ZGY5MzQ3IDM2YTIxZDUxNzI1YQpB
dXRob3I6ICAgICBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
PgoKICAgIE1lcmdlIDUuMTQtcmM1IGludG8gY2hhci1taXNjLW5leHQKICAgIAogICAgV2UgbmVl
ZCB0aGUgZml4ZXMgaW4gaGVyZSBhcyB3ZWxsLCBhbmQgcmVzb2x2ZXMgc29tZSBtZXJnZSBpc3N1
ZXMgd2l0aAogICAgdGhlIG1oaSBjb2RlYmFzZS4KCklmIG15IGFzc3VtcHRpb24gaXMgY29ycmVj
dCB3aGVuIEkgcHJvcG9zZSB0aGF0IHdlIHJldmVydCBjb21taXQKY2U3OGZmYTNlZjE2IGZvciB2
NS4xNCwgQUZBSUNTIGl0J3Mgbm90IHJlYWxseSBuZWVkZWQgZm9yIHY1LjE0IChjb21taXQKMDA5
MmExZTNmNzYzIGlzIGluIC1uZXh0LCBub3QgaW4gTGludXMnIHRyZWUgeWV0KSBhbmQgY29tbWl0
CmNlNzhmZmEzZWYxNiBicmVha3MgYXRoMTFrLiBBbmQgdGhlIGNvbmZsaWN0IGJldHdlZW4gbmV0
LW5leHQgYW5kCmNoYXItbWlzYy1uZXh0IGNhbiBiZSB0aGVuIGxhdGVyIGZpeGVkIGR1cmluZyB0
aGUgbWVyZ2Ugd2luZG93LgoKV2lsbCB0aGlzIHdvcmsgZm9yIGV2ZXJ5b25lPyBJZiBubyBvYmpl
Y3Rpb25zLCBJJ2xsIHN1Ym1pdCB0aGUgcmV2ZXJ0IHRvCkxpbnVzIGxhdGVyIHRvZGF5LiBXZSBh
cmUgZ2V0dGluZyByZWFsbHkgY2xvc2UgdG8gZmluYWwgdjUuMTQgcmVsZWFzZSBzbwpub3QgbXVj
aCB0aW1lIGxlZnQgdG8gZml4IHRoaXMuCgpKdXN0IHRvIHJlaXRlcmF0ZSB3aHkgdGhlIHVyZ2Vu
Y3k6IGNvbW1pdCBjZTc4ZmZhM2VmMTYgYnJva2UgYXRoMTFrIGluCnY1LjE0LXJjNSwgdXNlcnMg
aGF2ZSByZXBvcnRlZCAoYW5kIEkgaGF2ZSBjb25maXJtZWQpIHRoYXQgYXQgbGVhc3QKUUNBNjM5
MCBzdXBwb3J0IGlzIGJyb2tlbiBidXQgSSBzdXNwZWN0IGFsbCBRdWFsY29tbSBXaS1GaSA2IGRl
dmljZXMKc3VwcG9ydGVkIGJ5IGF0aDExayBhcmUgY3VycmVudGx5IGJyb2tlbi4KClsxXSBodHRw
czovL2dpdC5rZXJuZWwub3JnL2xpbnVzL2NlNzhmZmEzZWYxNgoKWzJdIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC9jaGFyLW1pc2MuZ2l0L2Nv
bW1pdC8/aD1jaGFyLW1pc2MtbmV4dCZpZD04MTMyNzJlZDUyMzhiMzdjODFlNDQ4YjMwMjA0OGU4
MDA4NTcwMTIxCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZl
bG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGlu
ZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
