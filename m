Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1959EB64DD
	for <ath11k@archiver.kernel.org>; Tue,  1 Aug 2023 04:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBPF4P/bvCLJJnhJmATnixuOOm0IOkCS/K+hu8DRd+E=; b=ylotkUxTSQbcHg
	14ug+L+EoopjPpjpUQ4BpZ4N9+KJbPwJujXWpej3iK8paWghODtpF5yI1PJG0lVZJWPJIkVqDVooI
	fG7p0O/1Xg1z30WjugKt6N1/3bVrp1KmUKT86F0tXwmfHcp0jIIO/zj40hnbVAfgu5+sptbA6CznO
	gfA4uClcP+AgxRICXAVUOvYLA2fnLKf2RMoq8zS1zwtD/uBdNAoXgnRvGgvfI74fe/XiE0UEtK/sx
	WCuXhqOvYapK67laJwU2sO7gOkhTWXQddp5Vyr7KQUotJcvrcsXUYIx1fx3yrxNNqYD0YEeqbiJLi
	8VawJTjUzLAvOe2wBCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQgt4-000KlT-0D;
	Tue, 01 Aug 2023 04:21:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQgt1-000Kkn-0C
	for ath11k@lists.infradead.org;
	Tue, 01 Aug 2023 04:21:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3711uRP1000919;
	Tue, 1 Aug 2023 04:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0RtP2Y3YQXXQfiijFoqpCWqcsbUeRAPKQJssdfDcNFs=;
 b=pnxwmuV4w8VfwVOeT14cieYychGwYFikctTfkzvpMiLMYsFEvSdg0B9Vb/6td9nOL1kf
 eehsLRSFQVs6zm6RFlhD367bYfO2S/33t0s8Om0AB5rFxh2u+tsoO0hgf3z0Ig7KM7Ub
 0ZWhDX28Zc3Itoc9pThZQRpjy1V7knEu8tOnxTajgMhbxDJwi/36Gv20vmU0vb8El1vs
 lCcd3xDmZl/WK6rLPKGaRBe6UeY7MoSmBhQf8SS5NluacKWrtV39IR5OjkO+ROcF+duz
 RI5g4RR4zqROqwHUMTnb9Po0551zEV7U7MoBEZRtgDb+24kbmmyNg0BTy+VQXbyQpSFG ug== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s6d8gt2fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:21:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3714Korw020313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Aug 2023 04:20:50 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 21:20:49 -0700
Message-ID: <09c8f5b1-dfa0-9d3f-4164-cfad4d4edc67@quicinc.com>
Date: Mon, 31 Jul 2023 22:20:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 1/3] bus: mhi: host: allow MHI client drivers to
 provide the firmware via a pointer
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230727100430.3603551-1-kvalo@kernel.org>
 <20230727100430.3603551-2-kvalo@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230727100430.3603551-2-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DgV7rGZyieAPqpMTFAFGHJnkMVOiCRJ2
X-Proofpoint-GUID: DgV7rGZyieAPqpMTFAFGHJnkMVOiCRJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=793
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_212131_443507_36DD3E3D 
X-CRM114-Status: GOOD (  14.07  )
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

On 7/27/2023 4:04 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Currently MHI loads the firmware image from the path provided by client
> devices. ath11k needs to support firmware image embedded along with meta data
> (named as firmware-2.bin). So allow the client driver to request the firmware
> file from user space on it's own and provide the firmware image data and size
> to MHI via a pointer struct mhi_controller::fw_data.
> 
> This is an optional feature, if fw_data is NULL MHI load the firmware using the
> name from struct mhi_controller::fw_image string as before.
> 
> Tested with ath11k and WCN6855 hw2.0.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
