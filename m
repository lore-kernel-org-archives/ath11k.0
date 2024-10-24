Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FD6D0BB4C
	for <ath11k@archiver.kernel.org>; Thu, 24 Oct 2024 01:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtXht9oqPA1wpmSDUbIPL3yeOG0mZaOguHYKNW6OE9A=; b=jPrvYiqxT37kDVdtew0S58A1TZ
	mbIFOdjVyH0CjFywAQAP1nt+QRoB3n+MfQx7UCRgNUhXbMcog/ptgMuNlh4K3D8r7A98FtT5D7RBR
	FHwMT628MvfQgZApQO28JuDqjhR3fPHRV3a8w5BZ59L5OWlocrk/GK1/H93wGKMVP+sUAkyDku47D
	y2zdZnBcNXxAz/PjVHS3JxbMoE043HERzscJB7QlRPxOAliV140ss3Dizc2ixBB3gKIYYGSuysEzT
	+55nOI/JxFXmfGSvTf3XNOnGSqM/xz9AsuAHWRobRMTSW+yiMFaIJP94opIbDHjzoG1pZeHpwJYGy
	r+Ctdnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mmc-0000000GR4Z-2oZx;
	Thu, 24 Oct 2024 01:37:02 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mgB-0000000GQIl-3XUF
	for ath11k@lists.infradead.org;
	Thu, 24 Oct 2024 01:30:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XYpJG6F8wz1yndS;
	Thu, 24 Oct 2024 09:30:22 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A6BC180019;
	Thu, 24 Oct 2024 09:30:15 +0800 (CST)
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Oct 2024 09:30:15 +0800
Subject: Re: [PATCH 1/1] ath11k: fix return value check in
 ath11k_spectral_debug_register()
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
	<ath11k@lists.infradead.org>
References: <20241023074051.309-1-thunder.leizhen@huawei.com>
 <f8e6901a-0f68-44e1-81e6-729539693fa4@quicinc.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <f4d17e48-6a25-75c5-976a-4d0c14743276@huawei.com>
Date: Thu, 24 Oct 2024 09:30:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f8e6901a-0f68-44e1-81e6-729539693fa4@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100006.china.huawei.com (7.185.36.228)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_183024_280836_BA9512E4 
X-CRM114-Status: GOOD (  17.86  )
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



On 2024/10/23 22:02, Jeff Johnson wrote:
> On 10/23/2024 12:40 AM, Zhen Lei wrote:
>> Fix the incorrect return value check for debugfs_create_file(), which
>> returns ERR_PTR(-ERROR) instead of NULL when it fails.
> 
> Based upon the commit text this change is incorrect.
> 
>  * NOTE: it's expected that most callers should _ignore_ the errors returned
>  * by this function. Other debugfs functions handle the fact that the "dentry"
>  * passed to them could be an error and they don't crash in that case.
>  * Drivers should generally work fine even if debugfs fails to init anyway.
> 
> So ath11k should not be checking the return value at all, and definitely
> should not be returning -EINVAL since the driver should still operate even if
> creating a debugfs file fails.

OK, so that members such as scan_ctl in struct ath11k_spectral can be removed.
I will update accordingly in v2.

> 
>>
>> Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/spectral.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
>> index 79e091134515b43..4c545231292142a 100644
>> --- a/drivers/net/wireless/ath/ath11k/spectral.c
>> +++ b/drivers/net/wireless/ath/ath11k/spectral.c
>> @@ -942,7 +942,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
>>  						    0600,
>>  						    ar->debug.debugfs_pdev, ar,
>>  						    &fops_scan_ctl);
>> -	if (!ar->spectral.scan_ctl) {
>> +	if (IS_ERR(ar->spectral.scan_ctl)) {
>>  		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
>>  			    ar->pdev_idx);
>>  		ret = -EINVAL;
>> @@ -953,7 +953,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
>>  						      0600,
>>  						      ar->debug.debugfs_pdev, ar,
>>  						      &fops_scan_count);
>> -	if (!ar->spectral.scan_count) {
>> +	if (IS_ERR(ar->spectral.scan_count)) {
>>  		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
>>  			    ar->pdev_idx);
>>  		ret = -EINVAL;
>> @@ -964,7 +964,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
>>  						     0600,
>>  						     ar->debug.debugfs_pdev, ar,
>>  						     &fops_scan_bins);
>> -	if (!ar->spectral.scan_bins) {
>> +	if (IS_ERR(ar->spectral.scan_bins)) {
>>  		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
>>  			    ar->pdev_idx);
>>  		ret = -EINVAL;
> 
> 
> .
> 

-- 
Regards,
  Zhen Lei

