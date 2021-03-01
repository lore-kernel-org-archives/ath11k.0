Return-Path: <SRS0=Rum7=H7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D36C433E0
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 10:55:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F5364EAE
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 10:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9F5364EAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vyb05AbxvbQTDyM8gFzGYjR93cmYLHvcaPgxqc5w4a4=; b=Wt1e6vXVXreDvqsS5PL4VPhO/
	hImATOdBDhPL3LeaRhFtDKcMGu0TTRRaXDku5z0WZA02BIsY6CyH9BzEe3QZ+c3ylzIfS74NA3Rng
	tHJypOG/09XkCMJj/svu6aZeXT3qrSwQ/+0UxaTpFYc4rNpZZW8Sx1PA/uKLR3+n1at8n0EUC2gjR
	6OSbXWE2AJ7Pqbwewiv2norjZ80V/yIQX/ebViGRyjtaRXkAT1HCOwUG56fLD/0ylYBbRs0z6i8dF
	BS7DgRMAIbxKSEn5Oz7LIJg02ZncGg4zpdqfa98FPMntLNgIimVhZFdouB4g51ahOB2pIkJbZpEr8
	VW4klBWkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGgCo-0004Uj-2T; Mon, 01 Mar 2021 10:55:14 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGgCl-0004UL-HQ
 for ath11k@lists.infradead.org; Mon, 01 Mar 2021 10:55:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614596111; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=OQfRWbuGN9YKDbaltvm+TCUxNlmP7GJVWl50mjdo72o=;
 b=oGW7ZToYMigy7tY0xG2oQ9ne71zN63SpFUS2Xgjlt3K4XEEmge1JSWn0JHtIPumOCDNSb1JX
 9ug7czTkB1uYQZWnpKnpLaZtZfxDOHtB3HQ+dZsDTWujqGhxgZilZLmvy0Mpt14gZj/nppyU
 o36+YlCMNJ2g19dRxFVLgTP433c=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 603cc80d9e950d0db14453ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 10:55:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 77322C43461; Mon,  1 Mar 2021 10:55:08 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E6087C433CA;
 Mon,  1 Mar 2021 10:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E6087C433CA
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
 <87czwj9umb.fsf@codeaurora.org>
 <ae28fa90b517a293d0a61278ceb834db@codeaurora.org>
Date: Mon, 01 Mar 2021 12:55:04 +0200
In-Reply-To: <ae28fa90b517a293d0a61278ceb834db@codeaurora.org> (Wen Gong's
 message of "Mon, 01 Mar 2021 18:37:09 +0800")
Message-ID: <871rcz9m9j.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_055511_736455_964EEA60 
X-CRM114-Status: GOOD (  16.02  )
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

V2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cgo+IE9uIDIwMjEtMDMtMDEg
MTU6NTQsIEthbGxlIFZhbG8gd3JvdGU6Cj4+IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVyb3JhLm9y
Zz4gd3JpdGVzOgo+Pgo+Pj4gT24gMjAyMS0wMi0xNCAwMjozNiwgSnVzdGluIE1henpvbGEgUGFs
dXNrYSB3cm90ZToKPj4+PiBPbiAyLzEyLzIxIDE6MTYgQU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+
Pj4+IEp1c3RpbiBNYXp6b2xhIFBhbHVza2EgPGptcEBqdXN0aW5tcC5jb20+IHdyaXRlczoKPj4+
Pj4KPj4+Pj4+IE9uIDIvMTEvMjEgNjoxMCBBTSwgS2FsbGUgVmFsbyB3cm90ZToKPj4+Pj4+PiAo
Y2hhbmdpbmcgdGhlIHRpdGxlIHRvIGZpbmQgdGhpcyBlYXNpZXIpCj4+Pj4+Pj4KPj4+Pj4+PiBK
dXN0aW4gTWF6em9sYSBQYWx1c2thIDxqbXBAanVzdGlubXAuY29tPiB3cml0ZXM6Cj4+Pj4+Pj4K
Pj4+Pj4+Pj4gT24gMTIvMjEvMjAgMTI6MTEgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+Pj4+Pj4+
Pj4gTXkgcm91dGVyIHN1cHBvcnRzIDE2MCBNSHogY2hhbm5lbHMgaW4gdGhlIDUgR0h6IGJhbmRz
IFsxXS7CoCBJCj4+Pj4+Pj4+Pj4gc3dpdGNoZWQgdGhlIHJvdXRlciB0byBhZHZlcnRpc2luZyA4
MCBNSHogY2hhbm5lbHMgYW5kIHRoZQo+Pj4+Pj4+Pj4+IGNhcmQgY291bGQKPj4+Pj4+Pj4+PiBj
b25uZWN0Lgo+Pj4+Pj4+Pj4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZGVidWdnaW5nLCB0aGlz
IHNob3VsZCBoZWxwIHVzCj4+Pj4+Pj4+PiByZXByb2R1Y2luZyB0aGUKPj4+Pj4+Pj4+IHByb2Js
ZW0uIFdoYXQncyB0aGUgZXhhY3Qgb3BlbndydCB2ZXJzaW9uIHlvdSBhcmUgdXNpbmc/Cj4+Pj4+
Pj4+IFRoZSBPcGVuV1JUIHZlcnNpb24gaXM6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9wZW5XcnQgMTku
MDcuNSByMTEyNTctNTA5MDE1MmFlMyAvIEx1Q0kgb3BlbndydC0xOS4wNyBicmFuY2gKPj4+Pj4+
Pj4gZ2l0LTIwLjM0MS41NzYyNi01MWY1NWI1Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IChUaGlzIGlzIHRo
ZSBsYXRlc3Qgc3RhYmxlIHJlbGVhc2UuKQo+Pj4+Pj4+IFRoYW5rcy4gSSBnb3QgYSByZXBvcnQg
dGhhdCB0aGlzIG1pZ2h0IGJlIGR1ZSB0byBjb21taXQKPj4+Pj4+PiAzNTc5OTk0NDc2YjYKPj4+
Pj4+PiAoIndpcmVsZXNzOiBmaXggd3JvbmcgMTYwLzgwKzgwIE1IeiBzZXR0aW5nIikuIENhbiB5
b3UgdHJ5Cj4+Pj4+Pj4gcmV2ZXJ0aW5nIHRoZQo+Pj4+Pj4+IGNvbW1pdCBqdXN0IHRvIGNvbmZp
cm0gd2UgYXJlIHNlZWluZyB0aGUgc2FtZSBpc3N1ZT8KPj4+Pj4+IEkgd2lsbCB0cnkgb3ZlciB0
aGUgd2Vla2VuZC7CoCBTaGFsbCBJIHN0aWxsIHVzZSB0aGUKPj4+Pj4+IGF0aDExay1xY2E2Mzkw
LWJyaW5ndXAgYnJhbmNoIG9yIHNvbWV0aGluZyBlbHNlP8KgIChJJ20gc3RpbGwKPj4+Pj4+IHJ1
bm5pbmcKPj4+Pj4+IHRoZSBhdGgxMWstcWNhNjM5MC1icmluZ3VwIGJyYW5jaCBvbiBteSBsYXB0
b3ApLgo+Pj4+PiBZZXMsIHVzZSB0aGUgc2FtZSBicmFuY2guIExlYXN0IGFtb3VudCBvZiBjaGFu
Z2VzIHRoYXQgd2F5Lgo+Pj4+Cj4+Pj4gSSByZXZlcnRlZCAzNTc5OTk0NDc2YjYgYW5kIHJlLWVu
YWJsZWQgMTYwIE1IeiBjaGFubmVscyBvbiBteQo+Pj4+IHJvdXRlci7CoAo+Pj4+IEkgd2FzIGFi
bGUgdG8gY29ubmVjdCB0byBteSByb3V0ZXIgdXNpbmcgdGhlIDUgR0h6IGJhbmQgYXQgODAgTUh6
IChhcwo+Pj4+IGV4cGVjdGVkKS4KPj4+Pgo+Pj4+IEl0IHNlZW1zIHRoYXQgcmV2ZXJ0aW5nIDM1
Nzk5OTQ0NzZiNiBmaXhlZCB0aGUgZmlybXdhcmUgY3Jhc2ggd2l0aAo+Pj4+IDE2MAo+Pj4+IE1I
eiBjaGFubmVscyEKPj4+Pgo+Pj4+IEknbGwgbGVhdmUgbXkgcm91dGVyIGluIDE2MCBNSHogbW9k
ZSBmb3IgYSB3aGlsZSB0byBzZWUgaWYgdGhlcmUgYXJlCj4+Pj4gYW55IHByb2JsZW1zIHRoYXQg
Y3JvcCB1cCBvdmVyIHRpbWUuCj4+Pgo+Pj4gRG9lcyBhbnlvbmUgdHJ5aW5nIHJldmVydCB0aGlz
IHBhdGNoKDM1Nzk5OTQ0NzZiNiB3aXJlbGVzczogZml4IHdyb25nCj4+PiAxNjAvODArODAgTUh6
IHNldHRpbmcpIHVwc3RyZWFtPwo+Pgo+PiBZZXMsIEp1c3RpbiByZXBvcnRzIGFib3ZlIHRoYXQg
aGUgcmV2ZXJ0ZWQgY29tbWl0IDM1Nzk5OTQ0NzZiNiBhbmQgdGhlCj4+IGZpcm13YXJlIGRpZCBu
b3QgY3Jhc2ggYWZ0ZXIgdGhhdC4KPgo+IEkga25vdyB0aGF0LiBIYXMgc29tZW9uZSBzZW50IHBh
dGNoIHRvIHJldmVydCBpdCBpbiBwdWJsaWM/CgpJIGRvbid0IHJlY2FsbCBzZWVpbmcgYW55IHJl
dmVydHMgZm9yIHRoaXMuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9l
bi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsg
bWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
