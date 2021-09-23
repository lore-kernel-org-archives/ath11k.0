Return-Path: <SRS0=q7Iz=ON=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094D8C433EF
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 09:27:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A8160F12
	for <ath11k@archiver.kernel.org>; Thu, 23 Sep 2021 09:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4A8160F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/T2hdUqKfzvYh/11rHqzPbcPL8CK/D7mmkrDnZ15ys=; b=u/FtFNrddNdKLM/jKn4eNS5BA+
	nOq0PYIMctPKptjVNT7b1F4N3RzqCWjANdMkT3iDaLKsxFzt+NU2mPAQrNViIjmLhztLrCqQiMM7C
	ZC+amo1mXRdNvz7bzvzGqrwPtKTd1l3cDkg/mjuThXt+Gbs/dbb69zp3TsbYfN1D32eKrkv0BSaV6
	H/cy88+RCUlZtvAmwMgKlvMds/SWT1CF63DkNPFWfWxI6mRg/SXvscxM9OQfdDJjV3dsvZ9CNww1U
	ot/He6GfDM9JdQX/QoUpBjrzhLVH16DLMGkdQweKQ7O1PXNpbgWgOORjgtD4y6Rna84aa7z0M8R+G
	toRguj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTL0a-00An70-Es; Thu, 23 Sep 2021 09:27:12 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTL0S-00An4x-Ob
 for ath11k@lists.infradead.org; Thu, 23 Sep 2021 09:27:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632389228; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nwIqQQTWureI6o4/Gjjs7du07LTdw+L9gBJa3OcDoLM=;
 b=JOvsGbRfAZCD1JWaYaeIS3lfGirnGslgu4PRfXCDdRrPhBXWqGTNkigTzr0IevYubRNoCpQa
 DUri3CMsZ7P7W04lUnb3S88UjKgAjT83DIsKn75V6lwYqoEwW+shkXkWBAGRNQu3h+IdWUMV
 4LqzUSEVoM+VT2UAEscTJXohK/4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 614c4862e0f78151d6add4be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Sep 2021 09:26:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 23334C43618; Thu, 23 Sep 2021 09:26:58 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EC7C6C4338F;
 Thu, 23 Sep 2021 09:26:56 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 23 Sep 2021 17:26:56 +0800
From: Carl Huang <cjhuang@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Loic Poulain
 <loic.poulain@linaro.org>, ath11k@lists.infradead.org, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
In-Reply-To: <20210923085926.GD6083@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
 <20210916171927.GB9027@thinkpad>
 <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
 <20210923085926.GD6083@thinkpad>
Message-ID: <6912b6840858c0554922c01a0f9c47b8@codeaurora.org>
X-Sender: cjhuang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_022708_527499_28AD323F 
X-CRM114-Status: GOOD (  36.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wOS0yMyAxNjo1OSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+IE9uIFRo
dSwgU2VwIDIzLCAyMDIxIGF0IDA0OjM0OjQzUE0gKzA4MDAsIENhcmwgSHVhbmcgd3JvdGU6Cj4+
IE9uIDIwMjEtMDktMTcgMDE6MTksIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPj4gPiBP
biBUaHUsIFNlcCAxNiwgMjAyMSBhdCAwNzo0MjowMlBNICswMzAwLCBLYWxsZSBWYWxvIHdyb3Rl
Ogo+PiA+ID4gTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGlu
YXJvLm9yZz4gd3JpdGVzOgo+PiA+ID4KPj4gPiA+ID4gT24gVGh1LCBTZXAgMTYsIDIwMjEgYXQg
MDE6MTg6MjJQTSArMDIwMCwgTG9pYyBQb3VsYWluIHdyb3RlOgo+PiA+ID4gPj4gTGUgamV1LiAx
NiBzZXB0LiAyMDIxIMOgIDEzOjEyLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPAo+PiA+ID4gPj4g
bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPj4gPiA+ID4+Cj4+
ID4gPiA+Cj4+ID4gPiA+IFsuLi5dCj4+ID4gPiA+Cj4+ID4gPiA+PiA+IElmIHRoaW5ncyBzZWVt
cyB0byB3b3JrIGZpbmUgd2l0aG91dCB0aGF0IHBhdGNoLCB0aGVuIGl0IGltcGxpZXMgdGhhdAo+
PiA+ID4gPj4gPiBzZXR0aW5nIE0wCj4+ID4gPiA+PiA+IHN0YXRlIHdvcmtzIGR1cmluZyByZXN1
bWUuIEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgcmV2ZXJ0IHRoYXQgcGF0Y2guCj4+ID4gPiA+PiA+
Cj4+ID4gPiA+PiA+IExvaWMsIGRpZCB0aGF0IHBhdGNoIGZpeCBhbnkgaXNzdWUgZm9yIHlvdSBv
ciBpdCB3YXMgYSBjb3NtZXRpYyBmaXggb25seT8KPj4gPiA+ID4+Cj4+ID4gPiA+Pgo+PiA+ID4g
Pj4gSXQgZml4ZXMgc2R4IG1vZGVtIHJlc3VtaW5nIGlzc3VlLCB3aXRob3V0IHRoYXQgd2UgZG9u
4oCZdCBrbm93IG1vZGVtIG5lZWRzCj4+ID4gPiA+PiB0byBiZSByZWluaXRpYWxpemVkLgo+PiA+
ID4gPj4KPj4gPiA+ID4KPj4gPiA+ID4gT2theS4gVGhlbiBpbiB0aGF0IGNhc2UsIHRoZSByZWNv
dmVyeSBtZWNoYW5pc20gaGFzIHRvIGJlIGFkZGVkIHRvIHRoZSBhdGgxMWsKPj4gPiA+ID4gTUhJ
IGNvbnRyb2xsZXIuCj4+ID4gPgo+PiA+ID4gV2hhdCBkb2VzIHRoYXQgbWVhbiBpbiBwcmFjdGlz
ZSwgZG8geW91IGhhdmUgYW55IHBvaW50ZXJzIG9yCj4+ID4gPiBleGFtcGxlcz8gSQo+PiA+ID4g
aGF2ZSBubyBjbHVlIHdoYXQgeW91IGFyZSBwcm9wb3NpbmcgOikKPj4gPiA+Cj4+ID4KPj4gPiBU
YWtlIGEgbG9vayBhdCB0aGUgbWhpX3BjaV9yZWNvdmVyeV93b3JrKCkgZnVuY3Rpb24gYmVsb3c6
Cj4+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9idXMvbWhpL3BjaV9nZW5lcmljLmMjbjYxMAo+
PiA+Cj4+ID4gWW91IG5lZWQgdG8gaW1wbGVtZW50IHNvbWV0aGluZyBzaW1pbGFyIHRoYXQgYmFz
aWNhbGx5IHBvd2VycyB1cCB0aGUgTUhJCj4+ID4gZW5kcG9pbnQgKFFDQTYzOTApIGluIGNhc2Ug
cG1fcmVzdW1lKCkgZmFpbHMuIEF0IG1pbmltdW0sIHlvdSBuZWVkIHRvCj4+ID4gY2FsbAo+PiA+
IGJlbG93IGZ1bmN0aW9uczoKPj4gPgo+PiA+ICMgQ2hlY2sgaWYgdGhlIGRldmljZSBpcyBwb3dl
cmVkIG9uLiBJZiB5ZXMsIHRoZW4gcG93ZXIgaXQgZG93biB0byBicmluZwo+PiA+IGl0IGJhY2sK
Pj4gPiBtaGlfcG93ZXJfZG93bigpCj4+ID4gbWhpX3VucHJlcGFyZV9hZnRlcl9wb3dlcl9kb3du
KCkKPj4gPgo+PiA+ICMgUG93ZXIgdXAgdGhlIGRldmljZQo+PiA+IG1oaV9wcmVwYXJlX2Zvcl9w
b3dlcl91cCgpCj4+ID4gbWhpX3N5bmNfcG93ZXJfdXAoKQo+PiA+Cj4+ID4gVGhpcyBpbXBsaWVz
IHRoYXQgdGhlIFdMQU4gZGV2aWNlIGhhcyBiZWVuIHBvd2VyZWQgb2ZmIGR1cmluZyBzdXNwZW5k
LAo+PiA+IHNvIHRoZQo+PiA+IHJlc3VtZSBmYWlscyBhbmQgd2UgYXJlIGJyaW5naW5nIHRoZSBk
ZXZpY2UgYmFjayB0byB3b3JraW5nIHN0YXRlLgo+PiA+Cj4+IFRoaXMgaXMgZmluZSBmb3IgcGxh
dGZvcm0gd2hpY2ggZG9lc24ndCBwcm92aWRlIHBvd2VyIHN1cHBseSBkdXJpbmcgCj4+IHN1c3Bl
bmQuCj4+IEJ1dCBOVUMgaGFzIHBvd2VyIHN1cHBseSBpbiBzdXNwZW5kIHN0YXRlLgo+IAo+IElm
IE5VQyByZXRhaW5zIHBvd2VyIHN1cHBseSBkdXJpbmcgc3VzcGVuZCB0aGVuIGl0IHNob3VsZCB3
b3JrIHdpdGggCj4gdGhhdCBjb21taXQuCj4gRHVyaW5nIHJlc3VtZSwgdGhlIGRldmljZSBpcyBl
eHBlY3RlZCB0byBiZSBpbiBNMyBzdGF0ZSBhbmQgdGhhdCdzIHdoYXQgCj4gdGhlCj4gY29tbWl0
IHZlcmlmaWVzLgo+IAo+IElmIHRoZSBkZXZpY2UgaXMgaW4gYSBkaWZmZXJlbnQgc3RhdGUsIHRo
ZW4gbW9zdCBsaWtlbHkgdGhlIGRldmljZSBoYXZlIAo+IHBvd2VyCj4gY3ljbGVkLgo+IApCdXQg
dGhlIHRyaWNreSB0aGluZyBoZXJlIGlzIHRoYXQgdXBzdHJlYW0gUUNBNjM5MCBkb2Vzbid0IGhh
dmUgcmVjb3ZlcnkgCm1lY2hhbmlzbSB0byBkb3dubG9hZApmaXJtd2FyZSBhZ2Fpbiwgc28gUUNB
NjM5MCBoYXMgbm8gd2F5IHRvIHdvcmsgYWZ0ZXIgYSBwb3dlciBjeWNsZS4KCj4+IFFDQTYzOTAg
b24gTlVDIHdvcmtzIGFmdGVyIGp1c3QgcmV2ZXJ0aW5nIHRoaXMgY29tbWl0IGFsc28gcHJvdmVz
IE5VQyAKPj4gaGFzCj4+IHBvd2VyIHN1cHBseSBpbgo+PiBzdXNwZW5kIHN0YXRlLgo+PiAKPiAK
PiBUaGF0J3MgYmVjYXVzZSB3ZSBhbGxvd2VkIHRoZSBkZXZpY2UgdG8gYmUgaW4gYW55IHN0YXRl
IGR1cmluZyByZXN1bWUgCj4gYW5kIGlmIGl0Cj4gcmVzcG9uZHMgdG8gdGhlIE0wIHRyYW5zaXRp
b24gaXQgd29ya2VkLgo+IAo+PiBUaGUgcmVhc29uIGlzIE1ISS1TVEFUVVMgcmVnaXN0ZXIgY2Fu
J3QgYmUgcmVhZCBzb21laG93IGluIE0zIHN0YXRlIG9uIAo+PiBOVUMuCj4gCj4gTm8sIHRoYXQn
cyBub3QgY29ycmVjdC4KPiAKPj4gRG9lcyB0aGUgTUhJIHNwZWMgc3RhdGUgdGhhdCBNSEktU1RB
VFVTIHJlZ2lzdGVyIGNhbiBiZSByZWFkIGluIE0zIAo+PiBzdGF0ZT8KPj4gCj4gCj4gWWVzLCBh
bGwgdGhlIE1ISSByZWdpc3RlcnMgYXJlIGFjY2Vzc2libGUgaW4gYWxsIHN0YXRlcy4gRHVyaW5n
IE0zLCAKPiBib3RoIE1ISQo+IGhvc3QgYW5kIGRldmljZSAoaWYgc3VwcG9ydGVkKSB3aWxsIHRy
YW5zaXRpb24gdG8gRDMgQ29sZC4gVGhlbiBkdXJpbmcgCj4gcmVzdW1lLAo+IGhvc3Qgd2lsbCBz
d2l0Y2ggdG8gRDAgbGluayBzdGF0ZSBhbmQgd2lsbCBhbHNvIG5vdGlmeSB0aGUgZGV2aWNlIHRv
IAo+IGVudGVyIEQwLgo+IAo+IEZvciBhaWQgZGVidWdnaW5nLCBwbGVhc2Ugc2VlIHRoZSBzdGF0
ZSB0aGUgZGV2aWNlIGlzIGluIGR1cmluZyAKPiBtaGlfcG1fcmVzdW1lKCkuCj4gWW91IGNhbiB1
c2UgYmVsb3cgZGlmZjoKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2NvcmUvcG0u
YyBiL2RyaXZlcnMvYnVzL21oaS9jb3JlL3BtLmMKPiBpbmRleCBmYjk5ZTM3MjcxNTUuLjQ4MmQ1
NWRkMjA5ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvY29yZS9wbS5jCj4gKysrIGIv
ZHJpdmVycy9idXMvbWhpL2NvcmUvcG0uYwo+IEBAIC04OTgsNiArODk4LDkgQEAgaW50IG1oaV9w
bV9yZXN1bWUoc3RydWN0IG1oaV9jb250cm9sbGVyICptaGlfY250cmwpCj4gICAgICAgICBpZiAo
TUhJX1BNX0lOX0VSUk9SX1NUQVRFKG1oaV9jbnRybC0+cG1fc3RhdGUpKQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTzsKPiAKPiArICAgICAgIGRldl9pbmZvKGRldiwgIkRldmljZSBzdGF0
ZTogJXNcbiIsCj4gKyAgICAgICAgICAgICAgICBUT19NSElfU1RBVEVfU1RSKG1oaV9nZXRfbWhp
X3N0YXRlKG1oaV9jbnRybCkpKTsKPiArCj4gICAgICAgICBpZiAobWhpX2dldF9taGlfc3RhdGUo
bWhpX2NudHJsKSAhPSBNSElfU1RBVEVfTTMpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+IAo+IAo+IFRoYW5rcywKPiBNYW5pCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgx
MWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDExawo=
