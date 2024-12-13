Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E82E77180
	for <ath11k@archiver.kernel.org>; Fri, 13 Dec 2024 06:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oqBkIztTMd+a0ITaA1ANvdOI20jM+UGGbXNGNgQhu0=; b=u7JUEHhvacNrbKNy+4jMKoI6GO
	eFeHDzKqzMUzS49Z2iNyVChf6aialMXMzCYjnBW6XspB2dUj4brXvFVgYfasvVgBETgcF4I6kgsuZ
	TgOGKi4Ym40yleaS4Ki5IimYiIFvuobi9gpg8w9JqVyFPAzNtQB1kX1G5nGTASUt4v1E6G1P5tM/J
	ffbcoKKSREKikRnKnRFY0GH5+yja1nYuqp4V20Tw2AcqD5pwG+f/bu6U3sK415deYv3pDD+cu2Pom
	TstXYeL2Xib+bfYOE7gGOPn+oCLJBO+xhYB9Gp6CP6CFXRIfm8zAjMfBJLQupcKm3g3P9zFXG596g
	ehbYakMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLzRT-00000002tZe-2vsF;
	Fri, 13 Dec 2024 06:46:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLzRQ-00000002tYo-1HIo
	for ath11k@lists.infradead.org;
	Fri, 13 Dec 2024 06:46:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD6MD6b026852;
	Fri, 13 Dec 2024 06:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oqBkIztTMd+a0ITaA1ANvdOI20jM+UGGbXNGNgQhu0=; b=hnMcZSQKNlMaUmqb
	68B0wLDENaGA1jU9xaQYA0YNf8YLX+Cp+7f7YGPPQEB8oJlOMVH8FX8F7xT3FiaC
	X/oYponx0ILdrKJnWHaSas8YtfEcJ/koJGRrbxITyNQLtzqD/zsBv/fK1R7rF3nU
	/Og0mcetwU22GqwLux5HdpOKh+r0DutQrzvSSQ/4uMm6TD8sHn+FKyEVvJDlR+L9
	jiY6fFqrHKAKYx8n5f2FM7oCva9u0iDCVrujTZF3v8jGEb3nLCz2ZgYyxPdOiyAG
	AIP/G7CiePI/GwzSfP4SxZtMEnAmKhzD8yCCj/mxXy1vhVNUxIGpkbDXCAi+pbVH
	kvCeHQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40nbes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 06:46:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD6kDgb026577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 06:46:13 GMT
Received: from [10.110.46.166] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 22:46:12 -0800
Message-ID: <07734404-b737-4a8c-ae24-f8b0b8c16e58@quicinc.com>
Date: Fri, 13 Dec 2024 14:46:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] wifi: ath11k: move update channel list to worker
 for wait flag
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241129070714.226-1-quic_kangyang@quicinc.com>
 <20241129070714.226-3-quic_kangyang@quicinc.com> <87y10lngf1.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87y10lngf1.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VrB9COWG6suFogTu1dDNCpfIni3U88Bx
X-Proofpoint-ORIG-GUID: VrB9COWG6suFogTu1dDNCpfIni3U88Bx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_224624_713226_044C9C2B 
X-CRM114-Status: GOOD (  21.75  )
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



On 12/12/2024 10:07 PM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
> 
>> From: Wen Gong <quic_wgong@quicinc.com>
>>
>> When wait flag is set for ath11k_reg_update_chan_list(), it will wait
>> the completion of 11d/hw scan if 11d/hw scan is running.
>>
>> With the previous patch "wifi: ath11k: move update channel list from
>> update reg worker to reg notifier", ath11k_reg_update_chan_list() will
>> be called when reg_work is running. The global lock rtnl_lock will be
>> held by reg_work in the meantime. If the wait_for_completion_timeout()
>> is called due to 11d/hw scan is running, the occupation time of
>> rtnl_lock will increase. This will increase blocking time for other
>> threads if they want to use rtnl_lock.
>>
>> Move update channel list operation in ath11k_reg_update_chan_list() to
>> a new worker, then the wait of completion of 11d/hw scan will not
>> happen in reg_work and not increase the occupation time of the rtnl_lock.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>> Co-developed-by: Kang Yang <quic_kangyang@quicinc.com>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> 
> Same here, I think the commit message should be more or less rewritten.
> 
>> --- a/drivers/net/wireless/ath/ath11k/core.h
>> +++ b/drivers/net/wireless/ath/ath11k/core.h
>> @@ -743,6 +743,10 @@ struct ath11k {
>>   	struct completion bss_survey_done;
>>   
>>   	struct work_struct regd_update_work;
>> +	struct work_struct channel_update_work;
>> +	struct list_head channel_update_queue;
>> +	/* protects channel_update_queue data */
>> +	spinlock_t channel_update_lock;
> 
> Do you really need a new lock? Why not use data_lock?

Seems data_lock is OK, will change in next version.

> 
>> @@ -6318,6 +6320,15 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw, bool suspend)
>>   	}
>>   	spin_unlock_bh(&ar->data_lock);
>>   
>> +	spin_lock_bh(&ar->channel_update_lock);
> 
> Empty line here, please.
> 
>> +	while ((params = list_first_entry_or_null(&ar->channel_update_queue,
>> +						  struct scan_chan_list_params,
>> +						  list))) {
>> +		list_del(&params->list);
>> +		kfree(params);
>> +	}
> 
> Here also empty line.
> 
>> +	spin_unlock_bh(&ar->channel_update_lock);
>> +
>>   	rcu_assign_pointer(ar->ab->pdevs_active[ar->pdev_idx], NULL);
>>   
>>   	synchronize_rcu();
> 
> [...]
> 
>> +void ath11k_regd_update_chan_list_work(struct work_struct *work)
>> +{
>> +	struct ath11k *ar = container_of(work, struct ath11k,
>> +					 channel_update_work);
>> +	struct scan_chan_list_params *params;
>> +	struct list_head local_update_list;
>> +	int left;
>> +
>> +	INIT_LIST_HEAD(&local_update_list);
>> +
>> +	spin_lock_bh(&ar->channel_update_lock);
>> +	while ((params = list_first_entry_or_null(&ar->channel_update_queue,
>> +						  struct scan_chan_list_params,
>> +						  list))) {
>> +		list_del(&params->list);
>> +		list_add_tail(&params->list, &local_update_list);
>> +	}
>> +	spin_unlock_bh(&ar->channel_update_lock);
> 
> What about list_splice_tail_init() or similar?

Seems list_splice_tail_init() is better. The time complexity is O(1).👍

> 
>> +
>> +	while ((params = list_first_entry_or_null(&local_update_list,
>> +						  struct scan_chan_list_params,
>> +						  list))) {
>> +		if (ar->state_11d != ATH11K_11D_IDLE) {
>> +			left = wait_for_completion_timeout(&ar->completed_11d_scan,
>> +							   ATH11K_SCAN_TIMEOUT_HZ);
>> +			if (!left) {
>> +				ath11k_dbg(ar->ab, ATH11K_DBG_REG,
>> +					   "failed to receive 11d scan complete: timed out\n");
>> +				ar->state_11d = ATH11K_11D_IDLE;
>> +			}
> 
> Empty line here.
> 


