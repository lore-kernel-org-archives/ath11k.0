Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80871C433F5
	for <ath11k@archiver.kernel.org>; Tue, 31 May 2022 21:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKuxnF3hRbL6W8ocHMRupZaVvspEUFb9KXR6Aow3Y1E=; b=DYfZgoNp5bJtKd
	qiLnbTerj2Ef3m13g6YOJTBeKnTiABu4jeu4s4Kwjss/di5gcw8ICf9hWeY7amEYtf5TI95O7wEQc
	SuBvdSVPmaI7C0yYfTz732zgrNU/YCMSuaaXbNBuQJt7mOYKfcFeIm0WQExdqJeLo6b1BwN3JUmLn
	T5OAZiY0T9IrhlaKXI0+UMYc1kJ4mVWKYkkIW6AaFA0pTACvOAckMdaJ5Wd03/qWwh8J2Ztz1BrbK
	Yi/48QolK2UfoHvAdxxeKUPV51Z/4u4U3D63P2Fc3f8zCXdzWceCzgBSH86U601A4CAB/XZQN2CC9
	y9pe4pKEA9tzobxqIMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9m4-00ClXo-Id; Tue, 31 May 2022 21:51:36 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9m0-00ClVX-S0
	for ath11k@lists.infradead.org; Tue, 31 May 2022 21:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654033892; x=1685569892;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ADSONrRrcYWIBItW/IDoJda+KltF0U2bPCMO56q/27Q=;
  b=EJKBGBo4fLWa8LdSlKqQ7B9R8RXW01pGL+vTaHX4Yte3Ig2JppSCZnlz
   zy1JScq5klwPcup/jcEpD+fm0S7DspORfVlDZLl9q/n9HQXUcCtBJuMjn
   fT3zDhq2Q3YOHvYYd5D/ACkmHtGPS3tTx1Q3Uw0pXizqEABCuPvA/psRI
   A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 31 May 2022 14:51:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 14:51:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 14:51:28 -0700
Received: from [10.110.67.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 31 May
 2022 14:51:26 -0700
Message-ID: <bbc9d5c1-6b05-4e8a-3141-ffdb23e586be@quicinc.com>
Date: Tue, 31 May 2022 14:51:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] ath11k: mhi: fix potential memory leak in
 ath11k_mhi_register()
Content-Language: en-US
To: Jianglei Nie <niejianglei2021@163.com>, <kvalo@kernel.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220530080610.143925-1-niejianglei2021@163.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220530080610.143925-1-niejianglei2021@163.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145132_986085_6E6D7B3F 
X-CRM114-Status: GOOD (  18.08  )
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

On 5/30/2022 1:06 AM, Jianglei Nie wrote:
> mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
> errors occur, mhi_ctrl should be freed by mhi_free_controller() and set
> ab_pci->mhi_ctrl = NULL because ab_pci->mhi_ctrl has a dangling pointer
> to the freed memory. But when ath11k_mhi_read_addr_from_dt() fails, the
> function returns without calling mhi_free_controller(), which will lead
> to a memory leak.
> 
> We can fix it by calling mhi_free_controller() when
> ath11k_mhi_read_addr_from_dt() fails and set ab_pci->mhi_ctrl = NULL in
> all of the places where we call mhi_free_controller().
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
> ---
>   drivers/net/wireless/ath/ath11k/mhi.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index fc3524e83e52..fc1bbf91c58e 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -367,8 +367,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>   	ret = ath11k_mhi_get_msi(ab_pci);
>   	if (ret) {
>   		ath11k_err(ab, "failed to get msi for mhi\n");
> -		mhi_free_controller(mhi_ctrl);
> -		return ret;
> +		goto free_controller;
>   	}
>   
>   	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
> @@ -377,7 +376,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>   	if (test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
>   		ret = ath11k_mhi_read_addr_from_dt(mhi_ctrl);
>   		if (ret < 0)
> -			return ret;
> +			goto free_controller;
>   	} else {
>   		mhi_ctrl->iova_start = 0;
>   		mhi_ctrl->iova_stop = 0xFFFFFFFF;
> @@ -405,18 +404,22 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>   	default:
>   		ath11k_err(ab, "failed assign mhi_config for unknown hw rev %d\n",
>   			   ab->hw_rev);
> -		mhi_free_controller(mhi_ctrl);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto free_controller;
>   	}
>   
>   	ret = mhi_register_controller(mhi_ctrl, ath11k_mhi_config);
>   	if (ret) {
>   		ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
> -		mhi_free_controller(mhi_ctrl);
> -		return ret;
> +		goto free_controller;
>   	}
>   
>   	return 0;
> +
> +free_controller:
> +	mhi_free_controller(mhi_ctrl);
> +	ab_pci->mhi_ctrl = NULL;
> +	return ret;
>   }
>   
>   void ath11k_mhi_unregister(struct ath11k_pci *ab_pci)

LGTM, thanks

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
