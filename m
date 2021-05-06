Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5937C433B4
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:15:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6700161164
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6700161164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QSMYuSLHYhGCnp7l4tmzTHY5TF3q/BtrPHbhwaL+5MU=; b=KusmSoZBi50dF9PhHHxjxRj9N
	CutPRfaXGwnvAFErLlb4m0PohlIqwYf1v16o67FP9A0w7tJ44xNXS4mUUu151HYlliu+KWTvbZW8u
	TkC0sWI5BM/TbM5aA1KuCAu5zgBHT7wNbJQHfI3PSH8j2I2E3umaqbXamzxTIA+OuKhSZE9fhUo3X
	QioEkn8I4Z45h9wIwawyB2ETzU3DINJXzvtLlicLsifte6hFDL4enBzjs7z5hHSwQ7/v21jF9dMDD
	FxdU3eQPTTtagIwAoy5exAMF2hsv95Whe2p8TYDCTBI8AXS7BBTh58vYNZXl//i9kVnWU87SUppuM
	1P3lq8E5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leRfs-002gUu-Kv; Thu, 06 May 2021 00:15:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRfo-002gUb-VT
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 00:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=E7I+HXKgFBtlJVW9U0cF2K060a3+eIp53m54UZg8Juo=; b=13UnOUposqlLMOG7lHFQwydtPc
 scBwhCY7ziy1vlXCP3/qNI0oKFzJnKzgfheDjimowsWgZeD9A7Tp4bQhvF2i0sMsH1xoeO4pwNRA6
 WVYcQvuvDpylIC2HS27NfZMVM+foJ009qBJVDBMUQ3yGmZauWm4qBRc4O70nxUuZFRWt4WjGCHayJ
 bGyKWqmB1pNqMzw8Ir+7VQ21S5S3msKw/7qPx9bU4ZXD1SbrVNByJUmacLuDN/XIp4/jaiaMBGhoD
 W4t8FkBvwvMGlVy7IG7iyS/pRRC7gJTIGh4m8XraOHY2Xv5kexUkTU+AR3aIFGE+RgzjkAT3a6AAH
 rLN5lxsg==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRfj-005QWa-9n
 for ath11k@lists.infradead.org; Thu, 06 May 2021 00:15:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620260122; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=E7I+HXKgFBtlJVW9U0cF2K060a3+eIp53m54UZg8Juo=;
 b=WExKZjGDI/7GMCNHvh6CLnQwDAXfhbpXZ+qPU+WO9jLr6uz6mrpX+/DiLUwLPkJZtTTQ9tEU
 lxVojWjs4YfduFn1LtAUHbZQ4jAXzF+Y+xslNPjMZtA3wl+eIHDDSH/7VZ4Kj630JLQr1g+S
 +P6NVKHuP5b7e/J2E8uPKOxwr0o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6093350e853c0a2c46c89bd4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 00:15:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CD0BEC43460; Thu,  6 May 2021 00:15:09 +0000 (UTC)
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hemantk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D9C5AC4338A;
 Thu,  6 May 2021 00:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9C5AC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 4/6] ath11k: set register access length for MHI driver
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 ath11k@lists.infradead.org
References: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
 <1620234501-30461-5-git-send-email-bbhatt@codeaurora.org>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <60e7a674-a5d1-e796-2911-a9680d0e26b2@codeaurora.org>
Date: Wed, 5 May 2021 17:15:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620234501-30461-5-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_171522_650442_47CA0A8B 
X-CRM114-Status: GOOD (  11.95  )
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
> MHI driver requires register space length to add range checks and
> prevent memory region accesses outside of that for MMIO space.
> Set it before registering the MHI controller.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
