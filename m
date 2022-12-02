Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74740C4332F
	for <ath11k@archiver.kernel.org>; Fri,  2 Dec 2022 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSUx5j3TIQgsC6k7pyiArU5LaGAlziqq2kXCH8zng38=; b=vUx7TbXsiDFCI2
	aovw+rFWFpcLwRxsZ7svTasghxPGjaFf1uqviyLTR+H8KPoHLcoXf88djScrq98+Q/mzMWdOkYrOa
	X2So9HwTwCanfdSzwfUKOHZVn59lNkSs4ZfGWXB44IQsrIfonUOMzlglNat3jd40L0nv26hYdUROR
	4GreUWm+lemEaYSxK1/Km7xZYe5v2rJPC8x9IwmXqmf2aKeUmXkbPzpFh80AhtGDzZJqJGOKQdE4n
	fstUj06HjpHXO5oDp35/xd4w0FZMDXgp5NIzE7Q5+4HOeGHCD7MoIQOjqjJEDgg9uMOC2U7Ko3d4X
	7DIGeqf4ezOnqIm1gljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1B3p-000jud-FL; Fri, 02 Dec 2022 18:46:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1B3l-000jsX-U3
	for ath11k@lists.infradead.org; Fri, 02 Dec 2022 18:46:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 15DCDB82222;
	Fri,  2 Dec 2022 18:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A63C433D7;
	Fri,  2 Dec 2022 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670006810;
	bh=1A9oppjyFCLaD25OsGPdEgZGbHr5BCt2AbllX8MIjgA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=S/Zvz3aOcZzMFwPPZAKpo64sxIfJKLb+t3GAw8NYiVibQ9KqDMQJrFPVmT3Gc7Mrv
	 qr5Vaf+a0u4G4HWpnGzLNd8Hy6uVw6l/5gZmec0iM+TTFrPrLG26FYvZwJoXokGKto
	 pO7EP1Yq8kszCDu991NmIMaMPt3dbSgV0mGAi6cPEgpP+yNiaLewQVDua8U73hERGs
	 MpqRoY9ESMzu0qYpgvNh+LJIfETp3Q+A93SpvhdVEOJGptcdFghCpbD4Nkyqse9a3w
	 8IW82NHjIsAh9IMG7hXVKt4J5+NcZdtQPJyMwHxrdRmRfd9VZ1QJQjW7v9D2khN54y
	 k2aqXbK6FWgaQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: failed to insert STA entry for the AP (error -2)
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org>
	<20221130125236.GA865@lst.de> <87k03c4mdb.fsf@kernel.org>
	<20221130133016.GC3055@lst.de>
Date: Fri, 02 Dec 2022 20:46:45 +0200
In-Reply-To: <20221130133016.GC3055@lst.de> (Christoph Hellwig's message of
	"Wed, 30 Nov 2022 14:30:16 +0100")
Message-ID: <87sfhx3ap6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_104654_306097_BEA9600E 
X-CRM114-Status: GOOD (  15.03  )
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

> I'm seeing this fun churn of warns when trying to connect to my AP
> with a brand new Thinkpad T14s Gen3 AMD that I'm trying to install
> Debian on.
>
> The kernel is linux-image-6.0.0-5-amd64 from Debian unstable, which is
> identical to the latest 6.0-stable for ath11k.
>
> [ 280.585881] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
> 0x98000000-0x981fffff 64bit]
> [  280.586362] ath11k_pci 0000:01:00.0: MSI vectors: 32
> [  280.586368] ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> [  280.741846] mhi mhi0: Requested to power ON
> [  280.741860] mhi mhi0: Power on setup success
> [ 280.743578] mhi mhi0: firmware: direct-loading firmware
> ath11k/WCN6855/hw2.1/amss.bin
> [  280.834744] mhi mhi0: Wait for device to enter SBL or Mission mode
> [ 281.468934] ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb
> board_id 0xff soc_id 0x400c1211
> [ 281.468944] ath11k_pci 0000:01:00.0: fw_version 0x11090c35
> fw_build_timestamp 2022-04-18 20:23 fw_build_id
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> [ 281.469461] ath11k_pci 0000:01:00.0: firmware: direct-loading
> firmware ath11k/WCN6855/hw2.1/board-2.bin
> [ 281.469544] ath11k_pci 0000:01:00.0: firmware: direct-loading
> firmware ath11k/WCN6855/hw2.1/regdb.bin
> [ 281.479138] ath11k_pci 0000:01:00.0: firmware: direct-loading
> firmware ath11k/WCN6855/hw2.1/board-2.bin
> [ 281.510539] ath11k_pci 0000:01:00.0: firmware: direct-loading
> firmware ath11k/WCN6855/hw2.1/m3.bin
> [  281.802394] ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
> [  341.715380] wlp1s0: authenticate with 0c:70:4a:89:bc:64
> [  341.730641] wlp1s0: Invalid HE elem, Disable HE
> [  341.769475] ath11k_pci 0000:01:00.0: failed to setup rx defrag context

Haven't seen this before either. Really unfortunate that the warning
message message is not printing the error value (missed that during
review), but I suspect the error is coming from crypto_alloc_shash()
call:

int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id)
{
	struct ath11k_base *ab = ar->ab;
	struct crypto_shash *tfm;
	struct ath11k_peer *peer;
	struct dp_rx_tid *rx_tid;
	int i;

	tfm = crypto_alloc_shash("michael_mic", 0, 0);
	if (IS_ERR(tfm))
		return PTR_ERR(tfm);

Any chance you could check that? Also please check that
CONFIG_CRYPTO_MICHAEL_MIC is enabled (it should be as CONFIG_ATH11K
depends on it).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
