Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED8E606A31E
	for <ath11k@archiver.kernel.org>; Thu, 29 Oct 2026 06:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RHR4oO+f;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLOjDDAO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKqJdQ3l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gv3BQaHlQOepHLlWrIvVRssNi+en5MSyyRdZDeBrNY0=; b=RHR4oO+fZW40fA
	Q7DjzUJ1029kkFAXhjB9czBG1jq4nu3IqHobJaxWuUfqxZNFGKsuZcJW3Gz7xMKYJF1Yj9b7SoEmM
	zxPJxUYnMIh5ApL9n4TOSNDU5ABViKEV5oCNYQMP+byNbdPWCyTDqh5LnPs2CQ+1Ki6EeyW7+ECXR
	/dOfsdpLJ4gq2d5/EqlYeIUk9mkVXierIgzaRUM7pTfsu6dwdahSFiWmpUeXE6dIO7tHFbLAHGmBY
	naUg+V4C9O9osUjMzHtqdfCIEsbRvzhJQsE3toPP6O14ODVTKBKwO+h2Lc+1OXCM3KgWOOyppHdmW
	1s2vqT2229qL+jM4fslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJo3-00000008UOR-2H4q;
	Thu, 29 Oct 2026 06:40:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJo0-00000008UNg-3dy9
	for ath11k@lists.infradead.org;
	Thu, 29 Oct 2026 06:40:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GpUk3341048
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 06:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gv3BQaHlQOepHLlWrIvVRssNi+en5MSyyRdZDeBrNY0=; b=pLOjDDAORyjr8kQV
	alcBDL2ofgW33nUMpNZhqwMSo625Jpr17pjhUxbBvsLEOS9rNCZGQ6Sw0Xb24aLW
	v688y4IvEGV0mhd8Tetn0WSSCEf3oQhOo65U2yXPrIjGMXmHj/VSJPtregj6sp8Z
	MnyfkbCUqXSIk986u2Ye2vkMpNuSG4Z8jYiW8PwctclBXKjokYz2EqYdKYmk4UyQ
	QOymclUA4ghsPfx+lNXPtnrMGOEmYN1fReRNxbYMiMVGcbOlgw2p48OsqAL7Zuab
	p+livXOEb9xPK8hgSCl+x/AfeDsROe9SRfbwb2qTm+wInHnefVuHN8K8iZWTlDo+
	PeEJ0g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3h2de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 06:40:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3342022eec.1
        for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793256006; x=1793860806; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gv3BQaHlQOepHLlWrIvVRssNi+en5MSyyRdZDeBrNY0=;
        b=FKqJdQ3lnTZhMeOL0nvGBYtkFeHUfjWCcgQZ1aiuVIYxAuuGJaRZtSNvSgotY4BRXD
         84O0Z6sJqUzf1rqR7zVsT65t8j/Ds3JAcn05vvovttUUApkZvJ/59W29mpWG5zM6eAbr
         v/hPIoOiazIDoSLavSbVD20iHL2wUJTG89iAaYNrScsuUyOTlHCUPPy97o3G6+0RUxl1
         0/MUx9TjT3aYZDke45O+6xXCih6ryFrZ6ELNSAqAKcEnBor8kmfk1O4H4u1Yyal87jVu
         mk4OnBN08MhnEo4WeSNSD4v4eUHXsaA75I70SVVxuW0UU5FTD04hnp7HHq28Qt8FWhJq
         M5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256006; x=1793860806;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gv3BQaHlQOepHLlWrIvVRssNi+en5MSyyRdZDeBrNY0=;
        b=yCznd9ANK0+Vua37YylbXnxrhgeLR07wzx4LC/Gh1R09/sFEG/+nTmGdclH6lhMO0i
         Rg9o0JxXlkJ9xh3bOPwDiwcO/5gR9Nf0dPQoOvOa4XjY/ef/TfDdw3pQKgCxlcTAeX1+
         +9YhcUE0kXb8BHPyr0Qy1MAzvX+KXJ69SpiX5lzIZI5enal9rXEl0fepwXWYSZtjtesW
         tLj+aruoZ/431Uvi/QxF1OPVQv94pqJsYJv757xS896ah1ZN8YZQNVIreS13woBIhTeq
         BrfuAOx+BagWMMnYLDDNcTttitFH4A6wAYeTLIuXDUmzfLUJZkH3pXbRhaRiaddaJwoH
         2DsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/S0mlb5GOBR4dnz5yMt8IuKR8bJtbgdJKmcf8y0teEAQmk1lM8vuTA2mld3w3Dlha+QMJXXk=@lists.infradead.org
X-Gm-Message-State: AFq9FYKW2S19Y34pV1jEBLlYZdJlmYadg1rBgA6TGNBi/yWzK5aS8u4p
	SgaBOayQyDrKdAOVT1LvbsCAq/IeFm51n6dTr92w6aGcKTR4TtQIbjGvbt8C6BumtCWgvllfkAd
	jp0pCFyOE2DSIB9IUcS3OEiTIxVZfHkJH3VePfh5JdBPB0ja9efPObR2n5dolb0z/
X-Gm-Gg: AYBFou2EB3WI0rYOmkO2wlU87XO0ZmFFY6FCFt/h8xwj52T8YBVcLcTpEPZLnXaky1l
	PJVVGG0iJrQmdJCqRX3O/T88rSNHIW0dpFMx/YCI+iX3kw209Bhn8B8/G+HQeJzqRlKkElWkHb3
	+O32LV73YFfuyitP5fnNdYF3zxjuXp3uzno6y1YcriFixzkXwMcvUSp0rWW/XwTrLuhw3pf5JqK
	1WGOAx1yfozVcolVAq6Qty4ZjQ8tGNhvSLyFtkPCXX8XeRrpfJ9cmru8xLawdNnngyeSwpM9mNJ
	EPwhkhGry56E+LKfoaYB8qeCMvCFeyD/9Y9AB7C8aN1u6rYAjMDYw0+oGOXW3fWxkbxg0VDjrmz
	+QxmYlCMKugP3Yp5SK1lscaGQPl07s+twS6XQQCnuZQ4Ea4du0f19lsIaNeiiZ5GqRA8Kn3pGEB
	DaTABPDU3lnfXETwSzus4eyA==
X-Received: by 2002:a05:7301:e10f:b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a201fb427mr6379456eec.41.1793256006464;
        Wed, 28 Oct 2026 23:40:06 -0700 (PDT)
X-Received: by 2002:a05:7301:e10f:b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a201fb427mr6379421eec.41.1793256005900;
        Wed, 28 Oct 2026 23:40:05 -0700 (PDT)
Received: from [10.152.202.164] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16676903eec.24.2026.10.28.23.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:40:05 -0700 (PDT)
Message-ID: <e1f00156-fa37-44e7-9d30-177d5fe63240@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 12:10:00 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Reject short management RX frames
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260926114037.3231795-1-yaojiale02@163.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260926114037.3231795-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyNSBTYWx0ZWRfX141mG7hBr2GJ
 P6VlIOgUctg9M2nINF2NjocMV0FoJSkWK99BVLWkgBGW1GBrk5QG2meCWEkN04SHFbyq8gF7B4T
 aHxcD7XNSKKRtkg95VWEGSX0z/gl1pE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyNSBTYWx0ZWRfX4k/rQrFHdRba
 qeslfm4TisC5hY9OfcBa1t6YwE1sUZbgJ6OaSESWmmUVOX3+tg5WvHDvdbFKMUB+B7T21uNvKqs
 PdA0ty3EfPCdqEaqvv8bZW90PyRRdwNelFsj/a9Mq6sgiazjY76krnRzsfXBSQFIIwyuAxBgoyl
 POtcEkcnBaUHNY/D7XXGxFWjpi4kPPinIS7QXUzgxQUnUtUZDbQeZrwA6fpys0dYdXxl4HAtWjU
 3hGhNPxrujxmCcr+C1HFFn20XTRHcLym78qEShSTB/uLCwUMSWiXMJN2+tB0wxhcuGR7Yh+w2CW
 SfhucyuozfFyuPmWPBTThHjNUhYfp8kJCZVXmq4HyE69chJgmxGEC51smJAAipg2cjq1SwWqjeI
 AnSJax7snFyLkMtOekFrQXg14p9ZpUI3PXTJ4bXOtP81RuPmIUlTe6blCO7LhGXIIR8tFtlHsuf
 9ffpaCf+G0E2AZ8uB1Q==
X-Proofpoint-ORIG-GUID: xfw7IePAjpwPZHB_jVPaAx9eHylk2-0s
X-Proofpoint-GUID: xfw7IePAjpwPZHB_jVPaAx9eHylk2-0s
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2ea47 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=9NHMLYiaqCzydb3n8i0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_234009_151855_23E80BFC 
X-CRM114-Status: GOOD (  16.78  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 26-09-2026 17:10, Jiale Yao wrote:
> ath11k_pull_mgmt_rx_params_tlv() verifies that the firmware-reported frame
> length fits in the WMI event, but does not ensure that it can hold an IEEE
> 802.11 management header. It then sets skb->len to that reported length.
> 
> ath11k_mgmt_rx_event() subsequently reads frame_control and other header
> fields without another length check. A firmware event with a short buf_len
> can therefore cause an out-of-bounds read.
> 
> Reject frames shorter than a three-address IEEE 802.11 header before
> adjusting the skb to expose the frame.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/net/wireless/ath/ath11k/wmi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index bbca275a8289..02cd9764b6fc 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -5995,7 +5995,8 @@ static int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
>   	hdr->tsf_delta =  ev->tsf_delta;
>   	memcpy(hdr->rssi_ctl, ev->rssi_ctl, sizeof(hdr->rssi_ctl));
>   
> -	if (skb->len < (frame - skb->data) + hdr->buf_len) {
> +	if (hdr->buf_len < sizeof(struct ieee80211_hdr_3addr) ||
> +	    skb->len < (frame - skb->data) + hdr->buf_len) {
>   		ath11k_warn(ab, "invalid length in mgmt rx hdr ev");
>   		return -EPROTO;
>   	}

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

