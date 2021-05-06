Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3F8C43461
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:25:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7D2613DD
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D7D2613DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ur+4jM1VdBpNFfwwGhKU9hycV/1Ek/lhsPvy2PvfFuA=; b=KHVH0QpacwZuvV/GFx5q9REil
	OU7/W4y9xBx70p2Mzm1rtfsVwPeWJA1BDPagKCsA3VH8BNlis2HMP5fHpjz5sDNp0YCR8SEKVkpBE
	qt6Pppv5H6F0Ij+ZCAoxExpZH3min2svGEEiIVnjo2CcsInDow9rs2yplgbBofvDbR/AKk+lUkb96
	Q1Q0yAJimdW8vp+fTVLWgc7bBs/4rLdMGT3rAYqVEq7GWu+I/0Ezy9cdyDac4a7yhhdcWf3fsyJ8b
	Hj9y/n9sxoRrAgUJOi/7/RocFwsafKt0XPXdOOzaGBMwFuuJQbxplofrFK6MCPRixdOfH4d2LO4Tg
	DLvElEb+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leRpn-002hC8-8q; Thu, 06 May 2021 00:25:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRpl-002hC2-Tp
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 00:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=t86AX5J1LPQ0F9dkoMI/7zO/SFpx4ZgWBgEKui4KQrU=; b=oRw+swDX9eY2lyT7Aeqd9hzCxJ
 gye51IjkZmbxxuDHhH/SA/Hjt8aqINrcMtI3CY/uk0OcRNkIGspH20+u1dNiIMvmsTH7T4qOcY18Z
 aF7ltMfCWky/AtRsmrnyVh5BiHxKSQyOuVx+H75DRuOlFYQgaBgmCr0j292dXiubF5gpDV21b3Nbq
 rgydFcttcoz4V0HIrAQ36yDMR7paxeFFAIQBOy1ajYONYAndxTGIQByYg1NC1cI41bhMr6bQXT+7Z
 dichKigQdWuEdkfUsVYUitthsVPrF7NeWVV/dbg0LhfBDkd0NQNdZ3IQWXtjlBnqBWRe9DUIHA1YH
 /SK6bHog==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRph-005QxW-0r
 for ath11k@lists.infradead.org; Thu, 06 May 2021 00:25:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620260739; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=t86AX5J1LPQ0F9dkoMI/7zO/SFpx4ZgWBgEKui4KQrU=;
 b=hTIyjKZC/66/osSwBlepvWwbvftrRs27wSLS51M/oIA4MtcS8oY8ytRHdQiFA+x4egq0Co3k
 eialFaa15t3G2h2fIKKfzvhvjtuEk3Pu6EYHONe4+IMaNU0ukdYh7z3g+xcfleITYjRaP8Sw
 AHBnTL8sCE7VDy6qN2P3MTtCdIk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6093377855b14811b432b107 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 00:25:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 45FD7C433F1; Thu,  6 May 2021 00:25:28 +0000 (UTC)
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hemantk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 27A70C433F1;
 Thu,  6 May 2021 00:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27A70C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 1/6] bus: mhi: core: Set BHI/BHIe offsets on power up
 preparation
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 ath11k@lists.infradead.org
References: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
 <1620234501-30461-2-git-send-email-bbhatt@codeaurora.org>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <d4371467-f9ea-a143-a1a0-3ce4bc86c6ed@codeaurora.org>
Date: Wed, 5 May 2021 17:25:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620234501-30461-2-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_172539_282882_100729B5 
X-CRM114-Status: GOOD (  13.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 5/5/21 10:08 AM, Bhaumik Bhatt wrote:
> Set the BHI and/or BHIe offsets in mhi_prepare_for_power_up(),
> rearrange the function, and remove the equivalent from
> mhi_async_power_up(). This helps consolidate multiple checks
> in different parts of the driver and can help MHI fail early on
> before power up begins if the offsets are not read correctly.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
