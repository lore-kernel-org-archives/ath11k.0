Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD09C83F27
	for <ath11k@archiver.kernel.org>; Tue, 22 Jul 2025 11:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFb9As+tGUSsfLRTQC2OOODRjXdSTQs59XrJQlNc9GI=; b=4b6zf+cjKFGkP6hQ9oMubhDIZD
	u0nHOyu7EkSKNCVMtTp2+g/+UR4Ri6Uae26oSKs6UKD4S8YyUyK9OPCVAkefEy67IqiQPrHB/Ji3l
	EKUowvdhqrMyWLGy/pcpWEbYBTW8WbI4mRgryvkQqNniaCRL8vgdj0MkDoRkyBOn3vLcX+OBjgeqJ
	y/Bm2KV58tYrZfsHfugBRPDHz0VY4QTV0XTSRHZ4C8bIKJuHj4nzhtUyx3DNJZmIVh4jtMXNeMMq/
	wlG7og7ThJETFGZlldfYqWbwwH0g7aBg3ZDv6uwefabah/ADmAsgM5lEZRzZa1WWj56fr5HRtDL1K
	QkMJCFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB6v-00000002H1H-2sp0;
	Tue, 22 Jul 2025 11:24:41 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB6t-00000002H0s-34x4
	for ath11k@lists.infradead.org;
	Tue, 22 Jul 2025 11:24:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753183444; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AM5rf5qTRMzd7B0mcgd3eoqRkznkHh298xcYgOjrM9NXYTQwKyTRR+ypqZB2mP/mAn6R6CwQZIw/OKidgtsUjqVQKU6AGiWv2qPL4Z5O6BkEPlmyoj9bMYLXPU0uMxow306OomcNP+6zp1U/eOQvUELhT6rtT2cR6CaT0DysfUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753183444; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lFb9As+tGUSsfLRTQC2OOODRjXdSTQs59XrJQlNc9GI=; 
	b=MRgsn2aL9kEwvhAYF5BoZauUK27DjiIVrD2uRBZi2N0d7x/UqpurXBIPtyKNB36seUK9gSqC3rjgpp/ba21zZWTvm3TYW4sUmcLfs616dC6wV+1mmyg+AS4QQjkcziYtcGDXhYGz7uA1t9CwZS0xAh88dH9/amlEvlaQyUhCWJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753183444;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lFb9As+tGUSsfLRTQC2OOODRjXdSTQs59XrJQlNc9GI=;
	b=NpseaKQXDA7i4X7EY+DW3lqKjkD2veGr+YrHY4zaJf4Slf7vbh3PlL8b8oU/G0W+
	wr7zyWzLsvMPfU45Ydv5D1UuxOfsutLhFXMeg794F7IYW9LnlDDc7vIQtUtV41ZUBYO
	ylyM+8rlfnW3UqvOtP0+b4Uuyrr+b1L4c7OdbRDU=
Received: by mx.zohomail.com with SMTPS id 1753183441522359.46150902403406;
	Tue, 22 Jul 2025 04:24:01 -0700 (PDT)
Message-ID: <ae7a08cb-af73-4a27-aad4-c852be5f77aa@collabora.com>
Date: Tue, 22 Jul 2025 16:23:55 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, kernel@collabora.com, stable@vger.kernel.org,
 Muna Sinada <quic_msinada@quicinc.com>,
 Anilkumar Kolli <quic_akolli@quicinc.com>, Miles Hu <milehu@codeaurora.org>,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
 Jeff Johnson <jjohnson@kernel.org>, kbuild test robot <lkp@intel.com>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v3] wifi: ath11k: HAL SRNG: don't deinitialize and
 re-initialize again
To: Kalle Valo <kvalo@kernel.org>
References: <20250722053121.1145001-1-usama.anjum@collabora.com>
 <1598d25d-e254-410e-ac5c-66d5450fd686@oss.qualcomm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <1598d25d-e254-410e-ac5c-66d5450fd686@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042439_845643_E1F9350D 
X-CRM114-Status: GOOD (  15.42  )
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

Hi Kalle,

On 7/22/25 2:47 PM, Baochen Qiang wrote:
> 
> 
> On 7/22/2025 1:31 PM, Muhammad Usama Anjum wrote:
>> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
>> deallocated and there is high possibility that we'll not be able to get
>> the same memory allocated from dma when there is high memory pressure.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Cc: stable@vger.kernel.org
>> Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes since v1:
>> - Cc stable and fix tested on tag
>> - Clear essential fields as they may have stale data
>>
>> Changes since v2:
>> - Add comment and reviewed by tag
>> ---
>>  drivers/net/wireless/ath/ath11k/core.c |  6 +-----
>>  drivers/net/wireless/ath/ath11k/hal.c  | 16 ++++++++++++++++
>>  drivers/net/wireless/ath/ath11k/hal.h  |  1 +
>>  3 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>> index 4488e4cdc5e9e..34b27711ed00f 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -2213,14 +2213,10 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>  	mutex_unlock(&ab->core_lock);
>>  
>>  	ath11k_dp_free(ab);
>> -	ath11k_hal_srng_deinit(ab);
>> +	ath11k_hal_srng_clear(ab);
>>  
>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>  
>> -	ret = ath11k_hal_srng_init(ab);
>> -	if (ret)
>> -		return ret;
>> -
>>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>>  
>>  	ret = ath11k_core_qmi_firmware_ready(ab);
>> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
>> index b32de563d453a..e8ebf963f195c 100644
>> --- a/drivers/net/wireless/ath/ath11k/hal.c
>> +++ b/drivers/net/wireless/ath/ath11k/hal.c
>> @@ -1359,6 +1359,22 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>>  }
>>  EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>>  
>> +void ath11k_hal_srng_clear(struct ath11k_base *ab)
>> +{
>> +	/* No need to memset rdp and wrp memory since each individual
>> +	 * segment would get cleared ath11k_hal_srng_src_hw_init() and
> 
> nit: s/cleared /cleared in/
Please can you make this change while applying the patch?

> 
>> +	 * ath11k_hal_srng_dst_hw_init().
>> +	 */
>> +	memset(ab->hal.srng_list, 0,
>> +	       sizeof(ab->hal.srng_list));
>> +	memset(ab->hal.shadow_reg_addr, 0,
>> +	       sizeof(ab->hal.shadow_reg_addr));
>> +	ab->hal.avail_blk_resource = 0;
>> +	ab->hal.current_blk_index = 0;
>> +	ab->hal.num_shadow_reg_configured = 0;
>> +}
>> +EXPORT_SYMBOL(ath11k_hal_srng_clear);
>> +
>>  void ath11k_hal_dump_srng_stats(struct ath11k_base *ab)
>>  {
>>  	struct hal_srng *srng;
>> diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
>> index 601542410c752..839095af9267e 100644
>> --- a/drivers/net/wireless/ath/ath11k/hal.h
>> +++ b/drivers/net/wireless/ath/ath11k/hal.h
>> @@ -965,6 +965,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
>>  			  struct hal_srng_params *params);
>>  int ath11k_hal_srng_init(struct ath11k_base *ath11k);
>>  void ath11k_hal_srng_deinit(struct ath11k_base *ath11k);
>> +void ath11k_hal_srng_clear(struct ath11k_base *ab);
>>  void ath11k_hal_dump_srng_stats(struct ath11k_base *ab);
>>  void ath11k_hal_srng_get_shadow_config(struct ath11k_base *ab,
>>  				       u32 **cfg, u32 *len);
> 


