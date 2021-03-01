Return-Path: <SRS0=Rum7=H7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54822C433E6
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 10:37:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19EB264D9C
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 10:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19EB264D9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bzcUVTtOsmrdS0R3KF022ZVrUExvcGQ2ANZDgSZAJOk=; b=byAPk9BAcf1QOHe3TLUg2E5wC
	fzvUnzGxZ593ZJqR4CQprAQoZKqt/S7fEqxN7O0RLjpTpq/SkiEvPAZrIlWBt32jNJK/vd9l9L/lB
	9vHhjdWm6J6gsIxJ0vpk7jm0dBdqvUry3i6rGOm3/dLq9IGkErydhRo4GMUuYBQ//6MLmt+N8tSKY
	x0+Q4IKJQ6o5GqxODed2EI8ZgalyMh556i9oJvuxOpzrfGNVHhb/lqla1ig5NM4d42Dn44t10tLAL
	hGasDzIt2nZb3iNdemfB1RIKiK6zx6U3kgwMdR12CsKODtPWz3joEqgc64ondxFC4REwncKMolaUx
	Z/WmZEnJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGfvQ-0002py-8H; Mon, 01 Mar 2021 10:37:16 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGfvN-0002oi-7j
 for ath11k@lists.infradead.org; Mon, 01 Mar 2021 10:37:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614595032; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JTgvq5wyCHccMNzlJlfX+xCXJNFeXeznYSmhxX1cZBQ=;
 b=feuRijdg35kF1MUXpJ69vy1jAxkfRVpvhu2gBhxS0foYCNJQWrbyxqaAqG4/OjgC3m1Bwql2
 iflU2nBPfNa3klNXt/r9d7zO+DVmjJlv7AOFjXq1iFdIiUhZFYT+olvTR/p/TFDWqVaUTNnq
 lMqc5apBCg+nsjFgHP+foU+W+X4=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 603cc3d675e4458f08fdb826 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 10:37:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E8BB8C433ED; Mon,  1 Mar 2021 10:37:09 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 914C0C433CA;
 Mon,  1 Mar 2021 10:37:09 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 18:37:09 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: qca6390 firmware crashes while connecting to 160 MHz
 channel
In-Reply-To: <87czwj9umb.fsf@codeaurora.org>
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
 <87czwj9umb.fsf@codeaurora.org>
Message-ID: <ae28fa90b517a293d0a61278ceb834db@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_053713_335852_105969C6 
X-CRM114-Status: GOOD (  14.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMy0wMSAxNTo1NCwgS2FsbGUgVmFsbyB3cm90ZToKPiBXZW4gR29uZyA8d2dvbmdA
Y29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPiAKPj4gT24gMjAyMS0wMi0xNCAwMjozNiwgSnVzdGlu
IE1henpvbGEgUGFsdXNrYSB3cm90ZToKPj4+IE9uIDIvMTIvMjEgMToxNiBBTSwgS2FsbGUgVmFs
byB3cm90ZToKPj4+PiBKdXN0aW4gTWF6em9sYSBQYWx1c2thIDxqbXBAanVzdGlubXAuY29tPiB3
cml0ZXM6Cj4+Pj4gCj4+Pj4+IE9uIDIvMTEvMjEgNjoxMCBBTSwgS2FsbGUgVmFsbyB3cm90ZToK
Pj4+Pj4+IChjaGFuZ2luZyB0aGUgdGl0bGUgdG8gZmluZCB0aGlzIGVhc2llcikKPj4+Pj4+IAo+
Pj4+Pj4gSnVzdGluIE1henpvbGEgUGFsdXNrYSA8am1wQGp1c3Rpbm1wLmNvbT4gd3JpdGVzOgo+
Pj4+Pj4gCj4+Pj4+Pj4gT24gMTIvMjEvMjAgMTI6MTEgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+
Pj4+Pj4+PiBNeSByb3V0ZXIgc3VwcG9ydHMgMTYwIE1IeiBjaGFubmVscyBpbiB0aGUgNSBHSHog
YmFuZHMgWzFdLsKgIEkKPj4+Pj4+Pj4+IHN3aXRjaGVkIHRoZSByb3V0ZXIgdG8gYWR2ZXJ0aXNp
bmcgODAgTUh6IGNoYW5uZWxzIGFuZCB0aGUKPj4+Pj4+Pj4+IGNhcmQgY291bGQKPj4+Pj4+Pj4+
IGNvbm5lY3QuCj4+Pj4+Pj4+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGRlYnVnZ2luZywgdGhp
cyBzaG91bGQgaGVscCB1cwo+Pj4+Pj4+PiByZXByb2R1Y2luZyB0aGUKPj4+Pj4+Pj4gcHJvYmxl
bS4gV2hhdCdzIHRoZSBleGFjdCBvcGVud3J0IHZlcnNpb24geW91IGFyZSB1c2luZz8KPj4+Pj4+
PiBUaGUgT3BlbldSVCB2ZXJzaW9uIGlzOgo+Pj4+Pj4+IAo+Pj4+Pj4+IE9wZW5XcnQgMTkuMDcu
NSByMTEyNTctNTA5MDE1MmFlMyAvIEx1Q0kgb3BlbndydC0xOS4wNyBicmFuY2gKPj4+Pj4+PiBn
aXQtMjAuMzQxLjU3NjI2LTUxZjU1YjUKPj4+Pj4+PiAKPj4+Pj4+PiAoVGhpcyBpcyB0aGUgbGF0
ZXN0IHN0YWJsZSByZWxlYXNlLikKPj4+Pj4+IFRoYW5rcy4gSSBnb3QgYSByZXBvcnQgdGhhdCB0
aGlzIG1pZ2h0IGJlIGR1ZSB0byBjb21taXQgCj4+Pj4+PiAzNTc5OTk0NDc2YjYKPj4+Pj4+ICgi
d2lyZWxlc3M6IGZpeCB3cm9uZyAxNjAvODArODAgTUh6IHNldHRpbmciKS4gQ2FuIHlvdSB0cnkK
Pj4+Pj4+IHJldmVydGluZyB0aGUKPj4+Pj4+IGNvbW1pdCBqdXN0IHRvIGNvbmZpcm0gd2UgYXJl
IHNlZWluZyB0aGUgc2FtZSBpc3N1ZT8KPj4+Pj4gSSB3aWxsIHRyeSBvdmVyIHRoZSB3ZWVrZW5k
LsKgIFNoYWxsIEkgc3RpbGwgdXNlIHRoZQo+Pj4+PiBhdGgxMWstcWNhNjM5MC1icmluZ3VwIGJy
YW5jaCBvciBzb21ldGhpbmcgZWxzZT/CoCAoSSdtIHN0aWxsIAo+Pj4+PiBydW5uaW5nCj4+Pj4+
IHRoZSBhdGgxMWstcWNhNjM5MC1icmluZ3VwIGJyYW5jaCBvbiBteSBsYXB0b3ApLgo+Pj4+IFll
cywgdXNlIHRoZSBzYW1lIGJyYW5jaC4gTGVhc3QgYW1vdW50IG9mIGNoYW5nZXMgdGhhdCB3YXku
Cj4+PiAKPj4+IEkgcmV2ZXJ0ZWQgMzU3OTk5NDQ3NmI2IGFuZCByZS1lbmFibGVkIDE2MCBNSHog
Y2hhbm5lbHMgb24gbXkgCj4+PiByb3V0ZXIuwqAKPj4+IEkgd2FzIGFibGUgdG8gY29ubmVjdCB0
byBteSByb3V0ZXIgdXNpbmcgdGhlIDUgR0h6IGJhbmQgYXQgODAgTUh6IChhcwo+Pj4gZXhwZWN0
ZWQpLgo+Pj4gCj4+PiBJdCBzZWVtcyB0aGF0IHJldmVydGluZyAzNTc5OTk0NDc2YjYgZml4ZWQg
dGhlIGZpcm13YXJlIGNyYXNoIHdpdGggCj4+PiAxNjAKPj4+IE1IeiBjaGFubmVscyEKPj4+IAo+
Pj4gSSdsbCBsZWF2ZSBteSByb3V0ZXIgaW4gMTYwIE1IeiBtb2RlIGZvciBhIHdoaWxlIHRvIHNl
ZSBpZiB0aGVyZSBhcmUKPj4+IGFueSBwcm9ibGVtcyB0aGF0IGNyb3AgdXAgb3ZlciB0aW1lLgo+
PiAKPj4gRG9lcyBhbnlvbmUgdHJ5aW5nIHJldmVydCB0aGlzIHBhdGNoKDM1Nzk5OTQ0NzZiNiB3
aXJlbGVzczogZml4IHdyb25nCj4+IDE2MC84MCs4MCBNSHogc2V0dGluZykgdXBzdHJlYW0/Cj4g
Cj4gWWVzLCBKdXN0aW4gcmVwb3J0cyBhYm92ZSB0aGF0IGhlIHJldmVydGVkIGNvbW1pdCAzNTc5
OTk0NDc2YjYgYW5kIHRoZQo+IGZpcm13YXJlIGRpZCBub3QgY3Jhc2ggYWZ0ZXIgdGhhdC4KSSBr
bm93IHRoYXQuCkhhcyBzb21lb25lIHNlbnQgcGF0Y2ggdG8gcmV2ZXJ0IGl0IGluIHB1YmxpYz8K
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
