Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD53C19F29
	for <ath11k@archiver.kernel.org>; Wed, 27 Jul 2022 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skjLJGfYryBIAroDlsHcdYR57GzfsYsmq7cIu7NvYvA=; b=GMEZ/TEjDU7rwl
	5HaBPt1+Mxc6vnVpquddZpg1i6HyYx+iXsQtd2b7khX9VxjuFsaniRuv+VIKeg//jiP+jaRzm+g8t
	584XnFJQd9FHp5wNRa6wL50HC8nA2zF6fCd9k0Ip9vTg0Qh7uJcoDB1o5eLAjmqv7JXFAdOcR6RsU
	f/QLgdvGdYT7b1JW+Vzz4sYIGjFOwPJ7PZx0+r2ESbsJ8FtRdZL8hQZC47WEqj+jljFicl/Py9uh7
	pmd8UJn9I6KkX4jfaOizdS4WJt2Qw+HO389Ci14W//6i4bvSOgwQ7LjNEictRZhZx1AQtHe7aKrAB
	CZsLzr1h9N35pkiBG/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdvn-00CATp-HO; Wed, 27 Jul 2022 10:06:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdvj-00CAPw-Jt
	for ath11k@lists.infradead.org; Wed, 27 Jul 2022 10:06:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0C9B7B82007;
	Wed, 27 Jul 2022 10:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967A2C433D7;
	Wed, 27 Jul 2022 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658916372;
	bh=QqP7uJQPlIk1uVP+bYHOzL1entRg1wr04Poei7FAjX8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=EXaj1GZSUQFyMelddoAM/DYcCj4ULi5Z62GSUup8wye4LDWN8FRFTgUnNMR4xrqKZ
	 /Gs8ewklR9MNJH/BF5caGkEvurFxPzx7IVpW+FKDKMY0pYIg5XybTCw0cMokD5fG8i
	 s7ja0YAcoRWO9f98pZkWEiZY1WTJS8lNZk6kLVYzaHII3gW8gfLU52ZFSm4cPoRqkv
	 eKANEFmjIRAF6j9SWl940iLP0kGjxzNQx3sOIRbhmURtLnb36KcFqFwCvEjh5r6TzQ
	 u4ca6uUlIoCNxaxzJgZcuUuxGHwBgcKfB2IZ8rLae0UruL1G8h5IrX80U9A/+NJ8Sn
	 lZ1rkjBkzu2SQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix register write failure on QCN9074
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220608062954.27792-1-quic_mpubbise@quicinc.com>
References: <20220608062954.27792-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 Maxime Bizon <mbizon@freebox.fr>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165891636653.18387.14150045468188764767.kvalo@kernel.org>
Date: Wed, 27 Jul 2022 10:06:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_030616_004859_6D67EB25 
X-CRM114-Status: GOOD (  18.64  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Commit 56c8ccf331bd ("ath11k: Add register access logic for WCN6750")
> regressed QCN9074. With the above mentioned commit, writes are failing
> for some registers on QCN9074 although the device seems to work
> normally.
> 
> ath11k_pci 0000:03:00.0: failed to set pcie link register0x01e0e0a8: 0xffffffff != 0x00000010
> ath11k_pci 0000:03:00.0: failed to set sysclk: -110
> 
> PCIe devices in ath11k (QCA6390, WCN6855, QCN9074, WCN6750) use window
> concept for register accesses. There are two schemes, dynamic & static
> window.
> 
> In dynamic window scheme, a single window(region in the BAR) is mapped
> either to CE or DP register windows at any give time. QCA6390 & WCN6855
> follow this scheme for register accesses.
> 
> In static window scheme, CE & DP register windows are statically mapped
> to separate regions with in the BAR so that there is no switching of
> register windows between CE & DP register accesses. QCN9074 & WCN6750
> follow this scheme although the window start offsets are different for
> QCN9074 & WCN6750.
> 
> QCN9074 uses 3rd & 2nd window for DP & CE register accesses respectively
> whereas WCN6750 uses 1st & 2nd window for DP & CE. In QCN9074, along with
> 2nd & 3rd windows, 1st window is also used for certain configurations
> which commit 56c8ccf331bd ("ath11k: Add register access logic for WCN6750")
> did not account for and hence the regression.
> 
> Fix this by going back to the original way of accessing the registers on
> QCN9074. Since this diverges from WCN6750 way of accessing registers, it
> is required to register window_read32/window_write32() pci_ops for WCN6750.
> We can also get rid of dp_window_idx & ce_window_idx members in hw_params,
> so remove them.
> 
> Also add a new API ath11k_pcic_register_pci_ops() for registering pci_ops
> to the ath11k core. This API checks for mandatory pci_ops() and reports
> error if those are missing. Also initialize unused pci_ops to NULL.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 56c8ccf331bd ("ath11k: Add register access logic for WCN6750")
> Reported-by: Maxime Bizon <mbizon@freebox.fr>
> Tested-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

867f4eeee862 wifi: ath11k: Fix register write failure on QCN9074

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220608062954.27792-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
