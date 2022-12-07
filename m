Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DECDC352A1
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51eVHsAEWKhyYMT4bVvjRx7LnRaKkD0X3uI1Ct7iuD4=; b=CSbx2gpT3MSRm3
	7zHHNl/JvY9LO9rweX8l+nZMwrimxy6Z3860jIPFhTkAC7xy6q3khIBVXpVqoNFRKz68mt75bdm1j
	Ll9y/Ye2jcLyvoZshcsvaTjkAkmZBfRX9R6AL1z0r3vuU3qylI4Zkekp6IZo8F/Rz2vXLHCCUmKAi
	r3kZ0C0afuK4W0eZya4WFZUnq5UmJkhEYuObzgB2QTyuGxI7QBv56noYQkkdAebZ9R5QorNhegKIx
	ldB+4apDpquIXAhM4qZw5vmtvtwxvt3zohEt4hsVEYlZHi30lOmAN/E4e+Cd6rMTsZFaI1knuq/u6
	bIcO2TAfoNP04eqAyXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uf7-003vCx-6z; Wed, 07 Dec 2022 13:40:37 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uf3-003ukx-RH
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 13:40:35 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 00D1167373; Wed,  7 Dec 2022 14:40:25 +0100 (CET)
Date: Wed, 7 Dec 2022 14:40:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	debian-kernel@lists.debian.org, debian-boot@lists.debian.org
Subject: Re: failed to insert STA entry for the AP (error -2)
Message-ID: <20221207134025.GA21691@lst.de>
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org> <20221130125236.GA865@lst.de> <87k03c4mdb.fsf@kernel.org> <20221130133016.GC3055@lst.de> <87sfhx3ap6.fsf@kernel.org> <20221203155227.GA13254@lst.de> <87cz8v2xb2.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cz8v2xb2.fsf@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_054034_064128_51D2D766 
X-CRM114-Status: GOOD (  23.02  )
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

Hi all,

adding the debian-kernel list due to issues with using debian-installer
daily snapshot to install on my brand new laptop with an ath11k_pci
supported wifi chip.

It turns out that while d-i comes with the ath11k and ath11k_pci
drivers, but misses the qrtr, qrtr-mki and michael_mic modules that
are needed for the driver to actually work and not just load.

On Wed, Dec 07, 2022 at 02:49:37PM +0200, Kalle Valo wrote:
> Thanks. But this makes me wonder is it sensible to randomly install a
> set of .ko files and drop the rest, like Debian's installer apparently
> does? The dependency for drivers is pretty well documented in Kconfig
> files, thanks to build testers testing with random configurations, but
> if the installer omits all that there will be problems just like you are
> experiencing. So for me MODULE_SOFTDEP() feels just like a band aid and
> not a robust solution.

I think a driver that a driver that has a runtime depedency on a
certain module, but doesn't import symbols is always going to be
somewhat problematic.  But I also agree that the arbitrary splitting
of kernel modules into separate packages for the installer, or
in fact not packaging them at all for the installer is rather
problematic.  I'm not sure what the rationale is behind that, but
I've added the debian-kernel and debian-boot lists.


> Though I am happy to take your MODULE_SOFTDEP() patch, just wondering if
> there is a better way to solve this. For example net/mac80211 (the
> 802.11 stack) has a lot of crypto dependencies:
> 
> 	select CRYPTO
> 	select CRYPTO_LIB_ARC4
> 	select CRYPTO_AES
> 	select CRYPTO_CCM
> 	select CRYPTO_GCM
> 	select CRYPTO_CMAC
> 	select CRC32
> 
> And it's not using MODULE_SOFTDEP() at all.

Yes.  I'm not quite sure how the packages for d-i select which
modules to include where, but given that other wifi hardware
seems to work in the installer they must have figured this out
somehow.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
