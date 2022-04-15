Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D550C433EF
	for <ath11k@archiver.kernel.org>; Fri, 15 Apr 2022 23:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iE57aO1b/jFT9T8yRGtGBvgKW0jh063DM6Y1xQ7Ra4Q=; b=OtTzfnaBcJzlr/
	NoXkPwl06M4qwvDAKmxR0/NospSW4nIR3MPDXth2MjnLNQqVv8fw9Mqc1QZ/6MmsiaLNA0HHx8IQA
	FRC7AMm8ITfoTSNJlLRWVYt/FBj0+Q/4FlJTVww38aEbR+2I+Bj/ddEOx8BCyA/OEyWbm3PB3c53w
	w6mcSZMxJzFBiM+kfM3LY+M6ODlKDOnQtUpop85P5mx0VU3J5nENa/1vzFYR2uFrv4VAdr+snebHx
	JMviVMX4e9oAtoFXbPTtA2MVDmaAfDUUNAfNzjgdOjtSEdQmV9Sj5EjyUkDY8HmGRiU0dibxeK2oL
	J0z4/OJhKn3foJEVDi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfUy1-00Bdqs-V8; Fri, 15 Apr 2022 23:03:05 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfUxz-00Bdp9-1G
 for ath11k@lists.infradead.org; Fri, 15 Apr 2022 23:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650063783; x=1681599783;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SXwXBdQqg3w0Na7l4QbphKGJc3ZMWJFk1TEWGHJVyNM=;
 b=jfHUgbzPrskiaTQU20bb7zrTjEw9ox93ryU+4x8w2v43fPa5YJdLdBQm
 t1dlvyG7HTFYVopSDTHWOW+foLSh49nCSnVHHk+dFsPCt3zXphc/XBsF8
 fPvCz599t5L+4UySkVc5fNF3gUPgH8e8yh4UgSyzl38TEPaXiUfWQ+/XQ g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Apr 2022 16:02:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 16:02:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Apr 2022 16:02:59 -0700
Received: from [10.110.103.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Apr
 2022 16:02:58 -0700
Message-ID: <ca2944bd-e80e-e0ff-0804-c8439f54b28a@quicinc.com>
Date: Fri, 15 Apr 2022 16:02:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] ath11k: simplify if-if to if-else
Content-Language: en-US
To: Yihao Han <hanyihao@vivo.com>, Kalle Valo <kvalo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <kernel@vivo.com>
References: <20220415125853.86418-1-hanyihao@vivo.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220415125853.86418-1-hanyihao@vivo.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_160303_171905_DA5A1D9B 
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

On 4/15/2022 5:58 AM, Yihao Han wrote:
> Replace `if (!ab->is_reset)` with `else` for simplification
> according to the kernel coding style:
> 
> "Do not unnecessarily use braces where a single statement will do."
> 
> ...
> 
> "This does not apply if only one branch of a conditional statement is
> a single statement; in the latter case use braces in both branches"
> 
> Please refer to:
> https://www.kernel.org/doc/html/v5.17-rc8/process/coding-style.html

why are you referring to braces when your patch has nothing to do with 
braces?

changing if (foo) X;if (!foo) Y; to if (foo) X else Y; is not a design 
pattern referenced in the coding style

> 
> Suggested-by: Benjamin Poirier <benjamin.poirier@gmail.com>
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
> v2:edit commit message
> ---
>   drivers/net/wireless/ath/ath11k/core.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index cbac1919867f..80009482165a 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1532,8 +1532,7 @@ static void ath11k_core_restart(struct work_struct *work)
>   
>   	if (ab->is_reset)
>   		complete_all(&ab->reconfigure_complete);
> -
> -	if (!ab->is_reset)
> +	else
>   		ath11k_core_post_reconfigure_recovery(ab);
>   }
>   


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
