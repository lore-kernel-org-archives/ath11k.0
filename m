Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906C9C4167B
	for <ath11k@archiver.kernel.org>; Tue, 28 Nov 2023 00:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNVjCy65i83dxR+Eka1Z9wJ9a/FbF4Y7myclnrKzMxU=; b=U3Xvw5Ib6g6jpv
	k/7urQDYDmI7Ksx2GhaTUATkyOMqmYyp46LGasFdysb3n4RI2bVtgkEZ7EE+auhLRbdd5ESBP2O1r
	3Ju2vAG8kiby3mk3aHHoWJkpoqO0MDiErKhoVCn1OPT9Ng+6HAnyCoS6srmy8KMHMuuTNkVJCwZ4c
	sYhHd5Lvv6ec5c6Wd0HjH+r0kc3ZDHH69uMyZbfzIUEvAK8/Sevc0AEtfonC3S9tbYkug0Ix5Ijx2
	YokA7dt8ETDIcgixJyQqUbV69BeAcXwBwB1XmG82hUnfILN61X7bw7e4AmtmtI+4cpBHZ5u0LGHpx
	EIAGbws1ew3xW3nqJ/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7mQ1-003mVy-2i;
	Tue, 28 Nov 2023 00:57:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7mPx-003mVS-1I
	for ath11k@lists.infradead.org;
	Tue, 28 Nov 2023 00:57:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS0UNxL028151;
	Tue, 28 Nov 2023 00:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wDphcBCzkGlF57moRbnrj+ShE9HczKhtiqeO3S+415o=;
 b=NHgRoC45vbXbNv/nGHBbGzA69e30/jNmntmv2ABhWRDNGs7QhUcdGx3wfCdleEr33Pp+
 PjYZKKe9CuHclKz/3TsPY4qxSRrN/QSEzqneh65hj72rSHnvlawPaEtqibDevaLY7Z49
 A56eaL5wX6kqy8O0qYlCun4TRnIWuLGQx5X9hTZ8/F5/JV6sFbs7BTK27dKWAmH+OdQX
 WrH+N216g/HmEcPBSc1V/HUsfvZtm9g8BkEeyvBRL+gC81kcymkr6SY9d5zJLXLnBhn0
 S3x6xKWGT2ZwR/O/AkNXVBPsNgW7Iysi40mc1pHCdk2UtK0GZyd05hupl1vX4GmJivEM UQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un1atgj15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 00:57:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS0vUo6031191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 00:57:30 GMT
Received: from [10.110.63.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 16:57:30 -0800
Message-ID: <20c7a367-2243-4e13-b023-9999dc6c6790@quicinc.com>
Date: Mon, 27 Nov 2023 16:57:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix layout of scan_flags in struct
 scan_req_params
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <20231127180559.1696041-1-nico.escande@gmail.com>
 <bdcdbd06-e9bd-4a92-b27b-d94b2d8fb52d@quicinc.com>
 <CX9YPUDTAT1N.23DMRB5O9FEAO@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CX9YPUDTAT1N.23DMRB5O9FEAO@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q2Tl_hyKAZNVKSOEYmpK3lQ2VEQi3-9f
X-Proofpoint-ORIG-GUID: q2Tl_hyKAZNVKSOEYmpK3lQ2VEQi3-9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_20,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_165737_567894_8F071809 
X-CRM114-Status: GOOD (  34.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/27/2023 2:54 PM, Nicolas Escande wrote:
> On Mon Nov 27, 2023 at 7:38 PM CET, Jeff Johnson wrote:
>> On 11/27/2023 10:05 AM, Nicolas Escande wrote:
>>> The is a layout mismatch between the bitfield representing scan_flags in
>>> struct scan_req_params & the bits as defined in the WMI_SCAN_XXX macros.
>>> Lets fix it by making the struct match the #defines.
>>>
>>> I tried to correct it by making the struct match the #define and it 
>>> worked for WMI_SCAN_FLAG_FORCE_ACTIVE_ON_DFS / scan_f_force_active_dfs_chn
>>> so I'm assuming this is the right thing to do.
>>>
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>>> ---
>>>  drivers/net/wireless/ath/ath11k/wmi.h | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
>>> index 100bb816b592..0b4e6c2f7860 100644
>>> --- a/drivers/net/wireless/ath/ath11k/wmi.h
>>> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
>>> @@ -3348,17 +3348,17 @@ struct scan_req_params {
>>>  			    scan_f_filter_prb_req:1,
>>>  			    scan_f_bypass_dfs_chn:1,
>>>  			    scan_f_continue_on_err:1,
>>> +			    scan_f_promisc_mode:1,
>>> +			    scan_f_force_active_dfs_chn:1,
>>> +			    scan_f_add_tpc_ie_in_probe:1,
>>> +			    scan_f_add_ds_ie_in_probe:1,
>>> +			    scan_f_add_spoofed_mac_in_probe:1,
>>>  			    scan_f_offchan_mgmt_tx:1,
>>>  			    scan_f_offchan_data_tx:1,
>>> -			    scan_f_promisc_mode:1,
>>>  			    scan_f_capture_phy_err:1,
>>>  			    scan_f_strict_passive_pch:1,
>>>  			    scan_f_half_rate:1,
>>>  			    scan_f_quarter_rate:1,
>>> -			    scan_f_force_active_dfs_chn:1,
>>> -			    scan_f_add_tpc_ie_in_probe:1,
>>> -			    scan_f_add_ds_ie_in_probe:1,
>>> -			    scan_f_add_spoofed_mac_in_probe:1,
>>>  			    scan_f_add_rand_seq_in_probe:1,
>>>  			    scan_f_en_ie_whitelist_in_probe:1,
>>>  			    scan_f_forced:1,
>>
>> You are convoluting two different data structures.
> 
> So maybe I'm missing something and please correct me where I'm wrong.
> 
>> struct scan_req_params is used to represent a scan request within the
>> host driver. This does not use the WMI_SCAN_XXX macros.
>>
> 
> In mac.c when we start a scan with ath11k_mac_op_hw_scan() for example we first
> initialize a struct scan_req_params with ath11k_wmi_start_scan_init().
> ath11k_wmi_start_scan_init() by itself does use the WMI_SCAN_XXX macros
> 
> 	arg->scan_flags |= WMI_SCAN_CHAN_STAT_EVENT;
> 
> Then later on in ath11k_mac_op_hw_scan() we either use the bitfield like with
> 
> 	arg->scan_f_add_spoofed_mac_in_probe = 1;
> 
> or we directly modify scan_flags like with
> 
> 	arg->scan_flags |= WMI_SCAN_FLAG_PASSIVE;
> 
> So is it not expected to use those flags there ?

IMO it is unexpected to use those flag there.
And I'm actually surprised we have the union there.

> 
>> struct wmi_start_scan_cmd is used to represent the scan request command
>> sent to firmware. This struct uses the WMI_SCAN_XXX macros to fill some
>> members of this struct in ath11k_wmi_copy_scan_event_cntrl_flags().

And IMO that is broken. We should only be using the bitfields.

> 
> Indeed ath11k_wmi_copy_scan_event_cntrl_flags() copies from struct
> scan_req_params to struct wmi_start_scan_cmd but this time we do not use 
> scan_flags directly, only ever use the bitfield that is in the same union
> as scan_flags
> 
> So having the bitfield out of sync does cause the struct wmi_start_scan_cmd that
> gets sent to the driver to not reflect the desired state set in scan_req_params.
> 
>> So your change has no effect on the driver operation and incorrectly
>> tries to foist the firmware definition upon the host internal
>> representation.
> 
> So either we should not use WMI_SCAN_XXX with scan_req_params.scan_flags ever
> and only use the bitfield to set scan parameters or if we use WMI_SCAN_XXX with
> scan_req_params.scan_flags they need to match the corresponding bitfield.

IMO the correct thing to do is to remove the unions from that struct and
only leave behind the bitfields and not use the WMI_SCAN_XXX masks
except when filling the firmware structure.

But don't spin an update to your patches until Kalle has a chance to
give his opinion. I'm new to maintaining these drivers and Kalle may
have a different opinion on this.

/jeff




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
