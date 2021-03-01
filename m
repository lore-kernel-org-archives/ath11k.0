Return-Path: <SRS0=Rum7=H7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C20C433E0
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 07:54:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 754BC64DBA
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 07:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 754BC64DBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tJP9dxZwToX1agM9GRlN+H2yOI0bMZvvLGNT2k2CBB0=; b=qMusN6IFZNmlcSRXFrDf6tB5U
	P4KKNTHsDp6SOakBe1Y8arTJhhF4AzYIiIVkReQ3DpoXr30HKHx7U7BGKU/W42JTWIlVGOmuRj4fZ
	P7qXxHjXvY9WYZzUan29SsEuJsAzVXjZc/m8wdpN+/CvfsL1hJnCOt3XyLAVUk3TanQTnrNypKHGC
	gvtYoEfF12kJYQl+WlYhL5RKSveyK236vcJ36DitLECsVs9gOpT/V6N1ZCcyHIQe057vL519s2jly
	l/wSScEgoaVk1y+QUs2ySqpr0YLItWHQZvf1AOUneiFX7VLNw3Gs6Z61mksQi9iHQvYtCMX/T+ZZO
	twVFuVfqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGdO9-0004WA-JS; Mon, 01 Mar 2021 07:54:45 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGdO7-0004Vp-BI
 for ath11k@lists.infradead.org; Mon, 01 Mar 2021 07:54:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614585282; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=EQjW7vINI3IF8Jaa2XuYD2rZHF5Yc18pcNSAkfpgTww=;
 b=Ujn30jy0ce5ka8eCqTEAkh5PoiJtbxRT5UyQ8jiRz/QtyOowr4/gf/KgOJdyAWajBwXS81z+
 PEYI3WLPQm2GkW0RY67PM5XlV8DjFwhEGmIwMfaqsTsKXJORHXihtrDxdqQIM4JvGjUmzrF/
 lHBKo+uxp+KIaUBY8fWHiSaAnT0=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 603c9dc116ba74520173706e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 07:54:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C453DC433ED; Mon,  1 Mar 2021 07:54:40 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D32CEC433C6;
 Mon,  1 Mar 2021 07:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D32CEC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Subject: Re: ath11k: qca6390 firmware crashes while connecting to 160 MHz
 channel
References: <87blew3e4q.fsf@codeaurora.org> <87blew3e4q.fsf@codeaurora.org>
 <054ddea6-639e-c21e-d404-d551c65128df@justinmp.com>
 <920c8cc9-21fb-b7aa-4b49-be7656fb14b5@justinmp.com>
 <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com>
 <874kkfozhp.fsf@codeaurora.org>
 <a170a87b-072d-dc8e-6833-231e0df5b23c@justinmp.com>
 <875z2yuafn.fsf_-_@codeaurora.org>
 <5fd39674-d513-c28e-5469-693d96e804c0@justinmp.com>
 <87k0rdste7.fsf@codeaurora.org>
 <ed6c2f2b-3f47-007f-9bdd-135514121aa5@justinmp.com>
 <af78423479f82ae460541ee3ab737121@codeaurora.org>
Date: Mon, 01 Mar 2021 09:54:36 +0200
In-Reply-To: <af78423479f82ae460541ee3ab737121@codeaurora.org> (Wen Gong's
 message of "Mon, 01 Mar 2021 15:21:48 +0800")
Message-ID: <87czwj9umb.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_025443_449149_7F46D622 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: ath11k@lists.infradead.org, Justin Mazzola Paluska <jmp@justinmp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

V2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cgo+IE9uIDIwMjEtMDItMTQg
MDI6MzYsIEp1c3RpbiBNYXp6b2xhIFBhbHVza2Egd3JvdGU6Cj4+IE9uIDIvMTIvMjEgMToxNiBB
TSwgS2FsbGUgVmFsbyB3cm90ZToKPj4+IEp1c3RpbiBNYXp6b2xhIFBhbHVza2EgPGptcEBqdXN0
aW5tcC5jb20+IHdyaXRlczoKPj4+Cj4+Pj4gT24gMi8xMS8yMSA2OjEwIEFNLCBLYWxsZSBWYWxv
IHdyb3RlOgo+Pj4+PiAoY2hhbmdpbmcgdGhlIHRpdGxlIHRvIGZpbmQgdGhpcyBlYXNpZXIpCj4+
Pj4+Cj4+Pj4+IEp1c3RpbiBNYXp6b2xhIFBhbHVza2EgPGptcEBqdXN0aW5tcC5jb20+IHdyaXRl
czoKPj4+Pj4KPj4+Pj4+IE9uIDEyLzIxLzIwIDEyOjExIFBNLCBLYWxsZSBWYWxvIHdyb3RlOgo+
Pj4+Pj4+PiBNeSByb3V0ZXIgc3VwcG9ydHMgMTYwIE1IeiBjaGFubmVscyBpbiB0aGUgNSBHSHog
YmFuZHMgWzFdLsKgIEkKPj4+Pj4+Pj4gc3dpdGNoZWQgdGhlIHJvdXRlciB0byBhZHZlcnRpc2lu
ZyA4MCBNSHogY2hhbm5lbHMgYW5kIHRoZQo+Pj4+Pj4+PiBjYXJkIGNvdWxkCj4+Pj4+Pj4+IGNv
bm5lY3QuCj4+Pj4+Pj4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZGVidWdnaW5nLCB0aGlzIHNo
b3VsZCBoZWxwIHVzCj4+Pj4+Pj4gcmVwcm9kdWNpbmcgdGhlCj4+Pj4+Pj4gcHJvYmxlbS4gV2hh
dCdzIHRoZSBleGFjdCBvcGVud3J0IHZlcnNpb24geW91IGFyZSB1c2luZz8KPj4+Pj4+IFRoZSBP
cGVuV1JUIHZlcnNpb24gaXM6Cj4+Pj4+Pgo+Pj4+Pj4gT3BlbldydCAxOS4wNy41IHIxMTI1Ny01
MDkwMTUyYWUzIC8gTHVDSSBvcGVud3J0LTE5LjA3IGJyYW5jaAo+Pj4+Pj4gZ2l0LTIwLjM0MS41
NzYyNi01MWY1NWI1Cj4+Pj4+Pgo+Pj4+Pj4gKFRoaXMgaXMgdGhlIGxhdGVzdCBzdGFibGUgcmVs
ZWFzZS4pCj4+Pj4+IFRoYW5rcy4gSSBnb3QgYSByZXBvcnQgdGhhdCB0aGlzIG1pZ2h0IGJlIGR1
ZSB0byBjb21taXQgMzU3OTk5NDQ3NmI2Cj4+Pj4+ICgid2lyZWxlc3M6IGZpeCB3cm9uZyAxNjAv
ODArODAgTUh6IHNldHRpbmciKS4gQ2FuIHlvdSB0cnkKPj4+Pj4gcmV2ZXJ0aW5nIHRoZQo+Pj4+
PiBjb21taXQganVzdCB0byBjb25maXJtIHdlIGFyZSBzZWVpbmcgdGhlIHNhbWUgaXNzdWU/Cj4+
Pj4gSSB3aWxsIHRyeSBvdmVyIHRoZSB3ZWVrZW5kLsKgIFNoYWxsIEkgc3RpbGwgdXNlIHRoZQo+
Pj4+IGF0aDExay1xY2E2MzkwLWJyaW5ndXAgYnJhbmNoIG9yIHNvbWV0aGluZyBlbHNlP8KgIChJ
J20gc3RpbGwgcnVubmluZwo+Pj4+IHRoZSBhdGgxMWstcWNhNjM5MC1icmluZ3VwIGJyYW5jaCBv
biBteSBsYXB0b3ApLgo+Pj4gWWVzLCB1c2UgdGhlIHNhbWUgYnJhbmNoLiBMZWFzdCBhbW91bnQg
b2YgY2hhbmdlcyB0aGF0IHdheS4KPj4KPj4gSSByZXZlcnRlZCAzNTc5OTk0NDc2YjYgYW5kIHJl
LWVuYWJsZWQgMTYwIE1IeiBjaGFubmVscyBvbiBteSByb3V0ZXIuwqAKPj4gSSB3YXMgYWJsZSB0
byBjb25uZWN0IHRvIG15IHJvdXRlciB1c2luZyB0aGUgNSBHSHogYmFuZCBhdCA4MCBNSHogKGFz
Cj4+IGV4cGVjdGVkKS4KPj4KPj4gSXQgc2VlbXMgdGhhdCByZXZlcnRpbmcgMzU3OTk5NDQ3NmI2
IGZpeGVkIHRoZSBmaXJtd2FyZSBjcmFzaCB3aXRoIDE2MAo+PiBNSHogY2hhbm5lbHMhCj4+Cj4+
IEknbGwgbGVhdmUgbXkgcm91dGVyIGluIDE2MCBNSHogbW9kZSBmb3IgYSB3aGlsZSB0byBzZWUg
aWYgdGhlcmUgYXJlCj4+IGFueSBwcm9ibGVtcyB0aGF0IGNyb3AgdXAgb3ZlciB0aW1lLgo+Cj4g
RG9lcyBhbnlvbmUgdHJ5aW5nIHJldmVydCB0aGlzIHBhdGNoKDM1Nzk5OTQ0NzZiNiB3aXJlbGVz
czogZml4IHdyb25nCj4gMTYwLzgwKzgwIE1IeiBzZXR0aW5nKSB1cHN0cmVhbT8KClllcywgSnVz
dGluIHJlcG9ydHMgYWJvdmUgdGhhdCBoZSByZXZlcnRlZCBjb21taXQgMzU3OTk5NDQ3NmI2IGFu
ZCB0aGUKZmlybXdhcmUgZGlkIG5vdCBjcmFzaCBhZnRlciB0aGF0LgoKLS0gCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93
aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1p
dHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEx
awo=
