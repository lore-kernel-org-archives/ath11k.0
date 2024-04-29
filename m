Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1631CC4345F
	for <ath11k@archiver.kernel.org>; Mon, 29 Apr 2024 18:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ET2AF7MnhTJkIxUl0KoC2YIy+Id2W9y0QPi0t4QPA2w=; b=bwxNg2kae8M0K8H6v+/nycJWNK
	nte3BxrcBWn69PpYzdW0kxAVILuV1A8QD0p5+kwKJGV8uL8nkBR0C1YQ66vTkaZSIqBtC9r7lIODX
	4oZ5O6/5ECfk61qcvr/beNDHHT3DriuCXrsjm0m4A/C4naZ5GiZVkpLPtz2XJdoUlHscr1e3f1Xw7
	ObnayyLUPC07OYp3kTAaUH1Djkr5FlmxofnnP2heRpeLBl2bUHGFFj/onxNybMYjv+zr/TGxVjo5h
	vqmMdKj3JaHI5DdCb4Iqb2UmxxnNN+xfg+3dkD1LRhgriKxQ8Jq78CudWmgIfVhmIfT8bbnW0yZ2P
	cpmJO6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1VUm-00000003qVO-2Kfq;
	Mon, 29 Apr 2024 18:12:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1VUj-00000003qUv-2tp7
	for ath11k@lists.infradead.org;
	Mon, 29 Apr 2024 18:12:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43TFQUqu026819;
	Mon, 29 Apr 2024 18:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ET2AF7MnhTJkIxUl0KoC2YIy+Id2W9y0QPi0t4QPA2w=; b=Gb
	ofPrrUEguuAjYZeoER7VgPvepvVQSusr54gk902muA9A9CrOZOwAAIw00JJYqIa6
	IcChs8mgF7CpjLNsQ6T8dD0NvEkxuGeF/bB5+8fAjl+27m089mpDnmQugX+cPspO
	XZgZcBhr2If2oiRqMp/TlogrWdBwh0poQaffUG0CQLQLdUusa7EBQHRKJxFHCwNE
	o+p885gIp3MTfX2aENu1kfjRT+OQ3N/UGlFfVLBhVxzt9cEOnnWOzqdFiyOvejxC
	EIh+aBwVhxdDQda3j51zdU7u2ZxJY3zs7iw9YtEg2rnB1gJqAtP2q4jiu1bp6n2M
	9KJ4i69knZHtkoAiP2XQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xt5xkb5ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 18:12:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TICoSN006191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 18:12:50 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 11:12:49 -0700
Message-ID: <35f114c4-1ff7-4a4b-aadf-ed147f19e170@quicinc.com>
Date: Mon, 29 Apr 2024 11:12:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5] wifi: ath11k: skip status ring entry processing
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Venkateswara Naralasetty
	<quic_vnaralas@quicinc.com>
References: <20240429073624.736147-1-quic_tamizhr@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240429073624.736147-1-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I4XlDA3evLPhq4-CIwhkaqXDILi6BAhW
X-Proofpoint-GUID: I4XlDA3evLPhq4-CIwhkaqXDILi6BAhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_16,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=947
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_111253_887075_2BE38F28 
X-CRM114-Status: GOOD (  20.65  )
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

On 4/29/2024 12:36 AM, Tamizh Chelvam Raja wrote:
> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> 
> If STATUS_BUFFER_DONE is not set for a monitor status ring entry,
> we don't process the status ring until STATUS_BUFFER_DONE set
> for that status ring entry.
> 
> During LMAC reset it may happen that hardware will not write
> STATUS_BUFFER_DONE tlv in status buffer, in that case we end up
> waiting for STATUS_BUFFER_DONE leading to backpressure on monitor
> status ring.
> 
> To fix the issue, when HP(Head Pointer) + 1 entry is peeked and if DMA
> is not done and if HP + 2 entry's DMA done is set,
> replenish HP + 1 entry and start processing in next interrupt.
> If HP + 2 entry's DMA done is not set, poll onto HP + 1 entry DMA
> done to be set.
> 
> Also, during monitor attach HP points to the end of the ring and
> TP(Tail Pointer) points to the start of the ring.
> Using ath11k_hal_srng_src_peek() may result in processing invalid buffer
> for the very first interrupt. Since, HW starts writing buffer from TP.
> 
> To avoid this issue call ath11k_hal_srng_src_next_peek() instead of
> calling ath11k_hal_srng_src_peek().
> 
> Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Co-developed-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

however note...

> +
> +				/* If done status is missing:
> +				 * 1. As per MAC team's suggestion,
> +				 *    when HP + 1 entry is peeked and if DMA
> +				 *    is not done and if HP + 2 entry's DMA done
> +				 *    is set. skip HP + 1 entry and
> +				 *    start processing in next interrupt.
> +				 * 2. If HP + 2 entry's DMA done is not set,
> +				 *    poll onto HP + 1 entry DMA done to be set.
> +				 *    Check status for same buffer for next time
> +				 *    dp_rx_mon_status_srng_process
> +				 */
> +
> +				reap_status = ath11k_dp_rx_mon_handle_status_buf_done(ab, srng,
> +										      rx_ring);

ath11k-check reports:

drivers/net/wireless/ath/ath11k/dp_rx.c:3116: line length of 95 exceeds 90 columns
drivers/net/wireless/ath/ath11k/dp_rx.c:3117: line length of 95 exceeds 90 columns

Kalle, in this case we may want to make an exception since I don't think there
is a clean way to fix this other than refactoring.

FWIW I'd like to see this function refactored to avoid the excessive
indentation, but that should be a separate exercise.

/jeff

