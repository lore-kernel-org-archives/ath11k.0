Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1B0C433EF
	for <ath11k@archiver.kernel.org>; Mon, 17 Jan 2022 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNwanih5mr5HlhlklbYF7wz3j8saoOL8RZk+eyFtmN8=; b=1b2j1+Y7xdMC2/
	n73KVZZsYVVLOlzHVVWcmDW6Nq3yTc9B/alBpg0C5t/HVB/Xsfc+7ElrF4NyCUhNmFQVmJr/y9d7Z
	WcXKYBeyHOU2n/HDX/TPBzycEWBYWsmp3DShCsFKT7+ArF5XOY+37lY4aODUpg7pqwVxWuI1LGuy1
	P0ptLkyb3l6JfOU00YT6huutD3Kyq6PjoxFNJmULh2wJsqU/UeVY0Cv2GLgN5Dhd6GMvMVw7122Lj
	pMI2o+8uAtE1LsJo8FGn+LOVv3FvNpizswHUTyrzMB4ZMslD/vDvkkZny5q1i1x/DZTItYA5nlu3i
	VDie9F5hZEpttiX2bjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9RG3-00EvF0-BU; Mon, 17 Jan 2022 12:37:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9RG1-00EvES-8B
 for ath11k@lists.infradead.org; Mon, 17 Jan 2022 12:37:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DFFA611A1;
 Mon, 17 Jan 2022 12:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C3DC36AE7;
 Mon, 17 Jan 2022 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642423027;
 bh=144ap2SO9WHpXKY6PYR+n9vddvxSLLoMYrvNyrAi/hQ=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=ZAmkCAR0bLZ35wtQFdxosUpADNDnbuMzdCMrjvvDch+4zHeguNtZLSb2jBtyMG7f7
 9e+DeXM1ugTAKyrIHSfXv7gYVEwSXoZVGBXxNe2B1h4VUFKkQlK3d3BzfdEabgm2Av
 jkSHkgQHa1Qk6mP5h0rZCxbh70WHnLUiPZN+gjGhRnYGOPR4nzNKwCJszyuvzNEaB5
 w3NnHaAOsTGVo6054eVgECy9CWLc9HtTtXzpdTD5kjR9ZZ7p56sRZNkN5zJZ++WBkJ
 tlvcqMGsbDU+9OI+c8IMWMiSAMf1kOeLGikjtmAFsy04z9uzEc8ZSKq/d5tlz/umbm
 I2xRDdFvI+Slg==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: enable RX PPDU stats in monitor co-exist mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220111032224.14093-1-quic_alokad@quicinc.com>
References: <20220111032224.14093-1-quic_alokad@quicinc.com>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Miles Hu <milehu@codeaurora.org>, "Aloka Dixit" <quic_alokad@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164242302513.27899.14013951630174562565.kvalo@kernel.org>
Date: Mon, 17 Jan 2022 12:37:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_043709_365006_250FDFBE 
X-CRM114-Status: UNSURE (   7.47  )
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

Aloka Dixit <quic_alokad@quicinc.com> wrote:

> RX PPDU statistics collection is missing when monitor mode co-exists
> with other modes. This commit combines the processing of the destination
> ring with the status ring to fix the issue.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01179-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

67a9d399fcb0 ath11k: enable RX PPDU stats in monitor co-exist mode
3cd04a438754 ath11k: move function ath11k_dp_rx_process_mon_status

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220111032224.14093-1-quic_alokad@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
