Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999FAC433F5
	for <ath11k@archiver.kernel.org>; Tue,  3 May 2022 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2NS7sh8BFNGoBeFSyKvRywDgAbHhTuWi2C3E6ezabM=; b=BAGa0XDDQCXqG1
	df2GQCX0EftOObQrBJsIDjUvQXxyuMV21EFd2mx0zSNKoBFYR1vmfLq87DZlkDJQh0JRSUnWhgsgR
	cPnJOhsJFRFlwcBYWZFYZbiBGaNEi135f1XWPd7vIgXZL8BNKf39/PKQuUrKzNquOa0TbZB5tl7qb
	n6rxwJtbDsN91J70o0E7K+GxEWQEjPOKeBXHenGvxlNSK7rR145EPkMD0beaXZEy6MN2uxWhgt8oi
	etjCNOiqHOaNpblMqmg0NrI1FU950YR9U2bj6bKOauqml0zI8aDXp/h2q+2qpI1TufJc+lkVc16JU
	Ak6IHm64uIjm4vuaTkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nluMC-006Smk-UY; Tue, 03 May 2022 15:22:32 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nluMA-006Slh-Oq
 for ath11k@lists.infradead.org; Tue, 03 May 2022 15:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651591350; x=1683127350;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WxAD/mFvo/FjQ3sFtTHpbR+m/rdDXk3zprDa+9cn+Dc=;
 b=HvKVsGm9rG0/rlrDJOKrebYdTLaDsemDrwCW70MiYxRv41Zlxtza5kyV
 eE39WXNKs8hxdXPt8UxF4ob1fu2nSEPcgL0WAP1/5Y/xAfU2NjrtrUFeU
 2HHRAnLml0BSspnv5TBagzMOkj+9G6cHJf9Smd6bN7lXxnTmJipY9UoAn o=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 May 2022 08:22:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 08:22:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 08:22:29 -0700
Received: from [10.110.89.220] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 08:22:29 -0700
Message-ID: <2bb799aa-0a43-1433-70b2-76b14beee0dd@quicinc.com>
Date: Tue, 3 May 2022 08:22:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] ath10k: mac: fix too long lines
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220503060415.24499-1-kvalo@kernel.org>
 <20220503060415.24499-2-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220503060415.24499-2-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_082230_886936_E82D6397 
X-CRM114-Status: UNSURE (   6.39  )
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

On 5/2/2022 11:04 PM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> checkpatch warns:
> 
> drivers/net/wireless/ath/ath10k/mac.c:2696: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/mac.c:6942: line length of 94 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/mac.c:6948: line length of 91 exceeds 90 columns
> 
> These were introduced by commit 046d2e7c50e3 ("mac80211: prepare sta handling
> for MLO support").
> 
> Compile tested only.
> 

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath10k/mac.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
