Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D42C433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 13:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZJVGcnj0kxxQHMPcFNJcxNdFWcSTM8xH4JzWEkm+KM=; b=v4Dv8Vkrk7Ll/x
	USWR442/Ry9LjbxYtprHHg0H3HXcwdqCv09O+zo4wJnvyCHCXfvv0vDUGcOJQpXgCqi/gWT+sAwfk
	MtcBBdAMYMHbUFO/NBoFOmdPZD8UpJa1FAHLLA4eZey8DfrWFHecpqNUuSxPo5LNhNVfMYNC+wOM7
	+w+3Fo7bZdXx7e2oxzPCM/PKPAP9BLx374PhOw8dM7FU+hk8EnrCRM+wtb6c1j0e/S9LGj33SX6Hu
	tF/K7UDBztt99ag3JzaHRljkOhlSFuubDArV/2dKunustjVcfvM07IPbCQeiJn4hrELTHle7ZfCzF
	eKtzQY2vVkj4m41R8hXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWHvW-007pje-PM; Mon, 21 Mar 2022 13:18:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWHvO-007pg4-Sp
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 13:18:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64E5B61154;
 Mon, 21 Mar 2022 13:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12768C340E8;
 Mon, 21 Mar 2022 13:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647868697;
 bh=ftffsuXOcwkiieVfrAlyrUHaIDDIzRoaoNdHv5VLSLU=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=NCbWox8UHMMpiJX5vj+rqlLcVsXQHuCmsMtmpYyVeiHmDZwrkuLUy2mYAOk5b8Rb4
 LesbXP0D3yMrX3Tetk2EX4Hc9RXQN8yFzYVOIMLgrzoImylvE0q7i3Rw0/Js/Blgwm
 T2m2riiTEX1H7yL23Y+iLIkYTHlmdgAJkBS3FRax0zKVpFlRuKOlEKtuTllDUdzD8+
 OpKMs/R8PHsTZFl25LltCJNvaBykPWKdTxAS3QQ5HcxJgiVL4q6e3iQ/l65ctyVW/S
 ybZHFIL/aXHbsXjypYbDVGearb4FkTjcVBq3eDgvH1Ogu5PebiWbgfTGwO/0RE5W6k
 Ea1WpIU6aENGA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Advertise PLATFORM_CAP_PCIE_GLOBAL_RESET in qmi
 msg
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211011055602.77342-1-bqiang@codeaurora.org>
References: <20211011055602.77342-1-bqiang@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164786869187.26064.10113094982951147703.kvalo@kernel.org>
Date: Mon, 21 Mar 2022 13:18:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_061819_020486_3DDEDC25 
X-CRM114-Status: GOOD (  13.05  )
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

Baochen Qiang <bqiang@codeaurora.org> wrote:

> Inform firmware that host is capable of triggering a global reset.
> This is requested by firmware team.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>

In the pending branch I fixed the trivial conflicts and enabled this feature on
both wcn6855 hw2.0 and hw2.1.

I also now have more information what this is about so changed the commit log to:

---------------------------------------------------------------------

ath11k: enable PLATFORM_CAP_PCIE_GLOBAL_RESET QMI host capability

In Qualcomm ARM platforms there is WL_EN pin and other power regulators
which can be controlled at platform side to completely reset the chip.
For most of x86 and other platforms, the chip is connected via PCIe M.2
interface, and there is no way to control WL_EN pin. Instead the host
driver needs to reset the chip via PCIE_SOC_GLOBAL_RESET hardware
register, just like ath11k does currently.

But when using PCIE_SOC_GLOBAL_RESET there are some hardware registers
which are not cleared/restored. To handle those cases we can enable
PLATFORM_CAP_PCIE_GLOBAL_RESET QMI host capability to tell the firmware
to do some platform specific operations after firmware download.

This does not fix any known issues, but is recommended by the firmware
team, so enable the capability on QCA6390 and WCN6855 PCI devices. It is
currently unclear if this should be enabled also on QCN9074, so leave it
disabled for now. On AHB devices this is not needed as they don't use
PCIE_SOC_GLOBAL_RESET.

---------------------------------------------------------------------

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211011055602.77342-1-bqiang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
