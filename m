Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C591FC433F5
	for <ath11k@archiver.kernel.org>; Tue,  8 Mar 2022 06:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8dsECZ2YebUhJ5y3my9YI9loAvwt8KXnsyRM6I20pM=; b=Af8soxmCkuNGsX
	/o2vpyjOut3jtofxfdBcXPFmDMyOdI8rwnqAI2d4SRLuc4Mjg2VswedXgBsdNreP6Wli26G6YxmcD
	exztH//oX32I+7UKgC9a5xCcAtnsshJ5Y6qvhlk40cUwFsUOKZheT2iqdOiP+BTfluvlQaTxIXBGW
	09EjbNgYMsEP1K8ELsx5yNDeY+pJkAYyh7s+bW26v4Gti8YE4vOt7hJaDQszKEEa8LP/sClafSHxc
	IqKpOBebMFHBJR6ceifLi9/m8w8Rg2j2WwkmMFatvvip1wi3SGekpx4/lkSAPafhtbNrMuDhPn7A8
	/4DgGk3v5fgCBm1F2x7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRT7q-002lQl-PD; Tue, 08 Mar 2022 06:15:14 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRT7o-002lQD-LA
 for ath11k@lists.infradead.org; Tue, 08 Mar 2022 06:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646720112; x=1678256112;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=1XOqnXLpeVJlC4KyK0YuUmJ4jg+OeQyDZQ+E0RW+bRE=;
 b=rHwqN6vCmeXYwHqGop3cOx9xnQAjjWl43Xr9axXtD8BetyvFPWBqnaLo
 2prhkeUYKpSoDrsjAzUzC3wPgS+eLw9aTV1Ay8jiTnf7xu7r3vI9ENLI+
 jryZbqnaUDqfYKBR4QyaDipIJHeEbeS+e9l5QbzPkwln0N0tWiSP45gbi w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Mar 2022 22:01:02 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 22:01:01 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 7 Mar 2022 22:01:01 -0800
Received: from [10.216.19.10] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 7 Mar 2022
 22:00:56 -0800
Message-ID: <d7884804-6bc2-058b-c373-8b2005fd2811@quicinc.com>
Date: Tue, 8 Mar 2022 11:30:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 02/19] ath11k: Refactor PCI code to support hybrid bus
 devices
Content-Language: en-US
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-3-git-send-email-quic_mpubbise@quicinc.com>
 <87ee4sgo7l.fsf@kernel.org>
 <41f8fd92-70e4-def6-0bd1-c764b1445d68@quicinc.com>
In-Reply-To: <41f8fd92-70e4-def6-0bd1-c764b1445d68@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_221512_775177_925EFFB9 
X-CRM114-Status: GOOD (  24.95  )
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

T24gMi8yNS8yMDIyIDExOjIwIEFNLCBNYW5pa2FudGEgUHViYmlzZXR0eSB3cm90ZToKPiBPbiAx
LzI4LzIwMjIgMzo0NiBQTSwgS2FsbGUgVmFsbyB3cm90ZToKPj4gTWFuaWthbnRhIFB1YmJpc2V0
dHkgPHF1aWNfbXB1YmJpc2VAcXVpY2luYy5jb20+IHdyaXRlczoKPj4KPj4+IFVubGlrZSBvdGhl
ciBBVEgxMUsgUENJZSBkZXZpY2VzIHdoaWNoIGFyZSBlbnVtZXJhdGVkIGJ5IEFQU1MKPj4+IHBy
b2Nlc3NvciAoQXBwbGljYXRpb24gUHJvY2Vzc29yIFN1YlN5c3RlbSksIFdDTjY3NTAgZ2V0cwo+
Pj4gZW51bWVyYXRlZCBieSB0aGUgV1BTUyBRNiBwcm9jZXNzb3IgKFdpcmVsZXNzIFByb2Nlc3Nv
ciBTdWJTeXN0ZW0pOwo+Pj4gSW4gc2ltcGxlIHRlcm1zLCB0aG91Z2ggV0NONjc1MCBpcyBQQ0ll
IGRldmljZSwgaXQgaXMgbm90IGF0dGFjaGVkCj4+PiB0byB0aGUgQVBTUyBwcm9jZXNzb3IsIEFQ
U1Mgd2lsbCBub3Qga25vdyBvZiBzdWNoIGEgZGV2aWNlIGJlaW5nCj4+PiBwcmVzZW50IGluIHRo
ZSBzeXN0ZW0gYW5kIHRoZXJlZm9yZSBXQ042NzUwIHdpbGwgYmUgcmVnaXN0ZXJlZCBhcwo+Pj4g
YSBwbGF0Zm9ybSBkZXZpY2UgdG8gdGhlIGtlcm5lbCBjb3JlIGxpa2Ugb3RoZXIgc3VwcG9ydGVk
IEFIQgo+Pj4gZGV2aWNlcy4KPj4+Cj4+PiBXQ042NzUwIHVzZXMgYm90aCBBSEIgYW5kIFBDSSBB
UElzIGZvciBpdCdzIG9wZXJhdGlvbiwgaXQgdXNlcwo+Pj4gQUhCIEFQSXMgZm9yIGRldmljZSBw
cm9iZS9ib290IGFuZCBQQ0kgQVBJcyBmb3IgZGV2aWNlIHNldHVwCj4+PiBhbmQgcmVnaXN0ZXIg
YWNjZXNzZXM7IEJlY2F1c2Ugb2YgdGhpcyBuYXR1cmUsIGl0IGlzIHJlZmVycmVkCj4+PiBhcyBh
IGh5YnJpZCBidXMgZGV2aWNlLgo+Pj4KPj4+IFJlZmFjdG9yIFBDSSBjb2RlIHRvIHN1cHBvcnQg
aHlicmlkIGJ1cyBkZXZpY2VzIGxpa2UgV0NONjc1MC4KPj4+Cj4+PiBUZXN0ZWQtb246IFdDTjY3
NTAgaHcxLjAgQUhCIFdMQU4uTVNMLjEuMC4xLTAwNTczLVFDQU1TTFNXUExaLTEKPj4+IFRlc3Rl
ZC1vbjogV0NONjg1NSBodzIuMCBQQ0kgCj4+PiBXTEFOLkhTUC4xLjEtMDE3MjAuMS1RQ0FIU1BT
V1BMX1YxX1YyX1NJTElDT05aX0xJVEUtMQo+Pj4gVGVzdGVkLW9uOiBRQ045MDc0IGh3MS4wIFBD
SSBXTEFOLkhLLjIuNS4wLjEtMDExMDAtUUNBSEtTV1BMX1NJTElDT05aLTEKPj4+IFRlc3RlZC1v
bjogSVBRODA3NCBodzIuMCBBSEIgV0xBTi5ISy4yLjQuMC4xLTAwMTkyLVFDQUhLU1dQTF9TSUxJ
Q09OWi0xCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbnRhIFB1YmJpc2V0dHkgPHF1aWNf
bXB1YmJpc2VAcXVpY2luYy5jb20+Cj4+Cj4+IFsuLi5dCj4+Cj4+PiAtLS0gYS9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTFrL01ha2VmaWxlCj4+PiArKysgYi9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTFrL01ha2VmaWxlCj4+PiBAQCAtMjksNyArMjksNyBAQCBvYmotJChDT05G
SUdfQVRIMTFLX0FIQikgKz0gYXRoMTFrX2FoYi5vCj4+PiDCoCBhdGgxMWtfYWhiLXkgKz0gYWhi
Lm8KPj4+IMKgIG9iai0kKENPTkZJR19BVEgxMUtfUENJKSArPSBhdGgxMWtfcGNpLm8KPj4+IC1h
dGgxMWtfcGNpLXkgKz0gbWhpLm8gcGNpLm8KPj4+ICthdGgxMWtfcGNpLXkgKz0gbWhpLm8gcGNp
Lm8gcGNpX2Ntbi5vCj4+Cj4+IFNvIHRoZSBlbmQgcmVzdWx0IGxvb2tzIGxpa2UgdGhpczoKPj4K
Pj4gb2JqLSQoQ09ORklHX0FUSDExS19BSEIpICs9IGF0aDExa19haGIubwo+PiBhdGgxMWtfYWhi
LXkgKz0gYWhiLm8gcGNpX2Ntbi5vCj4+Cj4+IG9iai0kKENPTkZJR19BVEgxMUtfUENJKSArPSBh
dGgxMWtfcGNpLm8KPj4gYXRoMTFrX3BjaS15ICs9IG1oaS5vIHBjaS5vIHBjaV9jbW4ubwo+Pgo+
PiBMaW5raW5nIHBjaV9jbW4ubyB0byBib3RoIGF0aDExa19wY2kua28gYW5kIGF0aDExa19haGIu
a28gbG9va3Mgd3JvbmcuCj4+IERvZXMgdGhhdCBldmVuIGNvbXBpbGUgaWYgYXRoMTFrIGlzIGxp
bmtlZCB0byB0aGUga2VybmVsLCBlZy4gd2l0aAo+PiBhbGx5ZXNjb25maWc/Cj4+Cj4gCj4gSSBk
aWQgdHJ5IGNvbXBpbGluZyB0aGUga2VybmVsIHdpdGggYWxseWVzY29uZmlnIGFmdGVyIHlvdXIg
Y29tbWVudCwgCj4gY29tcGlsYXRpb24gd2VudCB0aHJvdWdoIHdpdGhvdXQgYW55IGhpY2N1cHMu
Cj4gCj4+IE9uZSB3YXkgdG8gc29sdmUgaXMgdG8gbGluayBwY2lfY21uLm8gdG8gYXRoMTFrLmtv
LiBCdXQgZm9yIGFub3RoZXIKPj4gYXBwcm9hY2gsIGZvciBhIGxvbmcgdGltZSBJIGhhdmUgYmVl
biB0aGlua2luZyBhYm91dCB3aGF0J3MgdGhlIHBvaW50IHRvCj4+IGhhdmUgc2VwYXJhdGUgYXRo
MTFrX3BjaS5rbyBhbmQgYXRoMTFrX2FoYi5rbyBtb2R1bGVzPyxUaGV5IGFyZSB2ZXJ5Cj4+IHNt
YWxsIGFueXdheSBjb21wYXJlZCB0byBhdGgxMWsua28uIFNvIG15IGlkZWFpcyB0aGF0IHNob3Vs
ZCB3ZSBoYXZlCj4+IGp1c3Qgb25lIGF0aDExay5rbyBtb2R1bGUsIGl0IGNvbnRhaW5zIGFsbCBB
SEIgYW5kIFBDSSBjb2RlIGFzIHdlbGwsIGFuZAo+PiBhdGgxMWtfcGNpLmtvIGFuZCBhdGgxMWtf
YWhiLmtvIHdvdWxkIG5vdCBiZSBjcmVhdGVkIGFueW1vcmUuIEl0IHdvdWxkCj4+IHNpbXBsaWZ5
IHRoaW5ncyBhIGJpdCwgZXNwZWNpYWxseSBoZXJlLgo+Pgo+PiBUaG91Z2h0cz8KPj4KPiAKPiBJ
IHNlZSBzb21lIGNvbmNlcm5zIGdvaW5nIHdpdGggc2luZ2xlIG1vZHVsZSBjb21iaW5pbmcgYm90
aCBBSEIgYW5kIFBDSSAKPiBtb2R1bGVzIGludG8gYXRoMTFrLmtvCj4gCj4gMSkgQUhCIGFuZCBQ
Q0kgZHJpdmVycyBtYWtlIHVzZSBvZiBjb21wbGV0ZWx5IGRpZmZlcmVudCBrZXJuZWwgCj4gZnJh
bWV3b3JrcywgZm9yIGV4YW1wbGUgQUhCIGRyaXZlciBuZWVkcyByZW1vdGVwcm9jIEFQSXMgZm9y
IGJvb3RpbmcgYW5kIAo+IHJlcXVpcmUgQ09ORklHX1JFTU9URVBST0MgdG8gYmUgY29tcGlsZWQg
aW4gdG8gdGhlIGtlcm5lbC4gU2ltaWxhcmx5LCAKPiBQQ0kgZHJpdmVyIG5lZWRzIE1ISSBBUElz
IGFuZCBhbHNvIGRlcGVuZGVudCBvbiBDT05GSUdfUENJLiBCb3RoIE1ISSBhbmQgCj4gUENJIGJ1
cyBmcmFtZXdvcmtzIG5lZWQgdG8gYmUgY29tcGlsZWQgZm9yIFBDSSB0byB3b3JrLiBJZiB3ZSBj
bHViIGFsbCAKPiBvZiB0aGlzIGludG8gc2luZ2xlIG1vZHVsZSwgSSBzZWUgdGhhdCB1bm5lY2Vz
c2FyaWx5IGFkZGl0aW9uYWwgbW9kdWxlcyAKPiB3aWxsIGJlIGNvbXBpbGVkIGludG8gdGhlIGtl
cm5lbCB3aGljaCBJTU8gaXMgbm90IHNvIGdvb2QgaWRlYS4KPiAKPiAKPiAyKSBTZWNvbmRseSwg
dGhlcmUgaXMgaGlnaCBjaGFuY2Ugb2Ygd3JpdGluZyBiYWQgY29kZSBhbGwgb3ZlciB0aGUgCj4g
ZHJpdmVyLiBGb3IgZXhhbXBsZSwgdGhlcmUgYXJlIGNoYW5jZXMgdGhhdCBkZXZlbG9wZXJzIHB1
dCBBSEIvUENJIAo+IHNwZWNpZmljIGNvZGUgYWxsIG92ZXIgdGhlIGRyaXZlciBjcmVhdGluZyBh
IGJpZyBtZXNzLgo+IFRob3VnaCB0aGlzIGNhbiBiZSBhdm9pZGVkIHdpdGggc3RyaW5nZW50IGNv
ZGUgcmV2aWV3LCBidXQgd2h5IHRvCj4gZ2l2ZSB0aGUgY2hhbmNlLgo+IAo+IFRob3VnaCBBSEIg
YW5kIFBDSSBkcml2ZXJzIGFyZSBzbWFsbGVyIGluIHNpemUsIElNSE8gbGV0IEFIQiBhbmQgUENJ
IGJlIAo+IGluZGVwZW5kZW50IGRyaXZlcnMsIGNvZGUgbG9va3MgY2xlYW5lciBhbmQgcHJvcGVy
bHkgc2VncmVnYXRlZCBieSAKPiBrZWVwaW5nIHRoZW0gYXMgaXQgaXMgdG9kYXkuCj4gCj4gUmVn
YXJkaW5nIHRoZSBjb21waWxhdGlvbiBvZiBQQ0kgY29tbW9uIGNvZGUsIHNoYWxsIHdlIG1vdmUg
aXQgaW50byAKPiBhdGgxMWsua28/IFdoYXQgaXMgeW91ciBvcGluaW9uIG9uIHRoaXMuCj4gCgpI
aSBLYWxsZSwKCkFueSB0aG91Z2h0cyBhYm91dCB0aGUgaWRlYSBwcm9wb3NlZD8KClRoYW5rcywK
TWFuaWthbnRhCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
