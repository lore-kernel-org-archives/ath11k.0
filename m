Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF19C433B4
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 17:28:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED623613CB
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 17:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED623613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=agHh/gm5pmBWvIxwGY1VrjgKmA6nvylP4XZDuR8er+M=; b=mGCllVdiD7MNxrd/UHIvtIl+6
	YRTOShVqQSgSq8ZaFLQ5OtirvQMpG3qHDk80bcd3Vgf3mxNi8xk2yu+EIUbKe3t2MDzr4g/sc/5Ft
	G7xXgl6aqs7Z13fD8qi+0jnRRJb1udhaoS+sA1xB5fWiBDHR7HAvBcSw5ckivUJEQkr7poSg1KDSO
	GRSZjMnePst9IHskJ+6FjqtebG4hrDahpFKGfiX9gmvkG9oe38GoO45fn8e2QEu5wghLX9XSuZeYQ
	sFmYQb3o/yJfnfquFdc0WVmJ003wZlglekk8bOrWIud7zw6CAgFM4IUlbmIPmufR1UgStu2M+Id4v
	uoKbY9PDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldyqX-00GfZA-48; Tue, 04 May 2021 17:28:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldyqV-00GfW2-8a
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 17:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=M2uqSqeWPpnIjZ194a3HKF3Bqx+cCeQjI+4eAg2X230=; b=Vg6TbNfweF50fgOGVQNgzPwMll
 EedU4ovY+Z+0CkGELidtlbKvyOaCfMdH6Uqq/ZSKiFGRIG42eMsohBEk14Sxww3q27BDnafaYfdbY
 2N08yxlAOEXXUO+S7fkuw8w4F1XQ+n8Hdo9eJryZuYtiGRtu/O7hbL5Wr2pbVuom/ofnB76Vfbwmz
 bkCDCQfZcl5qZUyhYJzdHpiJ4U911a0Szdvd2eGYc2yvcOZ/yQyAFKXkcFULwglB+IvKde5oqf3+f
 e4flEjoLcyEEqwjqWIG1FiEplnORJ+FyAlhtyu6N9vRRTdijyUYEsYGCbhC6nsJ83kJlJLO3nWU2+
 AQSiw3qA==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldyqS-0048mi-Lh
 for ath11k@lists.infradead.org; Tue, 04 May 2021 17:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1620149308; x=1651685308;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZOH1Z1q0t1yZorMN1W7GVEBt1fJx4vC20/fEaSi4LHE=;
 b=PwFtGkUjeUdC2zn8240l8boDhT01TML4ZGuZoD35LuZxo281UbbTZyTj
 EPXnK/Bg4InYS8xZJ62JZ/hKkKV4Ph3rY0FvSZz4XYyg7FOKR5c2BDWnq
 5kp5k7IDM0JwGS6FqBQAiMPjc67n1THdGfJwrf/bnqW9eNLeB+4hhvNcM E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 04 May 2021 10:28:28 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 04 May 2021 10:28:27 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:28:27 -0700
Subject: Re: [PATCH v1 3/6] bus: mhi: Add MMIO region length to controller
 structure
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
 <linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
 <linux-wireless@vger.kernel.org>, <kvalo@codeaurora.org>,
 <ath11k@lists.infradead.org>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
 <1618598825-18629-4-git-send-email-bbhatt@codeaurora.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <83589a09-e1a0-4611-a844-0ea52ca036b9@quicinc.com>
Date: Tue, 4 May 2021 11:28:26 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618598825-18629-4-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_102828_765697_7962EB97 
X-CRM114-Status: GOOD (  14.62  )
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

On 4/16/2021 12:47 PM, Bhaumik Bhatt wrote:
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
> index 944aa3a..ad53b24 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -293,6 +293,7 @@ struct mhi_controller_config {
>    * @mhi_dev: MHI device instance for the controller
>    * @debugfs_dentry: MHI controller debugfs directory
>    * @regs: Base address of MHI MMIO register space (required)
> + * @reg_len: Length of the MHI MMIO region (required)
>    * @bhi: Points to base of MHI BHI register space
>    * @bhie: Points to base of MHI BHIe register space
>    * @wake_db: MHI WAKE doorbell register address
> @@ -375,6 +376,7 @@ struct mhi_controller {
>   	struct mhi_device *mhi_dev;
>   	struct dentry *debugfs_dentry;
>   	void __iomem *regs;
> +	size_t reg_len;

Didn't Mani make sure this struct was packed using pahole when things 
were first upstreamed?  Feels like sticking this in the middle of a 
bunch of void * entries will add some padding.  Am I wrong?

>   	void __iomem *bhi;
>   	void __iomem *bhie;
>   	void __iomem *wake_db;
> 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
