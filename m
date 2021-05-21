Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83EAC433B4
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 02:21:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF3561057
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 02:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BF3561057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHDSD8b0bAU5SAmPPoSwR5SPt/6o3oRrV9igOd6l8UI=; b=DqSwiRJ/UQMCKEAUO8Bp525a/P
	QxFE/fKyc7URARmdud4Mnd7CPjDcLJfcVjWnobCj/N22UHcR6XYDOaAfGQT0wYlVZ8cDSFbVy7MbE
	OaFygSYdpjLrSd2l/nItxjDQW3TAim2gwH1G5/qhdwVirjneCI/sMSONMqwGU01s4dvIvHJ23fVSI
	BMfCY2gVFsCyAxzNcC+10erQ3hwpBosTn04WqJR1Sb/sRsdTS94E+tFieET7ncDj9iwzppntZYPyR
	zjOz/Y6Ci+V3NA/HvCn8TEkLfOQNOAd7gNulB0HRa3TJacBqiHrj/24uEvMeV0hu/AkAHs/4vaWjm
	XHCHSVBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljunH-003UV7-Cf; Fri, 21 May 2021 02:21:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljunD-003UTa-1r
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 02:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8DFCY8zp+CKLij4wkSAAwJexebg6Q/czG4q8BWXRJFw=; b=3F6Y1EsRFlnU31nTg/anmsj7RG
 AxKUlXqGXSSGXuoSPUsF4mZZNyA91Pm7TWhNkTnmAvlHJ07SraAXvaVxp2hCDh0cvstRbAdei5x88
 42WiuABiit+FvMjWvI6IKBUVauDJ370LSdw2ytZ8J+R7uA0xlkugGRe2pkgaAAoL6jaMJq0Inw2iB
 A/DeY8m7kbSKP3Yuxkgd/pQAuIZGGVGCSx29DiXsFXF3CpjyhNO+tlw6wk1C7W2BtBvzhJ95veMb5
 Uu00Y3AOyry/UWc4EVxyc3FJIXeKnPtr+8ul3DFLjlbVBAoWedQfl775ic9KLAdRKHMcHrK52y5is
 +yxc+wbQ==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljunA-00Glml-2c
 for ath11k@lists.infradead.org; Fri, 21 May 2021 02:21:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621563695; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8DFCY8zp+CKLij4wkSAAwJexebg6Q/czG4q8BWXRJFw=;
 b=Z+F+qGftM5XPgGKPm92kSjoc8RVD0Rm0LrVmlq+j/bFt6X6MeFM9r5TKoPLP+Jpobylc9e4C
 JvFsKuISZGjvSz0CYEa4jgb7ntHrcG0iMBvA5PXVZXADavQmqzZiuZPP+AJIK2Yt38mezFkb
 R35qQan5G3zNgwltEyn8yXxcR3I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60a7192f14eae4d741caebeb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 May 2021 02:21:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8142AC4338A; Fri, 21 May 2021 02:21:34 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0411C433D3;
 Fri, 21 May 2021 02:21:33 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 21 May 2021 10:21:33 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: johannes@sipsolutions.net, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wireless: add check of field VHT Extended NSS BW Capable
 for 160/80+80 MHz setting
In-Reply-To: <fe1b7675-23ba-a86e-90db-de5803231e21@broadcom.com>
References: <20210520034021.14690-1-wgong@codeaurora.org>
 <fe1b7675-23ba-a86e-90db-de5803231e21@broadcom.com>
Message-ID: <2f580f80af0ec9b17068d80d42e666b9@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_192136_203332_F5DF3289 
X-CRM114-Status: GOOD (  17.16  )
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

T24gMjAyMS0wNS0yMSAwMzoyMSwgQXJlbmQgdmFuIFNwcmllbCB3cm90ZToKPiBPbiA1LzIwLzIw
MjEgNTo0MCBBTSwgV2VuIEdvbmcgd3JvdGU6Cj4+IFRhYmxlIDktMjUx4oCUU3VwcG9ydGVkIFZI
VC1NQ1MgYW5kIE5TUyBTZXQgc3ViZmllbGRzLCBpdCBoYXMgc3ViZmllbGQgCj4+IFZIVCBFeHRl
bmRlZAo+PiBOU1MgQlcgQ2FwYWJsZSwgaXRzIGRlZmluaXRpb24gaXM6Cj4+IEluZGljYXRlcyB3
aGV0aGVyIHRoZSBTVEEgaXMgY2FwYWJsZSBvZiBpbnRlcnByZXRpbmcgdGhlIEV4dGVuZGVkIE5T
UyAKPj4gQlcKPj4gU3VwcG9ydCBzdWJmaWVsZCBvZiB0aGUgVkhUIENhcGFiaWxpdGllcyBJbmZv
cm1hdGlvbiBmaWVsZC4KPj4gCj4+IFRoaXMgcGF0Y2ggaXMgdG8gYWRkIGNoZWNrIGZvciB0aGUg
c3ViZmllbGQuCj4gCj4gQWxtb3N0IGxvb2tzIGdvb2QgdG8gbWUsIGJ1dC4uLgo+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+Cj4+IC0tLQo+PiAgIG5l
dC93aXJlbGVzcy9jaGFuLmMgfCA4ICsrKysrLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9uZXQvd2lyZWxl
c3MvY2hhbi5jIGIvbmV0L3dpcmVsZXNzL2NoYW4uYwo+PiBpbmRleCAyODViODA3NjA1NGIuLmY3
Zjg2YmQ3NWNjMCAxMDA2NDQKPj4gLS0tIGEvbmV0L3dpcmVsZXNzL2NoYW4uYwo+PiArKysgYi9u
ZXQvd2lyZWxlc3MvY2hhbi5jCj4gCj4gWy4uLl0KPiAKPj4gQEAgLTEwMzcsNyArMTAzOSw3IEBA
IGJvb2wgY2ZnODAyMTFfY2hhbmRlZl91c2FibGUoc3RydWN0IHdpcGh5IAo+PiAqd2lwaHksCj4+
ICAgCQljYXAgPSB2aHRfY2FwLT5jYXAgJiBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lE
VEhfTUFTSzsKPj4gICAJCWlmIChjYXAgIT0gSUVFRTgwMjExX1ZIVF9DQVBfU1VQUF9DSEFOX1dJ
RFRIXzE2ME1IWiAmJgo+PiAgIAkJICAgIGNhcCAhPSBJRUVFODAyMTFfVkhUX0NBUF9TVVBQX0NI
QU5fV0lEVEhfMTYwXzgwUExVUzgwTUhaICYmCj4+IC0JCSAgICAhKHZodF9jYXAtPmNhcCAmIElF
RUU4MDIxMV9WSFRfQ0FQX0VYVF9OU1NfQldfTUFTSykpCj4+ICsJCSAgICAhKGV4dF9uc3NfY2Fw
ICYmIHZodF9jYXAtPmNhcCAmIAo+PiBJRUVFODAyMTFfVkhUX0NBUF9FWFRfTlNTX0JXX01BU0sp
KQo+IAo+IHlvdSBzaG91bGQgbm90IG1peCBsb2dpY2FsIGFuZCBiaW5hcnkgb3BlcmF0b3JzIHNv
IGFkZCBicmFjZXMgYXJvdW5kCj4gdGhlIGJpbmFyeSBvcGVyYXRpb24gaGVyZS4KcHJpb3JpdHkg
b2YgJiBpcyBoaWdoZXIgdGhhbiAmJiwgc28gaXQgbm90IG5lZWQgdG8gYWRkIGJyYWNlcyBoZXJl
Lgpob3dldmVyLCBpIGhhdmUgc2VudCBwYXRjaCB2MiB3aGljaCBhZGRlZCB0aGUgYnJhY2VzLgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC13aXJlbGVzcy8yMDIxMDUyMTAyMTgwOS4yMzk4
Ni0xLXdnb25nQGNvZGVhdXJvcmEub3JnL1QvI3UKPiAKPiBSZWdhcmRzLAo+IEFyZW5kCj4gCj4+
ICAgCQkJcmV0dXJuIGZhbHNlOwo+PiAgIAkJYnJlYWs7Cj4+ICAgCWRlZmF1bHQ6Cj4+IAoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
