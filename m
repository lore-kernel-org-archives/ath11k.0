Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE27C433F5
	for <ath11k@archiver.kernel.org>; Fri, 15 Apr 2022 06:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xywsfdULLKylZqEjVKRTf5pTAydkyLbUhjnA4X5iufo=; b=UhxZ+09dowdRf/
	l4ExUB603fgCFOk5cAR/RSiHHs5F+kliHsQ27fOXOKYtx3QNbK0L0ksEHES/JRNobThPCxtkYJu11
	iz/EWCEnBOZzcf1++JuOFspNpgrMlIuEeXQnHeeq1dKVN0gLAVvefE0Cy0JA9+N8D0L1Q6cJFmcat
	598DLVMvG9bQY5HqcfV4Lo2QdB961/pbwURfDyZkbHsUel8QQanruKQvWszbOrE9prjaKxtn/k3TF
	RBry1NiZWvfm0tHr2wS/lZqXWzVZMlrc0vTt9PKtvm7IoXKJUY9ZzZjYYmYKpswQL6yQpAv2BbJBL
	8947xsYZceN/R+z58Q3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFWM-0091Q0-VN; Fri, 15 Apr 2022 06:33:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFGP-008vg7-5G
 for ath11k@lists.infradead.org; Fri, 15 Apr 2022 06:17:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id t12so6435283pll.7
 for <ath11k@lists.infradead.org>; Thu, 14 Apr 2022 23:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jatt+V+nXfhqQM9//07B65SFV6bMNiaWeVlnWsPUEY8=;
 b=LeUSar5B5rvRe12ca2HvwfsVrBkcS7B5f3PFuXsUAtqfFCTENTy3DNmOjAu0dXQ6ce
 VEvEHCb49p8sHqRbzPcJW+sZFgJ3RwMDydc+m/12fEmiOS4OgNZXWfMGxqQ6zzAyxAlS
 o7AjjKHlHiwFbDNe+H3dQmtZLC7gcjsD/t9UGTICwxqL6JbR2vVugF6SJ7QZMBg5PpwH
 HDaXu/rxmXVGxnh2e60yCk/nvpy5ANAnD+UJtek/THOl1cMa89SCw7BmSJG6R9giD0tP
 BmOdvdyptPOFvmUzIbrSYCMeFmFFgLqFPTCus8q72vLxEn58i0hps40w1pC1q+9AutZl
 598A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jatt+V+nXfhqQM9//07B65SFV6bMNiaWeVlnWsPUEY8=;
 b=bMKZCS21cSwmC8hrvADJ0apiiC78wr45ZAIBV7usinBMU+D88nPjQD8CMqNoqEJpsk
 4Y8yusoNSiC5prllbgW7I/Zt5aa/MtJ0knfzkdhXbWN6Ko3rT2RPM8PiEDnNmrUIEhw5
 qk8d9zFWPB3lHZnPO4BZlxNuDSdYSVr6krYFsviG0YnRs0lkTCqmzafAbfgFV0zMQ+1q
 c67cOt6z5m7pzwfIKNADSotDbCdSn5NDdSUyiTTNl7ijsHA/He+YCv14kS1+rEOoDUIn
 RImKKljUgzpuZfRuwyi+Ou35M88PUH8rQhHBzgW/zVaSlx29vTMNQUu5DwExjgrXXM8s
 XcuQ==
X-Gm-Message-State: AOAM531GHdMLNp+YnT13+fOLVqUpwcy69Jqy6TqG7u6Hk0LxyTjypPDO
 ZWSv/W2mRp8Bs6wNmpBDtds=
X-Google-Smtp-Source: ABdhPJxXl2J8MrOMJqY9UdpMm/pHQYL5wUpT7PmiQkXC6CUQF1tguXDxp0bE3E9oeAy+7fsxAK1UUA==
X-Received: by 2002:a17:903:2cb:b0:14f:4fb6:2fb0 with SMTP id
 s11-20020a17090302cb00b0014f4fb62fb0mr49422092plk.172.1650003418858; 
 Thu, 14 Apr 2022 23:16:58 -0700 (PDT)
Received: from d3 ([2405:6580:97e0:3100:ae94:2ee7:59a:4846])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a056a001a5200b0050a43bb7ae6sm479281pfv.161.2022.04.14.23.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 23:16:58 -0700 (PDT)
Date: Fri, 15 Apr 2022 15:16:52 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Yihao Han <hanyihao@vivo.com>, Wen Gong <quic_wgong@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@vivo.com
Subject: Re: [PATCH] ath11k: simplify if-if to if-else
Message-ID: <YlkN1FsTd0Bozz0K@d3>
References: <20220414092042.78152-1-hanyihao@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414092042.78152-1-hanyihao@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_231701_281346_17C1B7B2 
X-CRM114-Status: GOOD (  20.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2022-04-14 02:20 -0700, Yihao Han wrote:
> Replace `if (!ab->is_reset)` with `else` for simplification
> and add curly brackets according to the kernel coding style:
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

Same comment about the curly brackets part of the log as for the qlcnic
patch, it doesn't match the changes.

> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index cbac1919867f..80009482165a 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1532,8 +1532,7 @@ static void ath11k_core_restart(struct work_struct *work)
>  
>  	if (ab->is_reset)
>  		complete_all(&ab->reconfigure_complete);
> -
> -	if (!ab->is_reset)
> +	else
>  		ath11k_core_post_reconfigure_recovery(ab);
>  }

It seems there is no synchronization around is_reset but is it
guaranteed that it cannot be changed by ath11k_core_reset() between the
two tests? I'm not familiar with the driver.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
