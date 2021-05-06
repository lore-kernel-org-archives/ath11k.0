Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D742C433ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:16:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3EC613C7
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3EC613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M9XivYh4XW4vrtd3fOXz6fimHeMEiY/UoPdPv2vzbNA=; b=NwdArJrWp+21+6CMrejUmMZlM
	MyenE/JxJ6BKxFtXINJP3Vn+DckV7+Lucw0quxGr/3vOm9bUAqkLdCccGEB7mRKRRXKNlbRvLsGsw
	8X/lBxJMIpeAkWkiwUDbm9MPX7ijCl4Le5ApPUCEL7OrGUc2ZizVtE0OwOevGnbM1cuMcvAEp0SEC
	gPnMe0oLgYmfOr3xCCCZ9gT3rHB77NUpAitiEY7iahbNymKA1XBV5zwgI0mEVr64z+44rARnFji1a
	LFapoMsKyb8CvEpohSEUOXd70zjIraYJqTvcCK5XE1RaKmMVJyylO+PhLP0IpMuU5ek5QK8qkko3/
	YvKuxC29Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leRgf-002gay-Bs; Thu, 06 May 2021 00:16:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRgc-002gaK-0K
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 00:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=pX9OEOiNOPBGFSiRHp3QLF0msIPCYazXjx46x10mh70=; b=ek2zIcyMTIyS/I9VsBWJdVCSPT
 yYpOoNkC/1hVNQf2ug6mvB19w8m1+NLlI7AI8SV3czsncvScuK8dZKFn+7NMPRQ6BPY8rbfEE6jqj
 Knvq+yuo/Qw4R/IN4l+rREjtg5QI3HZtcJik64U9TcLG1qILPhBweguClK7rSt1nQobqiIByq5MrR
 6bDJzFc/VE32rKkCZkdPbBxRdRmPp/GfSFxust5hO9GoWaua7HVhspX5JApLaIzeu9C+gl6DDep2I
 BkTlGuRTR4lcyAc5yvvDuRtrUoPbvK8qXh+hhUbAEd42UPFmHQ9W2vo4m46b3eY8BfwhFhyCnwql0
 xoounvEg==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRgZ-005QWa-5A
 for ath11k@lists.infradead.org; Thu, 06 May 2021 00:16:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620260171; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=pX9OEOiNOPBGFSiRHp3QLF0msIPCYazXjx46x10mh70=;
 b=wYV7Lyd3tfCtdITgrAxBD8MP7Lgfes/fdMwm3DCqlDKXGb2cUoekpp01sBbNzzj+3klDz3rj
 NqSU6f26yg1XnPfIgQ8p3KV+CS/DknBUw+3MDKBDhvyABG3zmqfl1+AwZ096LIHxXpRJ5wNp
 nrFJPWlgJNjtbCUAqegjooWH1ZI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 609335489a9ff96d9594ef51 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 00:16:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5C210C4338A; Thu,  6 May 2021 00:16:08 +0000 (UTC)
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hemantk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FABEC433F1;
 Thu,  6 May 2021 00:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8FABEC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 3/6] bus: mhi: Add MMIO region length to controller
 structure
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 ath11k@lists.infradead.org
References: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
 <1620234501-30461-4-git-send-email-bbhatt@codeaurora.org>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <1ed18dfe-19bc-440d-e524-0883768426b7@codeaurora.org>
Date: Wed, 5 May 2021 17:16:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620234501-30461-4-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_171611_696482_B2181762 
X-CRM114-Status: GOOD (  13.14  )
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
> Make controller driver specify the MMIO register region length
> for range checking of BHI or BHIe space. This can help validate
> that offsets are in acceptable memory region or not and avoid any
> boot-up issues due to BHI or BHIe memory accesses.
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
