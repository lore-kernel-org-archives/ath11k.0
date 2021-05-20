Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248CAC433B4
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 19:21:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7ED60FEE
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 19:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7ED60FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0G5KgPdwfD7LI5vkmFh890QrVhhdR0kIR8jlqc5Auk=; b=JoTpUPELJoer85eG8dSUoCy3cG
	2Ml9nWD3E9x60/AHF6SwW15uZeGkVvRsEZk1fRFmtDknhanBVEZh3AI6fDDgskVOZL/l/ojI1iFfO
	xlvYFXZ/bFbVMQ5omtB6okq6TT2TP8jLZqeA5uaxMuVbivzYmg6v5FKkdxqw6Wpx8K734HFiXRSkS
	8XEyRinrQMWpKGvNIwUZJxBM8REJgUD1WvXnpAN3O8fxDLJTbE2vjTm7JrMqOC3cfTRzArmtX5g97
	EjJPs4Aj4h/VKaodo0yKsRaKzKp+aYXnx2C5iOu6j11x7BCa3UAfsnYrO5Qesp05IyinZG4BzxSiQ
	Toi/B1Eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljoEX-002Tt1-Uo; Thu, 20 May 2021 19:21:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljoET-002Tsg-QZ
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 19:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=SrlmagRZFJbi1BGTPEsklZ+1NvPvQ9nf7FKAWIviF6c=; b=WezKRrfnxWutzdIedkKcTLh3hS
 As5EvbdiOSW4PzXt6Ykjq+ASq4jYxkFuWxOUeyx0HTaH5m6DxlpuHMnVk40nPu0LiOV0delAjGuGV
 0elBu4Z04wKwkgEq3nm/WSTI/F0vOrFK4EBCAaTavOLcF5oojdPb0vn5GkF7juiQtqoX7prWl92OK
 zSTFemyvZXuPzmHSe1g1E+V3Q9yg0nCDAp0q+/KpVMVseNR5ywmcOwGRkqvIMhszAa2SODaOnHatc
 tgWUi04406abrkd5zBfxvPr7AFt/9ViqMm3Pmn+YuupKxjEoWNU7HfVggFDEs7YAJ/gKStH9/q1TY
 O/C62gtQ==;
Received: from lpdvacalvio01.broadcom.com ([192.19.229.182]
 helo=relay.smtp-ext.broadcom.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljoER-00GcEq-1j
 for ath11k@lists.infradead.org; Thu, 20 May 2021 19:21:20 +0000
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net
 (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1719A7A48;
 Thu, 20 May 2021 12:21:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1719A7A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1621538476;
 bh=RFqdOk4DSTtGRGbSs3c5rcpwvzKFhaZflNSssSjb0UI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YKGlUr34zYFZA3mU6Jz57c6xjkzHSVZ39vyC0e/xT+rggTzyHTm6rGfBFVLjilW7+
 nBOkHK3wQCjpfF7iMSNpo196MPe1iDI/9F0yzOK0D5xtiC831r2pMiBCY6im1HLcVu
 +m3vqh83mlBVK+JLl4dJwyvpT3rBRdOP2w9HSw6k=
Received: from [10.230.41.88] (unknown [10.230.41.88])
 by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 2D6B91874BE; 
 Thu, 20 May 2021 12:21:15 -0700 (PDT)
Subject: Re: [PATCH] wireless: add check of field VHT Extended NSS BW Capable
 for 160/80+80 MHz setting
To: Wen Gong <wgong@codeaurora.org>, johannes@sipsolutions.net,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20210520034021.14690-1-wgong@codeaurora.org>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <fe1b7675-23ba-a86e-90db-de5803231e21@broadcom.com>
Date: Thu, 20 May 2021 21:21:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520034021.14690-1-wgong@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_122119_200598_72490EDD 
X-CRM114-Status: GOOD (  14.58  )
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

T24gNS8yMC8yMDIxIDU6NDAgQU0sIFdlbiBHb25nIHdyb3RlOgo+IFRhYmxlIDktMjUx4oCUU3Vw
cG9ydGVkIFZIVC1NQ1MgYW5kIE5TUyBTZXQgc3ViZmllbGRzLCBpdCBoYXMgc3ViZmllbGQgVkhU
IEV4dGVuZGVkCj4gTlNTIEJXIENhcGFibGUsIGl0cyBkZWZpbml0aW9uIGlzOgo+IEluZGljYXRl
cyB3aGV0aGVyIHRoZSBTVEEgaXMgY2FwYWJsZSBvZiBpbnRlcnByZXRpbmcgdGhlIEV4dGVuZGVk
IE5TUyBCVwo+IFN1cHBvcnQgc3ViZmllbGQgb2YgdGhlIFZIVCBDYXBhYmlsaXRpZXMgSW5mb3Jt
YXRpb24gZmllbGQuCj4gCj4gVGhpcyBwYXRjaCBpcyB0byBhZGQgY2hlY2sgZm9yIHRoZSBzdWJm
aWVsZC4KCkFsbW9zdCBsb29rcyBnb29kIHRvIG1lLCBidXQuLi4KCj4gU2lnbmVkLW9mZi1ieTog
V2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+ICAgbmV0L3dpcmVsZXNzL2No
YW4uYyB8IDggKysrKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL25ldC93aXJlbGVzcy9jaGFuLmMgYi9uZXQv
d2lyZWxlc3MvY2hhbi5jCj4gaW5kZXggMjg1YjgwNzYwNTRiLi5mN2Y4NmJkNzVjYzAgMTAwNjQ0
Cj4gLS0tIGEvbmV0L3dpcmVsZXNzL2NoYW4uYwo+ICsrKyBiL25ldC93aXJlbGVzcy9jaGFuLmMK
ClsuLi5dCgo+IEBAIC0xMDM3LDcgKzEwMzksNyBAQCBib29sIGNmZzgwMjExX2NoYW5kZWZfdXNh
YmxlKHN0cnVjdCB3aXBoeSAqd2lwaHksCj4gICAJCWNhcCA9IHZodF9jYXAtPmNhcCAmIElFRUU4
MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF9NQVNLOwo+ICAgCQlpZiAoY2FwICE9IElFRUU4
MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF8xNjBNSFogJiYKPiAgIAkJICAgIGNhcCAhPSBJ
RUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwXzgwUExVUzgwTUhaICYmCj4gLQkJ
ICAgICEodmh0X2NhcC0+Y2FwICYgSUVFRTgwMjExX1ZIVF9DQVBfRVhUX05TU19CV19NQVNLKSkK
PiArCQkgICAgIShleHRfbnNzX2NhcCAmJiB2aHRfY2FwLT5jYXAgJiBJRUVFODAyMTFfVkhUX0NB
UF9FWFRfTlNTX0JXX01BU0spKQoKeW91IHNob3VsZCBub3QgbWl4IGxvZ2ljYWwgYW5kIGJpbmFy
eSBvcGVyYXRvcnMgc28gYWRkIGJyYWNlcyBhcm91bmQgdGhlIApiaW5hcnkgb3BlcmF0aW9uIGhl
cmUuCgpSZWdhcmRzLApBcmVuZAoKPiAgIAkJCXJldHVybiBmYWxzZTsKPiAgIAkJYnJlYWs7Cj4g
ICAJZGVmYXVsdDoKPiAKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
