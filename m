Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC855C433F5
	for <ath11k@archiver.kernel.org>; Wed, 23 Mar 2022 09:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Spzurz6trjdRpNQtzSPa5ZIQYWN6M7Cm3+iwAnAaOjI=; b=MmR7IJyfbUjeHP
	jyrMR1daGMh+J5Alsv1rb8ORyjEWI1pe34qpXnoP/s9velN/Hj94IqfpBerEplP9UQV/ZFimJXJCY
	Ff71mFbxiv8OHBRO/1W9bNN3z0eUbLOf5T3H0Cj6Y0VeYwjYBmwEwzZc8BCF8PO3xr9DDzshij9QS
	L0UyBJuFh4bDFvoCoCIV6lZ/LGypO9sMond1UB5gAtMSCFHZOX8TFXQy/jMQo/0zSQG7WwJetUkhb
	F51YBoc8q2JM4YcPzcbZO3HXxyP1Gtg/kLzfMs6sotHUFpZalqowFvhc608ogl8NqmeRG1nYr1woh
	GhyWJdoRWvCKlo2k0UbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWwxT-00DBOq-0D; Wed, 23 Mar 2022 09:07:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWwws-00DBBf-4v
 for ath11k@lists.infradead.org; Wed, 23 Mar 2022 09:06:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A86E7617A6;
 Wed, 23 Mar 2022 09:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57767C340E8;
 Wed, 23 Mar 2022 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648026393;
 bh=clh4+CymOPTgHreEHI+45avY3CyQG9AV2/v77vhmwJs=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=tB3Cwi9q9q47F8/zfvt+ykFp4M+SWhpa9r2AVNkQ4ScWDb3P7XNGndgxdbBPnIElq
 t+eSWOs4W9PC7EY/qyC9dnsoDXJFg/giKXWZSs3Y/QXcvmeZojHBgJgVNGbl1DIMf7
 1G0RcG2uUDuq9gRZfzcTHm7hoeEHbGq2gxyVk+vHgw1CEsXps2BSEfIwVeP5qARmG9
 QlgpWFZWobN51e8/IXdnJFcZBMUPBhKYWHOShSaHP6Y8CLylFiseFZuPDtf2a7BC1w
 x7ewt2fJtIEZysM7wfH7x8l5xbuhko1nm+IbvLN8fAeMXweIkc87pIR5/chClFyTal
 fEIKhFwPQXw5Q==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Advertise PLATFORM_CAP_PCIE_GLOBAL_RESET in qmi
 msg
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211011055602.77342-1-bqiang@codeaurora.org>
References: <20211011055602.77342-1-bqiang@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164802639004.545.3440948645378979467.kvalo@kernel.org>
Date: Wed, 23 Mar 2022 09:06:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_020634_274013_6DBE25E5 
X-CRM114-Status: GOOD (  15.76  )
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

> In Qualcomm ARM platforms there is WL_EN pin and other power regulators
> which can be controlled at platform side to completely reset the chip.
> For most of x86 and other platforms, the chip is connected via PCIe M.2
> interface, and there is no way to control WL_EN pin. Instead the host
> driver needs to reset the chip via PCIE_SOC_GLOBAL_RESET hardware
> register, just like ath11k does currently.
> 
> But when using PCIE_SOC_GLOBAL_RESET there are some hardware registers
> which are not cleared/restored. To handle those cases we can enable
> PLATFORM_CAP_PCIE_GLOBAL_RESET QMI host capability to tell the firmware
> to do some platform specific operations after firmware download.
> 
> This does not fix any known issues, but is recommended by the firmware
> team, so enable the capability on QCA6390 and WCN6855 PCI devices. It is
> currently unclear if this should be enabled also on QCN9074, so leave it
> disabled for now. On AHB devices this is not needed as they don't use
> PCIE_SOC_GLOBAL_RESET.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1e4ac7173c93 ath11k: enable PLATFORM_CAP_PCIE_GLOBAL_RESET QMI host capability

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211011055602.77342-1-bqiang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
