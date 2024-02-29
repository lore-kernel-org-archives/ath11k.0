Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44510C54798
	for <ath11k@archiver.kernel.org>; Thu, 29 Feb 2024 21:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApQRCiX+pUSEZ322c1brt4n1jWIQjUilSvI/o652IsU=; b=osnfYwX5bvg00NHBcdp+k494q7
	eOpkTAahHmDz0AqlEGYFa9CL8B73+rprcVciwIBCdSjNKp/4dIzEUXiieWM8vKchsQgJhx2pTdw7s
	itppLfmrgmUTiuVgiruitcR0s8HUpQmQW3/pC9ZyyGp/kWUgXt0WQUFS7F1Yggte1r+t/o7o1xW2f
	/shlFMuj9ZABZ4LacOshmFZkAWXx7RYGb2gXweho8JWQrGojofCx/xPakOYoXlAMSJ1FBPGaXOrHT
	WfDpo+j18y4IONkwzj878h1Tzc0buFx2Zh81LwkjlGZOOWxRKmarsFLV+Rz9n4U4Wx+QRM58a4vII
	s8+vIDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnVv-0000000FDKG-3xFf;
	Thu, 29 Feb 2024 21:00:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnVs-0000000FDII-0eHp
	for ath11k@lists.infradead.org;
	Thu, 29 Feb 2024 21:00:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T4v70L012347;
	Thu, 29 Feb 2024 21:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ApQRCiX+pUSEZ322c1brt4n1jWIQjUilSvI/o652IsU=; b=a0
	CB9qrmu1wKAMmJ3eDlveJ5bAipfMLri9d4WWXu2iFLkmentE2IwWnbVgW8Hqawnv
	hhomp1lDUrNL0hK3X6IaLB8wXnOwN8f3bWqdKt3d+XfE1h+bDYWV+iFXdx6bDFS1
	dJqnq1Zg2U2KfRzzhuofJcLE87w/1Qqr5T/o+k9d9FE2VT5K/ake73ddal1UQtFk
	s/GlUPbYagNzizr0DtcrEfiNQqQQ7Yi0DLYpwooVGDzKnxspRlJLn9DlNdDqvxDo
	DEtxz0hlQlG63uAEX6GvGJMOwhHkeXol77NebeJ+zsM8ngLZaIeyuufooHP7M38p
	GFchlUe0fZlXx6/wpGiQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wjexhk64b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 21:00:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41TL0Fsc028961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 21:00:15 GMT
Received: from [10.110.42.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 29 Feb
 2024 13:00:14 -0800
Message-ID: <8d0fd9bc-6da1-4d72-962a-60074940e1bb@quicinc.com>
Date: Thu, 29 Feb 2024 13:00:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] [v2] wifi: ath11k: fix few -Wmaybe-uninitialized
 warnings
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Baochen Qiang <quic_bqiang@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <lvc-project@linuxtesting.org>
References: <788f1df8-64e1-4b3c-ae8e-00c67be1c3de@quicinc.com>
 <20240229084031.51957-1-dmantipov@yandex.ru>
 <20240229084031.51957-3-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240229084031.51957-3-dmantipov@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9bkxZD2-yygKe2qHBKYAqvK-vlsDrCb9
X-Proofpoint-GUID: 9bkxZD2-yygKe2qHBKYAqvK-vlsDrCb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_06,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402290163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_130020_268640_AAF10651 
X-CRM114-Status: GOOD (  24.60  )
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

On 2/29/2024 12:40 AM, Dmitry Antipov wrote:
> When compiling with gcc version 14.0.1 20240226 (experimental) and
> W=12, I've noticed the following warnings:
> 
> drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_file_target_mem':
> drivers/net/wireless/ath/ath11k/qmi.c:2401:16: warning: 'ret' may be used uninitialized
> [-Wmaybe-uninitialized]
>  2401 |         return ret;
> 
> drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_bdf_qmi':
> drivers/net/wireless/ath/ath11k/qmi.c:2494:17: warning: 'fw_entry' may be used uninitialized
> [-Wmaybe-uninitialized]
>  2494 |                 release_firmware(fw_entry);
> 
> And a bunch of them traced to an uninitialized fields of the same
> variable, e.g.:
> 
> drivers/net/wireless/ath/ath11k/spectral.c: In function 'ath11k_spectral_process_data':
> drivers/net/wireless/ath/ath11k/spectral.c:700:47: warning: 'summ_rpt.meta.freq1' may
> be used uninitialized [-Wmaybe-uninitialized]

looks like a false positive since ath11k_spectral_pull_summary() always
sets the entire meta struct:
	memcpy(&report->meta, meta, sizeof(*meta));

>   700 |         struct ath11k_spectral_summary_report summ_rpt;
> 
> Fix all of the above by using 0, NULL, and {} initializers, respectively.
> Note there are few more (less obvious) -Wmaybe-uninitialized warnings
> still remains, but they're hardly possible to fix without running on
> a physical hardware. Compile tested only.
> 
> Also noticed by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v2: use {} initializer (Jeff Johnson) and aggregate to the series
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c      | 4 ++--
>  drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 5006f81f779b..4477f652e068 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2293,7 +2293,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
>  	struct qmi_txn txn;
>  	const u8 *temp = data;
>  	void __iomem *bdf_addr = NULL;
> -	int ret;
> +	int ret = 0;

as previously discussed this one I'll begrudgingly take.
please submit as a stand-alone patch

>  	u32 remaining = len;
>  
>  	req = kzalloc(sizeof(*req), GFP_KERNEL);
> @@ -2406,7 +2406,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab,
>  {
>  	struct device *dev = ab->dev;
>  	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
> -	const struct firmware *fw_entry;
> +	const struct firmware *fw_entry = NULL;

note that this also seems to be fixing a false positive.

the "maybe uninitialized" reference is:

out_qmi_cal:
	if (!ab->qmi.target.eeprom_caldata)
		release_firmware(fw_entry);

fw_entry is currently assigned:
	if (ab->qmi.target.eeprom_caldata) {
		...
	} else {
		snprintf(filename, sizeof(filename), "cal-%s-%s.bin",
			 ath11k_bus_str(ab->hif.bus), dev_name(dev));
		fw_entry = ath11k_core_firmware_request(ab, filename);
	}

So unless I'm missing something it is always the case that fw_entry will
be initialized when ab->qmi.target.eeprom_caldata is not set.

>  	struct ath11k_board_data bd;
>  	u32 fw_size, file_type;
>  	int ret = 0, bdf_type;
> diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
> index 79e091134515..9834e7dc5120 100644
> --- a/drivers/net/wireless/ath/ath11k/spectral.c
> +++ b/drivers/net/wireless/ath/ath11k/spectral.c
> @@ -697,7 +697,7 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
>  	struct ath11k_base *ab = ar->ab;
>  	struct spectral_tlv *tlv;
>  	struct spectral_summary_fft_report *summary = NULL;
> -	struct ath11k_spectral_summary_report summ_rpt;
> +	struct ath11k_spectral_summary_report summ_rpt = {};
>  	struct fft_sample_ath11k *fft_sample = NULL;
>  	u8 *data;
>  	u32 data_len, i;

so NAK on changes which "fix" false positives.


