Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D92C433F5
	for <ath11k@archiver.kernel.org>; Fri, 17 Dec 2021 11:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulaOzLOojrtEPmclMB0VXwE3dVb+xVOh5EHpMZQdwaM=; b=OIyWq7kuIHmI8VI92cedzlM0oV
	Q1sT0Wrw16SIGIxmSD1Fj7crLa1QvPC64afNbkRHc9GXMFVWxp32tjSna4b05o69b4ZrC1ExcpL/o
	manlNJg26M/fmzy3zdRLP+o8F8mYrWnsddt9uJ9KCF0uyE2cNKwePUSMRUuyxmw+t8wMlr97ZPHeE
	C5QMW/WzGw8wotz0zxsIF1ANs5edg32Mz9zE04Nm666BeJAEkd0LlM0aXYXkAnN2lcqYImJNrLkV/
	oq/rF52x7/XGiAipRPKspWrlVnQAM6rcW58FFmbdSB/pwIYgFwTjG7SABYejeWvulJmP02XrWVeCf
	/pIEs2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myB2j-009fDR-N4; Fri, 17 Dec 2021 11:04:53 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myB2f-009fBG-AO
 for ath11k@lists.infradead.org; Fri, 17 Dec 2021 11:04:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1639739088; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1X1RPSgFMfDf28jokkTlcHlWORqGPr/b3cM9BLsPbrU=;
 b=LLl3ZS/HQtfqHtRBuawm0srFduU8L6W0VR8jf3a+AEsNJIndfyFr6WnXu+OZS5Zq4JWLNOb9
 DWAbL0/dXQVSmHeeYarE1okU6p/r/1zItqo91Y4Z2aQzQRAisezCnCc11lmRj12WKhykuP13
 yinNNo6DTRZbiF55pn15kEKsJS4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61bc6ecf3553c354bee5d27a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Dec 2021 11:04:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9457FC43616; Fri, 17 Dec 2021 11:04:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DD7BCC4338F;
 Fri, 17 Dec 2021 11:04:45 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 17 Dec 2021 19:04:45 +0800
From: Carl Huang <cjhuang@codeaurora.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 quic_cjhuang@quicinc.com
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
In-Reply-To: <87lf0tydad.fsf@codeaurora.org>
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-7-cjhuang@codeaurora.org>
 <87lf0tydad.fsf@codeaurora.org>
Message-ID: <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org>
X-Sender: cjhuang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_030449_502849_35047262 
X-CRM114-Status: GOOD (  12.65  )
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

On 2021-12-10 00:05, Kalle Valo wrote:
> Carl Huang <cjhuang@codeaurora.org> writes:
> 
>> Host sets GTK related info to firmware before WoW is enabled, and
>> gets rekey replay_count and then disables GTK rekey when WoW quits.
>> 
>> Tested-on: QCA6390 hw2.0 PCI 
>> WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>> 
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath11k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
>> @@ -5850,6 +5850,41 @@ struct wmi_set_arp_ns_offload_cmd {
>>  	 */
>>  } __packed;
>> 
>> +#define GTK_OFFLOAD_OPCODE_MASK             0xFF000000
>> +#define GTK_OFFLOAD_ENABLE_OPCODE           0x01000000
>> +#define GTK_OFFLOAD_DISABLE_OPCODE          0x02000000
>> +#define GTK_OFFLOAD_REQUEST_STATUS_OPCODE   0x04000000
>> +
>> +#define GTK_OFFLOAD_KEK_BYTES       16
>> +#define GTK_OFFLOAD_KCK_BYTES       16
>> +#define GTK_REPLAY_COUNTER_BYTES    8
>> +#define WMI_MAX_KEY_LEN             32
>> +#define IGTK_PN_SIZE                6
>> +
>> +struct wmi_gtk_offload_status_event {
>> +	u32 vdev_id;
>> +	u32 flags;
>> +	u32 refresh_cnt;
>> +	u8 replay_counter[GTK_REPLAY_COUNTER_BYTES];
>> +	u8 igtk_key_index;
>> +	u8 igtk_key_length;
>> +	u8 igtk_key_rsc[IGTK_PN_SIZE];
>> +	u8 igtk_key[WMI_MAX_KEY_LEN];
>> +	u8 gtk_key_index;
>> +	u8 gtk_key_length;
>> +	u8 gtk_key_rsc[GTK_REPLAY_COUNTER_BYTES];
>> +	u8 gtk_key[WMI_MAX_KEY_LEN];
>> +} __packed;
> 
> [...]
> 
>> +	arvif->rekey_data.replay_ctr = le64_to_cpup((__le64 
>> *)ev->replay_counter);
>> +	/* supplicant expects big-endian replay counter */
>> +	replay_ctr = cpu_to_be64(le64_to_cpup((__le64 
>> *)ev->replay_counter));
>> +
>> +	ieee80211_gtk_rekey_notify(arvif->vif, arvif->bssid,
>> +				   (void *)&replay_ctr, GFP_KERNEL);
> 
> Please avoid casting as much possible, and also otherwise this just
> looks weird. Isn't ath11k WMI commands and events supposed to be in CPU
> endian and the firmware automatically translates them if CPU is little
> or big endian? So why do you cast ev->replay_counter to __le64 then?
> Wouldn't that break on big endian?
> 
Both cpu and firmware are supposed to be little endian in ath11k.
However, supplicant expects the replay_ctr in big endian format, that's
why an endian conversion is done here.

> --
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
