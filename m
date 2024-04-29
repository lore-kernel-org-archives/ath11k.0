Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAEBC4345F
	for <ath11k@archiver.kernel.org>; Mon, 29 Apr 2024 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWmk8dCq7+H7DvoYa0VbfQiKqbciMD7qdMitzQC+GRA=; b=GIP89sdmr9T6hS9nk2CM/+JCYT
	0ff8JxcVpLUhXejI47gIkrZn1zg3NTAx4j5TjmJdtaRSQRUl7yTvRqAOvY318qJoh8LEa/yw1GiZo
	/1X/uHcwBJubDjaP8TAp1VyN0pRGFxZslTjvbxMbW9O5vcyePJfhICxk7z4HqDax4H/0tGSLD7TV4
	grKF62Ij7mfKih5hJBP6+FSZnCWoq9WmWebWwL7adsStcqyc2lQ/3f+mIjhBYe1PikH3GOBEEz44u
	lMCmR0/wDf4scFlTtpp+Pq9uomD7WFLgwzt646XXWCJVqyJFJXILlQLpr2/kM/o4YT8aFWI34lKrJ
	CRL7P+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1L9H-00000001lZT-02pd;
	Mon, 29 Apr 2024 07:10:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1L9E-00000001lYe-17Tz
	for ath11k@lists.infradead.org;
	Mon, 29 Apr 2024 07:10:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T6Zaen011248;
	Mon, 29 Apr 2024 07:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aWmk8dCq7+H7DvoYa0VbfQiKqbciMD7qdMitzQC+GRA=; b=Xi
	8pxqTRgt3jYlvxdGoij4q4FJ9Zn50jJ0YfYT8CAdFUm7WMwzLM2Xm9V2Y28dS07u
	rI0ZwIydOLNGs0gQkasXCavbCrx+eOkAJh4q2D4y4y3LMHjaZ1MiRd61GxYaCUTq
	QfPdc63S5JE8/tjWS///UDwlX3HVZZNh0zmFcsRvK3aDkwtMM+OcxF6ldAyvnVuS
	UdDxT3WTUt0xUFGbe5nFSRswLSVjHMRnT62Op9lhnVsgC0CDlj1ZCzvCz4758o3u
	FJVkrm/0nMH9mEUcLM3lG8uJiKW4ytzo7xDot/L/3U1xtNNhSEARdQ5YpK9q+R+M
	1opg1aTQYB/IULZ/fVdg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrq2k34p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 07:09:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43T79oWg023572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 07:09:50 GMT
Received: from [10.151.41.48] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 00:09:47 -0700
Message-ID: <2de90e06-ae1b-6f1d-6d45-bb906233c8ba@quicinc.com>
Date: Mon, 29 Apr 2024 12:39:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCHv3] wifi: ath11k: skip status ring entry processing
Content-Language: en-US
To: Meiyong Yu <meiyong.yu@126.com>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        kernel test robot
	<lkp@intel.com>
References: <20240427091248.2013946-1-quic_tamizhr@quicinc.com>
 <c8812227-ae90-4bbe-9fd3-425b61e36838@quicinc.com>
 <A8B8371F-2FF4-45C7-9BEA-BE7FD5CA288F@126.com>
 <22DBEF03-83C8-460D-AF50-E1DE0038C072@126.com>
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
In-Reply-To: <22DBEF03-83C8-460D-AF50-E1DE0038C072@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZT1QCY4XfbV1oql4F1TuPK5IodEGQyD6
X-Proofpoint-GUID: ZT1QCY4XfbV1oql4F1TuPK5IodEGQyD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_04,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=931
 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404290046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_001000_356275_A35EF75D 
X-CRM114-Status: GOOD (  19.33  )
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

On 4/28/2024 6:32 PM, Meiyong Yu wrote:
> 
> 
>> On Apr 28, 2024, at 8:54 PM, Meiyong Yu <meiyong.yu@126.com> wrote:
>>
>>
>>
>>> On Apr 28, 2024, at 6:46 AM, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>>>
>>> On 4/27/2024 2:12 AM, Tamizh Chelvam Raja wrote:
>>>> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>>>>
>>>> If STATUS_BUFFER_DONE is not set for a monitor status ring entry,
>>>> we don't process the status ring until STATUS_BUFFER_DONE set
>>>> for that status ring entry.
>>>>
>>>> During LMAC reset it may happen that hardware will not write
>>>> STATUS_BUFFER_DONE tlv in status buffer, in that case we end up
>>>> waiting for STATUS_BUFFER_DONE leading to backpressure on monitor
>>>> status ring.
>>>>
>>
>> Can you known the LMAC reset event, if you can known, you can set all the ring entry
>> status  to done after reset is done, and the logic of code will be more clear.
>>
Host unaware of this event as this is internal to hardware. And as per the suggestion we are  reaping next entry
and proceeding further on this.
> 
> If sene of the LMAC reset event is asynchronous, You can do this:
>   1) when  LMAC init than set  a value to the new add global variabe lmac_life_cycle_id
>   2) before add tlv to ring, set lmac_life_cycle_id to tlv
>   3) when LMAC reset event is trigger, increase the value of lmac_life_cycle_id 
>  4) when get the status of tlv in ring(must delay for same period to ensure the real send ring is already send), 
>     check the value  lmac_life_cycle_id  in tlv, if it smaller than the  global one set tlv status to DONE 
> 
> 
>>>> To fix the issue, when HP(Head Pointer) + 1 entry is peeked and if DMA
>>>> is not done and if HP + 2 entry's DMA done is set,
>>>> replenish HP + 1 entry and start processing in next interrupt.
>>>> If HP + 2 entry's DMA done is not set, poll onto HP + 1 entry DMA
>>>> done to be set.
>>>>
>>>> Also, during monitor attach HP points to the end of the ring and
>>>> TP(Tail Pointer) points to the start of the ring.
>>>> Using ath11k_hal_srng_src_peek() may result in processing invalid buffer
>>>> for the very first interrupt. Since, HW starts writing buffer from TP.
>>>>
>>>> To avoid this issue call ath11k_hal_srng_src_next_peek() instead of
>>>> calling ath11k_hal_srng_src_peek().
>>>>
>>>> Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202303281719.CvnPkOiK-lkp@intel.com/
>>>
>>> I believe these are misleading. LKP didn't find the problem you are fixing, it
>>> found a problem in the implementation of the patch.
>>> So I would move these below the "---" so the LKP knows the issue it found is
>>> fixed, but the git history isn't itself isn't misleading
>>>
>>>> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>>>> Co-developed-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
>>>> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
>>>> ---
>>>> v3:
>>>> * Rebased on top of ToT
>>>> v2:
>>>> * Fixed compilation warning Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> drivers/net/wireless/ath/ath11k/dp_rx.c | 88 ++++++++++++++++++++++---
>>>> drivers/net/wireless/ath/ath11k/hal.c   | 14 ++++
>>>> drivers/net/wireless/ath/ath11k/hal.h   |  2 +
>>>
>>> My Qualcomm Innovation Center copyright checker reports:
>>> drivers/net/wireless/ath/ath11k/dp_rx.c copyright missing 2024
>>> drivers/net/wireless/ath/ath11k/hal.c copyright missing 2024
>>>
>>
> 


-- 
Tamizh

