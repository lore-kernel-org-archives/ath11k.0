Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE5DCD6E55
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r85YYvRXUgeOdHZjMqt3osRrQ3RltXHNQbceWHFhVYg=; b=M8tSPGpjo7HlKk9IEbNO+ZQyvc
	pvmnGJbYtCCXBCuCfVoQjgX5MTyM/MtscoyMVE/gBx7RG41C4ZGmVG/1CsZx7gwVFv3esGAqFhW7a
	htyI3b9u5V38ocqR/+2Azmwk2ZUyehx3fyG5OFdXVWR+zrhmOpV3sPTY8EITN31ewz8aA+N5yxyrf
	jpGDQUKekeQWFH0419exWcujrjYy7eM2epwerYvdNjpPod0h6qt4nBv6F/G/cmhOkS3bi4BOWmVK6
	Ae6kUr4FNrev8UWubtPUdKxQLWwpnnxg8ZKDpjey55F7UD/33qiLEM7cRnQHdETWylLDGaY4ESltZ
	ixBM/1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5Cb-0000000BRNm-2s3r;
	Mon, 01 Jun 2026 16:09:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5CZ-0000000BRNH-2Bw0
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 16:09:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EgahD1257648
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 16:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r85YYvRXUgeOdHZjMqt3osRrQ3RltXHNQbceWHFhVYg=; b=HEAx/FOLtHxgirbF
	1kbN8Aa2p+KUzYqfOBHMc/lKglW1x2tkH77zMxhRPuI+gArY79zFQ0QqTa3iC8CA
	Y9lMJFkrsRkTRGUI+CuRGsEXQ2IZDi41sBhBid5PaJwKno4Qq3c0qg/KawMX61Ei
	P8Svvk3Fg9Nj6ciokF34prsgNqCZPs1VYYFi2D4aDnQVsi2b38h1qRtoQAF7gttj
	GguoBOk9qcKKWD7gDjJnh1Z8upZiR3PeXVruChS2LWyzLtgWyUK5TmeUl/AzHx1s
	G5X1ODB2yeQuf24UsDhoIHQg8kKEh9UUm+g942EOKgsxz6fUOS3N5L08Kf6zVjzs
	x2ltwg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sssv8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 16:09:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d0d0b28eso2463737eec.0
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780330158; x=1780934958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r85YYvRXUgeOdHZjMqt3osRrQ3RltXHNQbceWHFhVYg=;
        b=akV0xIzyq0v3QHO5VMwU+TO279YrNbHfx04zkWQpdI+biPof+0i46SyWo+oPSu9CSV
         pOekc14yCpJOZiKP8XbOxDqHgso7FIJS8OMblp/4/Mnl+v3z9OTn3/GIt4DtUNxxWvev
         xhRn4sf5L7QvuRFPZF6BkseTaNQPXnFpGEHae3We4IjtsmtMlJ0g6uZ/rAoe2FNPjknG
         Dc9079LwjFUFxzgqm7kyt56UQPUJdrZnNvSUAr632+qGbPOw7FwbHICbh+rnNhP/Vp1x
         gqx9TsQe837SgdaeVstGJkf0pRWfCodNujh7WuneFAmUmUJERQTCXmo+zkl0tOtklkOP
         DunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330158; x=1780934958;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r85YYvRXUgeOdHZjMqt3osRrQ3RltXHNQbceWHFhVYg=;
        b=BSy4XHXlsrhRMPmuXeTL9hznt6f9lmVW21pLNUEfYuutaeumuns1m77cA2gtu32Ew3
         XOFKe6BM6wLUYFwVDwB7VuZ7fWn07FzUy9+/Cprxp6mq/IV4DyBUIUw1hH0N1o4sjG5G
         GVGN8v4uViW+UnjWO9Em1LBuJe3bTJ25wlx5mgFtp+Nz8+/ey5UcMT5sKioZUb+0s+e5
         ns7u6/d1WuQc4nTeKbaZqUh2ot66UXKNaGr40g8e6gu7pdDK2snqztubPFr+Ev4N0coc
         goFOR6vJfRawb0Jo1Zdgu0XNrhaVsqhiW95IfZnWqbbxz8Oj4n4xmDJCfqxwXAExZ2Xh
         DNBA==
X-Gm-Message-State: AOJu0Yz4V9J6d9vwAQfkzjZEEohhrMTeH4uAgzp6e45MthlO/amCo7Pi
	77ZSE6HbOGF8OzLpfVrpmPi6Z6j8sR91E9Djf7J56Y78VpscRddgKm+LdKCjf/k7fKE3rWPBN3X
	sEMI1o2wcgET8/tQsnrP9681qx0jvyVpc9i0AnuHxHAIutGLmxXDyQ44Mek6zj0Ual7Lcjl2Z
X-Gm-Gg: Acq92OGolI7WYiopoXd71mgfdG1dvFqH0enlYkFG5iwJdjpWrar4f59ob4cOYzzozcL
	B0/51wkR1IeCvz7NayBzZmde/m58LbRBgncvo800/BzrHtcy4okAxT75VkEq5xBZGOayEfG2epJ
	4CahBFzy3jL/+7YknvXAUjRDrRd52Mm3pLgx345k2Kf0JnU47KdWaF+xu97+eaX1gl+GpaJINhB
	hwaux+jiKP3wbcRB3Ypj9ybui9GR7bxxNl+ZrUw6K8ssFyZGPlf8eUD2bCHc1TEPaRpzj4jJBlE
	/j6DFTubdZiMTYxBxwtVM+XOh/QwCzclScPU5Z3Bn3PLSlj6y7/ZsfPIr2a+a0Lzimo1ngNh1HV
	gpmXJUmN7htCiCsRYXCKfabIZUVmjPReyAbCLIgRJ4XpIOsMVknxGl7zT6HRCL1tHxKtm+NXhLS
	WqJHHlPCIyXwrXzyO1
X-Received: by 2002:a05:7301:6a18:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-304fa69c7ffmr5559228eec.34.1780330158272;
        Mon, 01 Jun 2026 09:09:18 -0700 (PDT)
X-Received: by 2002:a05:7301:6a18:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-304fa69c7ffmr5559188eec.34.1780330157690;
        Mon, 01 Jun 2026 09:09:17 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5f6426sm9016059eec.31.2026.06.01.09.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 09:09:17 -0700 (PDT)
Message-ID: <84b140b1-1060-47ad-ac3f-ecaea7f97d40@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:09:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath11k: fix invalid data access in
 ath11k_dp_rx_h_undecap_nwifi
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
 <20260512022351.2033155-2-miaoqing.pan@oss.qualcomm.com>
 <f89f90ea-a9f2-4f1c-b55f-2b77ddc505e1@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f89f90ea-a9f2-4f1c-b55f-2b77ddc505e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: njSKaksTFq0BNtNcluCI0OPGztTMER7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2MCBTYWx0ZWRfX4mW5f3VKoDbk
 Kct/Tu9u8SrZDVCcaknwJ+w9rcph2moR7cKLcw5fOBO+ZSiKZHKIatwGIkw4qOlqNYqrabhsFXV
 WtlvUcVp92VYyk5EXK48PSQnvrAVeqeTZRYXXN9iGWoC9N8K78vlJi0mcB/NS7M1rm+ol44r65z
 Zdqsrpd13m25S8BwmoRlWqUqnrWk8oTR7E27v4mxbdQmDpdaFvBT8FtwhuxkP8mZ+2wjtUk+5ON
 031nARVtcwTnc8XXyJFB588iAEqzyyqk70i6inAQne0ZSXpD77PK7JXv27o+4iEuMxTEuewUSdn
 +T0wkJXX7XTI0zqRQQPYCasfhoQFLo03J+bUwA+Rt6r6A8L0bjLA/4snTCbuKq3w64utRBQmDcM
 qYH8CkhanCP9tapUO4HcvMwgHq8fNz6CTG9pXtdzMKtkEJ63fk9eM3LkJWje7pRcrz1B7PyF6W6
 3gmvgL8RJV+klzCSHXg==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1daeaf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PbU15OE6me5PO1c1xRkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: njSKaksTFq0BNtNcluCI0OPGztTMER7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_090919_571891_71842A0E 
X-CRM114-Status: GOOD (  16.39  )
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

On 5/31/2026 8:47 PM, Baochen Qiang wrote:
> 
> 
> On 5/12/2026 10:23 AM, Miaoqing Pan wrote:
>> In certain cases, hardware might provide packets with a
>> length greater than the maximum native Wi-Fi header length.
>> This can lead to accessing and modifying fields in the header
>> within the ath11k_dp_rx_h_undecap_nwifi() function for the
>> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type and
>> potentially result in invalid data access and memory corruption.
>>
>> Kernel stack is corrupted in: ath11k_dp_rx_h_undecap+0x6b0/0x6b0 [ath11k]
>> Call trace:
>>  ath11k_dp_rx_h_mpdu+0x0/0x2e8 [ath11k]
>>  ath11k_dp_rx_h_mpdu+0x1e0/0x2e8 [ath11k]
>>  ath11k_dp_rx_wbm_err+0x1e0/0x450 [ath11k]
>>  ath11k_dp_rx_process_wbm_err+0x2fc/0x460 [ath11k]
>>  ath11k_dp_service_srng+0x2e0/0x348 [ath11k]
>>
>> Add a sanity check before processing the SKB to prevent invalid
>> data access in the undecap native Wi-Fi function for the
>> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type.
>>
>> This adapted from the discussion/patch of the ath12k driver [1].
>>
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>>
>> Link: https://lore.kernel.org/linux-wireless/20250211090302.4105141-1-tamizh.raja@oss.qualcomm.com/ # [1]
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/dp_rx.c | 50 +++++++++++++++++++++++--
>>  1 file changed, 47 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> index fe79109adc70..fbe2061a544d 100644
>> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> @@ -2502,6 +2502,29 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
>>  	ieee80211_rx_napi(ar->hw, pubsta, msdu, napi);
>>  }
>>  
>> +static bool ath11k_dp_rx_check_nwifi_hdr_len_valid(struct ath11k_base *ab,
>> +						   struct hal_rx_desc *rx_desc,
>> +						   struct sk_buff *msdu)
>> +{
>> +	struct ieee80211_hdr *hdr;
>> +	u8 decap_type;
>> +	u32 hdr_len;
>> +
>> +	decap_type = ath11k_dp_rx_h_msdu_start_decap_type(ab, rx_desc);
>> +	if (decap_type != DP_RX_DECAP_TYPE_NATIVE_WIFI)
>> +		return true;
>> +
>> +	hdr = (struct ieee80211_hdr *)msdu->data;
>> +	hdr_len = ieee80211_hdrlen(hdr->frame_control);
>> +
>> +	if ((likely(hdr_len <= DP_MAX_NWIFI_HDR_LEN)))
> 
> nit: Double parentheses on likely()
I've fixed this in the 'pending' branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=99f35f3f082fca14fc3324e48abd805871d39c69

