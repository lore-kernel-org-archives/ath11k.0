Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62549C433F5
	for <ath11k@archiver.kernel.org>; Mon, 14 Mar 2022 10:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENPAaWWuSYyxgGdjnaGpL3TQPzc5fsQjjapiEKh1h+c=; b=3z1C3NNsrxsTWd
	k0JisnWOYjCbeNMu5QxsdKa0rmxJteLksAycsbgJam0Rl606Fj5sRITBtxKUfrdJwb3bKJ7CeYnRs
	sui0YhVFnEg6Wu4joTMwY6XaD8AMxfdQMbsUDYzPxMMbFsdh/AlRaV+X8S8BcNd8E2d9b9P6futhX
	Ij7J+CXHYjQy30jNAW4XdZ/tMiYQUJze+NCPwK6QdHIKeJ75IcmzHmikvoWUPh2JAcXBd8fsw+ic6
	FO9m3CvKZgn3vM/ECORzoDX6JvunCNU+VuWwW07yu/Nos+Xit+KI/liLB3hBZpGCsN+SLNk/Xyta7
	zIRvjW/EU+kMA9V58oiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTi2t-004zWN-Us; Mon, 14 Mar 2022 10:35:23 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTi2r-004zV4-8i
 for ath11k@lists.infradead.org; Mon, 14 Mar 2022 10:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647254121; x=1678790121;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cY7GWN7r9XYXXHS5uAvzO3nquuNRfXZRi/dw0vfXAeQ=;
 b=y8K5n3FUFn25p1lENoafNWPcubM2+9qu1kzjJDgFHSAqJ9voC5MqhAmP
 OkZJ1/DrI9BXXfEVfoHsbSPi30k8NkvgiLjcODukRDKClijqAuaCOgZs2
 opj3hFmQvcJ7a3y7Mu9Vek+JGuTlEYy4xfGN1WTSNyU6lEEfmghPmM1Yr Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Mar 2022 03:35:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 03:35:20 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Mar 2022 03:35:19 -0700
Received: from [10.253.10.5] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 14 Mar
 2022 03:35:18 -0700
Message-ID: <bb2a64ce-33f9-154c-faad-c5fbc70cd91c@quicinc.com>
Date: Mon, 14 Mar 2022 18:35:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/2] ath11k: add read variant from SMBIOS for download
 board data
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211220064829.17557-1-quic_wgong@quicinc.com>
 <20211220064829.17557-3-quic_wgong@quicinc.com> <87wnh2ql8n.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87wnh2ql8n.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_033521_382743_6F8FF993 
X-CRM114-Status: GOOD (  15.41  )
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

On 3/10/2022 4:12 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>> This is to read variant from SMBIOS such as read from DT, the variant
>> string will be used to one part of string which used to search board
>> data from board-2.bin.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> [...]
>
>> +static void ath11k_core_check_bdfext(const struct dmi_header *hdr, void *data)
>> +{
>> +	struct ath11k_base *ab = data;
>> +	const char *bdf_ext;
>> +	const char *magic = ATH11K_SMBIOS_BDF_EXT_MAGIC;
>> +	u8 bdf_enabled;
>> +	int i;
>> +	size_t len;
>> +
>> +	if (ab->qmi.target.bdf_ext[0] != '\0')
>> +		return;
>> +
>> +	if (hdr->type != ATH11K_SMBIOS_BDF_EXT_TYPE)
>> +		return;
>> +
>> +	if (hdr->length != ATH11K_SMBIOS_BDF_EXT_LENGTH) {
>> +		ath11k_dbg(ab, ATH11K_DBG_BOOT,
>> +			   "wrong smbios bdf ext type length (%d).\n",
>> +			   hdr->length);
>> +		return;
>> +	}
>> +
>> +	bdf_enabled = *((u8 *)hdr + ATH11K_SMBIOS_BDF_EXT_OFFSET);
>> +	if (!bdf_enabled) {
>> +		ath11k_dbg(ab, ATH11K_DBG_BOOT, "bdf variant name not found.\n");
>> +		return;
>> +	}
>> +
>> +	/* Only one string exists (per spec) */
>> +	bdf_ext = (char *)hdr + hdr->length;
> A proper struct is preferred over pointer arithmetic. For example
> something like this:
>
> struct ath11k_smbios_bdf {
>          struct dmi_header hdr;
>          u32 padding;
>          u8 bdf_enabled;
>          u8 bdf_ext[ATH11K_SMBIOS_BDF_EXT_MAX_LEN];
> }
>
> I'm not sure if I got the offsets right, but I hope you get the idea
> anyway.
Will change it.
>> +
>> +	if (memcmp(bdf_ext, magic, strlen(magic)) != 0) {
>> +		ath11k_dbg(ab, ATH11K_DBG_BOOT,
>> +			   "bdf variant magic does not match.\n");
>> +		return;
>> +	}
>> +
>> +	len = strlen(bdf_ext);
> What if bdf_ext is not null terminated? Wouldn't strnlen() with
> ATH11K_SMBIOS_BDF_EXT_MAX_LEN would be safer?
Yes, will change it.
>
>> --- a/drivers/net/wireless/ath/ath11k/core.h
>> +++ b/drivers/net/wireless/ath/ath11k/core.h
>> @@ -971,7 +971,18 @@ int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
>>   			  struct ath11k_board_data *bd);
>>   void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
>>   int ath11k_core_check_dt(struct ath11k_base *ath11k);
>> +/* SMBIOS type containing Board Data File Name Extension */
>> +#define ATH11K_SMBIOS_BDF_EXT_TYPE 0xF8
>>   
>> +/* SMBIOS type structure length (excluding strings-set) */
>> +#define ATH11K_SMBIOS_BDF_EXT_LENGTH 0x9
>> +
>> +/* Offset pointing to Board Data File Name Extension */
>> +#define ATH11K_SMBIOS_BDF_EXT_OFFSET 0x8
>> +
>> +/* The magic used by QCA spec */
>> +#define ATH11K_SMBIOS_BDF_EXT_MAGIC "BDF_"
>> +int ath11k_core_check_smbios(struct ath11k_base *ab);
>>   void ath11k_core_halt(struct ath11k *ar);
>>   int ath11k_core_resume(struct ath11k_base *ab);
>>   int ath11k_core_suspend(struct ath11k_base *ab);
> Please don't mix defines and function declarations, so move defines up
> in the file.
Yes, will change it.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
