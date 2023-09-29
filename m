Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FABE71D31
	for <ath11k@archiver.kernel.org>; Fri, 29 Sep 2023 13:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKS6+YS3ni7des6pHQvu+kjD9hxJmldoZ4ieOGbP45g=; b=XpWNvOOQNIhiUn
	hRQD4IV12GRSNQOL0NVJDRE7s4/rNH4HdaExxy3CXqbgRfIX6iQdtG0myQ2Ujf5+ZlLevRY0BgIU0
	PGfVTJTCSyBqjThSd5+AXG9n+nO6YqTimL5logJBZo8/c0e6rQGeXtTdVoevgNj58lV2Wuzw/YeFd
	KGRSYi+EfblX0cVNQon13+yNe8IaVOOg00lX8pFptYkeLXZhR/t5dew44Zb+CSrIIE/KwAmoQXmzn
	69cM0KFyWIM/yEJu5jxlA8cqzln63lPle78dyPW2KNP8QiatC6TGge7fEgzYXcnataathg82cXorK
	sRxqaxTPgxIh3O3wMaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDLx-007wmf-0M;
	Fri, 29 Sep 2023 13:16:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDLu-007wmB-22
	for ath11k@lists.infradead.org;
	Fri, 29 Sep 2023 13:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 297E7B81F44;
	Fri, 29 Sep 2023 13:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60ADFC433C7;
	Fri, 29 Sep 2023 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695993376;
	bh=cU7VTUFWrOyFPux0ewokHmAc68XzvYshho1YDazVwFk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=OLY1VF3devQ8Xozp7ytGB09tP4h6jAA2z91QuSHIypO4XTRaHvkxQCz1FaiAW3LuE
	 KAjP+DNwFFLwxXtFBdTW6iPgypIpiAhWPMfZHiHdGzM/BeuVrLqLD4mgPbEgbUpiww
	 7nwAp2W9Uc31aZlIT9b8ovW8bdzNBpzVUNX+jPwvCd0G5+VI3aYYK5Ne6CPvi8eCdI
	 EAgcXZA0MMvab8r3o5WTGKMCOSHFbX48cWiUFSuatyTGWYFUTrblCkeg7UmTgv7gYB
	 Pc51ZTfcb4gY6g+gNNfwpOZR/jYEvWOLgedcnRBQ6LoDEKZDLyF6WvRO+Aj1RGYuXa
	 HHklB7N/xWlCw==
MIME-Version: 1.0
Subject: Re: [PATCH v6 02/13] wifi: ath11k: store cur_regulatory_info for each
 radio
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230920082349.29111-3-quic_wgong@quicinc.com>
References: <20230920082349.29111-3-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169599337313.3629319.16942649855938558230.kvalo@kernel.org>
Date: Fri, 29 Sep 2023 13:16:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_061618_806776_D85BB1BF 
X-CRM114-Status: UNSURE (   5.94  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> The regulatory info of WMI_REG_CHAN_LIST_CC_EXT_EVENTID is not saved
> in ath11k now, the info should be saved in ath11k. Save the info for
> each radio and support switch regulatory rules dynamically.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This added a new warning:

drivers/net/wireless/ath/ath11k/wmi.c:7157: else is not generally useful after a break or return

You should guess by now what I'm going to say: please ALWAYS test your patches
with ath11k-check!

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230920082349.29111-3-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
