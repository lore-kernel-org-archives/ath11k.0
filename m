Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4402EC433EF
	for <ath11k@archiver.kernel.org>; Wed,  1 Dec 2021 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWrslFlH/ES0Gb43bFLj5Z60xoR3f2AueoxELH0951U=; b=YRXsyBHUZ1t97y
	9jPnggogTovi0Pq80msFEopCBO/JjG/LMdptsUjfAe4K/2kGBvLc5PmioKGkdjmaO5hXGGieCo6IA
	12Fi3KvayXPDBYcLsdN0HOo59oVH7fJ/V1plFmqPLxlY/6tdDnVp7ejeL1lv6pSldbkcFlirJaQLL
	zcWQhNRNH7SiXUgkwVfowTeMjxga3R2MDuW4w91sMpnGVa6lz7KQ3zjb4RSbbnFFZ6DpQng6ppUFe
	z+76pxByxjdvSkBzqTIJQAGGylnAjJMBAzyIOs+UGq6jCMA9pb8zUArhYOqokVwWNSkZfGYrK39xC
	o6s7xS89geonopIOCjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msNA1-0089Gk-EO; Wed, 01 Dec 2021 10:48:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msN9y-0089F7-Mv
 for ath11k@lists.infradead.org; Wed, 01 Dec 2021 10:48:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638355698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKVDaayb9Z/Ddig0Fl/GaJFR9P6OWvMrHeuR0/MtGo0=;
 b=2ZakPGx22bgcebPzdNcjjRS3Y+6bDCb8UqLyR772WTqZ3Dp4UaYXmOk/PEQcTyOQ7C281b
 bPOyziVy1+KZVMw3CGvc+ExOnUo3TGdnz0i00ne5c5xhE9SdM/59qPZ0xTYuY8kFfCRJHa
 wcobwbC4oDqjpMDdFFfLEhfZrKdXImuDjnGTDbe68FOs6Usz9scL95/c6U40dk3gLSwp4H
 hFcMKRQNY/TUSQIPtN1M6bsI7K7UFwZ9DBl1XIRPJr+91AHdW2Vxfy1MGQffna5JvbHjBr
 uAxbtarLA9tARJPPzvIH6mf2U5yQzqI1DPvadU9/jGsPDm2ZYxczJgvoUPA9sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638355698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKVDaayb9Z/Ddig0Fl/GaJFR9P6OWvMrHeuR0/MtGo0=;
 b=qy6yHYx5gu2MckULeM58AC46b3/lxjDG+QCdq/u8tP1cQaKsq7O2NcCTYCu267QpY8omHJ
 23N9eC+QYS1K/KDg==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Ashok Raj
 <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
In-Reply-To: <39556bdc-f48c-68b2-6bec-5975b92e02e2@kaod.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org> <87czmhb8gq.ffs@tglx>
 <875ys9b71j.ffs@tglx> <39556bdc-f48c-68b2-6bec-5975b92e02e2@kaod.org>
Date: Wed, 01 Dec 2021 11:48:17 +0100
Message-ID: <875ys8a9e6.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_024822_917702_1B3144D0 
X-CRM114-Status: UNSURE (   5.88  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Q2VkcmljLAoKT24gV2VkLCBEZWMgMDEgMjAyMSBhdCAwODoxNCwgQ8OpZHJpYyBMZSBHb2F0ZXIg
d3JvdGU6Cj4gT24gMTEvMzAvMjEgMjM6NDEsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4gSXQn
cyBub3QgdGhlIGNvcmUgZnVuY3Rpb24uIEl0J3MgdGhlIHBhdGNoIGFib3ZlIGFuZCBJJ20gYSBt
b3Jvbi4KPgo+IEFsbCBnb29kIG5vdy4gU2hpcCBpdCAhCgp0aGFua3MgYSBsb3QgZm9yIHRlc3Rp
bmcgdGhpcyBhbmQgZGVhbGluZyB3aXRoIHRoZSBmYWxsb3V0LiBNdWNoCmFwcHJlY2lhdGVkIQoK
ICAgICAgICB0Z2x4CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEx
awo=
