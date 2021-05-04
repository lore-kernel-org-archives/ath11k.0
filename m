Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB2CC433B4
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 23:04:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CC4C613DF
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 23:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CC4C613DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hCVtElh8VrZsYuyPxSKYtIOVw+bd7vIyIcquuDV6Fo=; b=jeN5xNsNdTlFER
	AuGmuFQzZPipn4x0aUIoNBM3tIjuHLA6GRRdMj2ai5Dm5HuVtRbSqiFTLSX163QvkAuW4z7v0E8Vy
	n9A1JTVgOC5U5ic6BJ4yFE3HHUJb0SVP6CkO3Z333qNp8l/D5xYnX2rhcBg/eG0MlIq1IHGzobRMW
	7Hen4HnG9X8XqJrhCuw5siF3D8Lf7F4sEk5yQGdGZV/8/3hG6hRihhgQkR9Vp7ZAjCRJg9X6wfq0m
	ksnEbk1jTwCTAHvJX4kd8rx+ouLVkm44aKnNUfOp+fw+2weHz8VXoOdWqoWx57vHSfiF+uiFv3j3m
	hdvwuWCrbGdpAWf07UsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le45Z-00HK65-2e; Tue, 04 May 2021 23:04:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le45V-00HK5e-9w
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 23:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Sender:Content-ID:Content-Description;
 bh=n8UfbbC1ipgkRcc5b6HF51NbS+0PW0JqK6XaicMOO5Y=; b=UHNU7QLpPiG5mMZmldfU0cC7Iq
 IfN2PwN9/lyXebjCWm2R075T9B05dZ2qxGnG18SwNWDhkO/oJgchKAnLO+ycF4n/mWLOmyoXrWMwF
 MHtJ/q2gdd4ekc6fN2EsoJeSJLnI2kMVfyv7TrNYKUwiV47RIpm//4UJY9pwH5Ol/Xi0bbJS0qzK0
 Hf/5Skbhie6HbmkQ0UO6357dH7BNEw8fzmE5V3HHPngpcZx43liNFQ0dnBBp05sZUH1e8S9JZB7JH
 IZo/I2drd3AyNJMO7mvBI9nw1xp/OihYx/NK9p5KzgrSdJ+zCtqib71bZVU0EFy4MmFdmXxylsvXT
 WdDwIogQ==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le45S-004K7e-Le
 for ath11k@lists.infradead.org; Tue, 04 May 2021 23:04:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620169456; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=n8UfbbC1ipgkRcc5b6HF51NbS+0PW0JqK6XaicMOO5Y=;
 b=EvpXdHCpo4x/xK0c5ZkS3deTXyZ/T4r7/cVM+xtnAZApiKh/AuUiojL73/UMaZD+dv97xSbv
 TnKyEZiaudo8ONY9XMIq3Gqo3Yy2631ChrhBzO4viJ0+CLQRl92q/IESxG2tR9eKxBAvOlgo
 uR0soDq+S46jY/kidGMJ0fj0T0I=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6091d2ee55b14811b4166e80 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 May 2021 23:04:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BAD87C433F1; Tue,  4 May 2021 23:04:13 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A1CBC433D3;
 Tue,  4 May 2021 23:04:12 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 04 May 2021 16:04:12 -0700
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
 hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v1 3/6] bus: mhi: Add MMIO region length to controller
 structure
Organization: Qualcomm Innovation Center, Inc.
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <83589a09-e1a0-4611-a844-0ea52ca036b9@quicinc.com>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
 <1618598825-18629-4-git-send-email-bbhatt@codeaurora.org>
 <83589a09-e1a0-4611-a844-0ea52ca036b9@quicinc.com>
Message-ID: <928a29dca0d2b141d4e21b7878c1c42e@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_160418_793932_F8E8DF67 
X-CRM114-Status: GOOD (  16.56  )
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
Reply-To: bbhatt@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Jeff,

On 2021-05-04 10:28 AM, Jeffrey Hugo wrote:
> On 4/16/2021 12:47 PM, Bhaumik Bhatt wrote:
>> Make controller driver specify the MMIO register region length
>> for range checking of BHI or BHIe space. This can help validate
>> that offsets are in acceptable memory region or not and avoid any
>> boot-up issues due to BHI or BHIe memory accesses.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   include/linux/mhi.h | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index 944aa3a..ad53b24 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -293,6 +293,7 @@ struct mhi_controller_config {
>>    * @mhi_dev: MHI device instance for the controller
>>    * @debugfs_dentry: MHI controller debugfs directory
>>    * @regs: Base address of MHI MMIO register space (required)
>> + * @reg_len: Length of the MHI MMIO region (required)
>>    * @bhi: Points to base of MHI BHI register space
>>    * @bhie: Points to base of MHI BHIe register space
>>    * @wake_db: MHI WAKE doorbell register address
>> @@ -375,6 +376,7 @@ struct mhi_controller {
>>   	struct mhi_device *mhi_dev;
>>   	struct dentry *debugfs_dentry;
>>   	void __iomem *regs;
>> +	size_t reg_len;
> 
> Didn't Mani make sure this struct was packed using pahole when things
> were first upstreamed?  Feels like sticking this in the middle of a
> bunch of void * entries will add some padding.  Am I wrong?
> 
OK. I missed out on this detail. I can move this size_t entry in v2.
>>   	void __iomem *bhi;
>>   	void __iomem *bhie;
>>   	void __iomem *wake_db;
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
