Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424FFC433F5
	for <ath11k@archiver.kernel.org>; Thu, 26 May 2022 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORJ2Q/6mMv+B9Lg0cugCa9B7mTs5uMp5RYbFFWQpaEg=; b=S3ybBtphx3rL/r
	UHvN520/FOxnQSvAvvbHOBoiyx09T/C1Tc4wxrIwNiJ3pXqnlqyrUP9PVJpAvddS7ocUodVAUQpEL
	i3P+1B6irLHNheBlsewtZrHwM2QvJcHjwBUyTLEEczcBZRqCGUtASkHf7ZQl4X+pAiI5bCVNdF4Lw
	hAP6EnX+qMtfIf3OtsF7wa9cZBBUhDgfUJQ1nvw6HSLLQkPvrOBZsCTwFS27Sw8Yf+jxkoLEIA7vN
	TjYAXngKfBwcQvaIBaVOvuXQgrEXvDY9PO7cj7hKf1KDs239UdwYpkU8hiLWC+6m/3NftCgHh2Cft
	UEn2gfWxj/5wQtBGtITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuFgA-00FLcF-Vw; Thu, 26 May 2022 15:45:39 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuFg8-00FLax-J0
	for ath11k@lists.infradead.org; Thu, 26 May 2022 15:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653579936; x=1685115936;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CkiHfK8/LMfUY/TQgcX12rRTrkAq3XCsa8+R5XT6JNY=;
  b=Anq8r+ocfPvEbaWmrD3jQicEivFrmnWEeaeH5DkmM6J40KTr4G/kGleZ
   K3Xq+Pcg2aH5ZdRbmO1XG5akg6FNlHtY0SZzBbPVB+z+yu35BhEXxZBwu
   QNI5N7hbESK7MTU9cKwe9FS032KqvKomCgUjdMgNJwnpwHpq2TZUzJe1D
   E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 May 2022 08:45:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 08:45:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 26 May 2022 08:45:31 -0700
Received: from [10.110.93.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 26 May
 2022 08:45:30 -0700
Message-ID: <25540c69-c58c-0dc5-29b3-4914a656a06f@quicinc.com>
Date: Thu, 26 May 2022 08:45:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ath11k: mhi: fix potential memory leak in
 ath11k_mhi_register()
Content-Language: en-US
To: Jianglei Nie <niejianglei2021@163.com>, <kvalo@kernel.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220526100227.483609-1-niejianglei2021@163.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220526100227.483609-1-niejianglei2021@163.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_084536_709176_4FDD7B87 
X-CRM114-Status: GOOD (  22.98  )
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

On 5/26/2022 3:02 AM, Jianglei Nie wrote:
> mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
> errors occur, mhi_ctrl should be freed by mhi_free_controller(). But
> when ath11k_mhi_read_addr_from_dt() fails, the function returns without
> calling mhi_free_controller(), which will lead to a memory leak.
> 
> We can fix it by calling mhi_free_controller() when
> ath11k_mhi_read_addr_from_dt() fails.
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/mhi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index fc3524e83e52..3318c7c2b32b 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -376,8 +376,10 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>   
>   	if (test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
>   		ret = ath11k_mhi_read_addr_from_dt(mhi_ctrl);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			mhi_free_controller(mhi_ctrl);
>   			return ret;
> +		}
>   	} else {
>   		mhi_ctrl->iova_start = 0;
>   		mhi_ctrl->iova_stop = 0xFFFFFFFF;

This patch looks good to me. However there is an additional issue that 
IMO should be addressed in this function with a separate patch.

Just after mhi_ctrl is allocated the pointer is saved:
	ab_pci->mhi_ctrl = mhi_ctrl;

When there is an error, mhi_ctrl is freed, but ab_pci->mhi_ctrl still 
has a dangling pointer to the freed memory. This has the potential to 
result in a subsequent use-after-free or double-free error.

So IMO we should do one of two things (I haven't looked at the code in 
detail to determine which is better):

1) don't set ab_pci->mhi_ctrl = mhi_ctrl until the end of the function 
after success from mhi_register_controller(). This requires that none of 
the functions called between the current assignment point and the 
proposed assignment point dereference ab_pci->mhi_ctrl

2) set ab_pci->mhi_ctrl = NULL in all of the places where we call 
mhi_free_controller()

2a) have a central error exit label and have all of the error conditions 
goto that label where there is a central code:
	mhi_free_controller(mhi_ctrl);
	ab_pci->mhi_ctrl = NULL;
	return ret;

	

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
