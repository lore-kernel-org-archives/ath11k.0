Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63101FA373D
	for <ath11k@archiver.kernel.org>; Tue,  1 Nov 2022 05:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8v03pJFd+LB59FNfq8Q1y+d/iFa3BMA5FIEZbws5+cY=; b=08NmByG4hqOqHn
	CKb+sGdjSyhSHx4pAAPp+HYD13kjhSt2e9KjKAX/paQqUKzPnKCLuavXzqJ+3LN0iLB91sidPm5UY
	bWAdPY2M6bZ5e/oamroiBK4VBxqBMZ81j7gm80aFyBZAM+/p3HgIWNy14MAydi3gTbqg8CFnxvaxn
	vlAaoUl8TotyY1Wy96r3ZXmJ8koyFc3l6nqQ56w3dhO7okGyWk6hTm5xrarObagy8o09YmF2obwlR
	GtA9URiqVM5vAOuSTXMQHB+sqLYSuI4kh1OJswUOlVm48jOTaJDsbvzphQ7/8ttljrhTnU5h1QfSa
	DaUD6G/9Tpb7Tv491UlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opk9W-0028nD-Oy; Tue, 01 Nov 2022 05:49:34 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opk9U-0028lr-7u
	for ath11k@lists.infradead.org; Tue, 01 Nov 2022 05:49:33 +0000
Received: by mail-wm1-f52.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso467423wmb.0
        for <ath11k@lists.infradead.org>; Mon, 31 Oct 2022 22:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFiJ1Xl5U/Q9kIWUJyg3ATXUzyGX+xpzIsnQgrcyPqQ=;
        b=3/zG+gLe6uq3NL7jFJeglJ7WIF6ZzY5vdv8vxpKviydu9EwU8TjSZDtDGggG5wIF0/
         /JCTAxU9AiTnzq6BBK1oKaioA0d5yUnFlIRSXYjl5sgqVjMiFXggoUFnErp58VUXIURJ
         J22AooFHzULgFO8rh+vdGcfLquOz2ZVwjWk8IN6//E6VjQvZnbgzUbic5PZCAlPnwZ9L
         XCpK7psMWxaHrmT+bm8O9TXLNUciuin1SwXjDUewm2C98AaMZDMxv4BJ3PkeFbk/utVl
         8sqwl0WmWCPyMQD0U6fykcveNn98VS5myz0vuxSnIFhnWK9YXtIWr2fEow4Vw8Zzk6Ew
         5B/Q==
X-Gm-Message-State: ACrzQf3MKfKTQCb4bnKSpscKFCY4blLtlI5FLwqUPrBksBXg8j1/QvMv
	+lYC77O8q30+cP/J9KjTrFk=
X-Google-Smtp-Source: AMsMyM78+gzC+G4r0hw11WY5fFkvvC3bal3WJWhhwtOLtGcIGj1F43LHVUwke1fflbbAJ+GtTzEUyQ==
X-Received: by 2002:a05:600c:3b1a:b0:3c7:132f:eb7f with SMTP id m26-20020a05600c3b1a00b003c7132feb7fmr20478963wms.49.1667281767330;
        Mon, 31 Oct 2022 22:49:27 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id y2-20020adffa42000000b0022e3538d305sm10350826wrr.117.2022.10.31.22.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 22:49:26 -0700 (PDT)
Message-ID: <833c7f2f-c140-5a0b-1efc-b858348206ec@kernel.org>
Date: Tue, 1 Nov 2022 06:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] ath11k (gcc13): synchronize
 ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org
Cc: linux-kernel@vger.kernel.org, Martin Liska <mliska@suse.cz>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20221031114341.10377-1-jirislaby@kernel.org>
 <55c4d139-0f22-e7ba-398a-e3e0d8919220@quicinc.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <55c4d139-0f22-e7ba-398a-e3e0d8919220@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_224932_303356_31CA87C9 
X-CRM114-Status: GOOD (  16.77  )
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

T24gMzEuIDEwLiAyMiwgMjI6MTYsIEplZmYgSm9obnNvbiB3cm90ZToKPiBPbiAxMC8zMS8yMDIy
IDQ6NDMgQU0sIEppcmkgU2xhYnkgKFNVU0UpIHdyb3RlOgo+PiBhdGgxMWtfbWFjX2hlX2dpX3Rv
X25sODAyMTFfaGVfZ2koKSBnZW5lcmF0ZXMgYSB2YWxpZCB3YXJuaW5nIHdpdGggCj4+IGdjYy0x
MzoKPj4gwqDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jOjMyMToyMDog
ZXJyb3I6IGNvbmZsaWN0aW5nIAo+PiB0eXBlcyBmb3IgJ2F0aDExa19tYWNfaGVfZ2lfdG9fbmw4
MDIxMV9oZV9naScgZHVlIHRvIGVudW0vaW50ZWdlciAKPj4gbWlzbWF0Y2g7IGhhdmUgJ2VudW0g
bmw4MDIxMV9oZV9naSh1OCknCj4+IMKgwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEx
ay9tYWMuaDoxNjY6NTogbm90ZTogcHJldmlvdXMgCj4+IGRlY2xhcmF0aW9uIG9mICdhdGgxMWtf
bWFjX2hlX2dpX3RvX25sODAyMTFfaGVfZ2knIHdpdGggdHlwZSAndTMyKHU4KScKPj4KPj4gSS5l
LiB0aGUgdHlwZSBvZiB0aGUgcmV0dXJuIHZhbHVlIGF0aDExa19tYWNfaGVfZ2lfdG9fbmw4MDIx
MV9oZV9naSgpIGluCj4+IHRoZSBkZWNsYXJhdGlvbiBpcyB1MzIsIHdoaWxlIHRoZSBkZWZpbml0
aW9uIHNwZWxscyBlbnVtIG5sODAyMTFfaGVfZ2kuCj4+IFN5bmNocm9uaXplIHRoZW0gdG8gdGhl
IGxhdHRlci4KPj4KPj4gQ2M6IE1hcnRpbiBMaXNrYSA8bWxpc2thQHN1c2UuY3o+Cj4+IENjOiBL
YWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgo+PiBDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRh
dmVtQGRhdmVtbG9mdC5uZXQ+Cj4+IENjOiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5j
b20+Cj4+IENjOiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgo+PiBDYzogUGFvbG8g
QWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPgo+PiBDYzogYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKPj4gQ2M6IGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZwo+PiBDYzogbmV0ZGV2QHZn
ZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBKaXJpIFNsYWJ5IChTVVNFKSA8amlyaXNs
YWJ5QGtlcm5lbC5vcmc+Cj4gCj4gU3VnZ2VzdCB0aGUgc3ViamVjdCBzaG91bGQgYmUKPiB3aWZp
OiBhdGgxMWs6IHN5bmNocm9uaXplIGF0aDExa19tYWNfaGVfZ2lfdG9fbmw4MDIxMV9oZV9naSgp
J3MgcmV0dXJuIHR5cGUKCkZXSVcgSSBjb3BpZWQgZnJvbToKJCBnaXQgbG9nIC0tZm9ybWF0PSVz
ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5oCmF0aDExazogSGFuZGxlIGtl
ZXBhbGl2ZSBkdXJpbmcgV29XTEFOIHN1c3BlbmQgYW5kIHJlc3VtZQphdGgxMWs6IHJlZHVjZSB0
aGUgd2FpdCB0aW1lIG9mIDExZCBzY2FuIGFuZCBodyBzY2FuIHdoaWxlIGFkZCBpbnRlcmZhY2UK
YXRoMTFrOiBBZGQgYmFzaWMgV29XIGZ1bmN0aW9uYWxpdGllcwphdGgxMWs6IGFkZCBzdXBwb3J0
IGZvciBoYXJkd2FyZSByZmtpbGwgZm9yIFFDQTYzOTAKYXRoMTFrOiByZXBvcnQgdHggYml0cmF0
ZSBmb3IgaXcgd2xhbiBzdGF0aW9uIGR1bXAKYXRoMTFrOiBhZGQgMTFkIHNjYW4gb2ZmbG9hZCBz
dXBwb3J0CmF0aDExazogZml4IHJlYWQgZmFpbCBmb3IgaHR0X3N0YXRzIGFuZCBodHRfcGVlcl9z
dGF0cyBmb3Igc2luZ2xlIHBkZXYKYXRoMTFrOiBhZGQgc3VwcG9ydCBmb3IgQlNTIGNvbG9yIGNo
YW5nZQphdGgxMWs6IGFkZCBzdXBwb3J0IGZvciA4MFA4MCBhbmQgMTYwIE1IeiBiYW5kd2lkdGgK
YXRoMTFrOiBBZGQgc3VwcG9ydCBmb3IgU1RBIHRvIGhhbmRsZSBiZWFjb24gbWlzcwphdGgxMWs6
IGFkZCBzdXBwb3J0IHRvIGNvbmZpZ3VyZSBzcGF0aWFsIHJldXNlIHBhcmFtZXRlciBzZXQKYXRo
MTFrOiByZW1vdmUgImF0aDExa19tYWNfZ2V0X2FyX3ZkZXZfc3RvcF9zdGF0dXMiIHJlZmVyZW5j
ZXMKYXRoMTFrOiBQZXJmb3JtIHBlci1tc2R1IHJ4IHByb2Nlc3NpbmcKYXRoMTFrOiBmaXggaW5j
b3JyZWN0IHBlZXIgc3RhdHMgY291bnRlcnMgdXBkYXRlCmF0aDExazogTW92ZSBtYWM4MDIxMSBo
dyBhbGxvY2F0aW9uIGJlZm9yZSB3bWlfaW5pdCBjb21tYW5kCmF0aDExazogZml4IG1pc3NlZCBi
dyBjb252ZXJzaW9uIGluIHR4IGNvbXBsZXRpb24KYXRoMTFrOiBkcml2ZXIgZm9yIFF1YWxjb21t
IElFRUUgODAyLjExYXggZGV2aWNlcwoKPiBUaGUgcmVmZXJlbmNlIHRvIGdjYyBpbiB0aGUgZGVz
Y3JpcHRpb24gc2hvdWxkIGJlIHN1ZmZpY2llbnQuCj4gCj4gS2FsbGUgY2FuIHVwZGF0ZSB0aGlz
IHdoZW4gaGUgbWVyZ2VzCgpPSywgdGhhbmtzLgoKPiBSZXZpZXdlZC1ieTogSmVmZiBKb2huc29u
IDxxdWljX2pqb2huc29uQHF1aWNpbmMuY29tPgo+IAo+PiAtLS0KPj4gwqAgZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9tYWMuaCB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5oIAo+PiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMWsvbWFjLmgKPj4gaW5kZXggMmEwZDNhZmIwYzk5Li4wMjMxNzgzYWQ3NTQgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmgKPj4gKysrIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuaAo+PiBAQCAtMTYzLDcgKzE2Myw3
IEBAIHZvaWQgYXRoMTFrX21hY19kcmFpbl90eChzdHJ1Y3QgYXRoMTFrICphcik7Cj4+IMKgIHZv
aWQgYXRoMTFrX21hY19wZWVyX2NsZWFudXBfYWxsKHN0cnVjdCBhdGgxMWsgKmFyKTsKPj4gwqAg
aW50IGF0aDExa19tYWNfdHhfbWdtdF9wZW5kaW5nX2ZyZWUoaW50IGJ1Zl9pZCwgdm9pZCAqc2ti
LCB2b2lkICpjdHgpOwo+PiDCoCB1OCBhdGgxMWtfbWFjX2J3X3RvX21hYzgwMjExX2J3KHU4IGJ3
KTsKPj4gLXUzMiBhdGgxMWtfbWFjX2hlX2dpX3RvX25sODAyMTFfaGVfZ2kodTggc2dpKTsKPj4g
K2VudW0gbmw4MDIxMV9oZV9naSBhdGgxMWtfbWFjX2hlX2dpX3RvX25sODAyMTFfaGVfZ2kodTgg
c2dpKTsKPj4gwqAgZW51bSBubDgwMjExX2hlX3J1X2FsbG9jIAo+PiBhdGgxMWtfbWFjX3BoeV9o
ZV9ydV90b19ubDgwMjExX2hlX3J1X2FsbG9jKHUxNiBydV9waHkpOwo+PiDCoCBlbnVtIG5sODAy
MTFfaGVfcnVfYWxsb2MgCj4+IGF0aDExa19tYWNfaGVfcnVfdG9uZXNfdG9fbmw4MDIxMV9oZV9y
dV9hbGxvYyh1MTYgcnVfdG9uZXMpOwo+PiDCoCBlbnVtIGF0aDExa19zdXBwb3J0ZWRfYncgYXRo
MTFrX21hY19tYWM4MDIxMV9id190b19hdGgxMWtfYncoZW51bSAKPj4gcmF0ZV9pbmZvX2J3IGJ3
KTsKPiAKCi0tIApqcwpzdXNlIGxhYnMKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
