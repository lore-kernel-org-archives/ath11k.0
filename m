Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F46C6FA8F
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 17:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGLfhDQ3onLVVtm8vQnJlaZkwDoRpYvN3rzZ+1rfO8w=; b=Z7pSljPjkR0mto
	aHqFHgZdk+sAlsNpGe7cUvg1gk+zRdwF+0LIa+r8lLeI0ZXyyQsvDRCIyaT/d/ePhmo4Z1HA7B8ck
	3loEw5Yh9WlowxatSVohfElTzBYE21B7tA4VfOwOIHJEaSVQgntoxdIX4LAEtKUpuBgjbRyTtt5xx
	7mqTIH9DIJeD7WbIR7BDwBSa8e7L6rkePXdEcTcD+RQ01QH8ZXnhKapACFca6e/8oAN8Lyn57PZwP
	iHttLIjjBQvEcwzfI5CZyGx6ZHSb9T+O+ITJpkxRzxFHdhA6EdcbkjaFjqLaNQbCX/KR21ZFgOM0b
	5B/geoBS2355b5+pxmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEPp-003YAx-1i;
	Thu, 24 Aug 2023 17:46:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEPm-003YAN-1g
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 17:46:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OEZ4I4013541;
	Thu, 24 Aug 2023 17:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JHl0ViCN2wARh66NKPDZ6jzV6YKPe00MnA5YHD6nKlU=;
 b=MUTWKI7QjMTfcXe+GlrVa8BsANX7tpKZ0V4/A9ZeRw262WnMUl1tL5dUq4XONL3iO0tp
 uCX2yfJZQ3NXrXcihT4RqzE4stejYTjTYublMhFYcWtTRqx2jS28C7IrTnQu2ihy87Yv
 wlKkoaYvDfZHMPTDKk12qPUDhlamXQv7TZX6tdMNPqcEY8QVGkb1v1l0CYjpRlaNlJcC
 4YIl/5h0TjOG5VcBqsDR+yLA60UV0nmc0HTs53hVTBu/KBwltRK3m75jVNeFP+3CF7Xa
 6ZRfM5v9QDUns1h4+d2etBLhhKfFVvMbDE9xwLPlGp79OcTap1Y3vfCDilFXIRZVXi51 Pg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3snt61adwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 17:46:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37OHk7IT029922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 17:46:07 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 24 Aug
 2023 10:46:07 -0700
Message-ID: <10733baf-fa3d-452d-a6da-f40a416658a1@quicinc.com>
Date: Thu, 24 Aug 2023 10:46:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath11k: use kstrtoul_from_user() where
 appropriate
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, Tom Rix <trix@redhat.com>,
        <linux-wireless@vger.kernel.org>, <lvc-project@linuxtesting.org>,
        <ath11k@lists.infradead.org>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
 <20230824075121.121144-4-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230824075121.121144-4-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uT0V3VmodbrO68SAphXW5NNsICnZt-n4
X-Proofpoint-GUID: uT0V3VmodbrO68SAphXW5NNsICnZt-n4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_14,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=607 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2308240152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_104638_679294_BE1CC0D8 
X-CRM114-Status: GOOD (  17.28  )
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
> Use 'kstrtoul_from_user()' in 'ath11k_write_file_spectral_count()'
> and 'ath11k_write_file_spectral_bins()'
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/spectral.c | 26 +++++++---------------
>   1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
> index 97eb2a457685..b5530e484507 100644
> --- a/drivers/net/wireless/ath/ath11k/spectral.c
> +++ b/drivers/net/wireless/ath/ath11k/spectral.c
> @@ -382,16 +382,11 @@ static ssize_t ath11k_write_file_spectral_count(struct file *file,
>   {
>   	struct ath11k *ar = file->private_data;
>   	unsigned long val;
> -	char buf[32];
> -	ssize_t len;
> -
> -	len = min(count, sizeof(buf) - 1);
> -	if (copy_from_user(buf, user_buf, len))
> -		return -EFAULT;
> +	ssize_t ret;
>   
> -	buf[len] = '\0';
> -	if (kstrtoul(buf, 0, &val))
> -		return -EINVAL;
> +	ret = kstrtoul_from_user(user_buf, count, 0, &val);
> +	if (ret)
> +		return ret;
>   
>   	if (val > ATH11K_SPECTRAL_SCAN_COUNT_MAX)
>   		return -EINVAL;
> @@ -437,16 +432,11 @@ static ssize_t ath11k_write_file_spectral_bins(struct file *file,
>   {
>   	struct ath11k *ar = file->private_data;
>   	unsigned long val;
> -	char buf[32];
> -	ssize_t len;
> -
> -	len = min(count, sizeof(buf) - 1);
> -	if (copy_from_user(buf, user_buf, len))
> -		return -EFAULT;
> +	ssize_t ret;
>   
> -	buf[len] = '\0';
> -	if (kstrtoul(buf, 0, &val))
> -		return -EINVAL;
> +	ret = kstrtoul_from_user(user_buf, count, 0, &val);
> +	if (ret)
> +		return ret;
>   
>   	if (val < ATH11K_SPECTRAL_MIN_BINS ||
>   	    val > ar->ab->hw_params.spectral.max_fft_bins)


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
