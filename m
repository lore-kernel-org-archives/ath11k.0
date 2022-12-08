Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CABC4332F
	for <ath11k@archiver.kernel.org>; Thu,  8 Dec 2022 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dkUAizjU82jSVTP/rtOP/SxZ+eSBexpCDyL1Ud+nA0=; b=4fsAJNcoYQa6Vp
	Vi2emri85JSttcrdM/9tXzgGKIQUSir3ShxwYEVVpwni6z8Ynjjrsfp1osCy0iogI5s+UFWIY2vtQ
	+7HjnGlvZfjoH5H2AwrA4NEo/yy5xam0cKiPIBcgErEF8j+WF+OPs3ijTUPCYCSIGYgMjwLXBeR4r
	3I7fLxhn8PcJQIm5uwhzlc5mTNweNEd5hwOlZfmLGqgtHv7VheicUTElFYQvFP0m7n19FQ5nKwGv8
	m4PA/zLlKklhDPaza8/pCbwrIVEFw+9kLLv5GkULxxz1cIoCfMqXrSvne5BogmCiz4eH/GkDqWlQa
	X7QR5h5ROMgc9KhdFkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3LsZ-008aeO-0y; Thu, 08 Dec 2022 18:44:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3LsV-008aY6-SC
	for ath11k@lists.infradead.org; Thu, 08 Dec 2022 18:44:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2921161EE5;
	Thu,  8 Dec 2022 18:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655C3C433D2;
	Thu,  8 Dec 2022 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670525054;
	bh=qu6zltMr3RVYYbEm2nNXjyjuc34po3m1owsgFYOCZUM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=T9vyuAC7cmiVOb0Cb5iTXgHIlW2f8QDkg2myfhF7a6kf8n85tkthzEYQruT3iAOI+
	 UPXuRaGxxrMjmM+YoR5BP6mB9/fxSfYzNzlb97MtjXFCr3+31LLDEZC7Fc8s5VN3LM
	 EgOwpdZof6MFSHgzurgGAQqw4qDJfQuYX8EhaF2225fTClwsgI/Qr6R5sDnJHPoV1q
	 BQFG+iWk53WVu+WJP6GvrJmqo3xUh590u9xzhv9X0EnYO7zF1q+tYQaiGpSrC8NgJ5
	 pdRDW+HF8gVbWh8uYqUHnU9uINTi1rd2OQzI9kTtw/r7b2vpTegWMIcCwQqWhtE/lI
	 ypdDwMoWYAEUw==
From: Kalle Valo <kvalo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  debian-kernel@lists.debian.org,  debian-boot@lists.debian.org
Subject: Re: failed to insert STA entry for the AP (error -2)
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org>
	<20221130125236.GA865@lst.de> <87k03c4mdb.fsf@kernel.org>
	<20221130133016.GC3055@lst.de> <87sfhx3ap6.fsf@kernel.org>
	<20221203155227.GA13254@lst.de> <87cz8v2xb2.fsf@kernel.org>
	<20221207134025.GA21691@lst.de>
Date: Thu, 08 Dec 2022 20:44:11 +0200
In-Reply-To: <20221207134025.GA21691@lst.de> (Christoph Hellwig's message of
	"Wed, 7 Dec 2022 14:40:25 +0100")
Message-ID: <87lenh20sk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_104416_014537_484D3E70 
X-CRM114-Status: GOOD (  28.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Christoph Hellwig <hch@lst.de> writes:

> adding the debian-kernel list due to issues with using debian-installer
> daily snapshot to install on my brand new laptop with an ath11k_pci
> supported wifi chip.
>
> It turns out that while d-i comes with the ath11k and ath11k_pci
> drivers, but misses the qrtr, qrtr-mki and michael_mic modules that
> are needed for the driver to actually work and not just load.

s/qrtr-mki/qrtr-mhi/

And also CRYPTO_MICHAEL_MIC is needed. This the copy from Kconfig file
which should be an accurate list of dependencies:

config ATH11K
	tristate "Qualcomm Technologies 802.11ax chipset support"
	depends on MAC80211 && HAS_DMA
	depends on CRYPTO_MICHAEL_MIC
	select ATH_COMMON
	select QCOM_QMI_HELPERS
...
config ATH11K_PCI
	tristate "Atheros ath11k PCI support"
	depends on ATH11K && PCI
	select MHI_BUS
	select QRTR
	select QRTR_MHI

> On Wed, Dec 07, 2022 at 02:49:37PM +0200, Kalle Valo wrote:
>> Thanks. But this makes me wonder is it sensible to randomly install a
>> set of .ko files and drop the rest, like Debian's installer apparently
>> does? The dependency for drivers is pretty well documented in Kconfig
>> files, thanks to build testers testing with random configurations, but
>> if the installer omits all that there will be problems just like you are
>> experiencing. So for me MODULE_SOFTDEP() feels just like a band aid and
>> not a robust solution.
>
> I think a driver that a driver that has a runtime depedency on a
> certain module, but doesn't import symbols is always going to be
> somewhat problematic.  But I also agree that the arbitrary splitting
> of kernel modules into separate packages for the installer, or
> in fact not packaging them at all for the installer is rather
> problematic.  I'm not sure what the rationale is behind that, but
> I've added the debian-kernel and debian-boot lists.
>
>> Though I am happy to take your MODULE_SOFTDEP() patch, just wondering if
>> there is a better way to solve this. For example net/mac80211 (the
>> 802.11 stack) has a lot of crypto dependencies:
>> 
>> 	select CRYPTO
>> 	select CRYPTO_LIB_ARC4
>> 	select CRYPTO_AES
>> 	select CRYPTO_CCM
>> 	select CRYPTO_GCM
>> 	select CRYPTO_CMAC
>> 	select CRC32
>> 
>> And it's not using MODULE_SOFTDEP() at all.
>
> Yes.  I'm not quite sure how the packages for d-i select which
> modules to include where, but given that other wifi hardware
> seems to work in the installer they must have figured this out
> somehow.

For older ath driver (ath6kl, ath9k, ath10k) the dependencies were quite
simple. ath11k was the first driver requiring MHI and QRTR for PCI
devices, so in that regard it's not surprising that this problem comes
up only now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
