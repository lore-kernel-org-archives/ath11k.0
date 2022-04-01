Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55A3C433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpsW3d+gfVo1h9JTjfkEn7/pJ5oROhXl9zAy86W1oQc=; b=uQqyNBWkQVYSj6
	9W0IQaHH8dt5/xLx60paO4RPAZ0iDxSCUP2m+S65EFhpVdqGI4Qjhns3KObqmSvN2HTfd5j6W5Cxv
	mDr9VIv7sx8ynTrq0S3S/Q+D5ZzzUooWYsWbPsumlQpeqiBz15MD5UESbiNBxLtkYkVE3/s7fCD1y
	S0HlYCmzUpriydUvO9sK0VLcR1B0pUSi+joECgqibsyP5JcUghh2PTBFueJajwe5R6cNlYiL+R9Hi
	kpuyOzALFd2WCyAW8nl2dicp7/ylgAyYMzB+ZaQd6uw/31KA1jAmmEtCs5Q7rk2kSNkgSiWGKWZJe
	9pnJiPXlRp5LhLvVJoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIjF-006I00-8q; Fri, 01 Apr 2022 14:58:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naIc9-006EQ5-KX
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 14:51:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01C5060F45;
 Fri,  1 Apr 2022 14:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D98C340EE;
 Fri,  1 Apr 2022 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824660;
 bh=gjV78sg4M+SM1WZOKlh+sYIDNQs2GbRiH0Kl00+k6sU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=XtL/uOlm7Nc/XmvuFw9Y8MtWQjXB4YZxqS9fsjx/DLkiHyr7t611GPc4N30ZUWosI
 IbH9H7f6G2MXdFMO7g80pNst29rq5yBE/AC+QU6eDkb6UDaFqadfzdt09ucBXG3DTr
 mPQh/siL1bHfm+/iWaHQeBSL5b6a5msoZOxR6CA3GIVMJ9nWtd/gU2500iKjMpbyzQ
 zc0EOfevuMQ/7n2/CxQ6Lk8feUVkwqb/n1P2iQnwSy7dT+e75xnUPhb0AywOUhBaJr
 u4W1kOQfxdp69fWzo6QoLdcSkHodk3c4PTNnY94yW+I0TTkgkdGUlTfDbMeFTJt4Ro
 zmIv6r7ZkLU7g==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath11k: select QRTR for AHB as well
References: <20220401093554.360211-1-robimarko@gmail.com>
Date: Fri, 01 Apr 2022 17:50:55 +0300
In-Reply-To: <20220401093554.360211-1-robimarko@gmail.com> (Robert Marko's
 message of "Fri, 1 Apr 2022 11:35:54 +0200")
Message-ID: <87ilrsuab4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_075101_781364_6B263D3B 
X-CRM114-Status: GOOD (  17.59  )
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

Robert Marko <robimarko@gmail.com> writes:

> Currently, ath11k only selects QRTR if ath11k PCI is selected, however
> AHB support requires QRTR, more precisely QRTR_SMD because it is using
> QMI as well which in turn uses QRTR.
>
> Without QRTR_SMD AHB does not work, so select QRTR in ATH11K and then
> select QRTR_SMD for ATH11K_AHB and QRTR_MHI for ATH11K_PCI.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
> index ad5cc6cac05b..b45baad184f6 100644
> --- a/drivers/net/wireless/ath/ath11k/Kconfig
> +++ b/drivers/net/wireless/ath/ath11k/Kconfig
> @@ -5,6 +5,7 @@ config ATH11K
>  	depends on CRYPTO_MICHAEL_MIC
>  	select ATH_COMMON
>  	select QCOM_QMI_HELPERS
> +	select QRTR
>  	help
>  	  This module adds support for Qualcomm Technologies 802.11ax family of
>  	  chipsets.
> @@ -15,6 +16,7 @@ config ATH11K_AHB
>  	tristate "Atheros ath11k AHB support"
>  	depends on ATH11K
>  	depends on REMOTEPROC
> +	select QRTR_SMD
>  	help
>  	  This module adds support for AHB bus
>  
> @@ -22,7 +24,6 @@ config ATH11K_PCI
>  	tristate "Atheros ath11k PCI support"
>  	depends on ATH11K && PCI
>  	select MHI_BUS
> -	select QRTR
>  	select QRTR_MHI
>  	help
>  	  This module adds support for PCIE bus

I now see a new warning:

WARNING: unmet direct dependencies detected for QRTR_SMD
  Depends on [n]: NET [=y] && QRTR [=m] && (RPMSG [=n] || COMPILE_TEST [=n] && RPMSG [=n]=n)
  Selected by [m]:
  - ATH11K_AHB [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH11K [=m] && REMOTEPROC [=y]

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
