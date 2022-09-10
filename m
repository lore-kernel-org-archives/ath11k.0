Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8DFC6FA83
	for <ath11k@archiver.kernel.org>; Sat, 10 Sep 2022 07:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrol3cmWhn0DqCIug1d1+ZCvT3DftPQGNn5C0aD2SM8=; b=EcXf2WCrCCJMTh
	n+72WsMCIKg5pxQcfriy7ycHadjS9TLGc9WYjwJjMXyJA9+86+qse4em1jbzZNzdPTOnRE5vKXEGJ
	OBTga5OAYR0Q6GXG0WMpp/k/idhhBWmnDR+IE0YGgnZX4m0oRh7QhLncwuwFFNri0OAYhGfxB+77Y
	TqC6fIO8Ucri4Rr8ISIwsgKZXZqN4y9HenQbtFx3Cpiq/4y2PssqVKo6AZ+HBJG21KORwyZ2RdZ9w
	X+PA+8Ki5j4JkUvJ4g7Pyms4cb+zStAsDWcdEPxnvKj4ZSmSgv49hd7luV+HpbPWWIzlCnJzwmwtc
	I//6ujCGmecanpXdVo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWuTD-006rsk-0P; Sat, 10 Sep 2022 07:00:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWuTA-006rrW-IB
	for ath11k@lists.infradead.org; Sat, 10 Sep 2022 07:00:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E83D6B80682;
	Sat, 10 Sep 2022 06:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED87C433C1;
	Sat, 10 Sep 2022 06:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662793197;
	bh=H1aoyF1uXDfRBKooemHT/8QDr5kWAqldZd79V0FSS58=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HkVhrj8ZkFAQeYHVojvPSgOc1WVVOxlAoXPqHcO2Z6yb0wUaVL9FPyhgG9Zz374NC
	 iGu3kEdcNhqji2wnhaf2btSUDwzx3pBR600fLRdy1F2Aw/wYAdu9Kc1+atHsq+fYLC
	 6r9ZOJn3UVe3f82vukvu126twrCN7rG9JfNFvFhJ90h/9bX6h3VG5JD7p0kUWdo6sI
	 Jb5o7KD4rjUzrwwbXtKyNCQX25yXFNDMvA815pubAf2svV7IB9qtDcQ8YCaikOuXYE
	 HSOt6CU/T8f/n1Ylu5L711uUzIZQ6neDiODjBsXprO4tE5WSiphM6UqxcK3O0oDYM1
	 Tl44ZAw1s5PlQ==
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] ath11k: Add WoW support for WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220902112520.24804-3-quic_mpubbise@quicinc.com>
References: <20220902112520.24804-3-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166279319008.7195.445410596806378846.kvalo@kernel.org>
Date: Sat, 10 Sep 2022 06:59:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_000000_783151_305FE88D 
X-CRM114-Status: UNSURE (   8.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Add support for WoW on WCN6750 chipset.
> 
> Unlike other chips where WoW exit happens after sending WoW wakeup
> WMI command, exit from WoW suspend in the case of WCN6750 happens
> upon sending a WoW exit SMP2P (Shared memory point to point) message
> to the firmware.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Failed to build:

ERROR: modpost: "ath11k_pci_disable_ce_irqs_except_wake_irq" [drivers/net/wireless/ath/ath11k/ath11k_ahb.ko] undefined!
ERROR: modpost: "ath11k_pci_enable_ce_irqs_except_wake_irq" [drivers/net/wireless/ath/ath11k/ath11k_ahb.ko] undefined!

This is because EXPORT_SYMBOL() macros were missing, added those in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e522bd3df8ab17f661547603a44f4b7d84223d73

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220902112520.24804-3-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
