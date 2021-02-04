Return-Path: <SRS0=ZsjY=HG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DA1C433E0
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 03:41:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E5464F5D
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 03:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E5464F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HRtOh5rzasAIyfJV0ACZ0wUBZGd/I5ft29kUQ03mv2A=; b=oggHfNeLbWTN4fepYvzUUoRJA
	Y14jh5YqjQFQhGy/831sFGs60NWUorQS6r6Ytg6TmnJckaZ+cW3JCCLV+5Wd/53Xni2z2TbunNQLv
	GFvdmQs38P4AqV5CwJkuyoDXByv6hOMgwkjFLjGtdiDBqnt7ID/lWDIpwrL7niylnIj5mR/9xgCjX
	Q0A5u9NBuNylTv5szFuIXt5Qh/w/IswdBVG5AssjMUIMxzY2pK5mqD2tlPWDmHChsqDyCT2/GgyoU
	/kKHiEawg5ENP8ikNUcIqEhVyaXuxSKxyDts1trtd1/HHsrtHg0dP1zrSPU0q2a9rL0mraDEyP+aB
	NsLzdIgeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7VW1-0007yc-BW; Thu, 04 Feb 2021 03:41:09 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7VVy-0007y8-LQ
 for ath11k@lists.infradead.org; Thu, 04 Feb 2021 03:41:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612410067; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=T6EudLrvQnPgGQjOQTFHIUEmOmA8Tkn1jsLZ+nZLPNQ=;
 b=QZ1pV0bkFKkQYb1oR0IN7DBwVL3eM50grh/GI5L9Y1aDTdJcLPy0Dg01Vwfe50w6sak4Md4c
 X3weVxoCvPKAWq3Vb+vBrp8GKbYtRljmzNu8+QMme6bQbvO18B2HaxgNxkE9OP74+7gdzuxf
 4GxrnonIxX4wKVIC6e1hNkIy814=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 601b6cc8ca5a3268deae1de8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 03:40:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E5397C43461; Thu,  4 Feb 2021 03:40:55 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: periyasa)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 67129C433CA;
 Thu,  4 Feb 2021 03:40:55 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 04 Feb 2021 09:10:55 +0530
From: Karthikeyan periyasamy <periyasa@codeaurora.org>
To: Peter Oh <peter.oh@eero.com>
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
In-Reply-To: <ea3fb227-8324-dd73-f400-b6e591bc91df@eero.com>
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
 <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
 <d6cbfd2aff787faa3be69252b2677df9@codeaurora.org>
 <08ef5e10-de7a-fe13-d23a-d1afa1dbd0e5@eero.com>
 <ea757176a6438f1b0cf9bee41f8a9f8c@codeaurora.org>
 <dc8f531f-2ab5-f690-2b94-917880682fcc@eero.com>
 <7e3bae2db30d90963f96bb9be82951f0@codeaurora.org>
 <ea3fb227-8324-dd73-f400-b6e591bc91df@eero.com>
Message-ID: <4eeb59233c041d26ca35fa8066691027@codeaurora.org>
X-Sender: periyasa@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_224107_560209_90F47AFF 
X-CRM114-Status: GOOD (  14.74  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMi0wNCAwOTowNywgUGV0ZXIgT2ggd3JvdGU6Cj4gT24gMi8zLzIxIDc6MTcgUE0s
IEthcnRoaWtleWFuIHBlcml5YXNhbXkgd3JvdGU6Cj4+IE9uIDIwMjEtMDItMDQgMDg6MzgsIFBl
dGVyIE9oIHdyb3RlOgo+Pj4gT24gMi8zLzIxIDU6MDggUE0sIEthcnRoaWtleWFuIHBlcml5YXNh
bXkgd3JvdGU6Cj4+Pj4gT24gMjAyMS0wMi0wNCAwMDo1OSwgUGV0ZXIgT2ggd3JvdGU6Cj4+Pj4+
IE9uIDEvMjYvMjEgNjo0NiBQTSwgS2FydGhpa2V5YW4gcGVyaXlhc2FteSB3cm90ZToKPj4+Pj4+
IE9uIDIwMjAtMTItMTkgMDA6NTMsIFBldGVyIE9oIHdyb3RlOgo+Pj4+Pj4+IE9uIDEyLzE4LzIw
IDc6MjQgQU0sIEthcnRoaWtleWFuIFBlcml5YXNhbXkgd3JvdGU6Cj4+Pj4+Pj4+IFR4IGRlc2Ny
aXB0b3Igc2VhcmNoIGluZGV4IGZpZWxkIHNob3VsZCBiZSB1cGRhdGVkIHdpdGggaHcgcGVlciAK
Pj4+Pj4+Pj4gaWQKPj4+Pj4+Pj4gYW5kIG5vdCBieSBBU1QgSGFzaC4gSW5jb3JyZWN0IHNlYXJj
aCBpbmRleCBjYXVzZXMgdGhyb3VnaHB1dCAKPj4+Pj4+Pj4gZGVncmFkYXRpb24KPj4+Pj4+Pj4g
aW4gYWxsIHRoZSBwbGF0Zm9ybXMuIHNvIHVwZGF0ZWQgdGhlIHNlYXJjaCBpbmRleCBmaWVsZCB3
aXRoIGh3IAo+Pj4+Pj4+PiBwZWVyIGlkLAo+Pj4+Pj4+PiB3aGljaCBpcyBhIGNvbW1vbiBjaGFu
Z2UgYXBwbGljYWJsZSBmb3IgYWxsIHRoZSBwbGF0Zm9ybXMuCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBU
ZXN0ZWQtb246IElQUTgwNzQgaHcyLjAgQUhCIAo+Pj4+Pj4+PiBXTEFOLkhLLjIuNC4wLjEtMDE0
OTItUUNBSEtTV1BMX1NJTElDT05aLTEKPj4+Pj4+Pj4gCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3BlZXIuYyAKPj4+Pj4+Pj4gYi9kcml2ZXJz
L25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3BlZXIuYwo+Pj4+Pj4+PiBpbmRleCBiNjllN2ViLi5m
NDlhYmVmYSAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDExay9wZWVyLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEx
ay9wZWVyLmMKPj4+Pj4+Pj4gCj4+Pj4+Pj4+IEBAIC0zMDksNyArMzEwLDExIEBAIGludCBhdGgx
MWtfcGVlcl9jcmVhdGUoc3RydWN0IGF0aDExayAqYXIsIAo+Pj4+Pj4+PiBzdHJ1Y3QgYXRoMTFr
X3ZpZiAqYXJ2aWYsCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHBlZXItPnBkZXZfaWR4ID0gYXIt
PnBkZXZfaWR4Owo+Pj4+Pj4+PiDCoMKgwqDCoMKgIHBlZXItPnN0YSA9IHN0YTsKPj4+Pj4+Pj4g
LcKgwqDCoCBhcnZpZi0+YXN0X2hhc2ggPSBwZWVyLT5hc3RfaGFzaDsKPj4+Pj4+Pj4gKwo+Pj4+
Pj4+PiArwqDCoMKgIGlmIChhcnZpZi0+dmlmLT50eXBlID09IE5MODAyMTFfSUZUWVBFX1NUQVRJ
T04pIHsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFydmlmLT5hc3RfaGFzaCA9IHBlZXItPmFz
dF9oYXNoOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXJ2aWYtPmFzdF9pZHggPSBwZWVyLT5o
d19wZWVyX2lkOwo+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+PiAKPj4+Pj4+PiBIb3cgYWJvdXQg
bm9uIFNUQVRJT04gdHlwZT8KPj4+Pj4+PiAKPj4+Pj4+IAo+Pj4+Pj4gbm8gbmVlZCBvZiBjb25m
aWd1cmluZyB0aGUgYXN0X2lkeCwgYXN0X2hhc2ggZmllbGQgZm9yIG5vbiBzdGF0aW9uIAo+Pj4+
Pj4gdHlwZS4gSXRzIHJlY29tbWVuZGVkIGJ5IEhXL0ZXIHRlYW0uCj4+Pj4+PiAKPj4+Pj4gQ2Fu
IHlvdSBhZGQgdGhpcyBjb21tZW50IGluIGNvbW1pdCBtZXNzYWdlPwo+Pj4+PiAKPj4+PiAKPj4+
PiBzdXJlCj4+Pj4gCj4+Pj4+IEFsc28gY291bGQgeW91IGluY2x1ZGUgdGhlIGFuc3dlciB0byAi
d2hhdCBjb25kaXRpb25zIHlvdSBvYnNlcnZlZCAKPj4+Pj4gdGhlCj4+Pj4+IHRocm91Z2hwdXQg
ZGVncmFkYXRpb24/IiBpbiBjb21taXQgbWVzc2FnZSB0b28/Cj4+Pj4gCj4+Pj4gSW4gYWxsIHRo
ZSBzY2VuYXJpbyB3aWxsIHNlZSBkZWdyYWRhdGlvbi4gSXRzIGEgZ2VuZXJhbCBpbXByb3ZlbWVu
dC4KPj4+PiAKPj4+IEl0IHNvdW5kcyBnb29kIGFuZCBpdCB3aWxsIGJldHRlciBpZiB5b3Ugc2hh
cmUgdGhlIG51bWJlciBiZWZvcmUgYW5kCj4+PiBhZnRlciB0aGUgcGF0Y2guCj4+IAo+PiBJIGhh
dmUgc2VlbiAxMCUgaW5jcmVhc2UgaW4gV0RTIHNjZW5hcmlvLgo+PiAKPj4gVGhhbmtzLAo+PiBL
YXJ0aGlrZXlhbiBQCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgc2hhcmluZy4KPiAKPiBCVFcsIGFs
bCBzdWNoIGluZm9ybWF0aW9uIHNob3VsZCBnbyB0byBjb21taXQgbWVzc2FnZS4KPiAKPiBQZXRl
cgoKSSB1cGRhdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlCgpUaGFua3MsCkthcnRoaWtleWFuIFAK
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
