Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9461C4345F
	for <ath11k@archiver.kernel.org>; Fri, 12 Apr 2024 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ikBphsePqsyYm+YPfd8yomsvkUJogaU4UHkXE0t+T0=; b=hdxBhbWA7pKq4EZu/PcHdWBxoQ
	eorN4c1shqekTnk44iyqCouwXWmuVVW/rN+s3PotWx7u9+btv2mNiIvan1MEOTHIjZjXaOZdCF/in
	L845tM5ql4p4pokNTF6Z6s3EIPPvYzaxpQKDxiK4WcP6t+kBJ0xHeuVhlo+qBMhtI828u6eS3YvpG
	D9KGfIIh/+wXWWEpEQ4aKNiOFV/Ib1cGGoHVjVxvEDRCFPbAUgnrRk/4MTP1L+kL17+2aE1ywDRPU
	yRtD0wd7ZW44RWBa7vC5PHika1zGyC6WTcO5fFEcbUREHMDFdcxac4mWnZIkpM8cvBfPqQeJSbR8T
	Yvgo376A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvMwj-000000016Sm-0szi;
	Fri, 12 Apr 2024 19:52:25 +0000
Received: from mxex2.tik.uni-stuttgart.de ([129.69.192.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvMwf-000000016N9-1Mpo
	for ath11k@lists.infradead.org;
	Fri, 12 Apr 2024 19:52:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by mxex2.tik.uni-stuttgart.de (Postfix) with ESMTP id CFCA660B43;
	Fri, 12 Apr 2024 21:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uni-stuttgart.de;
	 h=content-transfer-encoding:content-type:content-type
	:in-reply-to:organization:from:from:content-language:references
	:subject:subject:user-agent:mime-version:date:date:message-id;
	 s=dkim; i=@isd.uni-stuttgart.de; t=1712951522; x=1714690323;
	 bh=ObWGWVtdg8U0NPbe/EAvSL2dL0N1qhqx+T4lt2FGPoo=; b=bglzD7amfmfJ
	kMS2GaVF0TWKN1LuhlbIIguj1W3FyyWEpxF1gHVyoj1aT5mMCGafjtUMk3eu/KMW
	VaW8shkw+IkpLmY1Z/hzGPDMX+lL/T1+rWcwp4PDz46j/5hqLiP4McOOOJP2uV03
	N4cbnbv008i0dIfgyN3pDMBLUpAEnBJFAN1YN4jjiFp4FUMzfx4wiXjG0fO2ma91
	ZDQUDIiTq8nJfUNi0sXFamJqPQ8yiJ/Goj955aYNbcbd4ua2RJIRftnR9wsdrS5G
	6XT97+7h1jzVYmAmASVwwy+l05rXBT6U+OtOsxEcxW9pLd5gByYsTNYI0/5VoS5a
	T8Rd5sufrw==
X-Virus-Scanned: USTUTT mailrelay AV services at mxex2.tik.uni-stuttgart.de
Received: from mxex2.tik.uni-stuttgart.de ([127.0.0.1])
 by localhost (mxex2.tik.uni-stuttgart.de [127.0.0.1]) (amavis, port 10031)
 with ESMTP id hMBUxXXMAYCz; Fri, 12 Apr 2024 21:52:02 +0200 (CEST)
Received: from authenticated client
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxex2.tik.uni-stuttgart.de (Postfix) with ESMTPSA
Message-ID: <4a1e0cb6-c319-4eb1-9bd1-5ff13eabfe1b@isd.uni-stuttgart.de>
Date: Fri, 12 Apr 2024 21:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath11k: support DT ieee80211-freq-limit
 property to limit channels
To: Robert Marko <robimarko@gmail.com>, kvalo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, jjohnson@kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240412162510.29483-1-robimarko@gmail.com>
 <20240412162510.29483-2-robimarko@gmail.com>
Content-Language: de-DE, en-US
From: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>
Organization: Universitaet Stuttgart - ISD
In-Reply-To: <20240412162510.29483-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_125222_140435_00AD932B 
X-CRM114-Status: GOOD (  11.38  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 4/12/24 6:24 PM, Robert Marko wrote:
> The common DT property can be used to limit the available channels
> but ath11k has to manually call wiphy_read_of_freq_limits().
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

I've seen this before.

https://patchwork.kernel.org/project/linux-wireless/patch/ed266944c721de8dbf0fe35f387a3a71b2c84037.1686486468.git.chunkeey@gmail.com/

(dt-binding too. it has/had an ack)
https://patchwork.kernel.org/project/linux-wireless/patch/fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com/

sooo.... this is awkward.

> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index c32be587000d..59bde128d351 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -10124,6 +10124,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
>   	if (ret)
>   		goto err;
>   
> +	wiphy_read_of_freq_limits(ar->hw->wiphy);
>   	ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
>   	ath11k_mac_setup_he_cap(ar, cap);
>   


