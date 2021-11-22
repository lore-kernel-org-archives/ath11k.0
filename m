Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD885C433EF
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 06:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2nMH8k/GnJn4kSogN0szczxHw81x8MXDMhuKwTrAx4=; b=xxqTLnv8hPrqc6uAyrXMAqjExg
	3LVR5RN9p+/eDiyXv6yxXrqylEXoV6DeVvH8WHOxKDo1QuUA4SdNh+AoUb8a+XqLh5BrxJXxCoRR4
	ZhapIqFtPJAhbXmeou3APSSb/b9V0lynpeOpaucuK6xET2JmzdCdC4zReZgSQdQ+qyRYtvZBZdw2q
	bL/JH1zdqNMS8ZdknjDRrVMjasyGzVE31oIvb7st93FM7KJE2cFH1CGlP0uOtY57EAphC+8kgs9vj
	8IXOyhEQT+0/ZStTwasZGeaHmd0/VPKI1J539XhH0iS3XIKFAfRhlYIeQsLeVBJd3bQJ9C/266Wjy
	nflMY/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp2Z6-00Ewro-Nk; Mon, 22 Nov 2021 06:12:32 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp2Z3-00Ewr9-Rm
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 06:12:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637561548; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZheBse8ZEvGihMnRn4T6pwI87eiedwVxJmdP9hEilRo=;
 b=jjwPcSw04nTdcxcaeUU/EkUg8iRdx7R67aaC3kZRLqSESCaxQ3CdmpbrknnjsaEDMu6jWtpJ
 GVaPYFywybp8ViX7btwVrP7rKEex8MMaO2CQLwh00tLfCPg7jrjLBIIsrJaBvf4UjSNWF4+r
 kL9Ryb9m4eUx17iOvUBWfpm4kS4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 619b34cb11cd6d407715ada5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 06:12:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 67B14C4360D; Mon, 22 Nov 2021 06:12:27 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B240C4338F;
 Mon, 22 Nov 2021 06:12:27 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 22 Nov 2021 11:42:27 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
In-Reply-To: <1724585.GBsqGgcNsD@sven-l14>
References: <1637504521-30997-1-git-send-email-akolli@codeaurora.org>
 <1637504521-30997-2-git-send-email-akolli@codeaurora.org>
 <1724585.GBsqGgcNsD@sven-l14>
Message-ID: <a6f4fd77b1f8729368fee13a435fe652@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_221229_989029_2F323382 
X-CRM114-Status: GOOD (  13.22  )
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

On 2021-11-21 20:15, Sven Eckelmann wrote:
> On Sunday, 21 November 2021 15:22:01 CET Anilkumar Kolli wrote:
> [...]
>> +static int ath11k_mhi_read_addr_from_dt(struct mhi_controller 
>> *mhi_ctrl)
>> +{
>> +	struct device_node *np;
>> +	dma_addr_t start;
>> +	u32 reg[4];
>> +	int ret;
>> +
>> +	np = of_find_node_by_type(NULL, "memory");
>> +	if (!np)
>> +		return -ENOENT;
>> +
>> +	ret = of_property_read_u32_array(np, "reg", reg, 4);
>> +	if (ret)
>> +		return ret;
>> +
>> +	start = reg[0] + reg[1];
>> +	mhi_ctrl->iova_start = start + 0x1000000;
>> +	mhi_ctrl->iova_stop = start + reg[2] + reg[3];
>> +
>> +	return 0;
>> +}
>> +
> [...]
>> +			ret = of_property_read_u32(dev->of_node, "memory-region",
>> +						   &hremote_phandle);
>> +			if (ret) {
>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "qmi fail to get hremote phandle\n");
>> +				return ret;
>> +			}
>> +
>> +			hremote_node = of_find_node_by_phandle(hremote_phandle);
>> +			if (!hremote_node) {
>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "qmi fail to get hremote_node\n");
>> +				return ret;
>> +			}
>> +
>> +			ret = of_property_read_u32_array(hremote_node, "reg", reg, 4);
>> +			if (ret) {
>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "qmi fail to get reg from hremote\n");
>> +				return ret;
>> +			}
>> +
>> +			start = reg[0] + reg[1];
>> +			size = reg[2] + reg[3];
> 
> See my messages for v2 [1] and v3 [2]
> 
> 
Thanks for the review,

Here addresses are always within 32-bit.
so I will change the API to read only 2 integers and update start 
addresss and size.

> [1]
> https://patchwork.kernel.org/project/linux-wireless/patch/1637082058-6398-2-git-send-email-akolli@codeaurora.org/#24605391
> [2]
> https://patchwork.kernel.org/project/linux-wireless/patch/1637244892-27267-2-git-send-email-akolli@codeaurora.org/#24605417


- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
