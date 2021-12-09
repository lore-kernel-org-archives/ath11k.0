Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00443C433EF
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcFkiUHPlBHYvHARbmaP4sUVquvxQvupODMIzaJBAYA=; b=uGa1ViJpyKjjlr
	7IfsDxV7HRg+wvAiVk/vX1kHBKhjFFPfb4RzHU08DhHiChKE3RbbYWJ7F+gQV/TX4EPJgTmIkTR34
	JOrza7XlZUuTG0oTIOkWD+nVEWEvIEwDeae/0j0OG4HmUgStx2Gtuy/+bYDlVwiUm44H1ddVoVLX1
	k5XoJ0jUNEBtY2UtwCWIoNMpw/axEjK3YjL3XojYqfbkpfBnf6AD/528AP6w1MK5zv7KeIpbKUmhb
	bgNbNNqBO56s+RUMEYa1sh9yZ7h8ixopp86ptBp95VsuibAqVKRQCjWLw0jBaCQyk2Jmp/MDStktK
	ZPI27RIouM1ajWyQGxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvGn4-00Fdnt-It; Thu, 09 Dec 2021 10:36:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvGn1-00Fdmy-8J
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 10:36:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6B97ACE2576;
 Thu,  9 Dec 2021 10:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6D1C004DD;
 Thu,  9 Dec 2021 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639046195;
 bh=1GHthKtcS/GtdAuJZVLCvo7YEviQRgYTYs/I3neTWLs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=RkrZZnDaTMb+I+zqZvjhYxCM7vbvgsABDFPrOKcR4cJmqNF4OIC+3d25TcpnDrSYd
 DOS+ma5jnybOdajCwPTOFFSn84bJRN1xKnvdz9x2VkRn3o/SSlUdhdDdZNdDLlJ/eP
 7FOc7+ew7u6Jm8QxlkY4bb7PfnuOtqxa8utcuiB8TCEfMO5qUsu9dtEnH0b2rcm8pi
 IQw1bf1UIFW+JkemkwKgw2u77chB5ckzzH+OfhSJ1Jvvj5EXUbyu7BLLihEj7yEKAc
 khPcBKF6+FXfOsAdtN+2quYcCteOFt24CjNUFYPdi0eku1JLr6Z1/Uk8xBVF2GImO+
 EfrzIQnZf3tTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>
Subject: Re: [PATCH v2] ath11k: Change qcn9074 fw to operate in mode-2
References: <1638971390-7160-1-git-send-email-akolli@codeaurora.org>
Date: Thu, 09 Dec 2021 12:36:28 +0200
In-Reply-To: <1638971390-7160-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Wed, 8 Dec 2021 19:19:50 +0530")
Message-ID: <87a6ha3w0j.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_023639_505209_5590AC41 
X-CRM114-Status: GOOD (  12.58  )
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

Anilkumar Kolli <akolli@codeaurora.org> writes:

> From: Seevalamuthu Mariappan <seevalam@codeaurora.org>
>
> In mode-2 QCN9074 firmware uses 15MB of host memory and firmware
> request 1MB size segements in QMI, whereas in mode-0 firmware
> uses 45MB of host memory and each segment is of 2MB size.
> In mode-2 firmware operates with reduced number of vdevs and peers.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -12,9 +12,9 @@
>  /* Target configuration defines */
>  
>  /* Num VDEVS per radio */
> -#define TARGET_NUM_VDEVS	(16 + 1)
> +#define TARGET_NUM_VDEVS	(ab->hw_params.num_vdevs)
>  
> -#define TARGET_NUM_PEERS_PDEV	(512 + TARGET_NUM_VDEVS)
> +#define TARGET_NUM_PEERS_PDEV	(ab->hw_params.num_peers + TARGET_NUM_VDEVS)
>  
>  /* Num of peers for Single Radio mode */
>  #define TARGET_NUM_PEERS_SINGLE		(TARGET_NUM_PEERS_PDEV)
> @@ -26,7 +26,7 @@
>  #define TARGET_NUM_PEERS_DBS_SBS	(3 * TARGET_NUM_PEERS_PDEV)
>  
>  /* Max num of stations (per radio) */
> -#define TARGET_NUM_STATIONS	512
> +#define TARGET_NUM_STATIONS	(ab->hw_params.num_peers)

Don't know how I missed this previously, but the macros should be
converted to FOO(ab). I'll send v3.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
