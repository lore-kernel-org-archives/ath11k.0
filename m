Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49F1C433FE
	for <ath11k@archiver.kernel.org>; Tue,  8 Mar 2022 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMYBbbivT39Mn0K8yBTSfi/26OGzS7DV6+8FG4Om2Mw=; b=RyW/Ids/dLC9/w
	NPQ6SqRV3U1WCW6xmbPFecl3oArVrDsYOrNzN1nooJnbd4eaqwptXFbbTHYle1bFqM/lnF1qnikT8
	r3At6lVdiWefpmYkW8c8Kd98pkpneJjh14oEuueTvQTYHIkRxAI3rplhuMC1m80S+lay3w+dGeOmw
	tFivyus1Ji9wyTJLeyevYGVNI50+gwIS1/shApbakn0iEN4SUZ+B465d2wMZ+1lUnS36QAVBsLCve
	Zx/UBndc7t2GZY09zcDRNIKiFgydqIL7ckmWfBGGdjWGOzzKHupvW9dcbNWIVtMNbaryGA1wVktpC
	HIb7C3Kh0w1Beb9pqqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRV3L-003DhE-Cf; Tue, 08 Mar 2022 08:18:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRV3H-003DfY-US
 for ath11k@lists.infradead.org; Tue, 08 Mar 2022 08:18:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91B50B81744;
 Tue,  8 Mar 2022 08:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FECC340EB;
 Tue,  8 Mar 2022 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646727517;
 bh=ygSAw4GGLQGv6N4KsfuHh/vPdd3G0JUAnVR+GtrH+MY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=HmwMHu211dwZoi8TsqIQveHsiyeoAzPeKeLKxG4Z5/kFSaVuSwlqy6RwHndHUjrCr
 rdb6jH2F9lwM6rYZoA+1omJZwx8qy0WGf4U4m7UM+myis5xw/GKzkcAWzO7/6xHA1r
 ygxJKJIqsJvaUb1eH3I7O4wR1Cwvl+YcJEZIhcykRwMRxkksBHRQsjBjxjTwwZsA2K
 o1RKI3XQ+VwThy26OhqgVwP7Uv43AshzzJzcc9Qqt68hEag30x/TDxqD7VRnC2d+K2
 /+290UB4AXgi2xvI6ZT2AuMfxMO2qMEhG7Uwp7jHbBa1X/KigKPX6e+ldC0s/6TWCx
 ku2Li4FbSDOXA==
From: Kalle Valo <kvalo@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: ath11k@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for QUALCOMM ATHEROS ATH11K
 WIRELESS DRIVER
References: <20220308071827.9453-1-lukas.bulwahn@gmail.com>
Date: Tue, 08 Mar 2022 10:18:32 +0200
In-Reply-To: <20220308071827.9453-1-lukas.bulwahn@gmail.com> (Lukas Bulwahn's
 message of "Tue, 8 Mar 2022 08:18:27 +0100")
Message-ID: <87o82gsvqf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_001840_153918_A05AE6C1 
X-CRM114-Status: GOOD (  11.66  )
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

+ linux-wireless

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Commit dae0978d4174 ("dt: bindings: net: add qcom,ath11k.yaml") obviously
> adds qcom,ath11k.yaml, but the file entry in MAINTAINERS, added with
> commit fcda1cb81663 ("MAINTAINERS: add DT bindings files for ath10k and
> ath11k") then refers to qcom,ath11k.txt.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Repair this file reference in QUALCOMM ATHEROS ATH11K WIRELESS DRIVER, and
> put it in alphabetic order while at it.
>
> Fixes: fcda1cb81663 ("MAINTAINERS: add DT bindings files for ath10k and ath11k")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Kalle, please pick this minor non-urgent clean-up patch.

Can you resubmit as v2 and also CC linux-wireless, please? This way I
can pick this up directly from patchwork.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
