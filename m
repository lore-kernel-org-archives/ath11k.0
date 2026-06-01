Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2C3CD5BD1
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLQaNwgFzPvUJk0AnhaNubQuSeLF1I/jBvaeiZsg7YM=; b=2q6tRqDuDf+3xwWrQF04Z71jWC
	cCQPcOMx74PP/4gQVh4DcsD3ze6P8aBZKI2npSmjH7GnhqeEYAkOo5tdj83uEhyK2h6LQJg6IVs69
	czR4bwRwK8rLuMSGxvRl+9uCwpZMnCqlmBt23yT5qmQP7DHSNdR7lEB1u8tnf8aQwOkYTd0SyHFCe
	TbpmygTcLfaovWlrUqhzt3fNgN4gxenJM/E4zFIdilMZDpxMfyaFnvpoch/K64JQ2GaK2+NdRlQhE
	/h8Ruo2mrfrvHCBWQLUgsILxJHFDHgG0y7YZaIr4ceZVhR48iFGULMfju73MVUXvbepO927F5lPy/
	eBpKUiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTtcd-0000000A6JY-0kKh;
	Mon, 01 Jun 2026 03:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTtca-0000000A6JC-1kDT
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 03:47:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VMb1Ju1434574
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 03:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLQaNwgFzPvUJk0AnhaNubQuSeLF1I/jBvaeiZsg7YM=; b=Vnc3x50DzjBsGBs2
	RXwMgtUT9dQkze11gNokbEkHuvDNIRKXN1JcJZ9ohnUxqw9ubD9aSMkQrj3BaWyp
	pPFrHa8bPuFeHHU9UH+0QNFbxwlrh9lLkKDrEYOw4NMYiqatB5hHqEFoI85FV6ng
	PdwIZrtmah7xH1+CMddOu31LVh7Kst7KWEDwUXSCLItRpqP4WKlsIvYV0mhgUFwJ
	P8IkIVh83C5jOHhcwIygaKb5tIaz5UFRj9g/OP7tPicW1tcLC1SDVM++jQpd73fp
	tFSIMMHt7upuQ2zD4xGd2hIRfwOHOaEBE9igyCJ27q1Umnuj+xwlLznI7wH2YNW8
	tBzBlg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr41dh1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 03:47:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84256bee9a9so230335b3a.1
        for <ath11k@lists.infradead.org>; Sun, 31 May 2026 20:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780285642; x=1780890442; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLQaNwgFzPvUJk0AnhaNubQuSeLF1I/jBvaeiZsg7YM=;
        b=JjFfBEa+ytnap0Xo1OKoKTWPishhQtSQu7P8WvXiSslAGFFk1iuyk3ylKOMZDFmY9x
         Sh+VRb1Wbzkgaib8XUAdH8x8+/S/LoqrfQe7X7kW9IOZXSN+GTRzAbdBnaIpSTHUgnp9
         3CP9dvwdZDflR6qxTshw4TmPF4/fKCqcqwGbHUqCDczhqQtDnF1OMDVxKyOfTw6q/ZZO
         w7dhCaRE/xIfbnLoZIc+2+S3O9Cbmxs0WNbjqUT+DvVVMAh3BEXGeCmIpJztBGoUSAmS
         F9/a3n2+CFZE0i3Kv2diiq5lvnwKE7vCipz0Y4M14uxTcJ8Fd09Y5Fyl3kmcH4psb7dL
         MzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780285642; x=1780890442;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLQaNwgFzPvUJk0AnhaNubQuSeLF1I/jBvaeiZsg7YM=;
        b=kj4ecsPRLHrKWdtPHu2mAGfiz/0hD29hBCJ5iVdImukR0zxlmyqquhuGb9fXoNNzZZ
         z8KhDORgi6qX4vSaPGTGYgTwyXbY2UwNNRtElpkHSrUupSedUIXi7tOU4OehC1t40qBC
         IQIJnW9fb62R9dAMbC239TBbqpZv2yxI2gSGNf0Xz7GzyLGS7mIQlhU6UuXf5ZJmPyKC
         KOEscQv7Tl5lnmtFStLzzS7neJBXiovQF6S7cZxPDpIVO/jThcxwpsx8z1hBpwyJcHvU
         rlnzMf6DFQJsavwtmvG6j2UTcP0fhEkLlPvGJ4lnZomzELiHI4LyWvv09jBwM6YDn600
         kNOA==
X-Gm-Message-State: AOJu0Ywtc1U83fz5Ny+53cFbMet9CLz0DF/nlsFzdo1sbx7YbRvMPX+S
	qHIURjpEihvcV+O9AVYvovKtsYMo6m/7Ew1dVG8F3plrfdAPUKxjjpPccr85NbsdWWN55ejcEC4
	1R+TjdHpMrDJ8Tikywno7j7vItFnVCQetChdc7C79GreYV/o3iDCjnmuIrrltqbQ5
X-Gm-Gg: Acq92OFyIJpAsG5U/bU3W8bQQ/pHVYq5eaYi1Uy5W+MAVN/yzA9gvXf1OnKkaUd2RIC
	wXZcYG6pvZg60qE+TQSxFOlucTGwarxa6uE0ww0/Z2oWEGlxdDNm0n7TdZzmBl9zrquKQtmP1Uf
	XRZEmPguZ70fXHuKcVQU5JSZ3AKCJACGxSc2C7+eA2zsz3hIArWEmusMu+e2eLWKqV1K++HorYC
	s9jd2BpXWI3rKf4Rdks2pJmfPyR5juGUtWP7yRCR3rkahL7JnBokSIDF5vGre7mipZSa9yjHKGc
	LTxafi9TlTOXN7Bq7wRqmZ9Bp6ZEfeBFMwPTJbhALSxnymDEeA7oSa0ErbuYIZFOaokuFQxAucf
	d+TBbnrBsu/Zos4vT7Rr3zFJIUFYvg+fFo+gR22fqY0qIjW4nxT1H7raPjpAEtBrubc7Um56Rk9
	i4nse6HXMJVZYdEW/04f20J6GY8tY5
X-Received: by 2002:a05:6a00:2188:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-842256d7549mr8612547b3a.29.1780285642379;
        Sun, 31 May 2026 20:47:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2188:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-842256d7549mr8612495b3a.29.1780285641738;
        Sun, 31 May 2026 20:47:21 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423bdd217csm3897340b3a.49.2026.05.31.20.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:47:21 -0700 (PDT)
Message-ID: <f89f90ea-a9f2-4f1c-b55f-2b77ddc505e1@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 11:47:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath11k: fix invalid data access in
 ath11k_dp_rx_h_undecap_nwifi
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
 <20260512022351.2033155-2-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512022351.2033155-2-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1d00cb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EU6IV83DWVWhS13MJAEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: dzr78YDMCFo7HLkKFRi47asg3ofrpcsk
X-Proofpoint-GUID: dzr78YDMCFo7HLkKFRi47asg3ofrpcsk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAzNSBTYWx0ZWRfX3mAUfnvCusAT
 y8AXOQXZJ1adj/0A1cu32iKw2U/s91ZnzgeH0aMQQastl/bkWp6H9iPyt1rlpL4DDDPCCoYEXlV
 PZDKH8ZSbWsQBrrdoaLXRpo81c1mq+CQo1xngaMQlNPyAUZaPa73Re+0sa8xCN/GVAlxhbc1gA5
 mQzvgN41Gi1p4zW5N5Et4hJMvdYnrWkdsXSUmtJAvXR+mh1LILojfCQ1WdME1Ye45F4PiQSiAfA
 YHlw4svdZgZ8nFrVnyvFUe44tu7dwmZTnGtee02CSQxB3vYJhQ/EVyI+60B0HAP5MpUk3iStjXx
 S5/Z7xDfOr7gMrbKSD2dlAw00IQSdOFGLy3hpUZauQAjjz2CB4mL5ryD86u+642ZFKom5M0wBxa
 xb0fI/DB5A65Nu6gAik39Y2cgqMpCy+Vd/DIBiUKttZCwj/M88G04aZtzG956oP0vlqHOIvExyx
 68oiTvsnHVGMloGvbgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_204724_492075_468DB9F7 
X-CRM114-Status: GOOD (  19.27  )
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



On 5/12/2026 10:23 AM, Miaoqing Pan wrote:
> In certain cases, hardware might provide packets with a
> length greater than the maximum native Wi-Fi header length.
> This can lead to accessing and modifying fields in the header
> within the ath11k_dp_rx_h_undecap_nwifi() function for the
> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type and
> potentially result in invalid data access and memory corruption.
> 
> Kernel stack is corrupted in: ath11k_dp_rx_h_undecap+0x6b0/0x6b0 [ath11k]
> Call trace:
>  ath11k_dp_rx_h_mpdu+0x0/0x2e8 [ath11k]
>  ath11k_dp_rx_h_mpdu+0x1e0/0x2e8 [ath11k]
>  ath11k_dp_rx_wbm_err+0x1e0/0x450 [ath11k]
>  ath11k_dp_rx_process_wbm_err+0x2fc/0x460 [ath11k]
>  ath11k_dp_service_srng+0x2e0/0x348 [ath11k]
> 
> Add a sanity check before processing the SKB to prevent invalid
> data access in the undecap native Wi-Fi function for the
> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type.
> 
> This adapted from the discussion/patch of the ath12k driver [1].
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Link: https://lore.kernel.org/linux-wireless/20250211090302.4105141-1-tamizh.raja@oss.qualcomm.com/ # [1]
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 50 +++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index fe79109adc70..fbe2061a544d 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2502,6 +2502,29 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
>  	ieee80211_rx_napi(ar->hw, pubsta, msdu, napi);
>  }
>  
> +static bool ath11k_dp_rx_check_nwifi_hdr_len_valid(struct ath11k_base *ab,
> +						   struct hal_rx_desc *rx_desc,
> +						   struct sk_buff *msdu)
> +{
> +	struct ieee80211_hdr *hdr;
> +	u8 decap_type;
> +	u32 hdr_len;
> +
> +	decap_type = ath11k_dp_rx_h_msdu_start_decap_type(ab, rx_desc);
> +	if (decap_type != DP_RX_DECAP_TYPE_NATIVE_WIFI)
> +		return true;
> +
> +	hdr = (struct ieee80211_hdr *)msdu->data;
> +	hdr_len = ieee80211_hdrlen(hdr->frame_control);
> +
> +	if ((likely(hdr_len <= DP_MAX_NWIFI_HDR_LEN)))

nit: Double parentheses on likely()


