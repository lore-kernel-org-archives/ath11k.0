Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964D3C433EF
	for <ath11k@archiver.kernel.org>; Mon,  2 May 2022 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+lq5QYXQUX//lDhqe6SPdwvt3VkZaplHtkbjfcW80U=; b=oQy4mTFVIlPzg+
	woaeaTOFshJo94+W1c9EUGwvxAyPPi+AkcQ0JmHkSv993RijcQudL8du5XInhtEH/qGL/0RORLd5Q
	tMoQP3uR1/UTS40VJ5KBXW+hyCmtKRXOK4t4AJx/Z9l9y/2UX3XEIVozyQn24zjrs2Ezy+PACKgwB
	usSplSBAgVmplfYGHcGpwqNXLi0yo4P41JAkMsReOlJJCJWzHSEXnIyfUuDjzLGLh8ttYFTdVpdmf
	17CNCuDS24jYiEhtTtgnNamwks589yQUo0aReYU3lmDPDDSdcnztypvdTi7WN0+qVplMk7zEApY3I
	+Fwh36vPFfoH8t/P0ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlS6n-000ZF2-O6; Mon, 02 May 2022 09:12:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlS6k-000ZEN-OS
 for ath11k@lists.infradead.org; Mon, 02 May 2022 09:12:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42CAC6100A;
 Mon,  2 May 2022 09:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5A6C385A4;
 Mon,  2 May 2022 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651482761;
 bh=xp+KaC+MSEbRv63hUTOlIKKRERdSUFG/LI5tuD4UgQo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=uIZoj1vAzXEZS1rie5lqt3pySkw8SToFNcEVz7FmOk7lSPddSDXFt/ZXd33ayas67
 BJm+RET/Ifv72bt2rBUrYHEUmxWuU7shfVEv02ZiuPVjaCP0ca2p/G4ogtB/FVxD63
 qeU2OjpwHePZMpOziFGZ2jr6s62FK9S1pV6lSLchX0L5OYM4GK9GQIEfJxK5zaIPM1
 hRu/a1xNVJCwkqDMpj0VuygXHnAyTFfldPyc8qT+hu6g2+Upomvf28tWEXphEGzt1X
 lFPijJNryq63dMLHqq6Lpp8FRJRzRn2XingFJ3qCGDXrzibP0D/jeRdQtWK+Fd59jW
 2ndlrZiOIblAg==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
Subject: Re: [PATCH v7 4/9] ath11k: Add register access logic for WCN6750
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
 <20220429170502.20080-5-quic_mpubbise@quicinc.com>
Date: Mon, 02 May 2022 12:12:36 +0300
In-Reply-To: <20220429170502.20080-5-quic_mpubbise@quicinc.com> (Manikanta
 Pubbisetty's message of "Fri, 29 Apr 2022 22:34:57 +0530")
Message-ID: <87o80gb8mz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_021242_868991_7395A959 
X-CRM114-Status: GOOD (  11.76  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> WCN6750 uses static window mapping to access the HW registers.
> Unlike QCN9074 which uses 3rd window for UMAC and 2nd window
> for CE register access, WCN6750 uses 1st window for UMAC
> and 2nd window for CE registers.
>
> Also, refactor the code so that WCN6750 can use the existing
> ath11k_pci_read32/write32() APIs for accessing the registers.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

[...]

>  	{
>  		.name = "wcn6750 hw1.0",
> @@ -527,7 +539,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.m3_fw_support = false,
>  		.fixed_bdf_addr = false,
>  		.fixed_mem_region = false,
> +		.static_window_map = true,
>  		.hybrid_bus_type = true,
> +		.dp_window_idx = 1,
> +		.ce_window_idx = 2,
>  	},

In the pending branch I moved setting of static_window_map to patch 3.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
