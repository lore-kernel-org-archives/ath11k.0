Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2BDC433F5
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsIq+iqBsn/7ZeJPozpDNh7jw/DuknMnQM1hYRu02U8=; b=ZHnLrQuukx5X0J
	id1ZFsMVAhz+27AzNLC5pkRHmOctqZRej6YLWvp4Qw7b4wpgXUlDgJbr8lnPtuN0OjlNeRLpqY90n
	6Ww+62O9l8xBmHDvPRXhHLHA7sDgAsF6GqDJXNy1qAMqxHn91AEzsqpQZP8M58gUrL9jqWEvEkm7/
	NvuxMDYrpae3tHg4h1Uw9eSCBw5Ly3Z+gE1/DVA523DLsn1KZtgwoJfiwlWmfCjc1FwD5K9SJJoWE
	95vffFRg1jdeHL6ayB72iogsoG270VHIfoD5Hk8GMSTN6eVBRNXOC5tu0vdq4SJSyGgXsVdrKaatU
	8SlMsitVuhrBkEAwZQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpjJs-003sdZ-Vv; Wed, 24 Nov 2021 03:51:41 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpjJp-003sdH-Sk
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 03:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637725897; x=1669261897;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9IATbaAqXDyxifJBztg8aaiCcMMHzxxiFrSoM7G6xgs=;
 b=ARxKGHzpd/YMADN9kdDPs49U7EfuOx17QvYbPo8ouBG9x39HpPIK2R9H
 Ozpa+IvvmcMrsG6oVert6XMcNcvQuXNeW2gh1dShY6q6MwPA4+cXzcvir
 6Briie4smfLUMMRgh9jrCmMAMMA237nwwy8B4Ky1Hjg9HrvJncxfMEdUk E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Nov 2021 19:51:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 19:51:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 19:51:35 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 23 Nov
 2021 19:51:33 -0800
Message-ID: <0fb4fec3-4fd0-6e92-b1d9-5bffc0958e97@quicinc.com>
Date: Wed, 24 Nov 2021 11:50:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 2/3] ath11k: Refactor update channel list function
Content-Language: en-US
To: P Praneesh <ppranees@codeaurora.org>, <ath11k@lists.infradead.org>,
 <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, Karthikeyan Periyasamy
 <periyasa@codeaurora.org>
References: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
 <1634906227-22028-3-git-send-email-ppranees@codeaurora.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <1634906227-22028-3-git-send-email-ppranees@codeaurora.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_195138_008558_47A6827B 
X-CRM114-Status: UNSURE (   5.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/22/2021 8:37 PM, P Praneesh wrote:

...

> ---
> ...
> -			ch->maxpower = channel->max_power * 2;
> -			ch->maxregpower = channel->max_reg_power * 2;
> -			ch->antennamax = channel->max_antenna_gain * 2;
> ...
>   
> +int ath11k_wmi_update_scan_chan_list(struct ath11k *ar,
> +				     struct scan_req_params *arg)
> ...
> +			ch->maxpower = channel->max_power;
> +			ch->maxregpower = channel->max_reg_power;
> +			ch->antennamax = channel->max_antenna_gain;
> +
> ...
I see it also have another patch to remove the "*2" for power.
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=9212c1b9e80a869e732769a4fe7f82d392b219be

ath11k: send proper txpower and maxregpower values to firmware.

so are you the same reason to remove "*2" ?


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
