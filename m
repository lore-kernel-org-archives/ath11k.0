Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD02C3DA6F
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrocqq/8+ASx6SsuSlxYfl2gqBA+/RIOhQ2J+wiYEP8=; b=enEI+76G+nK2L/
	hjMLZak9mC2tAp+MBZhM9QFaYRD2HZyPDcPJpLAxr01WDNy9W6JiNaCUuhEBd8e/GuEH/ddpamBTX
	vywCGW6tbuZsPsr+oe1jj/2HW0Dlbg7o3SJg+MsiS4kcU1Cy2o9nLGMJGEN/CIVCOqwQpkhW4Ppsd
	Wvsrj+yHK/8I1i2apg0v8dLN/xkw0BBhFLAjoL6FCXZdA6r+ImOrP/WxTIzVyarGkI0kA3BrRXd/+
	jiUQGtijvSu1CiOGPkFuKJiCY2ZwYRVJ3QBAZAe0Pq/eGYg8U1LEqbk8bR3unlkAOi4OZSiZ3NmfI
	9AJzmdxQ+COo+q1rNlqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEJP-003Xh5-2R;
	Thu, 24 Aug 2023 17:40:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEJN-003XgD-10
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 17:40:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OGei8C022321;
	Thu, 24 Aug 2023 17:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9kggua4fcM4O5jlNv2h34XjgP/XDwv/jlGIegfCJEac=;
 b=C1IY4fzMea4ptNlYRCLyK+kG8d5sRG3YaIqrBp2tKkk4/A0B4WEjQgptmrLJEvZPwE8j
 5uOTDL2s+IEMLU8DqEJoeMSFdJFbJXgW7euAjRZ0vgOnY1/Z0l1weWbrsviO8su7lpSy
 SbsciQsdaavz01XKL74WDxsR0DnJ1UAZaP45M3b7pMjm/QL4hCwzH0yrzkS68ckm6Mpj
 ib/anA3IVS42YqZiQJE1X3DwsDth8UUvglfdQ32DU+E20KT9goiD1XqRQTTWLygS8uUL
 8kVfiyPrzmNcLpXr+igbfkP0vz94gC5yLVzOHeZ3dXGM36HkACLQNNRLwZjgIWbdUHOS Ug== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3snvuwac8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 17:39:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37OHdrSP021010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 17:39:53 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 24 Aug
 2023 10:39:52 -0700
Message-ID: <8933f6a1-cfe0-467d-bc52-5f784ce95840@quicinc.com>
Date: Thu, 24 Aug 2023 10:39:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] wifi: ath11k: simplify spectral pull functions
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, Tom Rix <trix@redhat.com>,
        <linux-wireless@vger.kernel.org>, <lvc-project@linuxtesting.org>,
        <ath11k@lists.infradead.org>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
 <20230824075121.121144-3-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230824075121.121144-3-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HOmWUsTwKgT25RB8F6QZ4LcdyZJS9j1H
X-Proofpoint-ORIG-GUID: HOmWUsTwKgT25RB8F6QZ4LcdyZJS9j1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_14,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=845 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_104001_351320_250EDCAB 
X-CRM114-Status: GOOD (  18.87  )
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

On 8/24/2023 12:50 AM, Dmitry Antipov wrote:
> Since 'ath11k_spectral_pull_summary()' and 'ath11k_spectral_pull_search()'
> always returns 0, both of them may be converted to 'void' and
> 'ath11k_spectral_process_fft()' may be simplified accordingly.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/spectral.c | 24 ++++++++--------------
>   1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
> index 705868198df4..97eb2a457685 100644
> --- a/drivers/net/wireless/ath/ath11k/spectral.c
> +++ b/drivers/net/wireless/ath/ath11k/spectral.c
> @@ -470,10 +470,10 @@ static const struct file_operations fops_scan_bins = {
>   	.llseek = default_llseek,
>   };
>   
> -static int ath11k_spectral_pull_summary(struct ath11k *ar,
> -					struct wmi_dma_buf_release_meta_data *meta,
> -					struct spectral_summary_fft_report *summary,
> -					struct ath11k_spectral_summary_report *report)
> +static void ath11k_spectral_pull_summary(struct ath11k *ar,
> +					 struct wmi_dma_buf_release_meta_data *meta,
> +					 struct spectral_summary_fft_report *summary,
> +					 struct ath11k_spectral_summary_report *report)
>   {
>   	report->timestamp = __le32_to_cpu(summary->timestamp);
>   	report->agc_total_gain = FIELD_GET(SPECTRAL_SUMMARY_INFO0_AGC_TOTAL_GAIN,
> @@ -500,13 +500,11 @@ static int ath11k_spectral_pull_summary(struct ath11k *ar,
>   					__le32_to_cpu(summary->info2));
>   
>   	memcpy(&report->meta, meta, sizeof(*meta));
> -
> -	return 0;
>   }
>   
> -static int ath11k_spectral_pull_search(struct ath11k *ar,
> -				       struct spectral_search_fft_report *search,
> -				       struct ath11k_spectral_search_report *report)
> +static void ath11k_spectral_pull_search(struct ath11k *ar,
> +					struct spectral_search_fft_report *search,
> +					struct ath11k_spectral_search_report *report)
>   {
>   	report->timestamp = __le32_to_cpu(search->timestamp);
>   	report->detector_id = FIELD_GET(SPECTRAL_FFT_REPORT_INFO0_DETECTOR_ID,
> @@ -531,8 +529,6 @@ static int ath11k_spectral_pull_search(struct ath11k *ar,
>   				       __le32_to_cpu(search->info2));
>   	report->rel_pwr_db = FIELD_GET(SPECTRAL_FFT_REPORT_INFO2_REL_PWR_DB,
>   				       __le32_to_cpu(search->info2));
> -
> -	return 0;
>   }
>   
>   static u8 ath11k_spectral_get_max_exp(s8 max_index, u8 max_magnitude,
> @@ -629,11 +625,7 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
>   		return ret;
>   	}
>   
> -	ret = ath11k_spectral_pull_search(ar, data, &search);
> -	if (ret) {
> -		ath11k_warn(ab, "failed to pull search report %d\n", ret);
> -		return ret;
> -	}
> +	ath11k_spectral_pull_search(ar, data, &search);
>   
>   	chan_width_mhz = summary->meta.ch_width;
>   


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
