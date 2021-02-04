Return-Path: <SRS0=ZsjY=HG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4971C433DB
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 01:09:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 546D064E0A
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 01:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 546D064E0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RJpYeKW1o6/hd9p0wbAyTcC2pQZ7gPLaunGEcTUDAIQ=; b=JgGVYJZ0tT2lMsEJbvKj8qt+x
	gB0VUm5vC5wQKAjevHjnnBjp4Ffev8DfQrnuBvsIzwtGDHga4PF3nMwoaNqnhC7YU5Bu1HZJvra6N
	TTnsXQOzaC5d0/W1T9HubPKxw3aCUMKSzK6iE7xozyOCqhx3E+Qipir/K4Yhzz4CrtFRQP5GZFv7P
	cqeEKw6V4Jg9T80Y/HQ0R/RcGm4Zc9as27wipYSYlOnoSK0OlVFdyDr1xrIoglGcmrauAgsf1vwIF
	Jb1v7yuTtLUcsAX1E3obja93Xd/08ItMWCcVKYbhXm4fQn3GuNe3nb8ZwNcxtXZqrx5CJ0uYVz31l
	8DB1yhYBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7T8y-0005lj-9a; Thu, 04 Feb 2021 01:09:12 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7T8v-0005lE-Uo
 for ath11k@lists.infradead.org; Thu, 04 Feb 2021 01:09:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612400949; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=G/wXac09EiUYuMIKbVlza3OTxdoMrvTB/u6MtvKydco=;
 b=mJSBMoB1kncmll42KlJHgx46DyGsN7Jly1hi6y+VJvCi+ZMgNYwXAMbcnknHMo8E/xuYePr3
 tCgDchRo+TLEQuNY1ORO8XBGhcKxfBpiVOOIwpFBNMmyy+u4RtHR8e9RkxSUtW4foBGYVtU8
 kWMF5PDgrLPASrgYd1cpYksZRRc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 601b491eca5a3268de5bc137 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 01:08:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 96C10C43462; Thu,  4 Feb 2021 01:08:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: periyasa)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DAA0C433CA;
 Thu,  4 Feb 2021 01:08:46 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 04 Feb 2021 06:38:46 +0530
From: Karthikeyan periyasamy <periyasa@codeaurora.org>
To: Peter Oh <peter.oh@eero.com>
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
In-Reply-To: <08ef5e10-de7a-fe13-d23a-d1afa1dbd0e5@eero.com>
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
 <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
 <d6cbfd2aff787faa3be69252b2677df9@codeaurora.org>
 <08ef5e10-de7a-fe13-d23a-d1afa1dbd0e5@eero.com>
Message-ID: <ea757176a6438f1b0cf9bee41f8a9f8c@codeaurora.org>
X-Sender: periyasa@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_200910_052885_75CF9B82 
X-CRM114-Status: GOOD (  11.90  )
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

T24gMjAyMS0wMi0wNCAwMDo1OSwgUGV0ZXIgT2ggd3JvdGU6Cj4gT24gMS8yNi8yMSA2OjQ2IFBN
LCBLYXJ0aGlrZXlhbiBwZXJpeWFzYW15IHdyb3RlOgo+PiBPbiAyMDIwLTEyLTE5IDAwOjUzLCBQ
ZXRlciBPaCB3cm90ZToKPj4+IE9uIDEyLzE4LzIwIDc6MjQgQU0sIEthcnRoaWtleWFuIFBlcml5
YXNhbXkgd3JvdGU6Cj4+Pj4gVHggZGVzY3JpcHRvciBzZWFyY2ggaW5kZXggZmllbGQgc2hvdWxk
IGJlIHVwZGF0ZWQgd2l0aCBodyBwZWVyIGlkCj4+Pj4gYW5kIG5vdCBieSBBU1QgSGFzaC4gSW5j
b3JyZWN0IHNlYXJjaCBpbmRleCBjYXVzZXMgdGhyb3VnaHB1dCAKPj4+PiBkZWdyYWRhdGlvbgo+
Pj4+IGluIGFsbCB0aGUgcGxhdGZvcm1zLiBzbyB1cGRhdGVkIHRoZSBzZWFyY2ggaW5kZXggZmll
bGQgd2l0aCBodyBwZWVyIAo+Pj4+IGlkLAo+Pj4+IHdoaWNoIGlzIGEgY29tbW9uIGNoYW5nZSBh
cHBsaWNhYmxlIGZvciBhbGwgdGhlIHBsYXRmb3Jtcy4KPj4+PiAKPj4+PiBUZXN0ZWQtb246IElQ
UTgwNzQgaHcyLjAgQUhCIAo+Pj4+IFdMQU4uSEsuMi40LjAuMS0wMTQ5Mi1RQ0FIS1NXUExfU0lM
SUNPTlotMQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTFrL3BlZXIuYyAKPj4+PiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGVl
ci5jCj4+Pj4gaW5kZXggYjY5ZTdlYi4uZjQ5YWJlZmEgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wZWVyLmMKPj4+PiArKysgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTFrL3BlZXIuYwo+Pj4+IAo+Pj4+IEBAIC0zMDksNyArMzEwLDExIEBA
IGludCBhdGgxMWtfcGVlcl9jcmVhdGUoc3RydWN0IGF0aDExayAqYXIsIAo+Pj4+IHN0cnVjdCBh
dGgxMWtfdmlmICphcnZpZiwKPj4+PiDCoMKgwqDCoMKgwqDCoCBwZWVyLT5wZGV2X2lkeCA9IGFy
LT5wZGV2X2lkeDsKPj4+PiDCoMKgwqDCoMKgIHBlZXItPnN0YSA9IHN0YTsKPj4+PiAtwqDCoMKg
IGFydmlmLT5hc3RfaGFzaCA9IHBlZXItPmFzdF9oYXNoOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGlm
IChhcnZpZi0+dmlmLT50eXBlID09IE5MODAyMTFfSUZUWVBFX1NUQVRJT04pIHsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgYXJ2aWYtPmFzdF9oYXNoID0gcGVlci0+YXN0X2hhc2g7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGFydmlmLT5hc3RfaWR4ID0gcGVlci0+aHdfcGVlcl9pZDsKPj4+PiArwqDCoMKg
IH0KPj4+IAo+Pj4gSG93IGFib3V0IG5vbiBTVEFUSU9OIHR5cGU/Cj4+PiAKPj4gCj4+IG5vIG5l
ZWQgb2YgY29uZmlndXJpbmcgdGhlIGFzdF9pZHgsIGFzdF9oYXNoIGZpZWxkIGZvciBub24gc3Rh
dGlvbiAKPj4gdHlwZS4gSXRzIHJlY29tbWVuZGVkIGJ5IEhXL0ZXIHRlYW0uCj4+IAo+IENhbiB5
b3UgYWRkIHRoaXMgY29tbWVudCBpbiBjb21taXQgbWVzc2FnZT8KPiAKCnN1cmUKCj4gQWxzbyBj
b3VsZCB5b3UgaW5jbHVkZSB0aGUgYW5zd2VyIHRvICJ3aGF0IGNvbmRpdGlvbnMgeW91IG9ic2Vy
dmVkIHRoZQo+IHRocm91Z2hwdXQgZGVncmFkYXRpb24/IiBpbiBjb21taXQgbWVzc2FnZSB0b28/
CgpJbiBhbGwgdGhlIHNjZW5hcmlvIHdpbGwgc2VlIGRlZ3JhZGF0aW9uLiBJdHMgYSBnZW5lcmFs
IGltcHJvdmVtZW50LgoKUmVnYXJkcywKS2FydGhpa2V5YW4gUAoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
