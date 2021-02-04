Return-Path: <SRS0=ZsjY=HG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0662C433DB
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 03:17:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F01F64F4C
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 03:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F01F64F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h4m3Uv83w+fdwmC4IMdF/CY932bcDAgImEvZF0fbqZw=; b=FB1yEzeyYrWO1cKjIHP60nuDh
	4ZFprYk6lxuJrLYEHtw8nkjzeY24QQ7yVjKh8aBLJqqiRG+hhT2RH2f01UFkOrZjUkbp1LELYmCmK
	iSJHPy96B56aPxvRaWTNKzfLuFq+OIfT5EZvSqSDTcpPvSzWczTRCvgp961DaHduDkLDfF/ydpxim
	KPR1TIVofqqszCXge4SsrBx6llzSN5sZn/wm6BSzyCjngrDCc8pqFRmuetu1MptBO5Ou0pY+aDj0D
	sljQWUDSxlXXQPR8R6mcy/4X7ted8IjvQr1nMckjAw4r+ucQTqzeyRd9PVif7Gxx+5tv/f99iJNn9
	NSG5BlYYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7V9E-00068o-2i; Thu, 04 Feb 2021 03:17:36 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7V9B-000688-GP
 for ath11k@lists.infradead.org; Thu, 04 Feb 2021 03:17:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612408653; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VFXxTOfbCxVF5SughVd88GETR8yjPQq5C6S35tQhjPI=;
 b=Uj8tDz//3d5yRDflwTIez9Oi2VWxrgCLyNu/OkwoLG8Oe0AMcHFvm2YdpiKAxbRq+McxiuIR
 dFWq+Yfl0Y0U1T1hpLNw6bX2uWojEcS8oIl4zO38Y9k/41IXlnKv3oOlTlVrmFgZm+9TF/1K
 G+QEfKCAOcoFvIKEfo3OWOYpbHI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 601b674984d0ac8967ed561d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 03:17:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D39BFC433ED; Thu,  4 Feb 2021 03:17:28 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: periyasa)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D87BC433C6;
 Thu,  4 Feb 2021 03:17:28 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 04 Feb 2021 08:47:28 +0530
From: Karthikeyan periyasamy <periyasa@codeaurora.org>
To: Peter Oh <peter.oh@eero.com>
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
In-Reply-To: <dc8f531f-2ab5-f690-2b94-917880682fcc@eero.com>
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
 <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
 <d6cbfd2aff787faa3be69252b2677df9@codeaurora.org>
 <08ef5e10-de7a-fe13-d23a-d1afa1dbd0e5@eero.com>
 <ea757176a6438f1b0cf9bee41f8a9f8c@codeaurora.org>
 <dc8f531f-2ab5-f690-2b94-917880682fcc@eero.com>
Message-ID: <7e3bae2db30d90963f96bb9be82951f0@codeaurora.org>
X-Sender: periyasa@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_221733_626061_7B112CD0 
X-CRM114-Status: GOOD (  12.76  )
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

T24gMjAyMS0wMi0wNCAwODozOCwgUGV0ZXIgT2ggd3JvdGU6Cj4gT24gMi8zLzIxIDU6MDggUE0s
IEthcnRoaWtleWFuIHBlcml5YXNhbXkgd3JvdGU6Cj4+IE9uIDIwMjEtMDItMDQgMDA6NTksIFBl
dGVyIE9oIHdyb3RlOgo+Pj4gT24gMS8yNi8yMSA2OjQ2IFBNLCBLYXJ0aGlrZXlhbiBwZXJpeWFz
YW15IHdyb3RlOgo+Pj4+IE9uIDIwMjAtMTItMTkgMDA6NTMsIFBldGVyIE9oIHdyb3RlOgo+Pj4+
PiBPbiAxMi8xOC8yMCA3OjI0IEFNLCBLYXJ0aGlrZXlhbiBQZXJpeWFzYW15IHdyb3RlOgo+Pj4+
Pj4gVHggZGVzY3JpcHRvciBzZWFyY2ggaW5kZXggZmllbGQgc2hvdWxkIGJlIHVwZGF0ZWQgd2l0
aCBodyBwZWVyIGlkCj4+Pj4+PiBhbmQgbm90IGJ5IEFTVCBIYXNoLiBJbmNvcnJlY3Qgc2VhcmNo
IGluZGV4IGNhdXNlcyB0aHJvdWdocHV0IAo+Pj4+Pj4gZGVncmFkYXRpb24KPj4+Pj4+IGluIGFs
bCB0aGUgcGxhdGZvcm1zLiBzbyB1cGRhdGVkIHRoZSBzZWFyY2ggaW5kZXggZmllbGQgd2l0aCBo
dyAKPj4+Pj4+IHBlZXIgaWQsCj4+Pj4+PiB3aGljaCBpcyBhIGNvbW1vbiBjaGFuZ2UgYXBwbGlj
YWJsZSBmb3IgYWxsIHRoZSBwbGF0Zm9ybXMuCj4+Pj4+PiAKPj4+Pj4+IFRlc3RlZC1vbjogSVBR
ODA3NCBodzIuMCBBSEIgCj4+Pj4+PiBXTEFOLkhLLjIuNC4wLjEtMDE0OTItUUNBSEtTV1BMX1NJ
TElDT05aLTEKPj4+Pj4+IAo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMWsvcGVlci5jIAo+Pj4+Pj4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTFrL3BlZXIuYwo+Pj4+Pj4gaW5kZXggYjY5ZTdlYi4uZjQ5YWJlZmEgMTAwNjQ0Cj4+Pj4+PiAt
LS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3BlZXIuYwo+Pj4+Pj4gKysrIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wZWVyLmMKPj4+Pj4+IAo+Pj4+Pj4gQEAg
LTMwOSw3ICszMTAsMTEgQEAgaW50IGF0aDExa19wZWVyX2NyZWF0ZShzdHJ1Y3QgYXRoMTFrICph
ciwgCj4+Pj4+PiBzdHJ1Y3QgYXRoMTFrX3ZpZiAqYXJ2aWYsCj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oCBwZWVyLT5wZGV2X2lkeCA9IGFyLT5wZGV2X2lkeDsKPj4+Pj4+IMKgwqDCoMKgwqAgcGVlci0+
c3RhID0gc3RhOwo+Pj4+Pj4gLcKgwqDCoCBhcnZpZi0+YXN0X2hhc2ggPSBwZWVyLT5hc3RfaGFz
aDsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqAgaWYgKGFydmlmLT52aWYtPnR5cGUgPT0gTkw4MDIx
MV9JRlRZUEVfU1RBVElPTikgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFydmlmLT5hc3RfaGFz
aCA9IHBlZXItPmFzdF9oYXNoOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFydmlmLT5hc3RfaWR4
ID0gcGVlci0+aHdfcGVlcl9pZDsKPj4+Pj4+ICvCoMKgwqAgfQo+Pj4+PiAKPj4+Pj4gSG93IGFi
b3V0IG5vbiBTVEFUSU9OIHR5cGU/Cj4+Pj4+IAo+Pj4+IAo+Pj4+IG5vIG5lZWQgb2YgY29uZmln
dXJpbmcgdGhlIGFzdF9pZHgsIGFzdF9oYXNoIGZpZWxkIGZvciBub24gc3RhdGlvbiAKPj4+PiB0
eXBlLiBJdHMgcmVjb21tZW5kZWQgYnkgSFcvRlcgdGVhbS4KPj4+PiAKPj4+IENhbiB5b3UgYWRk
IHRoaXMgY29tbWVudCBpbiBjb21taXQgbWVzc2FnZT8KPj4+IAo+PiAKPj4gc3VyZQo+PiAKPj4+
IEFsc28gY291bGQgeW91IGluY2x1ZGUgdGhlIGFuc3dlciB0byAid2hhdCBjb25kaXRpb25zIHlv
dSBvYnNlcnZlZCAKPj4+IHRoZQo+Pj4gdGhyb3VnaHB1dCBkZWdyYWRhdGlvbj8iIGluIGNvbW1p
dCBtZXNzYWdlIHRvbz8KPj4gCj4+IEluIGFsbCB0aGUgc2NlbmFyaW8gd2lsbCBzZWUgZGVncmFk
YXRpb24uIEl0cyBhIGdlbmVyYWwgaW1wcm92ZW1lbnQuCj4+IAo+IEl0IHNvdW5kcyBnb29kIGFu
ZCBpdCB3aWxsIGJldHRlciBpZiB5b3Ugc2hhcmUgdGhlIG51bWJlciBiZWZvcmUgYW5kCj4gYWZ0
ZXIgdGhlIHBhdGNoLgoKSSBoYXZlIHNlZW4gMTAlIGluY3JlYXNlIGluIFdEUyBzY2VuYXJpby4K
ClRoYW5rcywKS2FydGhpa2V5YW4gUAoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMWsK
