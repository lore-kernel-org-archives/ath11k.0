Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D02ECAAA1
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 03:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stmqztDSznsRVomU8DSF0SCCsRVXFsjymgnATCJhqFo=; b=1kkqcWgu88jaB8
	dHWER9HLXsFsT3V1crdzdew0fP0ZI+bVOPaIG3+6XxF744j8k+02nLgPd7MtTgjtp74+yeNgsvQoD
	GWkWx5binB4QMJ/HzA9Gwq/5OvVJMGW7kwNNYaUXjCXUWygmSVvoq8gKpZtpdPq1zuXbGjEIn0qPH
	fRC4bvWXXlVFVXvhgM2pqKLQW7i1ePToPkxgYzS0FjspiefnmL3pw3o0UBsRbRGHWdAtdAP+h5cy4
	hQzAaBCWd9pB17rJYZVt4RssV4otLMpkKVIMVm9R8Ae/DiEtC5VlagIGNUXgOysYSE6okKalCJ/4v
	f41eHju6RXvqpvHXzaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXwG7-000jf0-4v; Tue, 13 Sep 2022 03:06:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXwG3-000jZE-L8
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 03:06:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D1KpuH020952;
	Tue, 13 Sep 2022 03:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fDp9I5Fkd0HTzg9jm/QKlvMqpQWJjYdUpUBDYZFpCR0=;
 b=C3op8/EtowAE7IN1R5+ay9jgsorBHemYbA7YPer1GTanUjY0T5+94SRizfnjBdl6j17/
 r/QV4zgmd0w5zjMm7QB1fJ/kQ3EfETJaqBG7p8kBIfPuXA1a6KP4Ez8S3ivG8wqloaNm
 GsDLjUAcJdJ4+nMfeWnOIA1Aws9m0uC53bx1p6NaRERw1a/IYG3OF0lV38k/iMXazMv/
 FT9/k3bLBdZuj/HLOXZNj8dWxLD86oKpNdGw0AokBVhsS05C4pB0lVFZXW7df77zGIaM
 77SUpOEqINQLaCBByc9vNM+mrbODUcddIQ1tie4QbgRheiZnrSXDDeUQRTeQJOwVyNDZ fw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk3bdvmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 03:06:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28D36aIb028149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 03:06:36 GMT
Received: from [10.253.33.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 20:06:35 -0700
Message-ID: <0e64e270-77c3-5c1a-08bc-577a82c8abac@quicinc.com>
Date: Tue, 13 Sep 2022 11:06:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] wifi: ath11k: Implement sram dump interface
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220802075533.1744-1-quic_bqiang@quicinc.com>
 <20220802075533.1744-3-quic_bqiang@quicinc.com> <87fsh0962e.fsf@kernel.org>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87fsh0962e.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OCbViw6nqA-1a1tlvlgbmTqOD0uZ7ezl
X-Proofpoint-GUID: OCbViw6nqA-1a1tlvlgbmTqOD0uZ7ezl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_16,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_200643_866162_FA4E2B9F 
X-CRM114-Status: GOOD (  26.46  )
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


On 9/9/2022 6:48 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>> Currently this feature is enabled for QCA6390/WCN6855.
>>
>> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> I did quite a few changes to this patch in the pending branch, please
> check my changes:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=074477aacb419493da6fb4d96fa9d12390c3b40e
>
> I improved the commit log.
>
>> --- a/drivers/net/wireless/ath/ath11k/hw.h
>> +++ b/drivers/net/wireless/ath/ath11k/hw.h
>> @@ -126,6 +126,11 @@ struct ath11k_hw_hal_params {
>>   	enum hal_rx_buf_return_buf_manager rx_buf_rbm;
>>   };
>>   
>> +struct ath11k_hw_sram_dump {
>> +	u32 start;
>> +	u32 end;
>> +};
>> +
>>   struct ath11k_hw_params {
>>   	const char *name;
>>   	u16 hw_rev;
>> @@ -200,6 +205,7 @@ struct ath11k_hw_params {
>>   	bool hybrid_bus_type;
>>   	bool fixed_fw_mem;
>>   	bool support_off_channel_tx;
>> +	const struct ath11k_hw_sram_dump *sram_dump;
>>   };
> Instead of separate structures I used inline structures:
>
> 		.sram_dump = {
> 			.start = 0x01400000,
> 			.end = 0x0177ffff,
> 		},
>
>> --- a/drivers/net/wireless/ath/ath11k/pcic.c
>> +++ b/drivers/net/wireless/ath/ath11k/pcic.c
>> @@ -203,6 +203,35 @@ u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
>>   }
>>   EXPORT_SYMBOL(ath11k_pcic_read32);
>>   
>> +int ath11k_pcic_dump_sram(struct ath11k_base *ab, u8 *buf,
>> +			  u32 start, u32 end)
>> +{
>> +	int ret = 0;
>> +	bool wakeup_required;
>> +	u32 *data = (u32 *)buf;
> I changed buf to a void pointer, then the cast is not needed.
>
>> +	u32 i;
>> +
>> +	/* for offset beyond BAR + 4K - 32, may
>> +	 * need to wakeup the device to access.
>> +	 */
>> +	wakeup_required = test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
>> +			  end >= ATH11K_PCI_ACCESS_ALWAYS_OFF;
>> +	if (wakeup_required && ab->pci.ops->wakeup) {
>> +		ret = ab->pci.ops->wakeup(ab);
>> +		if (ret)
>> +			ath11k_warn(ab, "%s: failed to do wakeup: %d\n", __func__, ret);
>> +	}
> I changed the error handling so that if wakeup() fails we do not
> continue and just return an error.

I prefer to keep the original design, because in that case we still have 
something to check after firmware crashes.

I admit that the dump content may be invalid if wakeup fails, but we can 
know that by checking kernel log, so we can avoid misleading.

>
>> +	for (i = start; i < end + 1; i += 4)
>> +		*data++ = ath11k_pcic_do_read32(ab, i);
>> +
>> +	if (wakeup_required && !ret && ab->pci.ops->release)
>> +		ab->pci.ops->release(ab);
> At the same time I removed the ret check here.
>
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(ath11k_pcic_dump_sram);
> I renamed this to ath11k_pcic_read() as I feel it's more descriptive
> what the function really does. It's not really care is this for sram
> dump or something else.
>
> I also renamed hif.h interface to ath11k_hif_read().
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
