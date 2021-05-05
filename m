Return-Path: <SRS0=fjpk=KA=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989CFC433ED
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 14:37:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46489613C0
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 14:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46489613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/g6BeXvkjpvCbs2L+wl8yYXQU/UsfzTWsDnWN4uPAp8=; b=qP3qMWsmvea/iN83RJQa8zXsN
	l+YH+UB8OxPa0V1QLPsc9XG3AIWD4L8xCV2TI7pH3MM7M0YqD+1WYkZuhJg7htUgm/rG6201HO9Qs
	gZy3RO+fNL+hn33mbwXJf0CMUB3JcbGKOnBMl/jzVYrIfUtws2N7HReiiH3jpEVtFZGrtAlBOi0IT
	7//U1SbJRPJPGO3tdrKqq4Zk8pMGudWHc3A+Sv4TvM8l3+nl29YqAGThrrPWPdk1hd76LzDn7Y38q
	NNqhXSURShcngaFB0XyfZhBHJ44ax+/JLJ6nRpA8Cvqz2pOWh24K7xuUivpqujXQvHkD+st1jmMpF
	e/qtEvl5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leIei-001S5R-Og; Wed, 05 May 2021 14:37:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leIeg-001S4o-JQ
 for ath11k@desiato.infradead.org; Wed, 05 May 2021 14:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1VY+1SqEr4YvaMc8e5qQSXNcREwWWIJRDCU+340hH9I=; b=XoCfDsI/SCXza9wQI0hMRZ0aGr
 HcKrYlqS4gvPwbF76U5rldlARrrKV/9/nhAUgCKyko4rDx9GTCIeskTuMpytJ0EsZhFfZdXC+RO7o
 FVZVgz2x5dY8I4Zq56qXPvTUt5Tjc43Dq5iYILS2Yj8nQ1hAydB84YCPGzm4rsnBrCz9Ix15S+fhc
 EF9oHNEAzG2jZoYXQn0Idyh0oDO/AdeE05I+a2Ecii/RzMuhVFu142eAQW2iJWm/oLkZ4CzEpGze1
 J3vOsjQ3anCU4z8IdfRCWq8ig6Lm4kwSkfWM+iV0j4ogYCq0T65m6nVOiZXRoRt+JNk4FxLXoNYEb
 YzAtWFUA==;
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leIee-004pe5-0Y
 for ath11k@lists.infradead.org; Wed, 05 May 2021 14:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1620225455; x=1651761455;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=r1ksVxU1MUF9GVcZZQBHhXDXhP3gNmg/6hz59OO9qzM=;
 b=V2hlsr0w+ncxuhDIBifMlSTwBlKwh1ZkjYrYcIcYV09eDaSCHyJLzGKh
 6guIpkitiW/ovnPpPSoYyo7sTNbDOykKKKaY+qLczNm9sfapb0hC8Ixf3
 cpCTPiLVsCAvWgZnyXE47tgI0J7Po7O3A72xJI05B9vBRQYC4RHr+fLSu E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 05 May 2021 07:37:33 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 May 2021 07:37:33 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May 2021
 07:37:32 -0700
Subject: Re: [PATCH v2 3/6] bus: mhi: Add MMIO region length to controller
 structure
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
 <linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
 <linux-wireless@vger.kernel.org>, <kvalo@codeaurora.org>,
 <ath11k@lists.infradead.org>
References: <1620171478-35679-1-git-send-email-bbhatt@codeaurora.org>
 <1620171478-35679-4-git-send-email-bbhatt@codeaurora.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <ee188cdb-3edf-816a-c0b2-88a14fd037f3@quicinc.com>
Date: Wed, 5 May 2021 08:37:32 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1620171478-35679-4-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_073736_116490_7129F770 
X-CRM114-Status: GOOD (  14.32  )
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

On 5/4/2021 5:37 PM, Bhaumik Bhatt wrote:
> Make controller driver specify the MMIO register region length
> for range checking of BHI or BHIe space. This can help validate
> that offsets are in acceptable memory region or not and avoid any
> boot-up issues due to BHI or BHIe memory accesses.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   include/linux/mhi.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 944aa3a..f6901db 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -293,6 +293,7 @@ struct mhi_controller_config {
>    * @mhi_dev: MHI device instance for the controller
>    * @debugfs_dentry: MHI controller debugfs directory
>    * @regs: Base address of MHI MMIO register space (required)
> + * @reg_len: Length of the MHI MMIO region (required)

I believe this should be moved so that it matches the ordering of the 
struct fields below.

With the adjustment, you can add my reviewed tag to this.

>    * @bhi: Points to base of MHI BHI register space
>    * @bhie: Points to base of MHI BHIe register space
>    * @wake_db: MHI WAKE doorbell register address
> @@ -386,6 +387,7 @@ struct mhi_controller {
>   	size_t rddm_size;
>   	size_t sbl_size;
>   	size_t seg_len;
> +	size_t reg_len;
>   	struct image_info *fbc_image;
>   	struct image_info *rddm_image;
>   	struct mhi_chan *mhi_chan;
> 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
