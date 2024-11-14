Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7F6D41C3A
	for <ath11k@archiver.kernel.org>; Thu, 14 Nov 2024 05:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qvs3mVL4PFfMrttbu7121qyHJCTzMk8eNsinxkbH1oQ=; b=D0+7qY+xFedLpiuhlnpWfCyATD
	ZnOVp/7i7Vd9uFpaVugSszglheTsVUBssee3Pz0W8FcZGaQntUfQZRqspSEwnZC+LQbCreIGtgjm5
	4bnqB+jj08a5FWd/lg80K4/pLEG4iWSWUy5/YykAZH02LOLvMrj38PmcCdmORyouaczEVAlWa2aRK
	MtYaQ3AwUTnnjPGCcyUHSgNGmcKvHNj8L+MGnpSLeYThtK66XvNfxcUQMGg/U2Gzs6hY62jpxEq5j
	mD9QQt4ZCmyoRhpWSwAr8fWKXt/LqscwhY4PXFIa5S3G5BnyjF2iW26KikoVgqNmfdfWfIvXbkgQC
	/quPWG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSVc-00000008rBz-0ij8;
	Thu, 14 Nov 2024 05:35:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSVZ-00000008rA4-2DEm
	for ath11k@lists.infradead.org;
	Thu, 14 Nov 2024 05:35:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADH1Wtc026737;
	Thu, 14 Nov 2024 05:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qvs3mVL4PFfMrttbu7121qyHJCTzMk8eNsinxkbH1oQ=; b=EolKFUWmvuNmLI+I
	fnX2MvrugMRzxsbygGuyMh2QQCUhQJhxJI7nSi1ACq7n5/j5azAoLfLr+Y5x05xF
	pku+BE49+wToklSlFwZ2sySVpp5u7GOlwNJPUEhsHavSBrHA4kPkVQgWGG1IjaPj
	esqkRwwLhDi6qhTsfBGPzQxOqmMsUU/A/b+2MYU6sN77v1NjuvC5XVCDZj493/Fk
	1SZkLlrAejqoDYr5pXI8gw7fSNhRRtoJ9yHWzQe4Wr/HnRzN4Sn4eWeTgI8c4V5+
	XoD7jtZmAkd1XmIu6BNlV3qGneTrw254s4vSNBE/FN2Ruv+KP+L1OLdvcNjGIEyf
	ybocOg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vt732py2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 05:35:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE5Z2kp018345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 05:35:02 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 21:35:01 -0800
Message-ID: <9a602e80-a66a-4618-818c-2875fc488c82@quicinc.com>
Date: Thu, 14 Nov 2024 13:34:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] wifi: ath11k: avoid burning CPU in
 ath11k_debugfs_fw_stats_request()
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
 <20241113015631.3105-2-quic_bqiang@quicinc.com> <877c972xqu.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <877c972xqu.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _C8figD_8pXkzFIprA09Kk7LcixsKTnN
X-Proofpoint-GUID: _C8figD_8pXkzFIprA09Kk7LcixsKTnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_213509_718314_79335295 
X-CRM114-Status: GOOD (  15.40  )
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



On 11/13/2024 7:12 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> We get report [1] that CPU is running a hot loop in
>> ath11k_debugfs_fw_stats_request():
>>
>> 94.60%     0.00%  i3status         [kernel.kallsyms]                 [k] do_syscall_64
>>         |
>>          --94.60%--do_syscall_64
>>                    |
>>                     --94.55%--__sys_sendmsg
>>                               ___sys_sendmsg
>>                               ____sys_sendmsg
>>                               netlink_sendmsg
>>                               netlink_unicast
>>                               genl_rcv
>>                               netlink_rcv_skb
>>                               genl_rcv_msg
>>                               |
>>                                --94.55%--genl_family_rcv_msg_dumpit
>>                                          __netlink_dump_start
>>                                          netlink_dump
>>                                          genl_dumpit
>>                                          nl80211_dump_station
>>                                          |
>>                                           --94.55%--ieee80211_dump_station
>>                                                     sta_set_sinfo
>>                                                     |
>>                                                      --94.55%--ath11k_mac_op_sta_statistics
>>                                                                ath11k_debugfs_get_fw_stats
>>                                                                |
>>                                                                 --94.55%--ath11k_debugfs_fw_stats_request
>>                                                                           |
>>                                                                           |--41.73%--_raw_spin_lock_bh
>>                                                                           |
>>                                                                           |--22.74%--__local_bh_enable_ip
>>                                                                           |
>>                                                                           |--9.22%--_raw_spin_unlock_bh
>>                                                                           |
>>                                                                            --6.66%--srso_alias_safe_ret
>>
>> This is because, if for whatever reason ar->fw_stats_done is not set by
>> ath11k_update_stats_event(), ath11k_debugfs_fw_stats_request() won't yield
>> CPU before an up to 3s timeout.
>>
>> Add 100ms sleep to avoid CPU burning.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Reported-by: Yury Vostrikov <mon@unformed.ru>
>> Closes: https://lore.kernel.org/all/7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com/ # [1]
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/debugfs.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
>> index 57281a135dd7..a5e0f2092da5 100644
>> --- a/drivers/net/wireless/ath/ath11k/debugfs.c
>> +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
>> @@ -207,6 +207,9 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
>>  			break;
>>  		}
>>  		spin_unlock_bh(&ar->data_lock);
>> +
>> +		/* 100ms is empirical, change if required */
>> +		msleep(100);
>>  	}
>>  	return 0;
>>  }
> 
> Please don't reinvent the wheel. Why not just use completion instead of
> this ugly spinning hack?
previously I was thinking that a wait_for_completion() is not allowed since we are in atomic context due to spin_lock. But thinking it more I find that after changing to use completion, the spin_lock is not necessary. so thanks, will do in next version.

> 


