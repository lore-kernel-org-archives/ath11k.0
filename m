Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D1DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 28 Mar 2022 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	Subject:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDNt1flzMdcP56wHneN+V2zukpC7J3XHe3kKp5OYgCI=; b=Lee/I1gKc8iJ8Ik6AvnZ8wJIbs
	6rF8e6Vy49sn4VNDtGCBh7bB9N/iOADDxMscSWmToEtyS7fylHayLvDQeYC+eXAQhDnQvx+cTnWFa
	WPJFMi58KsSKKXUbr/mqwUiMdHAc9MkaAUfwzpmcQI2z7Mgvk7wMNZ1qF/k/mkT9TOjeJ+Mzae5B4
	g2qs/wxcP1jxTCO1VFuCK88lcVoXaS4cztt/Hc7Uiq/Wddi+aUTu/xZfd6wAE0sDInZaWAy6iJt3Q
	au94ur8+V66Z4FOcDWvUHlO07w4wFNV5hR1VqB83kbLW8+3KHVSw2o2NKNhAnoS3qZZI2sFlertdS
	je5NQU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYsZK-009YaG-Ry; Mon, 28 Mar 2022 16:50:14 +0000
Received: from simonwunderlich.de ([23.88.38.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYsZH-009YZA-M3
 for ath11k@lists.infradead.org; Mon, 28 Mar 2022 16:50:13 +0000
Received: from [IPv6:2003:c5:974d:4090::607]
 (p200300C5974d40900000000000000607.dip0.t-ipconnect.de
 [IPv6:2003:c5:974d:4090::607])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by simonwunderlich.de (Postfix) with ESMTPSA id D2F91FA768;
 Mon, 28 Mar 2022 18:44:01 +0200 (CEST)
To: akolli@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 periyasa@codeaurora.org
References: <1612946530-28504-7-git-send-email-akolli@codeaurora.org>
Subject: Re: [PATCH 06/11] ath11k: add static window support for register
 access
From: Hamdi Issam <ih@simonwunderlich.de>
Message-ID: <4c708ea3-d027-aa01-e157-17a29889ac44@simonwunderlich.de>
Date: Mon, 28 Mar 2022 18:44:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1612946530-28504-7-git-send-email-akolli@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_095011_916132_11A93108 
X-CRM114-Status: GOOD (  12.17  )
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

SGVsbG8sCgpJIHdhcyB0cnlpbmcgdG8gcmVhZCB2YWx1ZXMgb2YgdGltZXJzIGZyb20gc29tZSBv
ZmZzZXRzIG9uIHRoZSBRQ045MDc0LCAKYnV0IEkgZ2V0IGV2ZXJ5IHRpbWUgYW4gaW52YWxpZCB2
YWx1ZXMgKDB4ZmZmZmZmZmYpOgpUaGlzIGlzIGV4YW1wbGUgb2YgbXkgY29kZToKCiNkZWZpbmUg
UUNOOTAwMF9XTEFPTl9HTE9CQUxfQ09VTlRFUl9DVFJMM8KgwqDCoMKgwqAgMHgxRjgwMTE4CiNk
ZWZpbmUgUUNOOTAwMF9XTEFPTl9HTE9CQUxfQ09VTlRFUl9DVFJMNMKgwqDCoMKgwqAgMHgxRjgw
MTFDCiNkZWZpbmUgUUNOOTAwMF9XTEFPTl9HTE9CQUxfQ09VTlRFUl9DVFJMNcKgwqDCoMKgwqAg
MHgxRjgwMTIwCgojZGVmaW5lIFFDTjkwMDBfVElNRV9TWU5DX0VOQUJMRcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweDgwMDAwMDAwCiNkZWZpbmUgUUNOOTAwMF9USU1FX1NZTkNfQ0xF
QVLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAKLgouCi4KYXRoMTFrX3BjaV93
cml0ZTMyKGFiLCBRQ045MDAwX1dMQU9OX0dMT0JBTF9DT1VOVEVSX0NUUkw1LCAKUUNOOTAwMF9U
SU1FX1NZTkNfQ0xFQVIpOwphdGgxMWtfcGNpX3dyaXRlMzIoYWIsIFFDTjkwMDBfV0xBT05fR0xP
QkFMX0NPVU5URVJfQ1RSTDUsIApRQ045MDAwX1RJTUVfU1lOQ19FTkFCTEUpOwpsb3cgPSBhdGgx
MWtfcGNpX3JlYWQzMihhYiwgUUNOOTAwMF9XTEFPTl9HTE9CQUxfQ09VTlRFUl9DVFJMMyk7Cmhp
Z2ggPSBhdGgxMWtfcGNpX3JlYWQzMihhYiwgUUNOOTAwMF9XTEFPTl9HTE9CQUxfQ09VTlRFUl9D
VFJMNCk7Ci4KLgoKVGhlIGxvdyBhbmQgdGhlIGhpZ2ggcGFyYW1ldGVycyBhbHdheXMgZXF1YWwg
dG8gIjB4ZmZmZmZmZmYiLgoKV2hlbiBJIG1hZGUgc29tZSBkZWJ1Z2dpbmcuIEkgZm91bmQgdGhh
dCB0aGUgaXNzdWUgaXMgcmVsYXRlZCB0byAKInN0YXRpY193aW5kb3dfbWFwIiBkZXZlbG9wZWQg
aW4gdGhlIGNvbW1pdCAKIjQ4MGE3MzYxMGM5NTUxMWU0MmZiN2QwMzU5YjUyM2Y2Njg4M2U1MWE6
IGF0aDExazogYWRkIHN0YXRpYyB3aW5kb3cgCnN1cHBvcnQgZm9yIHJlZ2lzdGVyIGFjY2VzcyIg
YW5kIGVuYWJsZWQgZm9yIFFDTjkwNzQgaW4gdGhpcyBjb21taXQgCiI0ZTgwOTQ2MTk3YTgzYTYx
MTVlMzA4MzM0NjE4NDQ5Yjc3Njk2ZDZhOiBhdGgxMWs6IGFkZCBxY245MDc0IHBjaSAKZGV2aWNl
IHN1cHBvcnQiLgpXaGVuIEkgZGlzYWJsZWQgdGhlICJzdGF0aWNfd2luZG93X21hcCIgCihhYi0+
YnVzX3BhcmFtcy5zdGF0aWNfd2luZG93X21hcCA9IGZhbHNlOykgZm9yIFFDTjkwNzQsIGluIHRo
YXQgY2FzZSBJIAp3YXMgYWJsZSB0byBnZXQgdGhlIGNvcnJlY3QgdmFsdWVzLgpTbyBpdCBzZWVt
cyB0aGF0IHRoZXJlJ3MgYW4gaXNzdWUgb2YgcmVhZGluZyBzb21lIHJlZyB3aGVuIApzdGF0aWNf
d2luZG93X21hcCBpcyBlbmFibGVkLgpJIG5lZWQgeW91ciBoZWxwIHRvIHNvbHZlIHRoaXMgaXNz
dWUuCgpSZWdhcmRzLApJc3NhbQoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
