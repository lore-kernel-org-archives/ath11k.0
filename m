Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BD8C3DA4A
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 01:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTvwtxAEl/GoW/Fv6LUxyvVqZYvC664HWlTMIoG42sI=; b=LEUx/JUrdIN8U6pRLUQCGJ11ua
	Jc9/iUnrCWnZImVq/E/zT+IMkOLg277+oDlKbJP8gRLI9VsKfjWprWd3Ac4WXfBNyg92Giq5x4Em6
	bM5rSD5Futw8YbBfpM0SihqZVUXKNPLGEOFZgfq0DJnapGXqYA/hdYftDi5Srax2OhySuNGs8MBSz
	lChU/o45K1KLfglxeKp9hR6k/Ctzc920LGOrPP6A1Pks8nl7znFXUmS+PrZOe2FNLW2u57USmSKee
	ImgcgeLR2H+0TTQpeooyWrT7c5MJP9HqSlsQ1/0ctDaHuYAqpdQ2YUxg1FMQDW52k4j5fwRi4fO0J
	RlLB6xxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFkEw-00000002Egu-2lSs;
	Fri, 16 May 2025 01:51:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFkEt-00000002Eg7-3ONe
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 01:51:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFPAx031652;
	Fri, 16 May 2025 01:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTvwtxAEl/GoW/Fv6LUxyvVqZYvC664HWlTMIoG42sI=; b=RFU7aqn2mSKCi2wX
	ptRaHioNftC9aYL9vxcvOZ0YuUOms8BL1izF4tbQ0IzjGOm5JJKxv/cY7+SxXNf4
	EFjCPLz8lF4DhC5lgFEnvqdPZiyg0lKFolg6V5AEPsYq1CSu6BDbHdmymyGC6rMy
	Et5/nHQJF/kOFrsTlV2SQQhwv3IQP50nAubhFKyy6WumRAtC44oa/nnXGpZzVNRh
	syVh5vmIc4Y36wrLvXUsiPgQJ50lEqaUU+1wndHO/snAsv/EdB7CgeC1ghtqEI9j
	dfPCCvNhTNxG5WRNsOEXjySrcbioS5eSi4ORU7QHDLGVyR/skUWRtKlOpH6bvWdi
	h5cI7Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr811e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 01:51:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G1pViq005568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 01:51:31 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 18:51:29 -0700
Message-ID: <50e0757f-03e8-460c-b14a-103e675f5f84@quicinc.com>
Date: Fri, 16 May 2025 09:51:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: clean-up during wrong ath11k_crypto_mode
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, <jjohnson@kernel.org>
CC: <~lkcamp/patches@lists.sr.ht>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250515222520.4922-1-rodrigo.gobbi.7@gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250515222520.4922-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oFmd9ZE8O3rekEovDSMgfM2t5JrJJGjT
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68269a37 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=VJvuOwoLhTZW_tfsPHkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: oFmd9ZE8O3rekEovDSMgfM2t5JrJJGjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAxNiBTYWx0ZWRfX5EZH73auMXZ2
 BdR0hP03ZoOHE0zmXhY1S7o8HNb+GQkIvfpjL4SeDkVAKqVI3KJRu/+cNlXKzsNPpv05O1JviMR
 x6xc6pbbeFd7EM58pzoBGlfalhEjLdhg4TBZXcoc3g8dBQEpitgt8kkg8K/7QqDTkZdPiyFYlZu
 THOpnKP9Q0XLElT6mO2xYenOxHNMS6/8q33EXl7duqghZIFqOAAfqN8zda7vMdwCe/Zs2z5FR09
 9G7AjRNNpXIPp2zqDh0tdnQFR7fw+lpfWn8KZ0+t2X2TtWcTJrOCb/IhUcirIzFW9KB7gZ4mzyQ
 9Dmp6UAZuharqnk+8+tH1IiKuEez1TjfpDH37U7tfKCgLNA6wU2K40MshB4CF+lPgXkhxjNw+7g
 Cz2FyEAyGZ6QSQDDs8XNFqeOqNUQYfDnncxWjWCIHPGpnE6h4sJDqBoRqap37lp/6KVqaiQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=944
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_185155_968351_C339263A 
X-CRM114-Status: GOOD (  14.57  )
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



On 5/16/2025 6:22 AM, Rodrigo Gobbi wrote:
> if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
> ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
> started/configured. It's reasonable to undo things during this condition, fixing
> the following smatch warning:
> 
> drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
> warn: missing unwind goto?
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Changelog:
> v2: add smatch warn at commit msg
> v1: https://lore.kernel.org/linux-wireless/20250515004258.87234-1-rodrigo.gobbi.7@gmail.com/
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 2e9f8a5e61e4..fd3017c444a4 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2163,7 +2163,9 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
>  		break;
>  	default:
>  		ath11k_info(ab, "invalid crypto_mode: %d\n", ath11k_crypto_mode);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		ath11k_dp_free(ab);
> +		goto err_firmware_stop;
>  	}

Instead, how about moving the ath11k_crypto_mode validating to the top of
ath11k_core_qmi_firmware_ready()?

>  
>  	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)


