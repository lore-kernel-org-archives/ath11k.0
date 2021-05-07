Return-Path: <SRS0=IakY=KC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A60C433B4
	for <ath11k@archiver.kernel.org>; Fri,  7 May 2021 02:33:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 901BD61154
	for <ath11k@archiver.kernel.org>; Fri,  7 May 2021 02:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 901BD61154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X4BzDpa3KXtOq2b1VeoHe1WbBcCOappEPasCdo6NHOM=; b=LCzxp4OPPMYZXaHCMoXPmWbis
	dHHxMScNsurSXECqC36kEdT2lqyhLPDYECKFJ82RQ1bdvoyGsXlSUReRWRy5fRTJPNjhuCN+aqeWc
	GqqwpqIh2YF7Fd81v6lfk54DEAqsJxM10+eVcLEMoQ6zrWWULJt3KerJY8fdQpjShXciRBgfIt1Wd
	pHFjx5f5Dln4YTxECHiKu091Ml4OWRIDSubcgEWueaoybmFUq8wmGhHU+TlepvVpWqUQi3efqd4j3
	3exq/90tRjthgv+9JMKlhrXXZ8J6vGahyBMI7+fpnMrrW7r7PqSs9FA8cu00QZs0QDt0toXEy2Uv4
	TB+6IeBUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leqIz-005sji-HN; Fri, 07 May 2021 02:33:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leqIy-005sjU-45
 for ath11k@desiato.infradead.org; Fri, 07 May 2021 02:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=8laHLxpGeb7o6Scw5WGknuXL88+X8velIbUvuC+eLbs=; b=l6+K4sTx3KuefisdJ/zwLciFMY
 wM95eZ5S1rTSyi+2omLr7fpcKooeHIJtO+9QgcYo0WzXduiBqCaC5fllV60LYI0EK2V3wEEvS5T4M
 MP4QdNDZhxycX3xxpWGVD8boZzfhuvcRoEu96IipQ/KwSxl0IReHXEULDq+IYzegBmge7GIfHJ4p7
 /atC9c/KK1N69uGp3wgyAOBAUIYZE2sFJEc6qTPAWDYHBPdSnggMPp9bAcriFd2N3F2Q8MbSrZy50
 0GkuurPZX8rda2KuevIOwXe2j8IR8PhQuLPiMBKGD6MYHJtyG9EYp+AaoGX6FXrshDE6gmE8mtS1v
 aGgAsZ+g==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leqIt-006WqD-Q6
 for ath11k@lists.infradead.org; Fri, 07 May 2021 02:33:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620354802; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8laHLxpGeb7o6Scw5WGknuXL88+X8velIbUvuC+eLbs=;
 b=VdUcGOamThtlOwge7Pxp5HQ6bA1ebg7uVpf4R2SEZXeQ5757551ASYpLzmrlD+uDXReWvXwg
 VYo7kG78W++GjlqntsVkgodWYOb2LUPo82dLQ6gFJVL9jKFMz1fcAFI/I3NiNnwE/NJCoRGH
 3/j2ElN2SuKm46CrJ8h8rVDNYT0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6094a6f1e0e9c9a6b601e82f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 May 2021 02:33:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E8755C43145; Fri,  7 May 2021 02:33:20 +0000 (UTC)
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hemantk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EEFEC433D3;
 Fri,  7 May 2021 02:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0EEFEC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v4 6/6] bus: mhi: core: Add range checks for BHI and BHIe
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 ath11k@lists.infradead.org
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-7-git-send-email-bbhatt@codeaurora.org>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <860e3d9d-91dc-7fd6-68f6-e8f099cc4555@codeaurora.org>
Date: Thu, 6 May 2021 19:33:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620330705-40192-7-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_193323_927854_82ED9688 
X-CRM114-Status: GOOD (  13.44  )
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



On 5/6/21 12:51 PM, Bhaumik Bhatt wrote:
> When obtaining the BHI or BHIe offsets during the power up
> preparation phase, range checks are missing. These can help
> controller drivers avoid accessing any address outside of the
> MMIO region. Ensure that mhi_cntrl->reg_len is set before MHI
> registration as it is a required field and range checks will
> fail without it.
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
