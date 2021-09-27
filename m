Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB5CC433F5
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 04:32:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD7160E73
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 04:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBD7160E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Prsa8nS1lAX+s13AKcK6KvrMdYP04a6zKjPX5ywlZE0=; b=D1orKivPJYHE6XEX6CEJkr8T1G
	z4VwqRcOD7NDywqfol9qgVDQ6BvN9jJOZD2wxtBh9XEsf1gsFZMPsTX0wGSwoY7bNS4IGzwMJLifi
	6LAGL7eBD37DLrFJFUVOnTClcBxCz80EhoWZhamTt+EoBmMy6WGsG8HD5I4KuSRyDYe5/gySp6PCJ
	l5WQsylSlsyvWjQwsPqLi5VTkVKIlSX0+JfPsmqv359WsvvyCXRDJSaWPlUoDnIL4vCBTmfzzgPMj
	H5xc0f/U7wPhnNvvGbr/kMpuvIQUCo+9GEbeWoXBSad0WJ8/kF6XovKe8l4Aj3PWX2C2eMpYgYEY5
	hrwDjRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUiJ8-001Y6m-Lt; Mon, 27 Sep 2021 04:32:02 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUiJ5-001Y6M-8T
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 04:32:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632717119; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JUvQW6LMLvc2XLMOLos8ZnrwmTTpDeLp9y6A5dmUXok=;
 b=RapQF5XaSz9P0yfpLku64AOvyHACJ2uphGQZ/iE4Zs3Le7wa9AN4Cca+pdD3RzCBg1M3r2wN
 wvL41s9vi2YQB7Q6TnhLsl4hwMtbDunCqv48b9tEbWvtf04lDW3V71QgFHgxp5VEe9Axcbph
 Db4TMlil/SCfWGK4FGeqbaWSJPc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6151493d3cc3a01f2641fcb5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Sep 2021 04:31:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 368E8C43460; Mon, 27 Sep 2021 04:31:57 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C9D7AC4338F;
 Mon, 27 Sep 2021 04:31:56 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 27 Sep 2021 10:01:56 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/3] ath11k: add htt cmd to enable full monitor mode
In-Reply-To: <87ilyqrsgt.fsf@codeaurora.org>
References: <20210721171905.61838-1-jouni@codeaurora.org>
 <20210721171905.61838-2-jouni@codeaurora.org>
 <87ilyqrsgt.fsf@codeaurora.org>
Message-ID: <f488dec59dbc92e21e231343f798a29c@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_213200_072476_E4E0F47A 
X-CRM114-Status: GOOD (  17.50  )
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

On 2021-09-24 19:22, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Anilkumar Kolli <akolli@codeaurora.org>
>> 
>> Add a new hw_param full_monitor_mode to enable full monitor support 
>> for
>> QCN9074. HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to the
>> firmware to enable the full monitor mode.
>> 
>> Tested-on: QCN9074 hw1.0 PCI 
>> WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath11k/core.c  |  4 ++
>>  drivers/net/wireless/ath/ath11k/dp.h    | 74 
>> +++++++++++++++++++++++++
>>  drivers/net/wireless/ath/ath11k/dp_tx.c | 48 ++++++++++++++++
>>  drivers/net/wireless/ath/ath11k/dp_tx.h |  2 +
>>  drivers/net/wireless/ath/ath11k/hw.h    |  1 +
>>  5 files changed, 129 insertions(+)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c 
>> b/drivers/net/wireless/ath/ath11k/core.c
>> index 969bf1a590d9..3179495cb3c9 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -65,6 +65,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  					BIT(NL80211_IFTYPE_AP) |
>>  					BIT(NL80211_IFTYPE_MESH_POINT),
>>  		.supports_monitor = true,
>> +		.full_monitor_mode = false,
>>  		.supports_shadow_regs = false,
>>  		.idle_ps = false,
>>  		.cold_boot_calib = true,
>> @@ -106,6 +107,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  					BIT(NL80211_IFTYPE_AP) |
>>  					BIT(NL80211_IFTYPE_MESH_POINT),
>>  		.supports_monitor = true,
>> +		.full_monitor_mode = false,
>>  		.supports_shadow_regs = false,
>>  		.idle_ps = false,
>>  		.cold_boot_calib = true,
>> @@ -146,6 +148,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>>  					BIT(NL80211_IFTYPE_AP),
>>  		.supports_monitor = false,
>> +		.full_monitor_mode = false,
>>  		.supports_shadow_regs = true,
>>  		.idle_ps = true,
>>  		.cold_boot_calib = false,
>> @@ -184,6 +187,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  					BIT(NL80211_IFTYPE_AP) |
>>  					BIT(NL80211_IFTYPE_MESH_POINT),
>>  		.supports_monitor = true,
>> +		.full_monitor_mode = true,
>>  		.supports_shadow_regs = false,
>>  		.idle_ps = false,
>>  		.cold_boot_calib = false,
> 
> wcn6855 was not updated, I added that.
> 

Thanks. 'full_monitor_mode = false' to be added.

>> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
>> @@ -1034,6 +1034,15 @@ int 
>> ath11k_dp_tx_htt_monitor_mode_ring_config(struct ath11k *ar, bool 
>> reset)
>>  	struct htt_rx_ring_tlv_filter tlv_filter = {0};
>>  	int ret = 0, ring_id = 0, i;
>> 
>> +	if (ab->hw_params.full_monitor_mode) {
>> +		ret = ath11k_dp_tx_htt_rx_full_mon_setup(ab,
>> +							 dp->mac_id, !reset);
>> +		if (ret < 0) {
>> +			ath11k_err(ab, "failed to setup full monitor %d\n", ret);
> 
> I changed this to:
> 
> 		if (ret) {
> 			ath11k_warn(ab, "failed to setup full monitor: %d\n", ret);
> 			return ret;
> 		}

Thanks.
-- 
- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
